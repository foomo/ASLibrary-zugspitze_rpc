package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetMessagesOperationEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetMessagesOperationComplete", type="com.test.services.mock.events.GetMessagesOperationEvent")]
	[Event(name="GetMessagesOperationProgress", type="com.test.services.mock.events.GetMessagesOperationEvent")]
	[Event(name="GetMessagesOperationError", type="com.test.services.mock.events.GetMessagesOperationEvent")]

	/**
	 *
	 */
	public class GetMessagesOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetMessagesOperation(proxy:MockProxy)
		{
			super(proxy, 'getMessages', [], GetMessagesOperationEvent);
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