package org.foomo.zugspitze.services.rpc
{
	import flash.net.ObjectEncoding;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	/**
	 * AMF based flash cient to PHP server communication over HTTP.
	 * Do not use this class directly - rely on reflection based auto generated service clients / proxies.
	 */
	public class RPCTransport extends URLStream
	{
		//-----------------------------------------------------------------------------------------
		// ~ Variables
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		protected var _endPoint:String;
		/**
		 *
		 */
		protected var _data:Object;

		//-----------------------------------------------------------------------------------------
		// ~ Constructor
		//-----------------------------------------------------------------------------------------

		public function RPCTransport(endPoint:String)
		{
			this.endPoint = endPoint;
			this.objectEncoding = ObjectEncoding.AMF0;
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public accessor methods
		//-----------------------------------------------------------------------------------------

		/**
		 *
		 */
		public function get endPoint():String
		{
			return this._endPoint;
		}
		public function set endPoint(value:String):void
		{
			this._endPoint = value;
		}

		/**
		 *
		 */
		public function get data():Object
		{
			return this._data;
		}

		/**
		 *
		 */
		public function get reply():*
		{
			return this.readObject();
		}

		//-----------------------------------------------------------------------------------------
		// ~ Public methods
		//-----------------------------------------------------------------------------------------

		/**
		 * send data
		 */
		public function send(data:Object):void
		{
			this._data = data;

			var bytes:ByteArray = new ByteArray;
			bytes.objectEncoding = this.objectEncoding
			bytes.writeObject(this._data);

			var request:URLRequest = new URLRequest(this.endPoint);
			request.contentType = 'application/octet-stream';
			request.method = URLRequestMethod.POST;
			request.data = bytes;

			this.load(request);
		}
	}
}