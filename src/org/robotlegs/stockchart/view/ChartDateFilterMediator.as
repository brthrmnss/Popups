package org.robotlegs.stockchart.view
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mx.events.CollectionEvent;
	import mx.formatters.DateFormatter;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.stockchart.model.AppModelEvent;
	import org.robotlegs.stockchart.model.IAppModel;
	import org.robotlegs.stockchart.model.MessageModel;
	import org.robotlegs.stockchart.model.MessageModelEvent;
	import org.robotlegs.stockchart.model.StockChartModel;
	import org.robotlegs.stockchart.model.StockChartModelEvent;
	import org.robotlegs.stockchart.model.vo.StockPriceVO;
	import org.robotlegs.stockchart.view.ui.chartDateFilter;
	
	public class ChartDateFilterMediator extends Mediator
	{
		[Inject] public var chartPage:chartDateFilter;
		[Inject] public var stockChartModel:StockChartModel;
		[Inject] public var appModel:IAppModel;		
		
		public function ChartDateFilterMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, StockChartModelEvent.CHART_FILTERED, whenChartDatesChanged);
			eventMap.mapListener(eventDispatcher, StockChartModelEvent.SLICING_CHART, whenChartSlicingDatesChanged);	
			eventMap.mapListener(eventDispatcher, StockChartModelEvent.SLICING_CHART_STOPPED, clearSlicingDates);				
			
			eventMap.mapListener(eventDispatcher, StockChartModelEvent.MOUSEOVER_CHART, onRolloverChartItem);	
			eventMap.mapListener(eventDispatcher, StockChartModelEvent.MOUSEOUT_CHART, onRolloutChartItem);				
			
						
			
			
			this.chartPage.addEventListener(chartDateFilter.FilterDatesChanged, this.onFiltered, false, 0, true ) 
				
		}
		
		private function onLoadChart(e:ChartPageEvent):void
		{
		}
		
		private function whenMessageAdded(e:MessageModelEvent):void
		{
		}
		
		private function whenChartsUpdated(e:AppModelEvent):void
		{
			//this.graphPage.charts.source = e.data as Array
		}		
		
		public var dateFormatter : DateFormatter = new DateFormatter()
		
		/**
		 * How do mediators talk to one another without fixing one to the other? 
		 * use the model? that's as bad as using the view ... 
		 * use the events ... now they're all here all the time, 
		 * ..use the model ... and a model event
		 * 
		 * */
		private function whenChartDatesChanged(e:  StockChartModelEvent):void
		{
			this.dateFormatter.formatString = 'YYYY-MM-DD'
			this.chartPage.setDates( (e.data[0]as StockPriceVO).date, e.data[1].date   )
			this.chartPage.setPrice( (e.data[0]as StockPriceVO).price, e.data[1].price   )			
			/*if ( e.data.length == 0 ) 
			{
				
			}
			else
			{
				this.chartPage.txtDateStart.text = this.
				this.chartPage.txtDateEnd.text = e.data[e.data.length-1].Date
			}*/
		}			
		
		private function whenChartSlicingDatesChanged(e:   StockChartModelEvent):void
		{
			this.chartPage.setDates( (e.data[0]as StockPriceVO).date, e.data[1].date   )
			this.chartPage.setPrice( (e.data[0]as StockPriceVO).price, e.data[1].price   )
		}			
		//private var timer : Timer; 
		private function clearSlicingDates(e:   StockChartModelEvent):void
		{
			return;
			this.whenChartDatesChanged( null ) 
		}				
		
		private function onFiltered(e:  CustomEvent2):void
		{
			this.stockChartModel.filterChart_ByDate( e.data[0] as Date, e.data[1] as Date ) 		
		}			
		
		private function onRolloverChartItem(e:  StockChartModelEvent):void
		{
			this.chartPage.onRolloverChartItem( (e.data as StockPriceVO)   )
		}			
		private function onRolloutChartItem(e:   StockChartModelEvent):void
		{
			this.chartPage.onRolloutChartItem(); //( null ) 
		}					
		
		
		
	}
}