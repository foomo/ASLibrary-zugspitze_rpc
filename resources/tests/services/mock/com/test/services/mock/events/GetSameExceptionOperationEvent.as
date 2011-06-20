package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetSameExceptionOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_SAME_EXCEPTION_OPERATION_COMPLETE:String = 'getSameExceptionOperationComplete';
		public static const GET_SAME_EXCEPTION_OPERATION_PROGRESS:String = 'getSameExceptionOperationProgress';
		public static const GET_SAME_EXCEPTION_OPERATION_ERROR:String = 'getSameExceptionOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSameExceptionOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
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