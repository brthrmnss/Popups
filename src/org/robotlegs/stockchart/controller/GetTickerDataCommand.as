
package  org.robotlegs.stockchart.controller
{
	import flash.events.Event;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.stockchart.model.TickerModel;
	import org.robotlegs.stockchart.model.vo.TickerVO;
	
	public class GetTickerDataCommand extends Command
	{
		public static const GET_TICKER:String = 'GET_TICKER';
		[Inject] public var tickerModel:TickerModel;
		
		override public function execute():void
		{
			for ( var i : int = 0; i < 10; i ++ )
			{
				
			}
			var charts : Array = [];
			charts = [ new TickerVO ( 'YEN', 91.56, 0.73 ), new TickerVO ( 'Markets' ),
			new TickerVO ( 'NASDAQ', 2265.64, -54 ), new TickerVO ( 'YEN', 10380.43, -139.89 ), new TickerVO ( 'S&P500', 1110.8, -0.64 )]
			this.returnResult( null, charts ) 
		}
		
		public function returnResult(event:Event, chartData : Array = null) : void
		{
			this.tickerModel.loadData( chartData ) 
		}
		
	}
}