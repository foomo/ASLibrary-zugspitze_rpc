package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetSharedObjectCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;
	import com.test.services.mock.vos.SharedObject;

	[Event(name="getSharedObjectCallComplete", type="com.test.services.mock.events.GetSharedObjectCallEvent")]
	[Event(name="getSharedObjectCallProgress", type="com.test.services.mock.events.GetSharedObjectCallEvent")]
	[Event(name="getSharedObjectCallError", type="com.test.services.mock.events.GetSharedObjectCallEvent")]

	/**
	 *
	 */
	public class GetSharedObjectCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getSharedObject';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSharedObjectCall()
		{
			super(METHOD_NAME, [], GetSharedObjectCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():SharedObject
		{
			return this.methodReply.value;
		}
	}
}