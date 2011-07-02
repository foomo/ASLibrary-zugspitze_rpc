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
	import com.test.services.mock.events.GetArrayOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetArrayOperationComplete", type="com.test.services.mock.events.GetArrayOperationEvent")]
	[Event(name="GetArrayOperationProgress", type="com.test.services.mock.events.GetArrayOperationEvent")]
	[Event(name="GetArrayOperationError", type="com.test.services.mock.events.GetArrayOperationEvent")]

	/**
	 * @link    www.foomo.org
	 * @license www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetArrayOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetArrayOperation(value:Array, proxy:MockProxy)
		{
			super(proxy, 'getArray', [value], GetArrayOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Array
		{
			return this.untypedResult;
		}
	}
}