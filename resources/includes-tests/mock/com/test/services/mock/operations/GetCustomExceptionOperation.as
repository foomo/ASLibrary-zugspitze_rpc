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
package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetCustomExceptionOperationEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.CustomException;
	import com.test.services.mock.events.CustomExceptionEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetCustomExceptionOperationComplete", type="com.test.services.mock.events.GetCustomExceptionOperationEvent")]
	[Event(name="GetCustomExceptionOperationProgress", type="com.test.services.mock.events.GetCustomExceptionOperationEvent")]
	[Event(name="GetCustomExceptionOperationError", type="com.test.services.mock.events.GetCustomExceptionOperationEvent")]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetCustomExceptionOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetCustomExceptionOperation(proxy:MockProxy)
		{
			super(proxy, 'getCustomException', [], GetCustomExceptionOperationEvent);
			this._methodCall.addEventListener(CustomExceptionEvent.CUSTOM_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			this._methodCall.addEventListener(ExceptionEvent.EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Boolean
		{
			return this.untypedResult;
		}

		/**
		 *
		 */
		public function get customException():CustomException
		{
			return this.error as CustomException
		}

		/**
		 *
		 */
		public function get exception():Exception
		{
			return this.error as Exception
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function unload():void
		{
			this._methodCall.removeEventListener(CustomExceptionEvent.CUSTOM_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			this._methodCall.removeEventListener(ExceptionEvent.EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			super.unload();
		}
	}
}