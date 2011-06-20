package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetComplexTypeMessageCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getComplexTypeMessageCallComplete", type="com.test.services.mock.events.GetComplexTypeMessageCallEvent")]
	[Event(name="getComplexTypeMessageCallProgress", type="com.test.services.mock.events.GetComplexTypeMessageCallEvent")]
	[Event(name="getComplexTypeMessageCallError", type="com.test.services.mock.events.GetComplexTypeMessageCallEvent")]

	/**
	 *
	 */
	public class GetComplexTypeMessageCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getComplexTypeMessage';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetComplexTypeMessageCall()
		{
			super(METHOD_NAME, [], GetComplexTypeMessageCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Boolean
		{
			return this.methodReply.value;
		}
	}
}