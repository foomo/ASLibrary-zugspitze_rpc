package org.foomo.zugspitze.services.core.rpc.events
{
	import org.foomo.zugspitze.services.core.rpc.protocol.call.MethodCall;
	import org.foomo.zugspitze.services.core.rpc.protocol.reply.MethodReply;

	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.SecurityErrorEvent;

	/**
	 *
	 */
	public class RPCMethodCallEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const RPC_METHOD_CALL_COMPLETE:String = 'rpcMethodCallComplete';
		public static const RPC_METHOD_CALL_ERROR:String 	= 'rpcMethodCallError';

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public var methodReply:MethodReply;
		/**
		 *
		 */
		public var methodCall:MethodCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCMethodCallEvent(type:String, methodCall:MethodCall, methodReply:MethodReply=null)
		{
			this.methodCall	= methodCall;
			this.methodReply = methodReply;

			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCMethodCallEvent(this.type, this.methodCall, this.methodReply);
		}

		/**
		 * @inherit
		 */
		public override function toString():String
		{
			return formatToString("RPCMethodCallEvent");
		}
	}
}