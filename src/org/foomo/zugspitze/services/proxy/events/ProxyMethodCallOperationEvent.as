package org.foomo.zugspitze.services.proxy.events
{
	import org.foomo.zugspitze.services.rpc.protocol.reply.MethodReply;

	import flash.events.Event;

	import org.foomo.zugspitze.events.OperationEvent;
	import org.foomo.zugspitze.operations.IOperation;

	public class ProxyMethodCallOperationEvent extends OperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodCallOperationEvent(type:String, operation:IOperation)
		{
			super(type, operation);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():MethodReply
		{
			return this.operationResult;
		}

		/**
		 *
		 */
		public function get error():*
		{
			return this.operationError;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new ProxyMethodCallOperationEvent(this.type, this.operation);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString('ProxyMethodCallOperationEvent');
		}
	}
}