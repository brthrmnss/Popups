package org.robotlegs.stockchart.view
{
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.stockchart.model.TwitterModel;
	import org.robotlegs.stockchart.model.TwitterModelEvent;
	
	import sss2.Twit.views.twits.lister.twit_lister;
	
	public class TwitterListMediator extends Mediator
	{
		[Inject] public var ui:twit_lister;
		[Inject] public var tickerModel:TwitterModel;		
		
		public function TwitterListMediator()
		{
			return;
		} 
		
		override public function onRegister():void
		{
			//eventMap.mapListener(eventDispatcher, ChartPageEvent.CHART_LOADED, onChartLoaded);
			eventMap.mapListener(eventDispatcher, TwitterModelEvent.TWEETS_UPDATED, onLoadTickerData);
			this.ui.list.dataProvider = this.tickerModel.twitsDisplay
		}
		
		private function onLoadTickerData(e:TwitterModelEvent ):void
		{
			this.ui.list.dataProvider = this.tickerModel.twitsDisplay;
			this.ui.moveBack( e.data as Number ) 
			this.tickerModel.twitsDisplay.enableAutoUpdate(); 
		}
		
 
	}
}