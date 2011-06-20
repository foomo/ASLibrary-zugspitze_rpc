package org.foomo.zugspitze.services.core.rpc
{
	import flash.events.EventDispatcher;
	import flash.events.ProgressEvent;

	[Event(name="progress", type="flash.events.ProgressEvent")]
	[Event(name="rpcMethodCallError", type="org.foomo.zugspitze.services.core.rpc.events.RPCMethodCallEvent")]
	[Event(name="rpcMethodCallComplete", type="org.foomo.zugspitze.services.core.rpc.events.RPCMethodCallEvent")]

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