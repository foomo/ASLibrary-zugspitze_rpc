package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetObjectOperationEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetObjectOperationComplete", type="com.test.services.mock.events.GetObjectOperationEvent")]
	[Event(name="GetObjectOperationProgress", type="com.test.services.mock.events.GetObjectOperationEvent")]
	[Event(name="GetObjectOperationError", type="com.test.services.mock.events.GetObjectOperationEvent")]

	/**
	 *
	 */
	public class GetObjectOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetObjectOperation(value:Object, proxy:MockProxy)
		{
			super(proxy, 'getObject', [value], GetObjectOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Object
		{
			return this.untypedResult;
		}
	}
}