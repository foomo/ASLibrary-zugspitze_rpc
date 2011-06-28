package com.test.services.mock.operations
{
	

	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetArrayOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetArrayOperationComplete", type="com.test.services.mock.events.GetArrayOperationEvent")]
	[Event(name="GetArrayOperationProgress", type="com.test.services.mock.events.GetArrayOperationEvent")]
	[Event(name="GetArrayOperationError", type="com.test.services.mock.events.GetArrayOperationEvent")]

	/**
	 *
	 */
	public class GetArrayOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetArrayOperation(value:Array, proxy:MockProxy)
		{
			super(proxy, 'getArray', [value], GetArrayOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Array
		{
			return this.untypedResult;
		}
	}
}