/*
 * This file is part of the foomo Opensource Framework.
 *
 * The foomo Opensource Framework is free software: you can redistribute it
 * and/or modify it under the terms of the GNU Lesser General Public License as
 * published  by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * The foomo Opensource Framework is distributed in the hope that it will
 * be useful, but WITHOUT ANY WARRANTY; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License along with
 * the foomo Opensource Framework. If not, see <http://www.gnu.org/licenses/>.
 */
package com.test.services.mock
{
	import com.test.services.mock.calls.GetArrayCall;
	import com.test.services.mock.calls.GetBooleanCall;
	import com.test.services.mock.calls.GetComplexTypeCall;
	import com.test.services.mock.calls.GetIntCall;
	import com.test.services.mock.calls.GetNumberCall;
	import com.test.services.mock.calls.GetObjectCall;
	import com.test.services.mock.calls.GetSharedObjectCall;
	import com.test.services.mock.calls.GetStringCall;
	import com.test.services.mock.vos.SharedObject;

	import flash.events.SecurityErrorEvent;

	import flexunit.framework.Assert;

	import mx.utils.ObjectUtil;

	import org.flexunit.async.Async;
	import org.foomo.zugspitze.rpc.events.ProxyErrorEvent;
	import org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexTypeMessage;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.CustomException;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
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
			Async.handleEvent(this, this.proxy.getBoolean(value), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:Boolean = GetBooleanCall(event.methodCall).result;
				Assert.assertEquals(result, value);
				Assert.assertTrue(result is Boolean);
			});
		}

		[Test(async)]
		public function testGetInt():void
		{
			var value:int = 13;
			Async.handleEvent(this, this.proxy.getInt(value), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:int = GetIntCall(event.methodCall).result;
				Assert.assertEquals(result, value);
				Assert.assertTrue(result is int);
			});
		}

		[Test(async)]
		public function testGetNumber():void
		{
			var value:Number = 13.3;
			Async.handleEvent(this, this.proxy.getNumber(value), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:Number = GetNumberCall(event.methodCall).result;
				Assert.assertEquals(result, value);
				Assert.assertTrue(result is Number);
			});
		}

		[Test(async)]
		public function testGetString():void
		{
			var value:String = 'foobar';
			Async.handleEvent(this, this.proxy.getString(value), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:String = GetStringCall(event.methodCall).result;
				Assert.assertEquals(result, value);
				Assert.assertTrue(result is String);
			});
		}

		[Test(async)]
		public function testGetObject():void
		{
			var value:Object = {foo:'bar'};
			Async.handleEvent(this, this.proxy.getObject(value), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:Object = GetObjectCall(event.methodCall).result;
				Assert.assertEquals(ObjectUtil.compare(result, value), 0);
				Assert.assertTrue(result is Object);
			});
		}

		[Test(async)]
		public function testGetArray():void
		{
			var value:Array = ['foo', 'bar'];
			Async.handleEvent(this, this.proxy.getArray(value), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:Array = GetArrayCall(event.methodCall).result;
				Assert.assertEquals(ObjectUtil.compare(result, value), 0);
				Assert.assertTrue(result is Array);
			});
		}

		[Test(async)]
		public function testGetComplexType():void
		{
			Async.handleEvent(this, this.proxy.getComplexType(new ComplexType), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:ComplexType = GetComplexTypeCall(event.methodCall).result
				Assert.assertTrue(result.typeBool is Boolean);
				Assert.assertTrue(result.typeBoolArray is Array);
				Assert.assertEquals(result.typeBoolArray[0], true);
				Assert.assertEquals(result.typeBoolArray[1], false);
				Assert.assertTrue(result.typeBoolean is Boolean);
				Assert.assertTrue(result.typeBooleanArray is Array);
				Assert.assertEquals(result.typeBooleanArray[0], true);
				Assert.assertEquals(result.typeBooleanArray[1], false);
				Assert.assertTrue(result.typeDouble is Number);
				Assert.assertTrue(result.typeFloat is Number);
				Assert.assertTrue(result.typeFloatArray is Array);
				Assert.assertEquals(result.typeFloatArray[0], 13.3);
				Assert.assertEquals(result.typeFloatArray[1], 14.4);
				Assert.assertTrue(result.typeInt is int);
				Assert.assertTrue(result.typeIntArray is Array);
				Assert.assertEquals(result.typeIntArray[0], 13);
				Assert.assertEquals(result.typeIntArray[1], 14);
				Assert.assertTrue(result.typeInteger is int);
				Assert.assertTrue(result.typeIntegerArray is Array);
				Assert.assertEquals(result.typeIntegerArray[0], 13);
				Assert.assertEquals(result.typeIntegerArray[1], 14);
				Assert.assertTrue(result.typeString is String);
				Assert.assertTrue(result.typeStringArray is Array);
				Assert.assertEquals(result.typeStringArray[0], 'foo');
				Assert.assertEquals(result.typeStringArray[1], 'bar');
				Assert.assertTrue(result.typeMixed is Object);
			});
		}

		[Test(async)]
		public function testGetSharedObject():void
		{
			Async.handleEvent(this, this.proxy.getSharedObject(), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				var result:SharedObject = GetSharedObjectCall(event.methodCall).result;
				Assert.assertTrue(result is SharedObject);
				Assert.assertEquals(result.name, 'sharedObject');
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
		public function testCommunicationError():void
		{
			this.proxy.endPoint = 'http://twitter.com/';
			Async.handleEvent(this, this.proxy, ProxyErrorEvent.COMMUNICATION_ERROR, function(event:ProxyErrorEvent, ... parms):void {
				Assert.assertTrue(true);
			}, 1000);
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
			Async.handleEvent(this, this.proxy.getException(), ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, function(event:ProxyMethodCallEvent, ... parms):void {
				var exception:Exception = event.methodCall.exception;
				Assert.assertEquals(exception.code, 500);
				Assert.assertEquals(exception.message, 'This is a mock exception');
			});
		}

		[Test(async)]
		public function testGetSameException():void
		{
			Async.handleEvent(this, this.proxy.getSameException(), ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, function(event:ProxyMethodCallEvent, ... parms):void {
				var exception:Exception = event.methodCall.exception;
				Assert.assertEquals(exception.code, 501);
				Assert.assertEquals(exception.message, 'This is a second mock exception of the same type');
			});
		}

		[Test(async)]
		public function testGetCustomException():void
		{
			Async.handleEvent(this, this.proxy.getCustomException(), ProxyMethodCallEvent.PROXY_METHOD_CALL_EXCEPTION, function(event:ProxyMethodCallEvent, ... parms):void {
				var exception:CustomException = event.methodCall.exception;
				Assert.assertEquals(exception.note, 'Hear my note!');
			});
		}

		[Test(async)]
		public function testGetMessage():void
		{
			Async.handleEvent(this, this.proxy.getMessage(), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				Assert.assertEquals(event.methodCall.messages[0], 'This is a single service message');
			});
		}

		[Test(async)]
		public function testGetMessages():void
		{
			Async.handleEvent(this, this.proxy.getMessages(), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				Assert.assertEquals(event.methodCall.messages[0], 'This is the first message');
				Assert.assertEquals(event.methodCall.messages[1], 'This is the second message');
			});
		}

		[Test(async)]
		public function testGetComplexTypeMessages():void
		{
			Async.handleEvent(this, this.proxy.getComplexTypeMessage(), ProxyMethodCallEvent.PROXY_METHOD_CALL_RESULT, function(event:ProxyMethodCallEvent, ... parms):void {
				Assert.assertTrue(event.methodCall.messages[0] is ComplexTypeMessage);
			});
		}
	}
}