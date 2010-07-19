package org.robotlegs.stockchart.view
{
	import flash.events.Event;
	
	public class ChartFilterEvent extends Event
	{
		public static const Chart_filtered:String = 'chartfiltered';
		
		public var data : Object; 
		
		public function ChartFilterEvent(type:String, data_ : Object = null, target :  Object = null, automatic : Boolean = false )
		{	
			this.data = data_
			super(type, true);
		}
	
	}
}