package org.foomo.zugspitze.services.proxy.operations
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;

	import org.foomo.zugspitze.core.IUnload;
	import org.foomo.zugspitze.operations.Operation;
	import org.foomo.zugspitze.services.proxy.Proxy;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodOperationEvent;
	import org.foomo.zugspitze.services.rpc.RPCMethodCallToken;
	import org.foomo.zugspitze.services.rpc.RPCTransport;
	import org.foomo.zugspitze.services.rpc.events.RPCMethodCallEvent;

	public class ProxyMethodOperation extends Operation implements IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected var _methodCall:ProxyMethodCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodOperation(method:Function, arguments:Array, eventClass:Class=null)
		{
			super((eventClass) ? eventClass : ProxyMethodOperationEvent);

			this._methodCall = method.apply(this, arguments);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_COMPLETE, this.methodCall_proxyMethodCallCompleteHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallProgressHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_ERROR, this.methodCall_proxyMethodCallErrorHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get error():String
		{
			return this.operationError;
		}

		/**
		 *
		 */
		public function unload():void
		{
			this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_COMPLETE, this.methodCall_proxyMethodCallCompleteHandler);
			this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallProgressHandler);
			this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_ERROR, this.methodCall_proxyMethodCallErrorHandler);
			this._methodCall = null;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallProgressHandler(event:ProxyMethodCallEvent):void
		{
			this.dispatchOperationProgressEvent(event.bytesTotal, event.bytesLoaded);
		}

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallErrorHandler(event:ProxyMethodCallEvent):void
		{
			this.dispatchOperationErrorEvent(event.error);
		}

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallCompleteHandler(event:ProxyMethodCallEvent):void
		{
			// TODO: check if this is correct
			if (event.methodCall.methodReply.exception) {
				this.dispatchOperationErrorEvent(event.methodCall.methodReply.exception);
			} else {
				this.dispatchOperationCompleteEvent(event.methodCall.methodReply.value);
			}
		}
	}
}