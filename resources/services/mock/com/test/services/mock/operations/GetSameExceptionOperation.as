package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetSameExceptionOperationEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetSameExceptionOperationComplete", type="com.test.services.mock.events.GetSameExceptionOperationEvent")]
	[Event(name="GetSameExceptionOperationProgress", type="com.test.services.mock.events.GetSameExceptionOperationEvent")]
	[Event(name="GetSameExceptionOperationError", type="com.test.services.mock.events.GetSameExceptionOperationEvent")]

	/**
	 *
	 */
	public class GetSameExceptionOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetSameExceptionOperation(proxy:MockProxy)
		{
			super(proxy, 'getSameException', [], GetSameExceptionOperationEvent);
			this._methodCall.addEventListener(ExceptionEvent.EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
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

		/**
		 *
		 */
		public function get exception():Exception
		{
			return this.error as Exception
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function unload():void
		{
			this._methodCall.removeEventListener(ExceptionEvent.EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			super.unload();
		}
	}
}