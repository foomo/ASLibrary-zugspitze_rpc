package org.foomo.zugspitze.services.operations
{
	import org.foomo.zugspitze.services.events.RPCClientMethodCallOperationEvent;
	import org.foomo.zugspitze.services.rpc.RPCClient;
	import org.foomo.zugspitze.services.rpc.RPCMethodCallToken;
	import org.foomo.zugspitze.services.rpc.events.RPCMethodCallTokenEvent;

	import flash.events.ProgressEvent;

	import org.foomo.zugspitze.core.IUnload;
	import org.foomo.zugspitze.operations.AbstractProgressOperation;

	[Event(name="operationError", type="org.foomo.zugspitze.services.rpc.events.RPCMethodCallTokenEvent")]
	[Event(name="operationComplete", type="org.foomo.zugspitze.services.rpc.events.RPCMethodCallTokenEvent")]

	public class RPCClientMethodCallOperation extends AbstractProgressOperation implements IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected var _token:RPCMethodCallToken;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCClientMethodCallOperation(rpcClient:RPCClient, methodName:String, arguments:Array, eventClass:Class=null)
		{
			super((eventClass) ? eventClass : RPCClientMethodCallOperationEvent);
			this._token = rpcClient.addMethodCall(methodName, arguments);
			this._token.addEventListener(ProgressEvent.PROGRESS, this.token_progressHandler);
			this._token.addEventListener(RPCMethodCallTokenEvent.METHOD_CALL_COMPLETE, this.token_methodCallCompleteHandler);
			this._token.addEventListener(RPCMethodCallTokenEvent.METHOD_CALL_ERROR, this.token_methodCallErrorHandler);
			rpcClient.sendCall();
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function unload():void
		{
			this._token.removeEventListener(RPCMethodCallTokenEvent.METHOD_CALL_COMPLETE, this.token_methodCallCompleteHandler);
			this._token.removeEventListener(RPCMethodCallTokenEvent.METHOD_CALL_ERROR, this.token_methodCallErrorHandler);
			this._token = null;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected function token_progressHandler(event:ProgressEvent):void
		{
			this.dispatchOperationProgressEvent(event.bytesTotal, event.bytesLoaded);
		}

		/**
		 *
		 */
		protected function token_methodCallErrorHandler(event:RPCMethodCallTokenEvent):void
		{
			this.dispatchOperationErrorEvent(event);
		}

		/**
		 *
		 */
		protected function token_methodCallCompleteHandler(event:RPCMethodCallTokenEvent):void
		{
			this.dispatchOperationCompleteEvent(event.methodReply);
		}
	}
}