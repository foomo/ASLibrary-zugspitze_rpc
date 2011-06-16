package org.foomo.zugspitze.services.proxy.events
{
	import flash.events.Event;

	import org.foomo.zugspitze.services.proxy.calls.ProxyMethodCall;

	public class ProxyMethodCallEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const PROXY_METHOD_CALL_COMPLETE:String 	= 'proxyMethodCallComplete';
		public static const PROXY_METHOD_CALL_PROGRESS:String 	= 'proxyMethodCallProgress';
		public static const PROXY_METHOD_CALL_ERROR:String 		= 'proxyMethodCallError';

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _methodCall:ProxyMethodCall

		//-----------------------------------------------------------------------------------------
		// ~ Variables
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
		 *
		 */
		public function get bytesLoaded():Number
		{
			return this.methodCall.bytesLoaded;
		}

		/**
		 *
		 */
		public function get bytesTotal():Number
		{
			return this.methodCall.bytesTotal;
		}

		/**
		 *
		 */
		public function get methodCall():ProxyMethodCall
		{
			return this._methodCall;
		}

		/**
		 *
		 */
		public function get error():String
		{
			return this._methodCall.error;
		}
	}
}