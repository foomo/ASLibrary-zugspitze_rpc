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
package org.foomo.zugspitze.rpc.events
{
	import flash.events.Event;

	import org.foomo.utils.ClassUtil;
	import org.foomo.zugspitze.rpc.calls.ProxyMethodCall;

	/**
	 * This is a base class and should not be used independently.
	 * Define your own ProxyMethodCallEvent class and it"s event types
	 *
	 * @link www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author franklin <franklin@weareinteractive.com>
	 */
	public class ProxyMethodCallEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const PROXY_METHOD_CALL_RESULT:String 	= "proxyMethodCallResult";
		public static const PROXY_METHOD_CALL_PROGRESS:String 	= "proxyMethodCallProgress";
		public static const PROXY_METHOD_CALL_EXCEPTION:String 	= "proxyMethodCallException";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		private var _methodCall:ProxyMethodCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodCallEvent(type:String, methodCall:ProxyMethodCall, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this._methodCall = methodCall;
			super(type, bubbles, cancelable);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Loaded bytes on progress
		 */
		public function get methodCall():ProxyMethodCall
		{
			return this._methodCall;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new ProxyMethodCallEvent(this.type, this.methodCall, this.bubbles, this.cancelable);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("ProxyMethodCallEvent", "methodCall", "bubbles", "cancelable");
		}
	}
}