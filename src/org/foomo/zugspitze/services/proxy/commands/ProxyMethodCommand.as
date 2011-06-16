package org.foomo.zugspitze.services.proxy.commands
{
	import flash.events.Event;

	import org.foomo.zugspitze.commands.Command;
	import org.foomo.zugspitze.commands.ICommand;
	import org.foomo.zugspitze.core.IUnload;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	public class ProxyMethodCommand extends Command implements ICommand, IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		private var _method:Function;

		private var _arguments:Array;

		protected var _methodCall:*;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodCommand(method:Function, arguments:Array, setBusyStatus:Boolean=false)
		{
			this._method = method;
			this._arguments = arguments;

			super(setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		public function execute():void
		{
			this._methodCall = this._method.apply(this, this._arguments);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_ERROR, this.methodCall_proxyMethodCallErrorHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallCompleteHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_COMPLETE, this.methodCall_proxyMethodCallProgressHandler);
		}


		public function get error():String
		{
			return ProxyMethodCall(this._methodCall).error;
		}


		public function unload():void
		{
			this._method = null;
			this._arguments = null;
			if (this._methodCall) {
				this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_ERROR, this.methodCall_proxyMethodCallErrorHandler);
				this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallCompleteHandler);
				this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_COMPLETE, this.methodCall_proxyMethodCallProgressHandler);
				this._methodCall = null;
			}
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallProgressHandler(event:ProxyMethodCallEvent):void
		{
		}

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallCompleteHandler(event:ProxyMethodCallEvent):void
		{
			this.dispatchCommandCompleteEvent();
		}

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallErrorHandler(event:ProxyMethodCallEvent):void
		{
			this.dispatchCommandErrorEvent(event.error);
		}
	}
}