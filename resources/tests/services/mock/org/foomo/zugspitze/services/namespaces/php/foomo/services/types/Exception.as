package org.foomo.zugspitze.services.namespaces.php.foomo.services.types
{
	[Bindable]
	[RemoteClass(alias='Foomo.Services.Types.Exception')]

	/**
	 * 
	 */
	public class Exception
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 * error code
		 */
		public var code:int;

		/**
		 * message
		 */
		public var message:String;

		/**
		 * xdebug messages
		 */
		public var xdebug_message:String;
	}
}