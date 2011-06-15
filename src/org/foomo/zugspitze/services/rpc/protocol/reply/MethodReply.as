package org.foomo.zugspitze.services.rpc.protocol.reply
{
	//[ExcludeClass]
	[RemoteClass(alias='Rad.Services.RPC.Protocol.Reply.MethodReply')]

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
		public var value:Object;
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