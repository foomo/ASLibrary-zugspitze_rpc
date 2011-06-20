package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetBooleanCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetBooleanCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_BOOLEAN_CALL_COMPLETE:String = "getBooleanCallComplete";
		public static const GET_BOOLEAN_CALL_PROGRESS:String = "getBooleanCallProgress";
		public static const GET_BOOLEAN_CALL_ERROR:String = "getBooleanCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetBooleanCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
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