package org.robotlegs.stockchart.view
{
	import flash.events.Event;
	/**
	 * Used for instances where new classes are purposeless
	 * */
	public class CustomEvent2 extends Event
	{
		//public static const ChartFilterEvent:String = 'chartfiltered';
		
		public var data : Object; 
		
		public function CustomEvent2(type:String, data_ : Object = null  )
		{	
			this.data = data_
			super(type, true);
		}
	
	}
}