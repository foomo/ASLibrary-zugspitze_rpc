package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetCustomExceptionOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_CUSTOM_EXCEPTION_OPERATION_COMPLETE:String = 'getCustomExceptionOperationComplete';
		public static const GET_CUSTOM_EXCEPTION_OPERATION_PROGRESS:String = 'getCustomExceptionOperationProgress';
		public static const GET_CUSTOM_EXCEPTION_OPERATION_ERROR:String = 'getCustomExceptionOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetCustomExceptionOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			super(type, result, error, messages, total, progress);
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
		public function get error():*
		{
			return this.untypedError;
		}
	}
}