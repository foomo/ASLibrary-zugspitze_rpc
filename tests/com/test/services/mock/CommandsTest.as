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

	import com.test.services.mock.commands.GetComplexTypeCommand;
	import com.test.services.mock.commands.GetExceptionCommand;
	import com.test.services.mock.commands.GetMessageCommand;
	import com.test.services.mock.commands.GetSharedObjectCommand;
	import com.test.services.mock.commands.GetStringCommand;
	import com.test.services.mock.vos.SharedObject;

	import flexunit.framework.Assert;

	import org.flexunit.async.Async;
	import org.foomo.zugspitze.events.CommandEvent;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
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