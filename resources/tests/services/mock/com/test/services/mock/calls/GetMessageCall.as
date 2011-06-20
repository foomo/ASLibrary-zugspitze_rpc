package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetMessageCallEvent;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;

	[Event(name="getMessageCallComplete", type="com.test.services.mock.events.GetMessageCallEvent")]
	[Event(name="getMessageCallProgress", type="com.test.services.mock.events.GetMessageCallEvent")]
	[Event(name="getMessageCallError", type="com.test.services.mock.events.GetMessageCallEvent")]

	/**
	 *
	 */
	public class GetMessageCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getMessage';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetMessageCall()
		{
			super(METHOD_NAME, [], GetMessageCallEvent);
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