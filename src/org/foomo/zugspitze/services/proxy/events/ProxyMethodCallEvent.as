package org.foomo.zugspitze.services.proxy.events
{
	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;


	/**
	 * This is a base class and should not be used independently.
	 * Define your own ProxyMethodCallEvent class and it's event types
	 */
	//[ExcludeClass]
	public class ProxyMethodCallEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const PROXY_METHOD_CALL_COMPLETE:String 	= "proxyMethodCallComplete";
		public static const PROXY_METHOD_CALL_PROGRESS:String 	= "proxyMethodCallProgress";
		public static const PROXY_METHOD_CALL_EXCEPTION:String 	= "proxyMethodCallException";
		public static const PROXY_METHOD_CALL_ERROR:String 		= "proxyMethodCallError";

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * The dispatching method call
		 */
		private var _methodCall:ProxyMethodCall

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodCallEvent(type:String, methodCall:ProxyMethodCall)
		{
			this._methodCall = methodCall;
			super(type);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Loaded bytes on progress
		 */
		public function get bytesLoaded():Number
		{
			return (this.methodCall) ? this.methodCall.bytesLoaded : 0;
		}

		/**
		 * Total bytes on progress
		 */
		public function get bytesTotal():Number
		{
			return (this.methodCall) ? this.methodCall.bytesTotal : 0;
		}

		/**
		 * The dispatching method call
		 */
		public function get methodCall():ProxyMethodCall
		{
			return this._methodCall;
		}

		/**
		 * Proxy error message
		 */
		public function get error():String
		{
			return this._methodCall.error;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		public override function clone():Event
		{
			return new ProxyMethodCallEvent(type, this.methodCall);
		}

		/**
		 * @inherit
		 */
		public override function toString():String
		{
			return formatToString("ProxyMethodCallEvent", "methodCall");
		}
	}
}