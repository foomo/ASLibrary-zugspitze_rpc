package org.foomo.zugspitze.services.core.rpc.protocol
{
	[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.RPCHead')]

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