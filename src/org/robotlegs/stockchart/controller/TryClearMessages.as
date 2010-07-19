package org.robotlegs.stockchart.controller
{
	import org.robotlegs.stockchart.model.MessageModel;
	import org.robotlegs.stockchart.model.UserProxy;
	//import org.robotlegs.stockchart.view.LoginPage;
	import org.robotlegs.mvcs.Command;
	
	public class TryClearMessages extends Command
	{
		[Inject]
		public var event:SystemEvent;
		
		[Inject]
		public var userProxy:UserProxy;
		
		[Inject]
		public var messageModel:MessageModel;
		
		override public function execute():void
		{
			if (userProxy.userLoggedIn)
			{
				messageModel.clearMessages();
			}
			else
			{
		/*		injector.mapValue(SystemEvent, event, 'LoginTrigger');
				contextView.addChild(new LoginPage());*/
			}
		}
	}
}