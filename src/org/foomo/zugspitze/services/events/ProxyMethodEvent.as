package org.foomo.zugspitze.services.events
{
	import org.foomo.zugspitze.services.proxy.ProxyMethod;

	import flash.events.Event;

	import org.foomo.zugspitze.operations.IProgressOperation;

	public class ProxyMethodEvent extends Event
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_CALL_COMPLETE:String = 'methodCallComplete';
		public static const METHOD_CALL_PROGRESS:String = 'methodCallProgress';
		public static const METHOD_CALL_ERROR:String 	= 'methodCallError';

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _method:ProxyMethod;
		/**
		 *
		 */
		private var _operation:IProgressOperation;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodEvent(type:String, method:ProxyMethod, operation:IProgressOperation)
		{
			this._method = method;
			this._operation = operation;

			super(type, bubbles, cancelable);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get operation():IProgressOperation
		{
			return this._operation;
		}

		/**
		 *
		 */
		public function get method():ProxyMethod
		{
			return this._method;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		public override function clone():Event
		{
			return new ProxyMethodEvent(this.type, this._method, this._operation);
		}

		/**
		 * @inherit
		 */
		public override function toString():String
		{
			return formatToString("ProxyMethodEvent");
		}
	}
}