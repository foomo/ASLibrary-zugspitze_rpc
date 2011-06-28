package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.events.GetComplexTypeCallEvent;

	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;

	public class GetComplexTypeCommand extends AbstractGetComplexTypeCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var result:ComplexType;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetComplexTypeCommand(value:ComplexType, proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			super(value, proxy, setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function abstractCompleteHandler(event:GetComplexTypeCallEvent):void
		{
			this.result = event.result;
			this.dispatchCommandCompleteEvent();
		}
	}
}