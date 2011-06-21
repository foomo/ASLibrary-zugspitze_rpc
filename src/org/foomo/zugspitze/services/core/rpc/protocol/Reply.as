package org.foomo.zugspitze.services.core.rpc.protocol
{
	import org.foomo.zugspitze.services.core.rpc.protocol.reply.ReplyHead;

	[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.Reply')]

	/**
	 * @private
	 */
	public class Reply
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * head of the call
		 */
		public var head:ReplyHead;
		/**
		 * all the calls
		 */
		public var methodReplies:Array = new Array;
	}
}