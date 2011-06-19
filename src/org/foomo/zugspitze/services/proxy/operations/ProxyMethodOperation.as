package org.foomo.zugspitze.services.proxy.operations
{

	import flash.events.Event;

	import org.foomo.zugspitze.core.IUnload;
	import org.foomo.zugspitze.operations.Operation;
	import org.foomo.zugspitze.services.proxy.Proxy;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	public class ProxyMethodOperation extends Operation implements IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected var _methodCall:ProxyMethodCall;
		/**
		 *
		 */
		protected var _methodName:String;
		/**
		 *
		 */
		protected var _arguments:Array;
		/**
		 *
		 */
		protected var _proxy:Proxy;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodOperation(proxy:Proxy, methodName:String, arguments:Array, eventClass:Class)
		{
			this._proxy = proxy;
			this._arguments = arguments;
			this._methodName = methodName;
			var method:Function = this._proxy[this._methodName];
			this._methodCall = method.apply(this, this._arguments);
			this._methodCall.addEventListener(this._methodName + 'CallComplete', this.methodCall_proxyMethodCallCompleteHandler);
			this._methodCall.addEventListener(this._methodName + 'CallProgress', this.methodCall_proxyMethodCallProgressHandler);
			this._methodCall.addEventListener(this._methodName + 'CallError', this.methodCall_proxyMethodCallErrorHandler);

			super(eventClass);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * String | Exception
		 */
		public function get error():*
		{
			return this.untypedError;
		}

		/**
		 *
		 */
		public function unload():void
		{
			this._methodCall.removeEventListener(this._methodName + 'CallComplete', this.methodCall_proxyMethodCallCompleteHandler);
			this._methodCall.removeEventListener(this._methodName + 'CallProgress', this.methodCall_proxyMethodCallProgressHandler);
			this._methodCall.removeEventListener(this._methodName + 'CallError', this.methodCall_proxyMethodCallErrorHandler);
			this._arguments = null;
			this._methodName = null;
			this._methodCall = null;
			this._proxy = null;
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
			this.dispatchOperationCompleteEvent(event.untypedResult);
		}

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallExceptionHandler(event:Event):void
		{
			this.dispatchOperationErrorEvent(this._methodCall.methodReply.exception);
		}
	}
}