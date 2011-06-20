package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetObjectCallEvent;
	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;

	[Event(name="getObjectCallComplete", type="com.test.services.mock.events.GetObjectCallEvent")]
	[Event(name="getObjectCallProgress", type="com.test.services.mock.events.GetObjectCallEvent")]
	[Event(name="getObjectCallError", type="com.test.services.mock.events.GetObjectCallEvent")]

	/**
	 *
	 */
	public class GetObjectCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getObject';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetObjectCall(value:Object)
		{
			super(METHOD_NAME, [value], GetObjectCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Object
		{
			return this.methodReply.value;
		}
	}
}