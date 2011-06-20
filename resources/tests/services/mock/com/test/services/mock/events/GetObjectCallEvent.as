package com.test.services.mock.events
{
	import com.test.services.mock.calls.GetObjectCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetObjectCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_OBJECT_CALL_COMPLETE:String = "getObjectCallComplete";
		public static const GET_OBJECT_CALL_PROGRESS:String = "getObjectCallProgress";
		public static const GET_OBJECT_CALL_ERROR:String = "getObjectCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetObjectCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			super(type, result, error, exception, messages, bytesTotal, bytesLoaded);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Object
		{
			return this.untypedResult;
		}
	}
}