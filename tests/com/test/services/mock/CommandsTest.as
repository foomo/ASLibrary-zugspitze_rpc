package com.test.services.mock
{

	import com.test.services.mock.commands.GetComplexTypeCommand;
	import com.test.services.mock.commands.GetExceptionCommand;
	import com.test.services.mock.commands.GetMessageCommand;
	import com.test.services.mock.commands.GetSharedObjectCommand;
	import com.test.services.mock.commands.GetStringCommand;
	import com.test.services.shared.SharedObject;

	import flexunit.framework.Assert;

	import org.flexunit.async.Async;
	import org.foomo.zugspitze.events.CommandEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;

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

		[Test(async)]
		public function testGetComplexTypeCommand():void
		{
			var cmd:GetComplexTypeCommand = new GetComplexTypeCommand(this.proxy);
			Async.handleEvent(this, cmd, CommandEvent.COMMAND_COMPLETE, function(event:CommandEvent, ... parms) {
				Assert.assertTrue(cmd.result is ComplexType);
			});
			cmd.execute();
		}

		[Test(async)]
		public function testGetSharedObjectCommand():void
		{
			var cmd:GetSharedObjectCommand = new GetSharedObjectCommand(this.proxy);
			Async.handleEvent(this, cmd, CommandEvent.COMMAND_COMPLETE, function(event:CommandEvent, ... parms) {
				Assert.assertTrue(cmd.result is SharedObject);
			});
			cmd.execute();
		}

		[Test(async)]
		public function testGetExceptionCommand():void
		{
			var cmd:GetExceptionCommand = new GetExceptionCommand(this.proxy);
			Async.handleEvent(this, cmd, CommandEvent.COMMAND_COMPLETE, function(event:CommandEvent, ... parms) {
				Assert.assertEquals(cmd.result, 'This is a mock exception');
			});
			cmd.execute();
		}

		[Test(async)]
		public function testGetMessagesCommand():void
		{
			var cmd:GetMessageCommand = new GetMessageCommand(this.proxy);
			Async.handleEvent(this, cmd, CommandEvent.COMMAND_COMPLETE, function(event:CommandEvent, ... parms) {
				Assert.assertEquals(cmd.result.length, 1);
			});
			cmd.execute();
		}
	}
}