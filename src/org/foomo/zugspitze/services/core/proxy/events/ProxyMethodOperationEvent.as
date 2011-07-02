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

	import org.foomo.zugspitze.events.OperationEvent;
	import org.foomo.zugspitze.utils.ClassUtils;

	[ExcludeClass]
	
	/**
	 * @link www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author franklin <franklin@weareinteractive.com>
	 * @inherit
	 */
	public class ProxyMethodOperationEvent extends OperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _messages:Array;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			this._messages = messages;
			super(type, result, error, total, progress);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get messages():Array
		{
			return this._messages;
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
			return new eventClass(this.type, this.untypedResult, this.untypedError, this.messages, this.total, this.progress);
		}

		/**
		 * @inherit
		 */
		override public function cloneWithType(type:String):OperationEvent
		{
			var eventClass:Class = ClassUtils.getClass(this);
			return new eventClass(type, this.untypedResult, this.untypedError, this.messages, this.total, this.progress);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString(ClassUtils.getClassName(this), 'result', 'error', 'messages', 'total', 'progress');
		}
	}
}