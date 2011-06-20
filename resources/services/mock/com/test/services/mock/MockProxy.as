package com.test.services.mock
{
	import org.foomo.zugspitze.zugspitze_internal;
	import org.foomo.zugspitze.services.proxy.Proxy;
	import com.test.services.mock.calls.GetIntCall;
	import com.test.services.mock.calls.GetNumberCall;
	import com.test.services.mock.calls.GetStringCall;
	import com.test.services.mock.calls.GetBooleanCall;
	import com.test.services.mock.calls.GetObjectCall;
	import com.test.services.mock.calls.GetComplexTypeCall;
	import com.test.services.mock.calls.GetSharedObjectCall;
	import com.test.services.mock.calls.GetExceptionCall;
	import com.test.services.mock.calls.GetSameExceptionCall;
	import com.test.services.mock.calls.GetCustomExceptionCall;
	import com.test.services.mock.calls.GetMessageCall;
	import com.test.services.mock.calls.GetMessagesCall;
	import com.test.services.mock.calls.GetComplexTypeMessageCall;

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
		public static var defaultEndPoint:String = 'http://foomo.radact.interact.com/foomo/modules/Foomo.Zugspitze/services/mock.php/Foomo.Services.RPC/serve';

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function MockProxy(endPoint:String=null)
		{
			super((endPoint != null) ? endPoint : defaultEndPoint, CLASS_NAME, VERSION);
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
		public function getComplexType():GetComplexTypeCall
		{
			return zugspitze_internal::sendMethodCall(new GetComplexTypeCall());
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
	}
}
