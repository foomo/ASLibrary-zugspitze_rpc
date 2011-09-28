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
package org.foomo.zugspitze.rpc.operations
{

	import flash.events.Event;

	import org.foomo.managers.LogManager;
	import org.foomo.memory.IUnload;
	import org.foomo.utils.ClassUtil;
	import org.foomo.zugspitze.operations.Operation;
	import org.foomo.zugspitze.operations.ProgressOperation;
	import org.foomo.zugspitze.rpc.Proxy;
	import org.foomo.zugspitze.rpc.calls.ProxyMethodCall;
	import org.foomo.zugspitze.rpc.events.ProxyErrorEvent;
	import org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent;

	[ExcludeClass]

	/**
	 * @link www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author franklin <franklin@weareinteractive.com>
	 */
	public class ProxyMethodOperation extends ProgressOperation implements IUnload
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
		/**
		 *
		 */
		protected var _messages:Array;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodOperation(proxy:Proxy, methodName:String, arguments:Array)
		{
			this._proxy = proxy;
			this._arguments = arguments;
			this._methodName = methodName;
			var method:Function = this._proxy[this._methodName];
			this._methodCall = method.apply(this, this._arguments);
			// @todo reenable when filtering is implemented
			//if (LogManager.isDebug()) LogManager.debug(this, 'ProxyMethodOperation.ProxyMethodOperation() :: {0}({1})', this._methodName, this._arguments);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, this.methodCall_proxyMethodCallResultHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallProgressHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			this._proxy.addEventListener(ProxyErrorEvent.COMMUNICATION_ERROR, this.proxy_errorHandler);
			this._proxy.addEventListener(ProxyErrorEvent.SECURITY_ERROR, this.proxy_errorHandler);
			this._proxy.addEventListener(ProxyErrorEvent.IO_ERROR, this.proxy_errorHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get messages():Array
		{
			return this._messages;
		}

		/**
		 *
		 */
		public function unload():void
		{
			this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, this.methodCall_proxyMethodCallResultHandler);
			this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallProgressHandler);
			this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			this._proxy.removeEventListener(ProxyErrorEvent.COMMUNICATION_ERROR, this.proxy_errorHandler);
			this._proxy.removeEventListener(ProxyErrorEvent.SECURITY_ERROR, this.proxy_errorHandler);
			this._proxy.removeEventListener(ProxyErrorEvent.IO_ERROR, this.proxy_errorHandler);
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
			this.dispatchOperationProgressEvent(event.methodCall.bytesTotal, event.methodCall.bytesLoaded);
		}

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallResultHandler(event:ProxyMethodCallEvent):void
		{
			this._messages = event.methodCall.messages;
			this.dispatchOperationCompleteEvent(event.methodCall.methodReply.value);
		}

		/**
		 *
		 */
		protected function methodCall_proxyMethodCallExceptionHandler(event:ProxyMethodCallEvent):void
		{
			// @todo reenable when filtering is implemented
			//if (LogManager.isDebug()) LogManager.debug(this, 'ProxyMethodOperation.methodCall_proxyMethodCallExceptionHandler() :: {0}', ClassUtil.getQualifiedName(event.methodCall.exception));
			this._messages = event.methodCall.messages;
			this.dispatchOperationErrorEvent(event.methodCall.methodReply.exception);
		}

		/**
		 *
		 */
		protected function proxy_errorHandler(event:ProxyErrorEvent):void
		{
			// @todo reenable when filtering is implemented
			//if (LogManager.isDebug()) LogManager.debug(this, 'ProxyMethodOperation.proxy_errorHandler() :: {0}', event.type);
			this.dispatchOperationErrorEvent(event);
		}
	}
}