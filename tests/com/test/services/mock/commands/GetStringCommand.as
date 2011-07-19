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
package com.test.services.mock.commands
{
	import com.test.services.mock.MockProxy;
	import com.test.services.mock.calls.GetStringCall;

	import org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetStringCommand extends AbstractGetStringCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var result:String;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetStringCommand(value:String, proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			super(value, proxy, setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function methodCall_proxyMethodCallResultHandler(event:ProxyMethodCallEvent):void
		{
			this.result = GetStringCall(event.methodCall).result;
			this.dispatchCommandCompleteEvent();
		}
	}
}