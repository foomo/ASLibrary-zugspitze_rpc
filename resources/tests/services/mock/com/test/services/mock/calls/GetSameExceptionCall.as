package com.test.services.mock.calls
{
	import org.foomo.zugspitze.services.core.rpc.events.RPCMethodCallEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import com.test.services.mock.events.GetSameExceptionCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getSameExceptionCallComplete", type="com.test.services.mock.events.GetSameExceptionCallEvent")]
	[Event(name="getSameExceptionCallProgress", type="com.test.services.mock.events.GetSameExceptionCallEvent")]
	[Event(name="getSameExceptionCallError", type="com.test.services.mock.events.GetSameExceptionCallEvent")]
	[Event(name="exception", type="com.test.services.mock.events.ExceptionEvent")]

	/**
	 *
	 */
	public class GetSameExceptionCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getSameException';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSameExceptionCall()
		{
			super(METHOD_NAME, [], GetSameExceptionCallEvent);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Method call result
		 */
		public function get result():Boolean
		{
			return this.methodReply.value;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		/**
		 * Complete handler
		 *
		 * @private
		 */
		override protected function token_methodCallTokenCompleteHandler(event:RPCMethodCallEvent):void
		{
			this._methodReply = event.methodReply;
			if (this._methodReply.exception != null) {
				switch (true) {
					case (this._methodReply.exception is Exception):
						this.dispatchEvent(new ExceptionEvent(ExceptionEvent.EXCEPTION, this._methodReply.exception.code, this._methodReply.exception.message, this._methodReply.exception.xdebug_message));
						break;
					default:
						throw new Error('Unhandled exception type');
						break;
				}
			} else {
				this.dispatchEvent(new GetSameExceptionCallEvent(GetSameExceptionCallEvent.GET_SAME_EXCEPTION_CALL_COMPLETE, this));
			}
		}
	}
}