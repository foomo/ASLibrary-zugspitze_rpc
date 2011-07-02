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
	import com.test.services.mock.events.GetMessageCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getMessageCallComplete", type="com.test.services.mock.events.GetMessageCallEvent")]
	[Event(name="getMessageCallProgress", type="com.test.services.mock.events.GetMessageCallEvent")]
	[Event(name="getMessageCallError", type="com.test.services.mock.events.GetMessageCallEvent")]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetMessageCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getMessage';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetMessageCall()
		{
			super(METHOD_NAME, [], GetMessageCallEvent);
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
	}
}