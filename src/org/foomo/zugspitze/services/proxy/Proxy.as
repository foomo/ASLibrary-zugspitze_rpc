package org.foomo.zugspitze.services.proxy
{
	import flash.events.EventDispatcher;

	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;
	import org.foomo.zugspitze.services.rpc.RPCClient;
	import org.foomo.zugspitze.zugspitze_internal;

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

		/**
		 *
		 */
		public function sendMethodCall(methodCall:ProxyMethodCall):*
		{
			methodCall.zugspitze_internal::token = this.rpcClient.addMethodCall(methodCall.methodName, methodCall.arguments);
			methodCall.zugspitze_internal::transport = this.rpcClient.sendCall();
			return methodCall;
		}
	}
}