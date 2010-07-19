package org.robotlegs.stockchart.model
{
	import flash.events.Event;
	
	public class TickerModelEvent extends Event
	{
		public static const TICKER_UPDATED:String = 'tickerUpdated';
		
		
		
		public var data: Object;
		
		public function TickerModelEvent(type:String, _data:Object = null)
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