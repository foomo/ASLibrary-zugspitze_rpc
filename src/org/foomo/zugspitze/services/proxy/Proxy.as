package org.foomo.zugspitze.services.proxy
{
	import org.foomo.zugspitze.services.events.ProxyMethodEvent;
	import org.foomo.zugspitze.services.rpc.RPCClient;

	import flash.events.EventDispatcher;

	[Event(name="methodCallError", type="org.foomo.zugspitze.services.events.ProxyMethodEvent")]
	[Event(name="methodCallComplete", type="org.foomo.zugspitze.services.events.ProxyMethodEvent")]
	[Event(name="methodCallProgress", type="org.foomo.zugspitze.services.events.ProxyMethodEvent")]

	public class Proxy extends EventDispatcher
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _rpcClient:RPCClient;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function Proxy(endPoint:String, serviceClassName:String, serviceClassVersion:Number, serviceSessionId:String=null)
		{
			this._rpcClient = new RPCClient(endPoint, serviceClassName, serviceClassVersion, serviceSessionId)
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get rpcClient():RPCClient
		{
			return this._rpcClient;
		}

		/**
		 *
		 */
		public function get endPoint():String
		{
			return this.rpcClient.endPoint;
		}
		public function set endPoint(value:String):void
		{
			this.rpcClient.endPoint = value
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected function dispatchProxyMethodEvent(event:ProxyMethodEvent):Boolean
		{
			return this.dispatchEvent(event);
		}
	}
}