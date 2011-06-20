package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetMessagesCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetMessagesCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_MESSAGES_CALL_COMPLETE:String = "getMessagesCallComplete";
		public static const GET_MESSAGES_CALL_PROGRESS:String = "getMessagesCallProgress";
		public static const GET_MESSAGES_CALL_ERROR:String = "getMessagesCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetMessagesCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
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