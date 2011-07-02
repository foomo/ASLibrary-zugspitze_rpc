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
package org.foomo.zugspitze.services.core.proxy
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;

	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;
	import org.foomo.zugspitze.services.core.proxy.events.ProxyErrorEvent;
	import org.foomo.zugspitze.services.core.rpc.RPCClient;
	import org.foomo.zugspitze.services.core.rpc.RPCMethodCallToken;
	import org.foomo.zugspitze.services.core.rpc.RPCTransport;
	import org.foomo.zugspitze.services.core.rpc.events.RPCClientErrorEvent;
	import org.foomo.zugspitze.services.core.rpc.events.RPCClientEvent;
	import org.foomo.zugspitze.services.core.rpc.events.RPCTransportErrorEvent;
	import org.foomo.zugspitze.zugspitze_internal;

	[Event(name="ioError", type="org.foomo.zugspitze.services.core.proxy.events.ProxyErrorEvent")]
	[Event(name="securityError", type="org.foomo.zugspitze.services.core.proxy.events.ProxyErrorEvent")]
	[Event(name="communicationError", type="org.foomo.zugspitze.services.core.proxy.events.ProxyErrorEvent")]
	[ExcludeClass]
	
	/**
	 * @link www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author franklin <franklin@weareinteractive.com>
	 */
	public class Proxy extends EventDispatcher
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * The acutal rpc client
		 */
		private var _client:RPCClient;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function Proxy(endPoint:String, serviceClassName:String, serviceClassVersion:Number, serviceSessionId:String=null)
		{
			this._client = new RPCClient(endPoint, serviceClassName, serviceClassVersion, serviceSessionId);
			this._client.addEventListener(RPCClientErrorEvent.RPC_TRANSPORT_ERROR, this.client_errorHandler);
			this._client.addEventListener(RPCClientErrorEvent.SECURITY_ERROR, this.client_errorHandler);
			this._client.addEventListener(RPCClientErrorEvent.IO_ERROR, this.client_errorHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * The acutal rpc client
		 */
		public function get client():RPCClient
		{
			return this._client;
		}

		/**
		 * RPC client end point
		 */
		public function get endPoint():String
		{
			return this.client.endPoint;
		}
		public function set endPoint(value:String):void
		{
			this.client.endPoint = value
		}

		//-----------------------------------------------------------------------------------------
		// ~ Zugspitze internal methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		zugspitze_internal function sendMethodCall(methodCall:ProxyMethodCall):*
		{
			var proxy:Proxy = this;
			var token:RPCMethodCallToken= this.client.addMethodCall(methodCall.methodName, methodCall.arguments);
			var transport:RPCTransport = this.client.sendCall();

			var unload:Function;
			var errorHandler:Function
			var completeHandler:Function;

			unload = function():void {
				transport.removeEventListener(RPCTransportErrorEvent.NULL_ERROR, errorHandler);
				transport.removeEventListener(RPCTransportErrorEvent.NULL_ERROR, errorHandler);
				transport.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
				transport.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
				transport.addEventListener(Event.COMPLETE, completeHandler);
			}

			completeHandler = function (event:Event):void {
				unload.call(proxy);
			}

			errorHandler = function(event:Event):void {
				switch (event.type) {
					case IOErrorEvent.IO_ERROR:
						proxy.dispatchEvent(new ProxyErrorEvent(ProxyErrorEvent.IO_ERROR, methodCall, event['text'], event['errorID']));
						break;
					case SecurityErrorEvent.SECURITY_ERROR:
						proxy.dispatchEvent(new ProxyErrorEvent(ProxyErrorEvent.SECURITY_ERROR, methodCall, event['text'], event['errorID']));
						break;
					default:
						proxy.dispatchEvent(new ProxyErrorEvent(ProxyErrorEvent.COMMUNICATION_ERROR, methodCall, event['text'], event['errorID']));
						break;
				}
				unload.call(proxy);
			}

			transport.addEventListener(RPCTransportErrorEvent.NULL_ERROR, errorHandler);
			transport.addEventListener(RPCTransportErrorEvent.REPLY_ERROR, errorHandler);
			transport.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
			transport.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			transport.addEventListener(Event.COMPLETE, completeHandler);

			methodCall.zugspitze_internal::token = token;
			methodCall.zugspitze_internal::transport = transport;

			return methodCall;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * Do not remove!
		 * This method catches the client errors. We will handle the errors through sent methods.
		 */
		protected function client_errorHandler(event:Event):void
		{
			// Place holder
		}
	}
}