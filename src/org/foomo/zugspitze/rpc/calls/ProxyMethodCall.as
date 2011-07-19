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
package org.foomo.zugspitze.rpc.calls
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;

	import org.foomo.core.IUnload;
	import org.foomo.rpc.RPCMethodCallToken;
	import org.foomo.rpc.RPCTransport;
	import org.foomo.rpc.events.RPCMethodCallEvent;
	import org.foomo.rpc.events.RPCTransportErrorEvent;
	import org.foomo.rpc.protocol.reply.MethodReply;
	import org.foomo.zugspitze.rpc.events.ProxyErrorEvent;
	import org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent;
	import org.foomo.zugspitze.zugspitze_internal;

	[Event(name="proxyMethodCallResult", type="org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent")]
	[Event(name="proxyMethodCallProgress", type="org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent")]
	[Event(name="proxyMethodCallException", type="org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent")]

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
		public function ProxyMethodCall(methodName:String, arguments:Array)
		{
			this._arguments = arguments;
			this._methodName = methodName;
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
			this.dispatchEvent(new ProxyMethodCallEvent(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this));
		}

		/**
		 * Complete handler
		 *
		 * @private
		 */
		protected function token_methodCallTokenCompleteHandler(event:RPCMethodCallEvent):void
		{
			this._methodReply = event.methodReply;
			if (this.methodReply.exception != null) {
				this.dispatchEvent(new ProxyMethodCallEvent(ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, this));
			} else {
				this.dispatchEvent(new ProxyMethodCallEvent(ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, this));
			}
		}
	}
}