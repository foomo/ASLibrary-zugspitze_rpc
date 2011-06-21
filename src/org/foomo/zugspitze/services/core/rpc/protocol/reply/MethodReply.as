package org.foomo.zugspitze.services.core.rpc.protocol.reply
{
	[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.Reply.MethodReply')]

	/**
	 * @private
	 */
	public class MethodReply
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * id of the method call
		 */
		public var id:String;
		/**
		 * return value
		 */
		public var value:*;
		/**
		 * messages
		 */
		public var messages:Array = [];
		/**
		 * server side exception
		 */
		public var exception:*;
	}
}