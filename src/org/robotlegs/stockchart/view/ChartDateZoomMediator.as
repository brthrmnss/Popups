package org.robotlegs.stockchart.view
{
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.events.CollectionEvent;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.mvcs.support.CustomEvent;
	import org.robotlegs.stockchart.model.AppModelEvent;
	import org.robotlegs.stockchart.model.IAppModel;
	import org.robotlegs.stockchart.model.MessageModel;
	import org.robotlegs.stockchart.model.MessageModelEvent;
	import org.robotlegs.stockchart.model.StockChartModel;
	import org.robotlegs.stockchart.view.ui.chartDateFilter;
	import org.robotlegs.stockchart.view.ui.chartZoomFilter;
	
	public class ChartDateZoomMediator extends Mediator
	{
		[Inject] public var ui:chartZoomFilter;
		[Inject] public var stockChartModel:StockChartModel;
		[Inject] public var appModel:IAppModel;		
		
		public function ChartDateZoomMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, ChartPageEvent.CHART_DATES_CHANGED, whenChartDatesChanged);
			this.ui.addEventListener( chartZoomFilter.SelectFilter, this.whenZoomSelected, false, 0, true ) 
		}
		
		private function onLoadChart(e:ChartPageEvent):void
		{
		}
		
		private function whenMessageAdded(e:MessageModelEvent):void
		{
		}
		
		private function whenZoomSelected(e: CustomEvent2):void
		{
		/*	if ( e.data == -1 )
			{
				Alert.show( 'Command not available' ); 
				return;
			}*/
			this.stockChartModel.filterChart( this.stockChartModel.dateStart, e.data as Number )
			/*var event :  ChartFilterEvent = new ChartFilterEvent( ChartFilterEvent.Chart_filtered,  e.data ) 
			this.dispatch( event ) */
		}		
		
 		/**
		 * Adjust the zoom highlight accordingly 
		 * */
		private function whenChartDatesChanged(e: ChartPageEvent):void
		{
			/*if ( e.data.length == 0 ) 
			{
				
			}
			else
			{
			this.chartPage.txtDateStart.text = e.data[0].Date
			this.chartPage.txtDateEnd.text = e.data[e.data.length-1].Date
			}*/
		}			
		
	}
}