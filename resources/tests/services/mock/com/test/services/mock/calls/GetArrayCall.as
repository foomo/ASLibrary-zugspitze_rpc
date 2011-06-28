package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetArrayCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;
	

	[Event(name="getArrayCallComplete", type="com.test.services.mock.events.GetArrayCallEvent")]
	[Event(name="getArrayCallProgress", type="com.test.services.mock.events.GetArrayCallEvent")]
	[Event(name="getArrayCallError", type="com.test.services.mock.events.GetArrayCallEvent")]

	/**
	 *
	 */
	public class GetArrayCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getArray';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetArrayCall(value:Array)
		{
			super(METHOD_NAME, [value], GetArrayCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Array
		{
			return this.methodReply.value;
		}
	}
}