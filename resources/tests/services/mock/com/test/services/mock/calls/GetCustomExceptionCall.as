package com.test.services.mock.calls
{
	import org.foomo.zugspitze.services.core.rpc.events.RPCMethodCallEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.CustomException;
	import com.test.services.mock.events.CustomExceptionEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import com.test.services.mock.events.ExceptionEvent;

	import com.test.services.mock.events.GetCustomExceptionCallEvent;
	import org.foomo.zugspitze.services.core.proxy.calls.ProxyMethodCall;

	[Event(name="getCustomExceptionCallComplete", type="com.test.services.mock.events.GetCustomExceptionCallEvent")]
	[Event(name="getCustomExceptionCallProgress", type="com.test.services.mock.events.GetCustomExceptionCallEvent")]
	[Event(name="getCustomExceptionCallError", type="com.test.services.mock.events.GetCustomExceptionCallEvent")]
	[Event(name="customException", type="com.test.services.mock.events.CustomExceptionEvent")]
	[Event(name="exception", type="com.test.services.mock.events.ExceptionEvent")]

	/**
	 *
	 */
	public class GetCustomExceptionCall extends ProxyMethodCall
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const METHOD_NAME:String = 'getCustomException';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetCustomExceptionCall()
		{
			super(METHOD_NAME, [], GetCustomExceptionCallEvent);
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
					case (this._methodReply.exception is CustomException):
						this.dispatchEvent(new CustomExceptionEvent(CustomExceptionEvent.CUSTOM_EXCEPTION, this._methodReply.exception.note));
						break;
					case (this._methodReply.exception is Exception):
						this.dispatchEvent(new ExceptionEvent(ExceptionEvent.EXCEPTION, this._methodReply.exception.code, this._methodReply.exception.message, this._methodReply.exception.xdebug_message));
						break;
					default:
						throw new Error('Unhandled exception type');
						break;
				}
			} else {
				this.dispatchEvent(new GetCustomExceptionCallEvent(GetCustomExceptionCallEvent.GET_CUSTOM_EXCEPTION_CALL_COMPLETE, this));
			}
		}
	}
}