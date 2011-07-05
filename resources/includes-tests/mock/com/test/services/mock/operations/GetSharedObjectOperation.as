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
	import com.test.services.mock.vos.SharedObject;

	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetSharedObjectOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetSharedObjectOperationComplete", type="com.test.services.mock.events.GetSharedObjectOperationEvent")]
	[Event(name="GetSharedObjectOperationProgress", type="com.test.services.mock.events.GetSharedObjectOperationEvent")]
	[Event(name="GetSharedObjectOperationError", type="com.test.services.mock.events.GetSharedObjectOperationEvent")]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetSharedObjectOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetSharedObjectOperation(proxy:MockProxy)
		{
			super(proxy, 'getSharedObject', [], GetSharedObjectOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():SharedObject
		{
			return this.untypedResult;
		}
	}
}