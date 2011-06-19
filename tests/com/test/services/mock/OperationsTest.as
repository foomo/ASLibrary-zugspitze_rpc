package com.test.services.mock
{
	import com.test.services.mock.events.GetExceptionOperationEvent;
	import com.test.services.mock.events.GetStringOperationEvent;
	import com.test.services.mock.operations.GetExceptionOperation;
	import com.test.services.mock.operations.GetStringOperation;

	import flexunit.framework.Assert;

	import org.flexunit.async.Async;
	import org.foomo.zugspitze.events.OperationEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;

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
			var value:String = 'foobar';
			var operation:GetStringOperation = new GetStringOperation(value, this.proxy);
			Async.handleEvent(this, operation, GetStringOperationEvent.GET_STRING_OPERATION_COMPLETE, function(event:GetStringOperationEvent, ... parms) {
				Assert.assertEquals(event.result, value);
				Assert.assertEquals(operation.result, value);
			});
		}

		[Test(async)]
		public function testGetExceptionOperation():void
		{
			var value:String = 'foobar';
			var operation:GetExceptionOperation = new GetExceptionOperation(this.proxy);
			Async.handleEvent(this, operation, GetExceptionOperationEvent.GET_EXCEPTION_OPERATION_ERROR, function(event:GetExceptionOperationEvent, ... parms) {
				Assert.assertTrue(event.error is Exception);
			});
		}
	}
}