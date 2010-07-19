package org.robotlegs.stockchart.view
{
	import flash.events.Event;
	
	public class ChartPageEvent extends Event
	{
		//public static const LOAD_CHART:String = 'loadChart';
		public static const CHART_LOADED:String = 'cartLoaded';
		public static const CHART_DATES_CHANGED :String = 'chartUpdated';
		
		public static const MOUSEOVER_CHART :String = 'MOUSEOVER_CHART';
		public static const MOUSEOUT_CHART :String = 'MOUSEOUT_CHART';
		static public var DataLoaded : String = 'DataLoaded';  
		
		public var data : Object; 
		
		public function ChartPageEvent(type:String, data_ : Object = null, target :  Object = null, automatic : Boolean = false )
		{	
			this.data = data_
			super(type, true);
		}
	
	}
}