package com.test.services.mock.events
{
	
	import com.test.services.mock.calls.GetArrayCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetArrayCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_ARRAY_CALL_COMPLETE:String = "getArrayCallComplete";
		public static const GET_ARRAY_CALL_PROGRESS:String = "getArrayCallProgress";
		public static const GET_ARRAY_CALL_ERROR:String = "getArrayCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetArrayCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			super(type, result, error, exception, messages, bytesTotal, bytesLoaded);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Array
		{
			return this.untypedResult;
		}
	}
}