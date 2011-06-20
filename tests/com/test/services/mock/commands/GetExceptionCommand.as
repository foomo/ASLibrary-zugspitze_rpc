package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.ExceptionEvent;

	public class GetExceptionCommand extends AbstractGetExceptionCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var result:String;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetExceptionCommand(proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			super(proxy, setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function abstractExceptionHandler(event:ExceptionEvent):void
		{
			this.result = event.message;
			this.dispatchCommandCompleteEvent();
		}
	}
}