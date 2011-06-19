package org.foomo.zugspitze.services.proxy.events
{
	import flash.events.Event;

	import org.foomo.zugspitze.events.OperationEvent;
	import org.foomo.zugspitze.utils.ClassUtils;

	/**
	 * @inherit
	 */
	//[ExcludeClass]
	public class ProxyMethodOperationEvent extends OperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private var _messages:Array;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function ProxyMethodOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			this._messages = messages;
			super(type, result, error, total, progress);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get messages():Array
		{
			return this._messages;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @inherit
		 */
		override public function clone():Event
		{
			var eventClass:Class = ClassUtils.getClass(this);
			return new eventClass(this.type, this.untypedResult, this.untypedError, this.messages, this.total, this.progress);
		}

		/**
		 * @inherit
		 */
		override public function toString():String
		{
			return formatToString(ClassUtils.getClassName(this), 'result', 'error', 'messages', 'total', 'progress');
		}
	}
}