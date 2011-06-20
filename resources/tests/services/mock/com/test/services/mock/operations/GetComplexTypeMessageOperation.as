package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetComplexTypeMessageOperationEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetComplexTypeMessageOperationComplete", type="com.test.services.mock.events.GetComplexTypeMessageOperationEvent")]
	[Event(name="GetComplexTypeMessageOperationProgress", type="com.test.services.mock.events.GetComplexTypeMessageOperationEvent")]
	[Event(name="GetComplexTypeMessageOperationError", type="com.test.services.mock.events.GetComplexTypeMessageOperationEvent")]

	/**
	 *
	 */
	public class GetComplexTypeMessageOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetComplexTypeMessageOperation(proxy:MockProxy)
		{
			super(proxy, 'getComplexTypeMessage', [], GetComplexTypeMessageOperationEvent);
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