package org.robotlegs.stockchart.view
{
	import com.brightPoint.controls.ChartDataSlicer;
	import com.brightPoint.controls.ChartDataSlicerEvent;
	
	import flash.events.Event;
	
	import mx.controls.DateField;
	import mx.events.CollectionEvent;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.stockchart.model.AppModelEvent;
	import org.robotlegs.stockchart.model.IAppModel;
	import org.robotlegs.stockchart.model.MessageModel;
	import org.robotlegs.stockchart.model.MessageModelEvent;
	import org.robotlegs.stockchart.model.StockChartModel;
	import org.robotlegs.stockchart.model.StockChartModelEvent;
	import org.robotlegs.stockchart.model.vo.StockPriceVO;
	
	public class ChartPageMediator extends Mediator
	{
		[Inject] public var ui:ChartPage;
		[Inject] public var stockChartModel:StockChartModel;
		[Inject] public var appModel:IAppModel;		
		
		public function ChartPageMediator()
		{
		} 
		
		override public function onRegister():void
		{
			//eventMap.mapListener(eventDispatcher, ChartPageEvent.CHART_LOADED, onChartLoaded);
			eventMap.mapListener(eventDispatcher, StockChartModelEvent.CHART_CHANGED, onLoadChartData);
			eventMap.mapListener(eventDispatcher, ChartFilterEvent.Chart_filtered, whenFilterApplied);
			eventMap.mapListener(eventDispatcher, StockChartModelEvent.CHART_DATES_FILTERED, whenDatesFiltered);			
			//eventMap.mapListener(eventDispatcher, ChartPageEvent.LOAD_CHART, onLoadChart);
			this.ui.dp.addEventListener(CollectionEvent.COLLECTION_CHANGE, this.whenChartDatesChaganged, false, 0, true)
			this.ui.hslicer.addEventListener( ChartDataSlicerEvent.SLICED_DATA, this.whenDataSliced , false, 0, true )
			this.ui.hslicer.addEventListener( ChartDataSlicerEvent.SLICING_DATA, this.whenDataSlicing , false, 0, true )				
			this.ui.hslicer.addEventListener( ChartDataSlicerEvent.SLICING_DATA_STOPPED, this.whenDataSlicingStopped , false, 0, true )	
			//move to a command
			this.ui.addEventListener( ChartPageEvent.DataLoaded , loadChartIntoModel )
			
				
			this.ui.addEventListener(ChartPageEvent.MOUSEOVER_CHART, this.onMouseOverChart, false, 0, true)
			this.ui.addEventListener(ChartPageEvent.MOUSEOUT_CHART, this.onMouseOutChart, false, 0, true)
			
			this.ui.getValueForDate = getVolForDate; 
		}
		
		private function onLoadChartData(e:StockChartModelEvent ):void
		{
			this.ui.loadData( this.stockChartModel.dp.source ) 
		}
		
		private function whenFilterApplied(e:ChartFilterEvent):void
		{
			trace('x' + e.data )
			var maxDifferent : Number = e.data as Number
			var ee : DateField
			var newSource :  Array = []
			var firstDate : Date = DateField.stringToDate( this.ui.dp[0].Date, "YYYY-MM-DD" );
			for each ( var item :  Object in this.ui.dp ) 
			{
				var date : Date = DateField.stringToDate( item.Date, "YYYY-MM-DD" );
				if ( date.getTime() - firstDate.getTime() > maxDifferent ) 
				{
					continue; 
				}
				newSource.push( item ) 
			}
			
			this.ui.dp.source = newSource
			this.ui.dp.refresh()
		}
		
		
		private function whenDataSliced(e:Event):void
		{
			this.stockChartModel.filterChart_ByIndex( this.ui.hslicer.slicedStart, this.ui.hslicer.slicedLength ) 
		}			
		private function loadChartIntoModel(e: ChartPageEvent):void
		{
			this.stockChartModel.loadData(e.data as Array ) 
			//this.graphPage.charts.source = e.data as Array
		}		
	
		private function whenChartDatesChaganged(e:Event):void
		{
			var event :  ChartPageEvent = new ChartPageEvent( ChartPageEvent.CHART_DATES_CHANGED, this.ui.dp ) 
			this.dispatch( event ) 
		}			
		
		private function whenDatesFiltered(e:Event):void
		{
	
			this.ui.hslicer.injectSliceChart( this.stockChartModel.lastStartIndex, 
				this.stockChartModel.lastStartIndex+this.stockChartModel.lastStartLength ) 
		}					
		
		
		private function whenDataSlicing(e:Event):void
		{
			this.stockChartModel.updateSlicingValues( this.ui.hslicer.slicingValues[0], this.ui.hslicer.slicingValues[1] ) 
		}		
		
		private function whenDataSlicingStopped(e:Event):void
		{
			this.dispatch( new StockChartModelEvent( StockChartModelEvent.SLICING_CHART_STOPPED ) ) 
		}			
		
		private function onMouseOverChart(e: ChartPageEvent):void
		{
			this.stockChartModel.rolledOverChartItem( 	e.data[0], e.data[1] )
		}			
		
		private function onMouseOutChart(e:Event):void
		{
			this.dispatch( new StockChartModelEvent( StockChartModelEvent.MOUSEOUT_CHART ) ) 
		}			
				
		private function getVolForDate( index : Object )  : Object
		{
			return this.stockChartModel.indexByDate[index]; 
		}
	}
}