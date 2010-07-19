 
package org.robotlegs.stockchart.model
{
	import flash.events.Event;
	
	public class AppModelEvent extends Event
	{
		public static const MESSAGE_ADDED:String = 'messageAdded';
		public static const CHARTS_UPDATED:String = 'chartsUpdated';
		
		private var _message:String;
		
		public var data : Array; 
		
		public function AppModelEvent(type:String, message:String = null, data_ : Array = null)
		{
			super(type);
			_message = message;
			data = data_ 
		}
		
		public function get message():String
		{
			return _message;
		}
	
	}
}