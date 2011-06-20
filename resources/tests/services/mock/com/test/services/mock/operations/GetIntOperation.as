package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetIntOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetIntOperationComplete", type="com.test.services.mock.events.GetIntOperationEvent")]
	[Event(name="GetIntOperationProgress", type="com.test.services.mock.events.GetIntOperationEvent")]
	[Event(name="GetIntOperationError", type="com.test.services.mock.events.GetIntOperationEvent")]

	/**
	 *
	 */
	public class GetIntOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetIntOperation(value:int, proxy:MockProxy)
		{
			super(proxy, 'getInt', [value], GetIntOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():int
		{
			return this.untypedResult;
		}
	}
}