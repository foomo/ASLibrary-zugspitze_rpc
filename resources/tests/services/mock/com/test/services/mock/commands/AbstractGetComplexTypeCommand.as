package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.calls.GetComplexTypeCall;
	import com.test.services.mock.events.GetComplexTypeCallEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;
	import org.foomo.zugspitze.commands.Command;
	import org.foomo.zugspitze.commands.ICommand;
	import org.foomo.zugspitze.core.IUnload;

	/**
	 * Create your own command instance and override the protected event handlers
	 */
	public class AbstractGetComplexTypeCommand extends Command implements ICommand, IUnload
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * Service proxy
		 */
		public var proxy:MockProxy;
		/**
		 * 
		 */
		public var value:ComplexType;
		/**
		 * Returned call from the proxy
		 */
		protected var _methodCall:GetComplexTypeCall;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		/**
		 * @param value ;
		 * @param proxy Service proxy
		 * @param setBusyStatus Set busy status while pending
		 */
		public function AbstractGetComplexTypeCommand(value:ComplexType, proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			this.value = value;
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
			this._methodCall = this.proxy.getComplexType(this.value);
			this._methodCall.addEventListener(GetComplexTypeCallEvent.GET_COMPLEX_TYPE_CALL_ERROR, this.abstractErrorHandler);
			this._methodCall.addEventListener(GetComplexTypeCallEvent.GET_COMPLEX_TYPE_CALL_PROGRESS, this.abstractProgressHandler);
			this._methodCall.addEventListener(GetComplexTypeCallEvent.GET_COMPLEX_TYPE_CALL_COMPLETE, this.abstractCompleteHandler);
		}

		/**
		 * @see org.foomo.zugspitze.core.IUnload
		 */
		public function unload():void
		{
			this.proxy = null;
			this.value = null;
			if (this._methodCall) {
				this._methodCall.removeEventListener(GetComplexTypeCallEvent.GET_COMPLEX_TYPE_CALL_ERROR, this.abstractErrorHandler);
				this._methodCall.removeEventListener(GetComplexTypeCallEvent.GET_COMPLEX_TYPE_CALL_PROGRESS, this.abstractProgressHandler);
				this._methodCall.removeEventListener(GetComplexTypeCallEvent.GET_COMPLEX_TYPE_CALL_COMPLETE, this.abstractCompleteHandler);
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
		protected function abstractProgressHandler(event:GetComplexTypeCallEvent):void
		{
			// Overwrite this method in your implementation class
		}

		/**
		 * Handle method call result
		 *
		 * @param event Method call event
		 */
		protected function abstractCompleteHandler(event:GetComplexTypeCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandCompleteEvent();
		}

		/**
		 * Handle method call error
		 *
		 * @param event Method call event
		 */
		protected function abstractErrorHandler(event:GetComplexTypeCallEvent):void
		{
			// Overwrite this method in your implementation class
			this.dispatchCommandErrorEvent(event.error);
		}
	}
}