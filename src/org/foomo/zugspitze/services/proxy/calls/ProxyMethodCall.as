package org.foomo.zugspitze.services.proxy.calls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;

	import org.foomo.zugspitze.core.IUnload;
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;
	import org.foomo.zugspitze.services.rpc.RPCMethodCallToken;
	import org.foomo.zugspitze.services.rpc.RPCTransport;
	import org.foomo.zugspitze.services.rpc.events.RPCMethodCallTokenEvent;
	import org.foomo.zugspitze.services.rpc.protocol.Reply;
	import org.foomo.zugspitze.services.rpc.protocol.reply.MethodReply;
	import org.foomo.zugspitze.zugspitze_internal;

	use namespace zugspitze_internal;

	[Event(name="proxyMethodCallComplete", type="org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent")]
	[Event(name="proxyMethodCallProgress", type="org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent")]
	[Event(name="proxyMethodCallError", type="org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent")]

	public class ProxyMethodCall extends EventDispatcher implements IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _arguments:Array;
		/**
		 *
		 */
		private var _methodName:String;
		/**
		 *
		 */
		private var _methodReply:MethodReply;
		/**
		 *
		 */
		private var _token:RPCMethodCallToken;
		/**
		 *
		 */
		private var _transport:RPCTransport;
		/**
		 *
		 */
		private var _bytesLoaded:Number;
		/**
		 *
		 */
		private var _bytesTotal:Number;
		/**
		 *
		 */
		private var _error:String;
		/**
		 *
		 */
		private var _eventClass:Class

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodCall(methodName:String, arguments:Array, eventClass:Class=null)
		{
			this._arguments = arguments;
			this._methodName = methodName;
			this._eventClass = (eventClass != null) ? eventClass : ProxyMethodCallEvent;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public accessor methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get methodName():String
		{
			return this._methodName;
		}

		/**
		 *
		 */
		public function get arguments():Array
		{
			return this._arguments;
		}

		/**
		 *
		 */
		public function get bytesLoaded():Number
		{
			return this._bytesLoaded;
		}

		/**
		 *
		 */
		public function get bytesTotal():Number
		{
			return this._bytesTotal;
		}

		/**
		 *
		 */
		public function get error():String
		{
			return this._error;
		}

		/**
		 *
		 */
		public function get methodReply():MethodReply
		{
			return this._methodReply;
		}

		/**
		 *
		 */
		public function get messages():Array
		{
			return this._methodReply.messages;
		}

		/**
		 *
		 */
		public function get exception():*
		{
			// TODO: check how this could be handled better
			return this.methodReply.exception;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function unload():void
		{
			if (this._transport) {
				this._transport.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.transport_errorHandler);
				this._transport.removeEventListener(IOErrorEvent.IO_ERROR, this.transport_errorHandler);
				this._transport.removeEventListener(ProgressEvent.PROGRESS, this.transport_progressHandler);
				this._transport = null;
			}
			if (this._token) {
				this._token.removeEventListener(RPCMethodCallTokenEvent.METHOD_CALL_TOKEN_COMPLETE, this.token_methodCallTokenCompleteHandler);
				this._token = null;
			}
		}

		//-----------------------------------------------------------------------------------------
		// ~ Zugspitze internal methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @private
		 */
		zugspitze_internal function set token(value:RPCMethodCallToken):void
		{
			this._token = value;
			this._token.addEventListener(RPCMethodCallTokenEvent.METHOD_CALL_TOKEN_COMPLETE, this.token_methodCallTokenCompleteHandler);
		}

		/**
		 * @private
		 */
		zugspitze_internal function set transport(value:RPCTransport):void
		{
			this._transport = value;
			this._transport.addEventListener(IOErrorEvent.IO_ERROR, this.transport_errorHandler);
			this._transport.addEventListener(IOErrorEvent.NETWORK_ERROR, this.transport_errorHandler);
			this._transport.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.transport_errorHandler);
			this._transport.addEventListener(ProgressEvent.PROGRESS, this.transport_progressHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected function transport_progressHandler(event:ProgressEvent):void
		{
			this._bytesLoaded = event.bytesLoaded;
			this._bytesTotal = event.bytesTotal;
			this.dispatchEvent(new this._eventClass(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this));
		}

		/**
		 *
		 */
		protected function transport_errorHandler(event:Event):void
		{
			this._error = event['text'];
			this.dispatchEvent(new this._eventClass(ProxyMethodCallEvent.PROXY_METHOD_CALL_ERROR, this));
		}

		/**
		 *
		 */
		protected function token_methodCallTokenCompleteHandler(event:RPCMethodCallTokenEvent):void
		{
			this._methodReply = event.methodReply
			this.dispatchEvent(new this._eventClass(ProxyMethodCallEvent.PROXY_METHOD_CALL_COMPLETE, this));
		}
	}
}