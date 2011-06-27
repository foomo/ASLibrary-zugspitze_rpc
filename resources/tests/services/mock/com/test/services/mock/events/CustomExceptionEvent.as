package com.test.services.mock.events
{
	import flash.events.Event;

	/**
	 *
	 */
	public class CustomExceptionEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const CUSTOM_EXCEPTION:String = "customException";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _note:String;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function CustomExceptionEvent(type:String, note:String)
		{
			this._note = note;
			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get note():String
		{
			return this._note;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new CustomExceptionEvent(this.type, this.note);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("CustomExceptionEvent");
		}
	}
}