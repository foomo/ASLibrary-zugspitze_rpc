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
	import com.test.services.mock.events.GetStringOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetStringOperationComplete", type="com.test.services.mock.events.GetStringOperationEvent")]
	[Event(name="GetStringOperationProgress", type="com.test.services.mock.events.GetStringOperationEvent")]
	[Event(name="GetStringOperationError", type="com.test.services.mock.events.GetStringOperationEvent")]

	/**
	 * @link    www.foomo.org
	 * @license www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetStringOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetStringOperation(value:String, proxy:MockProxy)
		{
			super(proxy, 'getString', [value], GetStringOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():String
		{
			return this.untypedResult;
		}
	}
}