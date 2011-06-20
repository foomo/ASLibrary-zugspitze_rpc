package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetComplexTypeMessageCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetComplexTypeMessageCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_COMPLEX_TYPE_MESSAGE_CALL_COMPLETE:String = "getComplexTypeMessageCallComplete";
		public static const GET_COMPLEX_TYPE_MESSAGE_CALL_PROGRESS:String = "getComplexTypeMessageCallProgress";
		public static const GET_COMPLEX_TYPE_MESSAGE_CALL_ERROR:String = "getComplexTypeMessageCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetComplexTypeMessageCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
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