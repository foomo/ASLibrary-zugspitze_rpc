package com.test.services.mock.events
{
	import org.foomo.zugspitze.services.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetBooleanOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_BOOLEAN_OPERATION_COMPLETE:String = 'getBooleanOperationComplete';
		public static const GET_BOOLEAN_OPERATION_PROGRESS:String = 'getBooleanOperationProgress';
		public static const GET_BOOLEAN_OPERATION_ERROR:String = 'getBooleanOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetBooleanOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
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