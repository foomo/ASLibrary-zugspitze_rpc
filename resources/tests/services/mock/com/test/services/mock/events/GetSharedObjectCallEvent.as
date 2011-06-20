package com.test.services.mock.events
{
	import com.test.services.mock.vos.SharedObject;
	import com.test.services.mock.calls.GetSharedObjectCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetSharedObjectCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_SHARED_OBJECT_CALL_COMPLETE:String = "getSharedObjectCallComplete";
		public static const GET_SHARED_OBJECT_CALL_PROGRESS:String = "getSharedObjectCallProgress";
		public static const GET_SHARED_OBJECT_CALL_ERROR:String = "getSharedObjectCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSharedObjectCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			super(type, result, error, exception, messages, bytesTotal, bytesLoaded);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():SharedObject
		{
			return this.untypedResult;
		}
	}
}