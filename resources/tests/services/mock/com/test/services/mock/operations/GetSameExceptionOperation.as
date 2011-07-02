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
	import com.test.services.mock.events.GetSameExceptionOperationEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetSameExceptionOperationComplete", type="com.test.services.mock.events.GetSameExceptionOperationEvent")]
	[Event(name="GetSameExceptionOperationProgress", type="com.test.services.mock.events.GetSameExceptionOperationEvent")]
	[Event(name="GetSameExceptionOperationError", type="com.test.services.mock.events.GetSameExceptionOperationEvent")]

	/**
	 * @link    www.foomo.org
	 * @license www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetSameExceptionOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetSameExceptionOperation(proxy:MockProxy)
		{
			super(proxy, 'getSameException', [], GetSameExceptionOperationEvent);
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
			this._methodCall.removeEventListener(ExceptionEvent.EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			super.unload();
		}
	}
}