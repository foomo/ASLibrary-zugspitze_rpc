package org.foomo.zugspitze.services.rpc.events
{
	import org.foomo.zugspitze.services.rpc.protocol.call.MethodCall;
	import org.foomo.zugspitze.services.rpc.protocol.reply.MethodReply;

	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.SecurityErrorEvent;

	/**
	 *
	 */
	public class RPCMethodCallTokenEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_CALL_TOKEN_COMPLETE:String = 'methodCallTokenComplete';
		public static const METHOD_CALL_TOKEN_ERROR:String 	= 'methodCallTokenError';

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

		public function RPCMethodCallTokenEvent(type:String, methodReply:MethodReply=null, methodCall:MethodCall=null)
		{
			this.methodReply = methodReply;
			this.methodCall	= methodCall;

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
			return new RPCMethodCallTokenEvent(this.type, this.methodReply, this.methodCall);
		}
	}
}