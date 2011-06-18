package com.test.services.mock
{

	import flexunit.framework.Assert;

	import org.flexunit.async.Async;
	import org.foomo.zugspitze.events.CommandEvent;
	import com.test.services.mock.commands.GetStringCommand;

	public class CommandsTest
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		// TODO: define server
		public static const END_POINT:String = 'http://foomo.radact.interact.com/foomo/modules/Foomo.Zugspitze/services/mock.php/Foomo.Services.RPC/serve';

		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var proxy:MockProxy

		//-----------------------------------------------------------------------------------------
		// ~ Initialization
		//-----------------------------------------------------------------------------------------

		[Before]
		public function setUp():void
		{
			this.proxy = new MockProxy(END_POINT);
		}

		[After]
		public function tearDown():void
		{
		}

		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}

		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}

		//-----------------------------------------------------------------------------------------
		// ~ Test methods
		//-----------------------------------------------------------------------------------------

		[Test(async)]
		public function testGetStringCommand():void
		{
			var cmd:GetStringCommand = new GetStringCommand('foobar', this.proxy);
			Async.handleEvent(this, cmd, CommandEvent.COMMAND_COMPLETE, function(event:CommandEvent, ... parms) {
				Assert.assertEquals(cmd.result, 'foobar');
			});
			cmd.execute();
		}
	}
}