/**
* Main Model for Application 
*/
package org.robotlegs.stockchart.model
{
	
	import org.robotlegs.mvcs.Actor;
	
	public interface  IAppModel  
	{
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
	  function updateCharts( charts : Array ) : void
	 function getCharts():Array
	}
}