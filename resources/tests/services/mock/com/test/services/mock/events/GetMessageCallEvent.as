package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetMessageCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetMessageCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_MESSAGE_CALL_COMPLETE:String = "getMessageCallComplete";
		public static const GET_MESSAGE_CALL_PROGRESS:String = "getMessageCallProgress";
		public static const GET_MESSAGE_CALL_ERROR:String = "getMessageCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetMessageCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
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