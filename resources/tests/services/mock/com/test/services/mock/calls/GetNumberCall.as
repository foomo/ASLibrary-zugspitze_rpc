package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetNumberCallEvent;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;

	[Event(name="getNumberCallComplete", type="com.test.services.mock.events.GetNumberCallEvent")]
	[Event(name="getNumberCallProgress", type="com.test.services.mock.events.GetNumberCallEvent")]
	[Event(name="getNumberCallError", type="com.test.services.mock.events.GetNumberCallEvent")]

	/**
	 *
	 */
	public class GetNumberCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getNumber';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetNumberCall(value:Number)
		{
			super(METHOD_NAME, [value], GetNumberCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Number
		{
			return this.methodReply.value;
		}
	}
}