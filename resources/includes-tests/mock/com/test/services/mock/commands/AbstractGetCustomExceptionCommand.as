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
	import com.test.services.mock.calls.GetCustomExceptionCall;
	import com.test.services.mock.events.GetCustomExceptionCallEvent;
	import com.test.services.mock.events.CustomExceptionEvent;
	import com.test.services.mock.events.ExceptionEvent;

	import org.foomo.zugspitze.commands.Command;
	import org.foomo.zugspitze.commands.ICommand;
	import org.foomo.core.IUnload;

	/**
	 * Create your own command instance and override the protected event handlers
	 *
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class AbstractGetCustomExceptionCommand extends Command implements ICommand, IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * Service proxy
		 */
		public var proxy:MockProxy;
		/**
		 * Returned call from the proxy
		 */
		protected var _methodCall:GetCustomExceptionCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * @param proxy Service proxy
		 * @param setBusyStatus Set busy status while pending
		 */
		public function AbstractGetCustomExceptionCommand(proxy:MockProxy, setBusyStatus:Boolean=false)
		{
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
			this._methodCall = this.proxy.getCustomException();
			this._methodCall.addEventListener(GetCustomExceptionCallEvent.GET_CUSTOM_EXCEPTION_CALL_ERROR, this.abstractErrorHandler);
			this._methodCall.addEventListener(GetCustomExceptionCallEvent.GET_CUSTOM_EXCEPTION_CALL_PROGRESS, this.abstractProgressHandler);
			this._methodCall.addEventListener(GetCustomExceptionCallEvent.GET_CUSTOM_EXCEPTION_CALL_COMPLETE, this.abstractCompleteHandler);
			this._methodCall.addEventListener(CustomExceptionEvent.CUSTOM_EXCEPTION, this.abstractCustomExceptionHandler);
			this._methodCall.addEventListener(ExceptionEvent.EXCEPTION, this.abstractExceptionHandler);
		}

		/**
		 * @see org.foomo.flash.core.IUnload
		 */
		public function unload():void
		{
			this.proxy = null;
			if (this._methodCall) {
				this._methodCall.removeEventListener(GetCustomExceptionCallEvent.GET_CUSTOM_EXCEPTION_CALL_ERROR, this.abstractErrorHandler);
				this._methodCall.removeEventListener(GetCustomExceptionCallEvent.GET_CUSTOM_EXCEPTION_CALL_PROGRESS, this.abstractProgressHandler);
				this._methodCall.removeEventListener(GetCustomExceptionCallEvent.GET_CUSTOM_EXCEPTION_CALL_COMPLETE, this.abstractCompleteHandler);
				this._methodCall.removeEventListener(CustomExceptionEvent.CUSTOM_EXCEPTION, this.abstractCustomExceptionHandler);
				this._methodCall.removeEventListener(ExceptionEvent.EXCEPTION, this.abstractExceptionHandler);
				this._methodCall = null;
			}
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * Handle method call progress
		 *
		 * @param event Method call event
		 */
		protected function abstractProgressHandler(event:GetCustomExceptionCallEvent):void
		{
			// Overwrite this method in your implementation class
		}

		/**
		 * Handle method call result
		 *
		 * @param event Method call event
		 */
		protected function abstractCompleteHandler(event:GetCustomExceptionCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandCompleteEvent();
		}

		/**
		 * Handle method call error
		 *
		 * @param event Method call event
		 */
		protected function abstractErrorHandler(event:GetCustomExceptionCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandErrorEvent(event.error);
		}

		/**
		 * Handle exception
		 *
		 * @param event Exception event
		 */
		protected function abstractCustomExceptionHandler(event:CustomExceptionEvent):void
		{
			this.dispatchCommandErrorEvent(event.toString());
		}

		/**
		 * Handle exception
		 *
		 * @param event Exception event
		 */
		protected function abstractExceptionHandler(event:ExceptionEvent):void
		{
			this.dispatchCommandErrorEvent(event.toString());
		}
	}
}