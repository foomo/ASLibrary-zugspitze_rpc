package com.test.services.mock.operations
{
	import com.test.services.mock.vos.SharedObject;

	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetSharedObjectOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetSharedObjectOperationComplete", type="com.test.services.mock.events.GetSharedObjectOperationEvent")]
	[Event(name="GetSharedObjectOperationProgress", type="com.test.services.mock.events.GetSharedObjectOperationEvent")]
	[Event(name="GetSharedObjectOperationError", type="com.test.services.mock.events.GetSharedObjectOperationEvent")]

	/**
	 *
	 */
	public class GetSharedObjectOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetSharedObjectOperation(proxy:MockProxy)
		{
			super(proxy, 'getSharedObject', [], GetSharedObjectOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():SharedObject
		{
			return this.untypedResult;
		}
	}
}