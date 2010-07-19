package org.robotlegs.stockchart.model
{
	import flash.events.Event;
	
	public class MessageModelEvent extends Event
	{
		public static const MESSAGE_ADDED:String = 'messageAdded';
		public static const MESSAGES_CLEARED:String = 'messagesCleared';
		
		private var _message:String;
		
		public function MessageModelEvent(type:String, message:String = null)
		{
			super(type);
			_message = message;
		}
		
		public function get message():String
		{
			return _message;
		}
	
	}
}