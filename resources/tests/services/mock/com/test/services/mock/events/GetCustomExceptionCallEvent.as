package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetCustomExceptionCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetCustomExceptionCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_CUSTOM_EXCEPTION_CALL_COMPLETE:String = "getCustomExceptionCallComplete";
		public static const GET_CUSTOM_EXCEPTION_CALL_PROGRESS:String = "getCustomExceptionCallProgress";
		public static const GET_CUSTOM_EXCEPTION_CALL_ERROR:String = "getCustomExceptionCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetCustomExceptionCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
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