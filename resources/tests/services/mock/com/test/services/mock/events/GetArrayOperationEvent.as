package com.test.services.mock.events
{
	

	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetArrayOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_ARRAY_OPERATION_COMPLETE:String = 'getArrayOperationComplete';
		public static const GET_ARRAY_OPERATION_PROGRESS:String = 'getArrayOperationProgress';
		public static const GET_ARRAY_OPERATION_ERROR:String = 'getArrayOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetArrayOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			super(type, result, error, messages, total, progress);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Array
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