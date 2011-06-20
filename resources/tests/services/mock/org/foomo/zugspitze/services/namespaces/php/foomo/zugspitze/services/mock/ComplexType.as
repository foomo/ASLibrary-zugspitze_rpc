package org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock
{
	[Bindable]
	[RemoteClass(alias='Foomo.Zugspitze.Services.Mock.ComplexType')]

	/**
	 * Basic standard types
	 */
	public class ComplexType
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * 
		 */
		public var typeString:String;

		/**
		 * 
		 */
		public var typeInt:int;

		/**
		 * 
		 */
		public var typeInteger:int;

		/**
		 * 
		 */
		public var typeFloat:Number;

		/**
		 * 
		 */
		public var typeDouble:Number;

		/**
		 * 
		 */
		[ArrayElementType("String")]
		public var typeStringArray:Array;

		/**
		 * 
		 */
		[ArrayElementType("int")]
		public var typeIntArray:Array;

		/**
		 * 
		 */
		[ArrayElementType("int")]
		public var typeIntegerArray:Array;

		/**
		 * 
		 */
		[ArrayElementType("Number")]
		public var typeFloatArray:Array;

		/**
		 * 
		 */
		public var typeBool:Boolean;

		/**
		 * 
		 */
		public var typeBoolean:Boolean;

		/**
		 * 
		 */
		[ArrayElementType("Boolean")]
		public var typeBoolArray:Array;

		/**
		 * 
		 */
		[ArrayElementType("Boolean")]
		public var typeBooleanArray:Array;

		/**
		 * 
		 */
		public var typeMixed:Object;
	}
}