package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetIntCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getIntCallComplete", type="com.test.services.mock.events.GetIntCallEvent")]
	[Event(name="getIntCallProgress", type="com.test.services.mock.events.GetIntCallEvent")]
	[Event(name="getIntCallError", type="com.test.services.mock.events.GetIntCallEvent")]

	/**
	 *
	 */
	public class GetIntCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getInt';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetIntCall(value:int)
		{
			super(METHOD_NAME, [value], GetIntCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():int
		{
			return this.methodReply.value;
		}
	}
}