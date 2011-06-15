package org.foomo.zugspitze.services.rpc
{
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;

	[Event(name="methodCallComplete", type="org.foomo.zugspitze.services.rpc.events.RPCMethodCallTokenEvent")]
	[Event(name="methodCallError", type="org.foomo.zugspitze.services.rpc.events.RPCMethodCallTokenEvent")]
	[Event(name="progress", type="flash.events.ProgressEvent")]

	/**
	 * @private
	 */
	public class RPCMethodCallToken extends EventDispatcher
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var methodCallId:String;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCMethodCallToken()
		{
		}
	}
}