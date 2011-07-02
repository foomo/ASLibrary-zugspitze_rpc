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
	import com.test.services.mock.events.GetComplexTypeOperationEvent;
	import com.test.services.mock.events.GetExceptionOperationEvent;
	import com.test.services.mock.events.GetMessageOperationEvent;
	import com.test.services.mock.events.GetSharedObjectOperationEvent;
	import com.test.services.mock.events.GetStringOperationEvent;
	import com.test.services.mock.operations.GetComplexTypeOperation;
	import com.test.services.mock.operations.GetExceptionOperation;
	import com.test.services.mock.operations.GetMessageOperation;
	import com.test.services.mock.operations.GetSharedObjectOperation;
	import com.test.services.mock.operations.GetStringOperation;
	import com.test.services.mock.vos.SharedObject;

	import flexunit.framework.Assert;

	import org.flexunit.async.Async;
	import org.foomo.zugspitze.events.OperationEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
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
		public function testGetComplexTypeOperation():void
		{
			var operation:GetComplexTypeOperation = new GetComplexTypeOperation(this.proxy);
			Async.handleEvent(this, operation, GetComplexTypeOperationEvent.GET_COMPLEX_TYPE_OPERATION_COMPLETE, function(event:GetComplexTypeOperationEvent, ... parms) {
				Assert.assertTrue(operation.result is ComplexType);
				Assert.assertEquals(event.result, operation.result);
			});
		}

		[Test(async)]
		public function testGetSharedObjectOperation():void
		{
			var operation:GetSharedObjectOperation = new GetSharedObjectOperation(this.proxy);
			Async.handleEvent(this, operation, GetSharedObjectOperationEvent.GET_SHARED_OBJECT_OPERATION_COMPLETE, function(event:GetSharedObjectOperationEvent, ... parms) {
				Assert.assertTrue(operation.result is SharedObject);
				Assert.assertEquals(event.result, operation.result);
			});
		}

		[Test(async)]
		public function testGetExceptionOperation():void
		{
			var operation:GetExceptionOperation = new GetExceptionOperation(this.proxy);
			Async.handleEvent(this, operation, GetExceptionOperationEvent.GET_EXCEPTION_OPERATION_ERROR, function(event:GetExceptionOperationEvent, ... parms) {
				Assert.assertTrue(event.error is Exception);
			});
		}

		[Test(async)]
		public function testGetMessageOperation():void
		{
			var operation:GetMessageOperation = new GetMessageOperation(this.proxy);
			Async.handleEvent(this, operation, GetMessageOperationEvent.GET_MESSAGE_OPERATION_COMPLETE, function(event:GetMessageOperationEvent, ... parms) {
				Assert.assertTrue(event.result);
				Assert.assertEquals(operation.messages.length, 1);
				Assert.assertEquals(operation.messages, event.messages);
			});
		}
	}
}