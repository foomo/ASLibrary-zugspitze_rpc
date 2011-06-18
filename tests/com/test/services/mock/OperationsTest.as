package com.test.services.mock
{
	import com.test.services.mock.events.GetStringOperationEvent;
	import com.test.services.mock.operations.GetStringOperation;

	import org.foomo.zugspitze.events.OperationEvent;

	public class OperationsTest extends Object
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
		public function testGetStringOperation():void
		{
			var op:GetStringOperation = new GetStringOperation('foobar', this.proxy);
			Async.handleEvent(this, op, GetStringOperation.OPERATION_COMPLETE, function(event:CommandEvent, ... parms) {
				Assert.assertEquals(op.result, 'foobar');
			});
			cmd.execute();
		}
	}
}