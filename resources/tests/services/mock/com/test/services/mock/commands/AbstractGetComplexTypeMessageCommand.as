package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.calls.GetComplexTypeMessageCall;
	import com.test.services.mock.events.GetComplexTypeMessageCallEvent;

	import org.foomo.zugspitze.commands.Command;
	import org.foomo.zugspitze.commands.ICommand;
	import org.foomo.zugspitze.core.IUnload;

	/**
	 * Create your own command instance and override the protected event handlers
	 */
	public class AbstractGetComplexTypeMessageCommand extends Command implements ICommand, IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * Service proxy
		 */
		public var proxy:MockProxy;
		/**
		 * Returned call from the proxy
		 */
		protected var _methodCall:GetComplexTypeMessageCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * @param proxy Service proxy
		 * @param setBusyStatus Set busy status while pending
		 */
		public function AbstractGetComplexTypeMessageCommand(proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			this.proxy = proxy;
			super(setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * @see org.foomo.zugspitze.commands.ICommand
		 */
		public function execute():void
		{
			this._methodCall = this.proxy.getComplexTypeMessage();
			this._methodCall.addEventListener(GetComplexTypeMessageCallEvent.GET_COMPLEX_TYPE_MESSAGE_CALL_ERROR, this.abstractErrorHandler);
			this._methodCall.addEventListener(GetComplexTypeMessageCallEvent.GET_COMPLEX_TYPE_MESSAGE_CALL_PROGRESS, this.abstractProgressHandler);
			this._methodCall.addEventListener(GetComplexTypeMessageCallEvent.GET_COMPLEX_TYPE_MESSAGE_CALL_COMPLETE, this.abstractCompleteHandler);
		}

		/**
		 * @see org.foomo.zugspitze.core.IUnload
		 */
		public function unload():void
		{
			this.proxy = null;
			if (this._methodCall) {
				this._methodCall.removeEventListener(GetComplexTypeMessageCallEvent.GET_COMPLEX_TYPE_MESSAGE_CALL_ERROR, this.abstractErrorHandler);
				this._methodCall.removeEventListener(GetComplexTypeMessageCallEvent.GET_COMPLEX_TYPE_MESSAGE_CALL_PROGRESS, this.abstractProgressHandler);
				this._methodCall.removeEventListener(GetComplexTypeMessageCallEvent.GET_COMPLEX_TYPE_MESSAGE_CALL_COMPLETE, this.abstractCompleteHandler);
				this._methodCall = null;
			}
		}

		//-----------------------------------------------------------------------------------------
		// ~ Protected eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * Handle method call progress
		 *
		 * @param event Method call event
		 */
		protected function abstractProgressHandler(event:GetComplexTypeMessageCallEvent):void
		{
			// Overwrite this method in your implementation class
		}

		/**
		 * Handle method call result
		 *
		 * @param event Method call event
		 */
		protected function abstractCompleteHandler(event:GetComplexTypeMessageCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandCompleteEvent();
		}

		/**
		 * Handle method call error
		 *
		 * @param event Method call event
		 */
		protected function abstractErrorHandler(event:GetComplexTypeMessageCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandErrorEvent(event.error);
		}
	}
}