package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetBooleanOperationEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetBooleanOperationComplete", type="com.test.services.mock.events.GetBooleanOperationEvent")]
	[Event(name="GetBooleanOperationProgress", type="com.test.services.mock.events.GetBooleanOperationEvent")]
	[Event(name="GetBooleanOperationError", type="com.test.services.mock.events.GetBooleanOperationEvent")]

	/**
	 *
	 */
	public class GetBooleanOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetBooleanOperation(value:Boolean, proxy:MockProxy)
		{
			super(proxy, 'getBoolean', [value], GetBooleanOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Boolean
		{
			return this.untypedResult;
		}
	}
}