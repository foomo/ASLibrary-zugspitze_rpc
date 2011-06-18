package org.foomo.zugspitze.services.proxy.events
{
	import flash.events.ErrorEvent;
	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;

	public class ProxyErrorEvent extends ErrorEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const COMMUNICATION_ERROR:String 	= "communicationError";
		public static const SECURITY_ERROR:String 		= "securityError";
		public static const IO_ERROR:String 			= "ioError";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		private var _methodCall:ProxyMethodCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyErrorEvent(type:String, methodCall:ProxyMethodCall, text:String="", id:int=0)
		{
			this._methodCall = methodCall;
			super(type, false, false, text, id);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * The causing method call
		 */
		public function get transport():ProxyMethodCall
		{
			return _methodCall;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			return new ProxyErrorEvent(type, transport);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString("RPCClientErrorEvent", "methodCall", "text", "id");
		}
	}
}