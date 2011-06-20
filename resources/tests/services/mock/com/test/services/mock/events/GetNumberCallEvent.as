package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetNumberCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetNumberCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_NUMBER_CALL_COMPLETE:String = "getNumberCallComplete";
		public static const GET_NUMBER_CALL_PROGRESS:String = "getNumberCallProgress";
		public static const GET_NUMBER_CALL_ERROR:String = "getNumberCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetNumberCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			super(type, result, error, exception, messages, bytesTotal, bytesLoaded);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Number
		{
			return this.untypedResult;
		}
	}
}