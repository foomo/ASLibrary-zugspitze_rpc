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
	import org.foomo.zugspitze.zugspitze_internal;
	import org.foomo.zugspitze.rpc.Proxy;
	import com.test.services.mock.calls.GetIntCall;
	import com.test.services.mock.calls.GetNumberCall;
	import com.test.services.mock.calls.GetStringCall;
	import com.test.services.mock.calls.GetBooleanCall;
	import com.test.services.mock.calls.GetObjectCall;
	import com.test.services.mock.calls.GetArrayCall;
	import com.test.services.mock.calls.GetComplexTypeCall;
	import com.test.services.mock.calls.GetSharedObjectCall;
	import com.test.services.mock.calls.GetExceptionCall;
	import com.test.services.mock.calls.GetSameExceptionCall;
	import com.test.services.mock.calls.GetCustomExceptionCall;
	import com.test.services.mock.calls.GetMessageCall;
	import com.test.services.mock.calls.GetMessagesCall;
	import com.test.services.mock.calls.GetComplexTypeMessageCall;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexType;
	import com.test.services.mock.vos.SharedObject;
	import org.foomo.zugspitze.services.namespaces.php.foomo.services.types.Exception;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.CustomException;
	import org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock.ComplexTypeMessage;

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class MockProxy extends Proxy
	{
		//-----------------------------------------------------------------------------------------
		// ~ Constants
		//-----------------------------------------------------------------------------------------

		public static const VERSION:Number 		= 0.1;
		public static const CLASS_NAME:String 	= 'Foomo\\Zugspitze\\Services\\Mock';

		//-----------------------------------------------------------------------------------------
		// ~ Static variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		private static var _instance:MockProxy;
		/**
		 *
		 */
		public static var defaultEndPoint:String = "http://foomo.radact.interact.com/foomo/modules/Foomo.Zugspitze/services/mock.php/Foomo.Services.RPC/serve";

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function MockProxy(endPoint:String=null)
		{
			if (endPoint == null) endPoint = defaultEndPoint;
			super(endPoint, CLASS_NAME, VERSION);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function getInt(value:int):GetIntCall
		{
			return zugspitze_internal::sendMethodCall(new GetIntCall(value));
		}

		/**
		 *
		 */
		public function getNumber(value:Number):GetNumberCall
		{
			return zugspitze_internal::sendMethodCall(new GetNumberCall(value));
		}

		/**
		 *
		 */
		public function getString(value:String):GetStringCall
		{
			return zugspitze_internal::sendMethodCall(new GetStringCall(value));
		}

		/**
		 *
		 */
		public function getBoolean(value:Boolean):GetBooleanCall
		{
			return zugspitze_internal::sendMethodCall(new GetBooleanCall(value));
		}

		/**
		 *
		 */
		public function getObject(value:Object):GetObjectCall
		{
			return zugspitze_internal::sendMethodCall(new GetObjectCall(value));
		}

		/**
		 *
		 */
		public function getArray(value:Array):GetArrayCall
		{
			return zugspitze_internal::sendMethodCall(new GetArrayCall(value));
		}

		/**
		 *
		 */
		public function getComplexType(value:ComplexType):GetComplexTypeCall
		{
			return zugspitze_internal::sendMethodCall(new GetComplexTypeCall(value));
		}

		/**
		 *
		 */
		public function getSharedObject():GetSharedObjectCall
		{
			return zugspitze_internal::sendMethodCall(new GetSharedObjectCall());
		}

		/**
		 *
		 */
		public function getException():GetExceptionCall
		{
			return zugspitze_internal::sendMethodCall(new GetExceptionCall());
		}

		/**
		 *
		 */
		public function getSameException():GetSameExceptionCall
		{
			return zugspitze_internal::sendMethodCall(new GetSameExceptionCall());
		}

		/**
		 *
		 */
		public function getCustomException():GetCustomExceptionCall
		{
			return zugspitze_internal::sendMethodCall(new GetCustomExceptionCall());
		}

		/**
		 *
		 */
		public function getMessage():GetMessageCall
		{
			return zugspitze_internal::sendMethodCall(new GetMessageCall());
		}

		/**
		 *
		 */
		public function getMessages():GetMessagesCall
		{
			return zugspitze_internal::sendMethodCall(new GetMessagesCall());
		}

		/**
		 *
		 */
		public function getComplexTypeMessage():GetComplexTypeMessageCall
		{
			return zugspitze_internal::sendMethodCall(new GetComplexTypeMessageCall());
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public static methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public static function get defaultInstance():MockProxy		{
			if (!_instance) _instance = new MockProxy(defaultEndPoint);
			return _instance;
		}
	}
}
