package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetExceptionOperationEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetExceptionOperationComplete", type="com.test.services.mock.events.GetExceptionOperationEvent")]
	[Event(name="GetExceptionOperationProgress", type="com.test.services.mock.events.GetExceptionOperationEvent")]
	[Event(name="GetExceptionOperationError", type="com.test.services.mock.events.GetExceptionOperationEvent")]

	/**
	 *
	 */
	public class GetExceptionOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetExceptionOperation(proxy:MockProxy)
		{
			super(proxy, 'getException', [], GetExceptionOperationEvent);
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