package org.robotlegs.stockchart.model
{
	import flash.events.Event;
	
	public class TwitterModelEvent extends Event
	{
		public static const TWEETS_UPDATED:String = 'tweetsUpdated';
		
		
		
		public var data: Object;
		
		public function TwitterModelEvent(type:String, _data:Object = null)
		{
			super(type);
			data = _data;
		}
		
/*		public function get message():String
		{
			return _message;
		}*/
	
	}
}