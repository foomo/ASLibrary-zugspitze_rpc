package org.foomo.zugspitze.services.proxy
{
	import org.foomo.zugspitze.services.events.ProxyMethodEvent;
	import org.foomo.zugspitze.services.events.RPCClientMethodCallOperationEvent;

	import flash.events.EventDispatcher;

	import org.foomo.zugspitze.events.OperationEvent;
	import org.foomo.zugspitze.events.ProgressOperationEvent;
	import org.foomo.zugspitze.operations.IProgressOperation;
	import org.foomo.zugspitze.utils.OperationUtils;

	[Event(name="methodCallError", type="org.foomo.zugspitze.services.events.ProxyMethodEvent")]
	[Event(name="methodCallComplete", type="org.foomo.zugspitze.services.events.ProxyMethodEvent")]
	[Event(name="methodCallProgress", type="org.foomo.zugspitze.services.events.ProxyMethodEvent")]

	public class ProxyMethod extends EventDispatcher
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		protected var _result:*;
		protected var _exception:*;
		protected var _messages:Array;
		protected var _proxy:Proxy;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethod(proxy:Proxy)
		{
			super();

			this._proxy = proxy;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public accessor methods
		//-----------------------------------------------------------------------------------------


		/**
		 * Handle messages
		 */
		public function get messages():Array
		{
			return this._messages;
		}
		public function set messages(value:Array):void
		{
			this._messages = value;
		}

		/**
		 * Handle exception
		 */
		public function get exception():Object
		{
			return this._exception;
		}
		public function set exception(value:Object):void
		{
			this._exception = value;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected methods
		//-----------------------------------------------------------------------------------------

		protected function runOperation(operation:IProgressOperation, completeHandler:Function=null, progressHandler:Function=null, errorHandler:Function=null):IProgressOperation
		{
			// set default handler if none given
			if (completeHandler == null) completeHandler = this.operation_operationCompleteHandler;
			if (progressHandler == null) progressHandler = this.operation_operationProgressHandler;
			if (errorHandler == null) errorHandler = this.operation_operationErrorHandler;
			return OperationUtils.runProgressOperation(operation, completeHandler, progressHandler, errorHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected function operation_operationProgressHandler(event:ProgressOperationEvent):void
		{
			this.dispatchEvent(new ProxyMethodEvent(ProxyMethodEvent.METHOD_CALL_PROGRESS, this, IProgressOperation(event.operation)));
		}

		/**
		 *
		 */
		protected function operation_operationCompleteHandler(event:RPCClientMethodCallOperationEvent):void
		{
			this._result = event.result.value;
			this._messages = event.result.messages;
			this._exception = event.result.exception;
			this.dispatchEvent(new ProxyMethodEvent(ProxyMethodEvent.METHOD_CALL_COMPLETE, this, IProgressOperation(event.operation)));
		}

		/**
		 *
		 */
		protected function operation_operationErrorHandler(event:RPCClientMethodCallOperationEvent):void
		{
			this._result = event.result.value;
			this._messages = event.result.messages;
			this._exception = event.result.exception;
			this.dispatchEvent(new ProxyMethodEvent(ProxyMethodEvent.METHOD_CALL_ERROR, this, IProgressOperation(event.operation)));
		}
	}
}