package org.foomo.zugspitze.services.rpc
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.ObjectEncoding;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLStream;
	import flash.utils.ByteArray;

	import org.foomo.zugspitze.services.rpc.protocol.Reply;
	import org.foomo.zugspitze.services.rpc.protocol.reply.MethodReply;

	[Event(name="networkError", type="flash.events.IOErrorEvent")]

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
			this.addEventListener(Event.COMPLETE, this.completeHandler);
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
		public function readReply():Reply
		{
			if (this.bytesAvailable > 0) {
				return this.readObject();
			} else {
				return null;
			}
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
			bytes.objectEncoding = ObjectEncoding.AMF0;
			bytes.writeObject(this._data);

			var request:URLRequest = new URLRequest(this.endPoint);
			request.contentType = 'application/octet-stream';
			request.method = URLRequestMethod.POST;
			request.data = bytes;

			this.load(request);
		}

		//-----------------------------------------------------------------------------------------
		// ~ Private eventhandler
		//-----------------------------------------------------------------------------------------

		/**
		 * Catch the complete event first to validate the transport reply
		 * TODO: check if this works as expected
		 */
		private function completeHandler(event:Event):void
		{
			if (this.bytesAvailable == 0) {
				event.stopImmediatePropagation();
				event.stopPropagation();
				this.dispatchEvent(new IOErrorEvent(IOErrorEvent.NETWORK_ERROR, false, false, 'Received emtpy reply'));
			}
		}
	}
}