package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetMessageOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetMessageOperationComplete", type="com.test.services.mock.events.GetMessageOperationEvent")]
	[Event(name="GetMessageOperationProgress", type="com.test.services.mock.events.GetMessageOperationEvent")]
	[Event(name="GetMessageOperationError", type="com.test.services.mock.events.GetMessageOperationEvent")]

	/**
	 *
	 */
	public class GetMessageOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetMessageOperation(proxy:MockProxy)
		{
			super(proxy, 'getMessage', [], GetMessageOperationEvent);
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