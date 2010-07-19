package org.robotlegs.stockchart.view
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.stockchart.model.TickerModel;
	import org.robotlegs.stockchart.model.TickerModelEvent;
	import org.robotlegs.stockchart.view.ui.ticker;
	
	public class TickerMediator extends Mediator
	{
		[Inject] public var ui:ticker;
		[Inject] public var tickerModel:TickerModel;		
		
		public function TickerMediator()
		{
			return;
		} 
		
		override public function onRegister():void
		{
			//eventMap.mapListener(eventDispatcher, ChartPageEvent.CHART_LOADED, onChartLoaded);
			eventMap.mapListener(eventDispatcher, TickerModelEvent.TICKER_UPDATED, onLoadTickerData);
		 
		}
		
		private function onLoadTickerData(e:TickerModelEvent ):void
		{
			this.ui.loadData( e.data as Array ) 
		}
		
 
	}
}