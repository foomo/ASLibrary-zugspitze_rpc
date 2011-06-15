package org.foomo.zugspitze.services.rpc.protocol.call
{
	import org.foomo.zugspitze.services.rpc.protocol.AbstractHead;

	//[ExcludeClass]
	[RemoteClass(alias='Rad.Services.RPC.Protocol.Call.Head')]

	/**
	 * @private
	 */
	public class CallHead extends AbstractHead
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * name of the user
		 */
		public var username:String;
		/**
		 * password of the user
		 */
		public var password:String;
		/**
		 * name of the class to be called
		 */
		public var className:String;
		/**
		 * version of the class
		 */
		public var classVersion:Number;
	}
}