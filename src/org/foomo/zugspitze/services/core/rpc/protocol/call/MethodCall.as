package org.foomo.zugspitze.services.core.rpc.protocol.call
{
	[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.Call.MethodCall')]

	/**
	 * @private
	 */
	public class MethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * id of the method call
		 */
		public var id:String;
		/**
		 * name of the method to be called
		 */
		public var method:String;
		/**
		 * the method call arguments
		 */
		public var arguments:Array;
	}
}