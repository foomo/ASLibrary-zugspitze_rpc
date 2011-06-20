package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;
	import com.test.services.mock.calls.GetComplexTypeCall;

	import flash.events.Event;

	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodCallEvent;

	/**
	 *
	 */
	public class GetComplexTypeCallEvent extends ProxyMethodCallEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_COMPLEX_TYPE_CALL_COMPLETE:String = "getComplexTypeCallComplete";
		public static const GET_COMPLEX_TYPE_CALL_PROGRESS:String = "getComplexTypeCallProgress";
		public static const GET_COMPLEX_TYPE_CALL_ERROR:String = "getComplexTypeCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetComplexTypeCallEvent(type:String, result:*=null, error:String='', exception:*=null, messages:Array=null, bytesTotal:Number=0, bytesLoaded:Number=0)
		{
			super(type, result, error, exception, messages, bytesTotal, bytesLoaded);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():ComplexType
		{
			return this.untypedResult;
		}
	}
}