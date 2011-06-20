package com.test.services.mock.operations
{
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;

	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetComplexTypeOperationEvent;

	import org.foomo.zugspitze.services.core.proxy.operations.ProxyMethodOperation;

	[Event(name="GetComplexTypeOperationComplete", type="com.test.services.mock.events.GetComplexTypeOperationEvent")]
	[Event(name="GetComplexTypeOperationProgress", type="com.test.services.mock.events.GetComplexTypeOperationEvent")]
	[Event(name="GetComplexTypeOperationError", type="com.test.services.mock.events.GetComplexTypeOperationEvent")]

	/**
	 *
	 */
	public class GetComplexTypeOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetComplexTypeOperation(proxy:MockProxy)
		{
			super(proxy, 'getComplexType', [], GetComplexTypeOperationEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():ComplexType
		{
			return this.untypedResult;
		}
	}
}