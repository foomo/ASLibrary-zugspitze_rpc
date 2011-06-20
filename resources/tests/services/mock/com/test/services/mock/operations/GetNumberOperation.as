package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetNumberOperationEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetNumberOperationComplete", type="com.test.services.mock.events.GetNumberOperationEvent")]
	[Event(name="GetNumberOperationProgress", type="com.test.services.mock.events.GetNumberOperationEvent")]
	[Event(name="GetNumberOperationError", type="com.test.services.mock.events.GetNumberOperationEvent")]

	/**
	 *
	 */
	public class GetNumberOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetNumberOperation(value:Number, proxy:MockProxy)
		{
			super(proxy, 'getNumber', [value], GetNumberOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Number
		{
			return this.untypedResult;
		}
	}
}