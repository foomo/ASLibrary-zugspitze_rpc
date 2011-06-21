package org.foomo.zugspitze.services.core.rpc.protocol.reply
{
	[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.Reply.Exception')]

	/**
	 * @private
	 */
	public class ReplyException
	{
		/**
		 * error code
		 */
		public var code:int;
		/**
		 * error message
		 */
		public var message:String;
		/**
		 * key for a localized message
		 */
		public var messageKey:String;
	}
}