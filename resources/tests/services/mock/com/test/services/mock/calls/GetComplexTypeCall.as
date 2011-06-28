package com.test.services.mock.calls
{
	import com.test.services.mock.events.GetComplexTypeCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;

	[Event(name="getComplexTypeCallComplete", type="com.test.services.mock.events.GetComplexTypeCallEvent")]
	[Event(name="getComplexTypeCallProgress", type="com.test.services.mock.events.GetComplexTypeCallEvent")]
	[Event(name="getComplexTypeCallError", type="com.test.services.mock.events.GetComplexTypeCallEvent")]

	/**
	 *
	 */
	public class GetComplexTypeCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getComplexType';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetComplexTypeCall(value:ComplexType)
		{
			super(METHOD_NAME, [value], GetComplexTypeCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():ComplexType
		{
			return this.methodReply.value;
		}
	}
}