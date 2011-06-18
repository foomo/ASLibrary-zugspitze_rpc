package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetStringCallEvent;

	import flexunit.framework.Assert;

	public class GetStringCommand extends AbstractGetStringCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var result:String;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetStringCommand(value:String, proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			super(value, proxy, setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function abstractCompleteHandler(event:GetStringCallEvent):void
		{
			this.result = event.result;
			this.dispatchCommandCompleteEvent();
		}
	}
}