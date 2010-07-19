/**
* Main Model for Application 
*/
package  org.robotlegs.stockchart.model
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.controls.DateField;
	
	import org.robotlegs.mvcs.Actor;
	import org.robotlegs.stockchart.model.vo.StockPriceVO;
	import org.robotlegs.stockchart.view.ChartPageEvent;

	/**
	 * Dispatched when chart filtered
	 */	
	[Event(name="chartFiltered", type="org.robotlegs.stockchart.model.StockChartModelEvent")]
	/**
	 * Dispatched when chart has been changed 
	 */
	[Event(name="chartChanged", type="org.robotlegs.stockchart.model.StockChartModelEvent")]
	public class   StockChartModel   extends Actor 
	{
		private var _chartData : ArrayCollection ; // [];
		private var _filteredChartData : ArrayCollection; 
		
		public function StockChartModel()
		{
			_chartData = new ArrayCollection();
			this._filteredChartData = new ArrayCollection();
		}		
		
 
	/*	public function addMessage(message:String):void
		{
			messages.addItem((messages.length + 1) + ': ' + message);
			dispatch(new MessageModelEvent(MessageModelEvent.MESSAGE_ADDED, message));
		}
		
		public function get messageList():ArrayCollection
		{
			return messages;
		}
		
		public function clearMessages():void
		{
			messages.removeAll();
			dispatch(new MessageModelEvent(MessageModelEvent.MESSAGES_CLEARED));
		}
	 	public function updateCharts(charts : Array) : void
	 	{
	 		this._charts = charts; 
	 		this.dispatch( new  AppModelEvent( AppModelEvent.CHARTS_UPDATED, null, this._charts ) ) 
	 	}*/
	 
	 	public function getChartDp() :  ArrayCollection
	 	{
	 		return this._filteredChartData
	 	}
		
		public var dateStart : Date = new Date()
		public var dateEnd : Date = new Date()			
			
		public var priceStart : StockPriceVO = new StockPriceVO()			
		public var priceEnd : StockPriceVO = new StockPriceVO()
			
		public function filterChart( startDate :   Date, milliseconds : Number  )  : void
		{
			/*var start : Date = new  Date()
			if ( startAt == -1 ) 
				start = this.dateStart*/
			
				var end : Date = new Date()
				end.setTime( startDate.getTime()+milliseconds )
			if ( milliseconds == 0 ) //show all data
			{
				this.zoomAll()
				return; 
			}
			if ( milliseconds == -1 ) //show all data
			{
				this.zoomYTD();
				return;
			}			
			this.filterChart_ByDate( startDate, end ) 
		}
		
		public function updateSlicingValues( startIndex : int , endIndex : int) : void
		{
			var priceStart_ :  StockPriceVO = this.convertStockDpItemToStockPriceVO(   this._filteredChartData.source[startIndex] )
			var priceEnd_ : StockPriceVO =  this.convertStockDpItemToStockPriceVO(  this._filteredChartData.source[endIndex] )
			var ev :  StockChartModelEvent = new StockChartModelEvent( StockChartModelEvent.SLICING_CHART, [priceStart_,priceEnd_] )
			this.dispatch( ev )
		}
		
		public  function get lastStartIndex     (): int { return this.lastStart }
		public function get lastStartLength (): int { return this.lastLength }
		private var lastStart : int = 0; 
		private var lastLength : int =0; 
		public function filterChart_ByIndex( start : int, length : int  )  : void
		{
			if ( lastStart == start && this.lastLength == length ) 
					return; 
			this.lastStart = start
			this.lastLength = length;
			this._filteredChartData.source   =this._chartData.source.slice(start,length);
			
			//this.updateLimits()
			/*
			this.dateStart = convertStockDpItemToDate( this._filteredChartData.source[start] )
			this.dateEnd = convertStockDpItemToDate( this._filteredChartData.source[start+length-1] )*/
			this.dateStart = convertStockDpItemToDate( this._filteredChartData.source[0] )
			this.dateEnd = convertStockDpItemToDate( this._filteredChartData.source[this._filteredChartData.length-1] )
				
			if ( length == 0 )
			{
				this.dateStart = convertStockDpItemToDate( this._chartData.source[0] )
				this.dateEnd = convertStockDpItemToDate( this._chartData.source[this._chartData.length-1] )				
			}
			
			this.chartFiltered()
		}		
		
		private var lastStartDate : Date ; 
		private var lastEndDate : Date  ; 		
		public function filterChart_ByDate( start :  Date, endDate :  Date  )  : void
		{
			if ( lastStartDate == start && this.lastEndDate == endDate ) 
				return; 
			this.lastStartDate = start
			this.lastEndDate = endDate;
			var newDp : Array = []; 
			for each ( var item :  Object in this._chartData )
			{
				var date : Date = this.convertStockDpItemToDate( item )
				if ( date.getTime() >= start.getTime() && date.getTime() <= endDate.getTime() )
				{
					newDp.push( item ) 
				}	
				
			}
			if ( newDp.length == 0 ) 
			{
				Alert.show('data not available')
					this.zoomAll()
				return; 
			}
			this._filteredChartData.source   = newDp
				
			this.lastStart = this._chartData.source.indexOf(newDp[0])
			this.lastLength = newDp.length; // this._chartData.source.indexOf(newDp[newDp.length-1])  - this.lastStart -1-50
				
			this.dateStart = convertStockDpItemToDate( this._filteredChartData.source[0] )
			this.dateEnd = convertStockDpItemToDate( this._filteredChartData.source[this._filteredChartData.length-1] )
			
			this.priceStart = convertStockDpItemToStockPriceVO( this._filteredChartData.source[0] ) 
			this.priceEnd = convertStockDpItemToStockPriceVO( this._filteredChartData.source[this._filteredChartData.length-1] )
				
			trace( 'dates cliped ' + [DateField.dateToString( start , 'MM-DD-YYYY' ),
				DateField.dateToString( endDate , 'MM-DD-YYYY' ),
				DateField.dateToString( this.dateStart , 'MM-DD-YYYY' ),
				DateField.dateToString( this.dateEnd , 'MM-DD-YYYY' )].join(' ' )  )
				
			this.chartFiltered();
			this.dispatch( new StockChartModelEvent( StockChartModelEvent.CHART_DATES_FILTERED, [this.priceStart, this.priceEnd]  ) ) 
		}		
				
		
		
		
		public function updateCharts() : void
		{
			this.chartFiltered();
		}		
		
		public var indexByDate  : Object = {};
		/**
		 * Loads new set of data
		 * */
		public function loadData( dp : Array )  : void{
			this._chartData.source = dp; 
			indexByDate = {}
			for each ( var item : Object in dp ) 
			{
				indexByDate[item.Date] = item
			}
			this._filteredChartData.source = dp; 
			
				
			
			this.dateStart = this.convertStockDpItemToDate(dp[0])
			this.dateEnd = this.convertStockDpItemToDate(dp[dp.length-1])
				
			this.dispatch( new StockChartModelEvent( StockChartModelEvent.CHART_CHANGED  ) ) 
			//this.zoomYTD();
			this.chartFiltered();
			
			//this.zoomYTD();
		}
		
		public function get dp () :  ArrayCollection
		{
			return this._chartData
		}
		
		public function zoomYTD ()  : void
		{
			var date : Date =  new Date()
			for each ( var item : Object in this._chartData ) 
			{
				if ( date.fullYear == this.convertStockDpItemToDate( item ).fullYear  ) 
				{
					var start_ : Date = this.convertStockDpItemToDate( item )
					var end_ : Date = this.convertStockDpItemToDate( this._chartData.getItemAt( this._chartData.length-1 ) )
					this.filterChart_ByDate( start_, 	end_ )
					return;
				}
			}			
		}
		
		public function zoomAll ()  : void
		{
			var startDate : Date; 
			var end : Date;
			startDate = this.convertStockDpItemToDate( this._chartData[0] )   
			end = this.convertStockDpItemToDate( this._chartData[this._chartData.length-1] ) 
			this.filterChart_ByDate( startDate, end ) 	
		}		
		
 	public function chartFiltered()  : void
		{
			this.priceStart = convertStockDpItemToStockPriceVO( this._filteredChartData.source[0] ) 
			this.priceEnd = convertStockDpItemToStockPriceVO( this._filteredChartData.source[this._filteredChartData.length-1] )		
			this.dispatch( new StockChartModelEvent( StockChartModelEvent.CHART_FILTERED, [this.priceStart, this.priceEnd]  ) ) 
		} 
		
	public function rolledOverChartItem( date  : String, price : Number)  : void
	{
		var stockPrice : StockPriceVO = new  StockPriceVO( 	  )
		var date_ : Date = DateField.stringToDate(date, "YYYY-MM-DD" );
		stockPrice.price = price
		stockPrice.date = date_; 
		this.dispatch( new StockChartModelEvent( StockChartModelEvent.MOUSEOVER_CHART, stockPrice ) ) 
	} 
		
	
	
	
		/**
		 * Utility
		 * */
		public function convertStockDpItemToDate( item : Object )  : Date
		{
			if ( item == null ) 
			{
				trace('input null')
				return new Date()
			}
			var date : Date = DateField.stringToDate( item.Date, "YYYY-MM-DD" );
			return date; 
		}
		
		public function convertStockDpItemToStockPriceVO( item : Object )  : StockPriceVO
		{
			if ( item == null ) 
			{
				trace('input null')
				return new StockPriceVO()
			}
			var date : Date = DateField.stringToDate( item.Date, "YYYY-MM-DD" );
			var stockPrice :  StockPriceVO = new StockPriceVO()
			stockPrice.date = date
			stockPrice.price = item.Close
			return stockPrice; 
		}		
		
		
	}
}