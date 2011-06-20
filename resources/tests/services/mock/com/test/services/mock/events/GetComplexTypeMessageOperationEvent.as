package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetComplexTypeMessageOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_COMPLEX_TYPE_MESSAGE_OPERATION_COMPLETE:String = 'getComplexTypeMessageOperationComplete';
		public static const GET_COMPLEX_TYPE_MESSAGE_OPERATION_PROGRESS:String = 'getComplexTypeMessageOperationProgress';
		public static const GET_COMPLEX_TYPE_MESSAGE_OPERATION_ERROR:String = 'getComplexTypeMessageOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetComplexTypeMessageOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
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