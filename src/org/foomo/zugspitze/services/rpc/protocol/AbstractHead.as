package org.foomo.zugspitze.services.rpc.protocol
{
	//[ExcludeClass]
	[RemoteClass(alias='RPCHead')]

	/**
	 * @private
	 */
	public class AbstractHead
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * id of the call
		 */
		public var callId:String;
		/**
		 * sessionId
		 */
		public var sessionId:String;
	}
}