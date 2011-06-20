package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetSharedObjectCallEvent;
	import com.test.services.mock.vos.SharedObject;

	public class GetSharedObjectCommand extends AbstractGetSharedObjectCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var result:SharedObject;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSharedObjectCommand(proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			super(proxy, setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function abstractCompleteHandler(event:GetSharedObjectCallEvent):void
		{
			this.result = event.result;
			this.dispatchCommandCompleteEvent();
		}
	}
}