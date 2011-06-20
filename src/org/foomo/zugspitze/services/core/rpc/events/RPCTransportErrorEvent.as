package org.foomo.zugspitze.services.core.rpc.events
{
	import flash.events.ErrorEvent;
	import flash.events.Event;

	public class RPCTransportErrorEvent extends ErrorEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public static const NULL_ERROR:String 	= "nullError";
		public static const REPLY_ERROR:String 	= "replyError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCTransportErrorEvent(type:String, text:String='', id:int=0)
		{
			super(type, false, false, text, id);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCTransportErrorEvent(this.type, this.text, this.errorID);
		}

		/**
		 * @inherit
		 */
		public override function toString():String
		{
			return formatToString("RPCTransportEvent", "text", "id");
		}
	}
}