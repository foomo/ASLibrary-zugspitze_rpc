package com.test.services.mock.events
{
	import com.test.services.mock.vos.SharedObject;

	import org.foomo.zugspitze.services.core.proxy.events.ProxyMethodOperationEvent;

	/**
	 *
	 */
	public class GetSharedObjectOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_SHARED_OBJECT_OPERATION_COMPLETE:String = 'getSharedObjectOperationComplete';
		public static const GET_SHARED_OBJECT_OPERATION_PROGRESS:String = 'getSharedObjectOperationProgress';
		public static const GET_SHARED_OBJECT_OPERATION_ERROR:String = 'getSharedObjectOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSharedObjectOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			super(type, result, error, messages, total, progress);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():SharedObject
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