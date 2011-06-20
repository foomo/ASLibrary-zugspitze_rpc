package com.test.services.mock.operations
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetCustomExceptionOperationEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.CustomException;
	import com.test.services.mock.events.CustomExceptionEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import org.foomo.zugspitze.services.proxy.operations.ProxyMethodOperation;

	[Event(name="GetCustomExceptionOperationComplete", type="com.test.services.mock.events.GetCustomExceptionOperationEvent")]
	[Event(name="GetCustomExceptionOperationProgress", type="com.test.services.mock.events.GetCustomExceptionOperationEvent")]
	[Event(name="GetCustomExceptionOperationError", type="com.test.services.mock.events.GetCustomExceptionOperationEvent")]

	/**
	 *
	 */
	public class GetCustomExceptionOperation extends ProxyMethodOperation
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function GetCustomExceptionOperation(proxy:MockProxy)
		{
			super(proxy, 'getCustomException', [], GetCustomExceptionOperationEvent);
			this._methodCall.addEventListener(CustomExceptionEvent.CUSTOM_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
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
		public function get customException():CustomException
		{
			return this.error as CustomException
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
			this._methodCall.removeEventListener(CustomExceptionEvent.CUSTOM_EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			this._methodCall.removeEventListener(ExceptionEvent.EXCEPTION, this.methodCall_proxyMethodCallExceptionHandler);
			super.unload();
		}
	}
}