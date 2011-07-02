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
package org.foomo.zugspitze.services.core.proxy.events
{
	import flash.events.Event;

	import org.foomo.zugspitze.utils.ClassUtils;

	[ExcludeClass]

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
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _result:*;
		/**
		 *
		 */
		private var _error:String;
		/**
		 *
		 */
		private var _exception:*;
		/**
		 *
		 */
		private var _messages:Array;
		/**
		 *
		 */
		private var _bytesTotal:Number;
		/**
		 *
		 */
		private var _bytesLoaded:Number;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodCallEvent(type:String, result:*=null, error:String="", exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			this._result = result;
			this._error = error;
			this._exception = exception;
			this._messages = messages;
			this._bytesTotal = bytesTotal;
			this._bytesLoaded = bytesLoaded;
			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Loaded bytes on progress
		 */
		public function get bytesLoaded():Number
		{
			return this._bytesLoaded;
		}

		/**
		 * Total bytes on progress
		 */
		public function get bytesTotal():Number
		{
			return this._bytesTotal;
		}

		/**
		 * Proxy error message
		 */
		public function get error():String
		{
			return this._error;
		}

		/**
		 * Proxy call messages
		 */
		public function get messages():Array
		{
			return this._messages;
		}

		/**
		 * Proxy call exception
		 */
		public function get exception():*
		{
			return this._exception;
		}

		/**
		 * Untypes proxy call result
		 */
		public function get untypedResult():*
		{
			return this._result;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			var eventClass:Class = ClassUtils.getClass(this);
			return new eventClass(this.type, this.untypedResult, this.error, this.exception, this.messages, this.bytesTotal, this.bytesLoaded);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString(ClassUtils.getClassName(this), "result", "error", "exception", "messages", "bytesTotal", "bytesLoaded");
		}
	}
}