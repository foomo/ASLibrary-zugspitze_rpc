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
package org.foomo.zugspitze.services.namespaces.php.foomo.zugspitze.services.mock
{
														
	[Bindable]
	[RemoteClass(alias='Foomo.Zugspitze.Services.Mock.ComplexType')]

	/**
	 * @link    http://www.foomo.org
	 * @license http://www.gnu.org/licenses/lgpl.txt
	 * @author  franklin <franklin@weareinteractive.com>
	 */
	public class ComplexType	{
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