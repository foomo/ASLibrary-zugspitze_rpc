package org.foomo.zugspitze.services.rpc.protocol
{
	import org.foomo.zugspitze.services.rpc.protocol.call.CallHead;

	//[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.Call')]

	/**
	 * @private
	 */
	public class Call
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * envelope / header style data
		 */
		public var head:CallHead;
		/**
		 * (multiple) method calls
		 */
		public var calls:Array = [];
	}
}