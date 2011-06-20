package org.foomo.zugspitze.services.core.rpc.events
{
	import flash.events.ErrorEvent;
	import flash.events.Event;

	import org.foomo.zugspitze.services.core.rpc.RPCTransport;

	public class RPCClientErrorEvent extends ErrorEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const RPC_TRANSPORT_ERROR:String 	= "rpcTransportError";
		public static const SECURITY_ERROR:String 		= "securityError";
		public static const IO_ERROR:String 			= "ioError";

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

		public function RPCClientErrorEvent(type:String, transport:RPCTransport, text:String='', id:int=0)
		{
			this._transport = transport;
			super(type, false, false, text, id);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * The causing transport
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
			return new RPCClientErrorEvent(type, transport, this.text, this.errorID);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("RPCClientErrorEvent", "transport", "text", "id");
		}
	}
}