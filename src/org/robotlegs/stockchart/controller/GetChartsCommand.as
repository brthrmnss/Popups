
package  org.robotlegs.stockchart.controller
{
	import flash.events.Event;
	
	import org.robotlegs.stockchart.model.IAppModel;
	import org.robotlegs.stockchart.model.vo.ChartDataVO;
	import org.robotlegs.mvcs.Command;
	
	public class GetChartsCommand extends Command
	{
		[Inject]
		public var event:SystemEvent;
		/* [Inject]
		public var event:SystemEvent;
		
		[Inject]
		public var userProxy:UserProxy;
		 */
		[Inject]
		public var appModel:IAppModel;
		
		override public function execute():void
		{
			/* var service : HTTPService = new HTTPService()
			service.url = 'graphs.json';
			service.addEventListener(ResultEvent.RESULT, whenResult , false, 0, true )  */
			var charts : Array = [];
			var chart :  ChartDataVO = new  ChartDataVO( 'Bad 1', 'This is a bad boy', [ ['mark', 'julie', 'frank'], [15, 88, 0  ] ] )
			charts.push( chart ) 
			this.returnResult( null, charts ) 
		}
		
		public function returnResult(event:Event, chartData : Array = null) : void
		{
			this.appModel.updateCharts( chartData ) 
		}
		
	}
}