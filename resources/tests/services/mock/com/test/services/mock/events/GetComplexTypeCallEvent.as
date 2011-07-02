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
package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;
	import com.test.services.mock.calls.GetComplexTypeCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodCallEvent;

	/**
	 * @link    www.foomo.org
	 * @license www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetComplexTypeCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_COMPLEX_TYPE_CALL_COMPLETE:String = "getComplexTypeCallComplete";
		public static const GET_COMPLEX_TYPE_CALL_PROGRESS:String = "getComplexTypeCallProgress";
		public static const GET_COMPLEX_TYPE_CALL_ERROR:String = "getComplexTypeCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetComplexTypeCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			super(type, result, error, exception, messages, bytesTotal, bytesLoaded);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():ComplexType
		{
			return this.untypedResult;
		}
	}
}