package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetStringCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getStringCallComplete", type="com.test.services.mock.events.GetStringCallEvent")]
	[Event(name="getStringCallProgress", type="com.test.services.mock.events.GetStringCallEvent")]
	[Event(name="getStringCallError", type="com.test.services.mock.events.GetStringCallEvent")]

	/**
	 *
	 */
	public class GetStringCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getString';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetStringCall(value:String)
		{
			super(METHOD_NAME, [value], GetStringCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():String
		{
			return this.methodReply.value;
		}
	}
}