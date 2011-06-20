package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetNumberOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_NUMBER_OPERATION_COMPLETE:String = 'getNumberOperationComplete';
		public static const GET_NUMBER_OPERATION_PROGRESS:String = 'getNumberOperationProgress';
		public static const GET_NUMBER_OPERATION_ERROR:String = 'getNumberOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetNumberOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			super(type, result, error, messages, total, progress);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Number
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