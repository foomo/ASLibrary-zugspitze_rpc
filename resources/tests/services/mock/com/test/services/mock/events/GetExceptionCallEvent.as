package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetExceptionCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetExceptionCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_EXCEPTION_CALL_COMPLETE:String = "getExceptionCallComplete";
		public static const GET_EXCEPTION_CALL_PROGRESS:String = "getExceptionCallProgress";
		public static const GET_EXCEPTION_CALL_ERROR:String = "getExceptionCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetExceptionCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
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