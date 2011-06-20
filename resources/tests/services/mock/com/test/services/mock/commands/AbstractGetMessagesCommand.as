package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.calls.GetMessagesCall;
	import com.test.services.mock.events.GetMessagesCallEvent;

	import org.foomo.zugspitze.commands.Command;
	import org.foomo.zugspitze.commands.ICommand;
	import org.foomo.zugspitze.core.IUnload;

	/**
	 * Create your own command instance and override the protected event handlers
	 */
	public class AbstractGetMessagesCommand extends Command implements ICommand, IUnload
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
		protected var _methodCall:GetMessagesCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * @param proxy Service proxy
		 * @param setBusyStatus Set busy status while pending
		 */
		public function AbstractGetMessagesCommand(proxy:MockProxy, setBusyStatus:Boolean=false)
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
			this._methodCall = this.proxy.getMessages();
			this._methodCall.addEventListener(GetMessagesCallEvent.GET_MESSAGES_CALL_ERROR, this.abstractErrorHandler);
			this._methodCall.addEventListener(GetMessagesCallEvent.GET_MESSAGES_CALL_PROGRESS, this.abstractProgressHandler);
			this._methodCall.addEventListener(GetMessagesCallEvent.GET_MESSAGES_CALL_COMPLETE, this.abstractCompleteHandler);
		}

		/**
		 * @see org.foomo.zugspitze.core.IUnload
		 */
		public function unload():void
		{
			this.proxy = null;
			if (this._methodCall) {
				this._methodCall.removeEventListener(GetMessagesCallEvent.GET_MESSAGES_CALL_ERROR, this.abstractErrorHandler);
				this._methodCall.removeEventListener(GetMessagesCallEvent.GET_MESSAGES_CALL_PROGRESS, this.abstractProgressHandler);
				this._methodCall.removeEventListener(GetMessagesCallEvent.GET_MESSAGES_CALL_COMPLETE, this.abstractCompleteHandler);
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
		protected function abstractProgressHandler(event:GetMessagesCallEvent):void
		{
			// Overwrite this method in your implementation class
		}

		/**
		 * Handle method call result
		 *
		 * @param event Method call event
		 */
		protected function abstractCompleteHandler(event:GetMessagesCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandCompleteEvent();
		}

		/**
		 * Handle method call error
		 *
		 * @param event Method call event
		 */
		protected function abstractErrorHandler(event:GetMessagesCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandErrorEvent(event.error);
		}
	}
}