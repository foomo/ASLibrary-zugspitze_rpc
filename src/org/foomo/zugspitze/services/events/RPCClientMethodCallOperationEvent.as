package org.foomo.zugspitze.services.events
{
	import org.foomo.zugspitze.services.rpc.protocol.reply.MethodReply;

	import flash.events.Event;

	import org.foomo.zugspitze.events.OperationEvent;
	import org.foomo.zugspitze.operations.IOperation;

	public class RPCClientMethodCallOperationEvent extends OperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCClientMethodCallOperationEvent(type:String, operation:IOperation)
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
			return MethodReply(this.operation.result);
		}

		/**
		 *
		 */
		public function get error():*
		{
			return this.operation.error;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCClientMethodCallOperationEvent(this.type, this.operation);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString('RPCClientMethodCallOpeationEvent');
		}
	}
}