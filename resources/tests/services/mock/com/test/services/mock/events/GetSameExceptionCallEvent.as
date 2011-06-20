package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetSameExceptionCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetSameExceptionCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_SAME_EXCEPTION_CALL_COMPLETE:String = "getSameExceptionCallComplete";
		public static const GET_SAME_EXCEPTION_CALL_PROGRESS:String = "getSameExceptionCallProgress";
		public static const GET_SAME_EXCEPTION_CALL_ERROR:String = "getSameExceptionCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSameExceptionCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
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