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
	import com.test.services.mock.events.GetIntCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getIntCallComplete", type="com.test.services.mock.events.GetIntCallEvent")]
	[Event(name="getIntCallProgress", type="com.test.services.mock.events.GetIntCallEvent")]
	[Event(name="getIntCallError", type="com.test.services.mock.events.GetIntCallEvent")]

	/**
	 * @link    www.foomo.org
	 * @license www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetIntCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getInt';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetIntCall(value:int)
		{
			super(METHOD_NAME, [value], GetIntCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():int
		{
			return this.methodReply.value;
		}
	}
}