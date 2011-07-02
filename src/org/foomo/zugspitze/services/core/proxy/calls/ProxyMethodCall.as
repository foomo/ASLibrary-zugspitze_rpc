/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package org.foomo.zugspitze.services.core.proxy.calls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;

	import org.foomo.zugspitze.core.IUnload;
	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodCallEvent;
	import org.foomo.zugspitze.services.core.rpc.RPCMethodCallToken;
	import org.foomo.zugspitze.services.core.rpc.RPCTransport;
	import org.foomo.zugspitze.services.core.rpc.events.RPCMethodCallEvent;
	import org.foomo.zugspitze.services.core.rpc.events.RPCTransportErrorEvent;
	import org.foomo.zugspitze.services.core.rpc.protocol.reply.MethodReply;
	import org.foomo.zugspitze.zugspitze_internal;

	[ExcludeClass]

	/**
	 * This is a base class and should not be used independently.
	 * Define your MethodCall class and and define your custom event class.
	 *
	 * @link www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author franklin <franklin@weareinteractive.com>
	 */
	public class ProxyMethodCall extends EventDispatcher implements IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * Method name
		 */
		protected var _methodName:String;
		/**
		 * Method arguments
		 */
		protected var _arguments:Array;
		/**
		 * Class instance to dispatch
		 */
		protected var _eventClass:Class
		/**
		 * RPC Token object on sent
		 */
		protected var _token:RPCMethodCallToken;
		/**
		 * RPC Transport object on sent
		 */
		protected var _transport:RPCTransport;
		/**
		 *
		 */
		protected var _methodReply:MethodReply;
		/**
		 *
		 */
		protected var _bytesLoaded:Number;
		/**
		 *
		 */
		protected var _bytesTotal:Number;
		/**
		 *
		 */
		protected var _error:String;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * @param methodName Method name
		 * @param arguments	Method arguments
		 * @param eventClass Event class extending ProxyMethodCallEvent
		 */
		public function ProxyMethodCall(methodName:String, arguments:Array, eventClass:Class)
		{
			this._arguments = arguments;
			this._methodName = methodName;
			this._eventClass = eventClass;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public accessor methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method name
		 */
		public function get methodName():String
		{
			return this._methodName;
		}

		/**
		 * Method arguments
		 */
		public function get arguments():Array
		{
			return this._arguments;
		}

		/**
		 * Bytes loaded on progress
		 */
		public function get bytesLoaded():Number
		{
			return this._bytesLoaded;
		}

		/**
		 * Bytes total on progress
		 */
		public function get bytesTotal():Number
		{
			return this._bytesTotal;
		}

		/**
		 * Transport error message
		 */
		public function get error():String
		{
			return this._error;
		}

		/**
		 * The method call reply object
		 */
		public function get methodReply():MethodReply
		{
			return this._methodReply;
		}

		/**
		 * The method reply's messages
		 */
		public function get messages():Array
		{
			return (this._methodReply) ? this._methodReply.messages : [];
		}

		/**
		 * The method reply's exception object
		 */
		public function get exception():*
		{
			return (this._methodReply) ? this.methodReply.exception : null;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function unload():void
		{
			if (this._token) {
				this._token.removeEventListener(RPCMethodCallEvent.RPC_METHOD_CALL_COMPLETE, this.token_methodCallTokenCompleteHandler);
				this._token = null;
			}
			if (this._transport) {
				this._transport.removeEventListener(IOErrorEvent.IO_ERROR, this.transport_errorHandler);
				this._transport.removeEventListener(RPCTransportErrorEvent.NULL_ERROR, this.transport_errorHandler);
				this._transport.removeEventListener(RPCTransportErrorEvent.REPLY_ERROR, this.transport_errorHandler);
				this._transport.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.transport_errorHandler);
				this._transport.removeEventListener(ProgressEvent.PROGRESS, this.transport_progressHandler);
				this._transport = null;
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
			this._token.addEventListener(RPCMethodCallEvent.RPC_METHOD_CALL_COMPLETE, this.token_methodCallTokenCompleteHandler);
		}

		/**
		 * @private
		 */
		zugspitze_internal function set transport(value:RPCTransport):void
		{
			this._transport = value;
			this._transport.addEventListener(IOErrorEvent.IO_ERROR, this.transport_errorHandler);
			this._transport.addEventListener(RPCTransportErrorEvent.NULL_ERROR, this.transport_errorHandler);
			this._transport.addEventListener(RPCTransportErrorEvent.REPLY_ERROR, this.transport_errorHandler);
			this._transport.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.transport_errorHandler);
			this._transport.addEventListener(ProgressEvent.PROGRESS, this.transport_progressHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * Progress handler
		 *
		 * @private
		 */
		protected function transport_progressHandler(event:ProgressEvent):void
		{
			this._bytesLoaded = event.bytesLoaded;
			this._bytesTotal = event.bytesTotal;
			this.dispatchEvent(new this._eventClass(this._methodName + 'CallProgress', null, '', null, null, this._bytesTotal, this._bytesLoaded));
		}

		/**
		 * Handling transport errors like SecurityError, IOError ...
		 *
		 * @private
		 */
		protected function transport_errorHandler(event:Event):void
		{
			this._error = event['text'];
			this.dispatchEvent(new this._eventClass(this._methodName + 'CallError', null, this._error, null, null, this._bytesTotal, this._bytesLoaded));
		}

		/**
		 * Complete handler
		 *
		 * @private
		 */
		protected function token_methodCallTokenCompleteHandler(event:RPCMethodCallEvent):void
		{
			this._methodReply = event.methodReply;
			this.dispatchEvent(new this._eventClass(this._methodName + 'CallComplete', this._methodReply.value, '', this._methodReply.exception, this._methodReply.messages, this._bytesTotal, this._bytesLoaded));
		}
	}
}