package com.test.services.mock
{
	import com.test.services.mock.CommandsTest;
	import com.test.services.mock.MockProxyTest;
	import com.test.services.mock.OperationsTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class MockTestSuite
	{
		public var test1:com.test.services.mock.CommandsTest;
		public var test2:com.test.services.mock.MockProxyTest;
		public var test3:com.test.services.mock.OperationsTest;
	}
}