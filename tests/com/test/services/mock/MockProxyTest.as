package com.test.services.mock
{
	import avmplus.getQualifiedClassName;

	import com.test.services.mock.events.ExceptionEvent;
	import com.test.services.mock.events.GetBooleanCallEvent;
	import com.test.services.mock.events.GetExceptionCallEvent;
	import com.test.services.mock.events.GetIntCallEvent;
	import com.test.services.mock.events.GetNumberCallEvent;
	import com.test.services.mock.events.GetObjectCallEvent;
	import com.test.services.mock.events.GetSharedObjectCallEvent;
	import com.test.services.mock.events.GetStandardTypesCallEvent;
	import com.test.services.mock.events.GetStringCallEvent;
	import com.test.services.shared.SharedObject;

	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;

	import flexunit.framework.Assert;

	import mx.utils.ObjectUtil;

	import org.flexunit.async.Async;
	import org.foomo.zugspitze.services.proxy.events.ProxyErrorEvent;

	public class MockProxyTest
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
		public function testGetBoolean():void
		{
			var value:Boolean = true;
			Async.handleEvent(this, this.proxy.getBoolean(value), GetBooleanCallEvent.GET_BOOLEAN_CALL_COMPLETE, function(event:GetBooleanCallEvent, ... parms):void {
				Assert.assertEquals(event.result, value);
				Assert.assertTrue(event.result is Boolean);
			});
		}

		[Test(async)]
		public function testGetInt():void
		{
			var value:int = 13;
			Async.handleEvent(this, this.proxy.getInt(value), GetIntCallEvent.GET_INT_CALL_COMPLETE, function(event:GetIntCallEvent, ... parms):void {
				Assert.assertEquals(event.result, value);
				Assert.assertTrue(event.result is int);
			});
		}

		[Test(async)]
		public function testGetNumber():void
		{
			var value:Number = 13.3;
			Async.handleEvent(this, this.proxy.getNumber(value), GetNumberCallEvent.GET_NUMBER_CALL_COMPLETE, function(event:GetNumberCallEvent, ... parms):void {
				Assert.assertEquals(event.result, value);
				Assert.assertTrue(event.result is Number);
			});
		}

		[Test(async)]
		public function testGetString():void
		{
			var value:String = 'foobar';
			Async.handleEvent(this, this.proxy.getString(value), GetStringCallEvent.GET_STRING_CALL_COMPLETE, function(event:GetStringCallEvent, ... parms):void {
				Assert.assertEquals(event.result, value);
				Assert.assertTrue(event.result is String);
			});
		}

		[Test(async)]
		public function testGetObject():void
		{
			var value:Object = {foo:'bar'};
			Async.handleEvent(this, this.proxy.getObject(value), GetObjectCallEvent.GET_OBJECT_CALL_COMPLETE, function(event:GetObjectCallEvent, ... parms):void {
				Assert.assertEquals(ObjectUtil.compare(event.result, value), 0);
				Assert.assertTrue(event.result is Object);
			});
		}

		[Test(async)]
		public function testGetStandardTypes():void
		{
			Async.handleEvent(this, this.proxy.getStandardTypes(), GetStandardTypesCallEvent.GET_STANDARD_TYPES_CALL_COMPLETE, function(event:GetStandardTypesCallEvent, ... parms):void {
				Assert.assertTrue(event.result.typeBool is Boolean);
				Assert.assertTrue(event.result.typeBoolArray is Array);
				Assert.assertEquals(event.result.typeBoolArray[0], true);
				Assert.assertEquals(event.result.typeBoolArray[1], false);
				Assert.assertTrue(event.result.typeBoolean is Boolean);
				Assert.assertTrue(event.result.typeBooleanArray is Array);
				Assert.assertEquals(event.result.typeBooleanArray[0], true);
				Assert.assertEquals(event.result.typeBooleanArray[1], false);
				Assert.assertTrue(event.result.typeDouble is Number);
				Assert.assertTrue(event.result.typeFloat is Number);
				Assert.assertTrue(event.result.typeFloatArray is Array);
				Assert.assertEquals(event.result.typeFloatArray[0], 13.3);
				Assert.assertEquals(event.result.typeFloatArray[1], 14.4);
				Assert.assertTrue(event.result.typeInt is int);
				Assert.assertTrue(event.result.typeIntArray is Array);
				Assert.assertEquals(event.result.typeIntArray[0], 13);
				Assert.assertEquals(event.result.typeIntArray[1], 14);
				Assert.assertTrue(event.result.typeInteger is int);
				Assert.assertTrue(event.result.typeIntegerArray is Array);
				Assert.assertEquals(event.result.typeIntegerArray[0], 13);
				Assert.assertEquals(event.result.typeIntegerArray[1], 14);
				Assert.assertTrue(event.result.typeString is String);
				Assert.assertTrue(event.result.typeStringArray is Array);
				Assert.assertEquals(event.result.typeStringArray[0], 'foo');
				Assert.assertEquals(event.result.typeStringArray[1], 'bar');
				Assert.assertTrue(event.result.typeMixed is Object);
			});
		}

		[Test(async)]
		public function testGetSharedObject():void
		{
			Async.handleEvent(this, this.proxy.getSharedObject(), GetSharedObjectCallEvent.GET_SHARED_OBJECT_CALL_COMPLETE, function(event:GetSharedObjectCallEvent, ... parms):void {
				Assert.assertTrue(event.result is SharedObject);
				Assert.assertEquals(event.result.name, 'sharedObject');
			});
		}

		[Test(async)]
		public function tesProxyIOErrorEvent():void
		{
			this.proxy.endPoint = 'http://localhost/xxx';
			Async.handleEvent(this, this.proxy, ProxyErrorEvent.IO_ERROR, function(event:ProxyErrorEvent, ... parms):void {
				Assert.assertTrue(true);
			});
			this.proxy.getBoolean(false);
		}

		[Test(async)]
		// TODO: set permanent endpoint
		public function testCommunicationError():void
		{
			this.proxy.endPoint = 'http://foomo.bestbytes.net/index.php';
			Async.handleEvent(this, this.proxy, ProxyErrorEvent.COMMUNICATION_ERROR, function(event:ProxyErrorEvent, ... parms):void {
				Assert.assertTrue(true);
			});
			this.proxy.getBoolean(false);
		}

		//[Test(async)]
		// TODO: implement with secured target
		public function testSecurityError():void
		{
			this.proxy.endPoint = 'http://';
			Async.handleEvent(this, this.proxy, SecurityErrorEvent.SECURITY_ERROR, function(event:SecurityErrorEvent, ... parms):void {
				Assert.assertTrue(true);
			}, 3000);
			this.proxy.getBoolean(false);
		}

		[Test(async)]
		public function testGetException():void
		{
			this.proxy.endPoint = END_POINT;
			Async.handleEvent(this, this.proxy.getException(), ExceptionEvent.EXCEPTION, function(event:ExceptionEvent, ... parms):void {
				Assert.assertEquals(event.code, 500);
				Assert.assertEquals(event.message, 'This is a mock exception');
			});
		}

		[Test(async)]
		public function testGetAnotherException():void
		{
			this.proxy.endPoint = END_POINT;
			Async.handleEvent(this, this.proxy.getAnotherException(), ExceptionEvent.EXCEPTION, function(event:ExceptionEvent, ... parms):void {
				Assert.assertEquals(event.code, 501);
				Assert.assertEquals(event.message, 'This is a second mock exception of the same type');
			});
		}
	}
}