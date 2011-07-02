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
	import flash.events.Event;

	/**
	 * @link    www.foomo.org
	 * @license www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class ExceptionEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const EXCEPTION:String = "exception";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * error code
		 */
		private var _code:int;

		/**
		 * message
		 */
		private var _message:String;

		/**
		 * xdebug messages
		 */
		private var _xdebug_message:String;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ExceptionEvent(type:String, code:int, message:String, xdebug_message:String)
		{
			this._code = code;
			this._message = message;
			this._xdebug_message = xdebug_message;
			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * error code
		 */
		public function get code():int
		{
			return this._code;
		}

		/**
		 * message
		 */
		public function get message():String
		{
			return this._message;
		}

		/**
		 * xdebug messages
		 */
		public function get xdebug_message():String
		{
			return this._xdebug_message;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new ExceptionEvent(this.type, this.code, this.message, this.xdebug_message);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("ExceptionEvent");
		}
	}
}