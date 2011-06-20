package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetBooleanCallEvent;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;

	[Event(name="getBooleanCallComplete", type="com.test.services.mock.events.GetBooleanCallEvent")]
	[Event(name="getBooleanCallProgress", type="com.test.services.mock.events.GetBooleanCallEvent")]
	[Event(name="getBooleanCallError", type="com.test.services.mock.events.GetBooleanCallEvent")]

	/**
	 *
	 */
	public class GetBooleanCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getBoolean';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetBooleanCall(value:Boolean)
		{
			super(METHOD_NAME, [value], GetBooleanCallEvent);
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