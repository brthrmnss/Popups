/**
* Main Model for Application 
*/
package  org.robotlegs.stockchart.model
{
	
	import org.robotlegs.mvcs.Actor;
	
	public class   AppModel   extends Actor implements IAppModel
	{
		private var _charts : Array = []; 
		
		public function AppModel()
		{
			//messages = new ArrayCollection();
		}		
		
		
		
	/* 	private var charts:ArrayCollection;
		
		public function IAppModel()
		{
			//messages = new ArrayCollection();
		}
		
		public function addMessage(message:String):void
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
	 */
	 	public function updateCharts(charts : Array) : void
	 	{
	 		this._charts = charts; 
	 		this.dispatch( new  AppModelEvent( AppModelEvent.CHARTS_UPDATED, null, this._charts ) ) 
	 	}
	 
	 	public function getCharts() : Array
	 	{
	 		return this._charts
	 	}
	}
}