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
	 * Dispatched when chart has been changed 
	 */
	[Event(name="tickerUpdated", type="org.robotlegs.stockchart.model.TickerModelEvent")]
	
	public class   TickerModel   extends Actor 
	{
		private var _tickerData : ArrayCollection ; // [];
		
		public function TickerModel()
		{
			_tickerData = new ArrayCollection();
		}		
 
		
		/**
		 * Loads new set of data
		 * */
		public function loadData( dp : Array )  : void{
			this._tickerData.source = dp; 
			this.dispatch( new TickerModelEvent( TickerModelEvent.TICKER_UPDATED , this._tickerData.source ) ) 
		}
		
		public function get dp () :  ArrayCollection
		{
			return this._tickerData
		}
		
  
	
 
		
		
	}
}