package org.foomo.zugspitze.services.rpc.events
{
	import flash.events.Event;

	/**
	 *
	 */
	public class RPCTransportEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const TRANSPORT_COMPLETE:String 	= 'transportComplete';
		public static const TRANSPORT_PROGRESS:String 	= 'transportProgress';
		public static const TRANSPORT_ERROR:String 		= 'transportError';

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public var resultData:Object;
		/**
		 *
		 */
		public var requestData:Object;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCTransportEvent(type:String, requestData:Object, resultData:Object=null)
		{
			this.requestData 	= requestData;
			this.resultData 	= resultData;
			super(type, false, false);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCTransportEvent(this.type, this.resultData, this.requestData);
		}
	}
}