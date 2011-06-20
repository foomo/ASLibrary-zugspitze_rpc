package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetMessagesCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getMessagesCallComplete", type="com.test.services.mock.events.GetMessagesCallEvent")]
	[Event(name="getMessagesCallProgress", type="com.test.services.mock.events.GetMessagesCallEvent")]
	[Event(name="getMessagesCallError", type="com.test.services.mock.events.GetMessagesCallEvent")]

	/**
	 *
	 */
	public class GetMessagesCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getMessages';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetMessagesCall()
		{
			super(METHOD_NAME, [], GetMessagesCallEvent);
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