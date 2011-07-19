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
package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.calls.GetObjectCall;
	
	import org.foomo.zugspitze.commands.Command;
	import org.foomo.zugspitze.commands.ICommand;
	import org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent;
	import org.foomo.core.IUnload;

	/**
	 * Create your own command instance and override the protected event handlers
	 *
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class AbstractGetObjectCommand extends Command implements ICommand, IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * Service proxy
		 */
		public var proxy:MockProxy;
		/**
		 * 
		 */
		public var value:Object;
		/**
		 * Returned call from the proxy
		 */
		protected var _methodCall:GetObjectCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * @param value ;
		 * @param proxy Service proxy
		 * @param setBusyStatus Set busy status while pending
		 */
		public function AbstractGetObjectCommand(value:Object, proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			this.value = value;
			this.proxy = proxy;
			super(setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @see org.foomo.zugspitze.commands.ICommand
		 */
		public function execute():void
		{
			this._methodCall = this.proxy.getObject(this.value);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, this.methodCall_proxyMethodCallResultHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallProgressHandler);
			this._methodCall.addEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
		}

		/**
		 * @see org.foomo.flash.core.IUnload
		 */
		public function unload():void
		{
			this.proxy = null;
			this.value = null;
			if (this._methodCall) {
				this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, this.methodCall_proxyMethodCallResultHandler);
				this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_PROGRESS, this.methodCall_proxyMethodCallProgressHandler);
				this._methodCall.removeEventListener(ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
				this._methodCall = null;
			}
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * Handle method call result
		 *
		 * @param event Method call event
		 */
		protected function methodCall_proxyMethodCallResultHandler(event:ProxyMethodCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandCompleteEvent();
		}

		/**
		 * Handle method call progress
		 *
		 * @param event Method call event
		 */
		protected function methodCall_proxyMethodCallProgressHandler(event:ProxyMethodCallEvent):void
		{
			// Overwrite this method in your implementation class
		}

		/**
		 * Handle method call error
		 *
		 * @param event Method call event
		 */
		protected function methodCall_proxyMethodCallExceptionHandler(event:ProxyMethodCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandErrorEvent();
		}
	}
}