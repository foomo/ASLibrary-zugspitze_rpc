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
	import com.test.services.mock.calls.GetSharedObjectCall;
	import com.test.services.mock.vos.SharedObject;

	import org.foomo.zugspitze.rpc.events.ProxyMethodCallEvent;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetSharedObjectCommand extends AbstractGetSharedObjectCommand
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		public var result:SharedObject;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetSharedObjectCommand(proxy:MockProxy, setBusyStatus:Boolean=false)
		{
			super(proxy, setBusyStatus);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Overriden methods
		//-----------------------------------------------------------------------------------------

		override protected function methodCall_proxyMethodCallResultHandler(event:ProxyMethodCallEvent):void
		{
			this.result = GetSharedObjectCall(event.methodCall).result;
			this.dispatchCommandCompleteEvent();
		}
	}
}