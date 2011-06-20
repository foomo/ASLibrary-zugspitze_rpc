package com.test.services.mock.events
{
	import flash.events.Event;

	/**
	 * 
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