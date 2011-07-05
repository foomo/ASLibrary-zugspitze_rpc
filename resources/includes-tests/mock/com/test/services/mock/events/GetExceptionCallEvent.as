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
	import com.test.services.mock.calls.GetExceptionCall;

	import flash.events.Event;

	import org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetExceptionCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_EXCEPTION_CALL_COMPLETE:String = "getExceptionCallComplete";
		public static const GET_EXCEPTION_CALL_PROGRESS:String = "getExceptionCallProgress";
		public static const GET_EXCEPTION_CALL_ERROR:String = "getExceptionCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetExceptionCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			super(type, result, error, exception, messages, bytesTotal, bytesLoaded);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Boolean
		{
			return this.untypedResult;
		}
	}
}