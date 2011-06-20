package org.foomo.zugspitze.services.core.rpc.events
{
	import flash.events.Event;

	import org.foomo.zugspitze.services.core.rpc.RPCTransport;

	public class RPCClientEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const RPC_TRANSPORT_COMPLETE:String 	= "rpcTransportComplete";
		public static const RPC_TRANSPORT_PROGRESS:String 	= "rpcTransportProgress";
		public static const RPC_TRANSPORT_OPEN:String 		= "rpcTransportOpen";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _transport:RPCTransport;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCClientEvent(type:String, transport:RPCTransport)
		{
			this._transport = transport;

			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get transport():RPCTransport
		{
			return _transport;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new RPCClientEvent(this.type, this.transport);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("RPCClientEvent", "transport");
		}
	}
}