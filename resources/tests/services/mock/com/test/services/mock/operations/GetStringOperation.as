package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetStringOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetStringOperationComplete", type="com.test.services.mock.events.GetStringOperationEvent")]
	[Event(name="GetStringOperationProgress", type="com.test.services.mock.events.GetStringOperationEvent")]
	[Event(name="GetStringOperationError", type="com.test.services.mock.events.GetStringOperationEvent")]

	/**
	 *
	 */
	public class GetStringOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetStringOperation(value:String, proxy:MockProxy)
		{
			super(proxy, 'getString', [value], GetStringOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():String
		{
			return this.untypedResult;
		}
	}
}