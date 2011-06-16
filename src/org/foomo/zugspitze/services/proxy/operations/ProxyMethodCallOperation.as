package org.foomo.zugspitze.services.proxy.operations
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;

	import org.foomo.zugspitze.core.IUnload;
	import org.foomo.zugspitze.operations.Operation;
	import org.foomo.zugspitze.services.proxy.Proxy;
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallOperationEvent;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;
	import org.foomo.zugspitze.services.rpc.RPCMethodCallToken;
	import org.foomo.zugspitze.services.rpc.RPCTransport;
	import org.foomo.zugspitze.services.rpc.events.RPCMethodCallTokenEvent;

	public class ProxyMethodCallOperation extends Operation implements IUnload
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

		public function ProxyMethodCallOperation(proxy:Proxy, methodCall:ProxyMethodCall, eventClass:Class=null)
		{
			super((eventClass) ? eventClass : ProxyMethodCallOperationEvent);

			this._methodCall = proxy.sendMethodCall(methodCall);
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