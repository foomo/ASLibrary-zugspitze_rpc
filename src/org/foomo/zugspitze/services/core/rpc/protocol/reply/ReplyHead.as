package org.foomo.zugspitze.services.core.rpc.protocol.reply
{
	import org.foomo.zugspitze.services.core.rpc.protocol.AbstractHead;

	[ExcludeClass]
	[RemoteClass(alias='Foomo.Services.RPC.Protocol.Reply.Head')]

	/**
	 * @private
	 */
	public class ReplyHead extends AbstractHead
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ReplyHead()
		{
			super();
		}
	}
}