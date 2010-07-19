package org.robotlegs.stockchart.model
{
	import flash.events.Event;
	
	public class StockChartModelEvent extends Event
	{
		public static const CHART_FILTERED:String = 'chartFiltered';
		public static const CHART_CHANGED:String = 'chartChanged';
		public static const CHART_DATES_FILTERED:String = 'CHART_DATES_FILTERED';		
		public static const SLICING_CHART_STOPPED:String = 'SLICING_CHART_STOPPED';				
		public static const SLICING_CHART :String = 'SLICING_CHART';		
		
		public static const MOUSEOVER_CHART :String = 'MOUSEOVER_CHART';
		public static const MOUSEOUT_CHART :String = 'MOUSEOUT_CHART';
		
		
		
		public var data: Object;
		
		public function StockChartModelEvent(type:String, _data:Object = null)
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