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
package com.test.services.mock.events
{
	import org.foomo.zugspitze.rpc.events.ProxyMethodOperationEvent;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class GetObjectOperationEvent extends ProxyMethodOperationEvent
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const GET_OBJECT_OPERATION_COMPLETE:String = 'getObjectOperationComplete';
		public static const GET_OBJECT_OPERATION_PROGRESS:String = 'getObjectOperationProgress';
		public static const GET_OBJECT_OPERATION_ERROR:String = 'getObjectOperationError';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function GetObjectOperationEvent(type:String, result:*=null, error:*=null, messages:Array=null, total:Number=0, progress:Number=0)
		{
			super(type, result, error, messages, total, progress);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get result():Object
		{
			return this.untypedResult;
		}

		/**
		 *
		 */
		public function get error():*
		{
			return this.untypedError;
		}
	}
}