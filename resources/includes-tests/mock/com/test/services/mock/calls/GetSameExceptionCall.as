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
package com.test.services.mock.calls
{
	import org.foomo.rpc.events.RPCMethodCallEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import com.test.services.mock.events.GetSameExceptionCallEvent;
	import org.foomo.zugspitze.rpc.calls.ProxyMethodCall;

	[Event(name="getSameExceptionCallComplete", type="com.test.services.mock.events.GetSameExceptionCallEvent")]
	[Event(name="getSameExceptionCallProgress", type="com.test.services.mock.events.GetSameExceptionCallEvent")]
	[Event(name="getSameExceptionCallError", type="com.test.services.mock.events.GetSameExceptionCallEvent")]
	[Event(name="exception", type="com.test.services.mock.events.ExceptionEvent")]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetSameExceptionCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getSameException';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSameExceptionCall()
		{
			super(METHOD_NAME, [], GetSameExceptionCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Boolean
		{
			return this.methodReply.value;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Complete handler
		 *
		 * @private
		 */
		override protected function token_methodCallTokenCompleteHandler(event:RPCMethodCallEvent):void
		{
			this._methodReply = event.methodReply;
			if (this._methodReply.exception != null) {
				switch (true) {
					case (this._methodReply.exception is Exception):
						this.dispatchEvent(new ExceptionEvent(ExceptionEvent.EXCEPTION, this._methodReply.exception.code, this._methodReply.exception.message, this._methodReply.exception.xdebug_message));
						break;
					default:
						throw new Error('Unhandled exception type');
						break;
				}
			} else {
				this.dispatchEvent(new GetSameExceptionCallEvent(GetSameExceptionCallEvent.GET_SAME_EXCEPTION_CALL_COMPLETE, this));
			}
		}
	}
}