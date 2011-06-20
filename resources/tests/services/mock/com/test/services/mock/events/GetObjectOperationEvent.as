package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetObjectOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_OBJECT_OPERATION_COMPLETE:String = 'getObjectOperationComplete';
		public static const GET_OBJECT_OPERATION_PROGRESS:String = 'getObjectOperationProgress';
		public static const GET_OBJECT_OPERATION_ERROR:String = 'getObjectOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetObjectOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			super(type, result, error, messages, total, progress);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Object
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