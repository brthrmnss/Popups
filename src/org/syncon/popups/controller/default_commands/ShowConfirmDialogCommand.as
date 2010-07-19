package  org.syncon.popups.controller.default_commands
{
	import org.robotlegs.mvcs.Command;
	import org.syncon.popups.controller.ShowPopupEvent;
	import org.syncon.popups.model.PopupModel;
	
	public class ShowConfirmDialogCommand extends Command
	{
		[Inject] public var event:ShowConfirmDialogTriggerEvent;
		[Inject] public var popupModel:PopupModel;
		
		override public function execute():void
		{
			this.dispatch( new  ShowPopupEvent ( ShowPopupEvent.SHOW_POPUP, event.popupName, event.arrayArgs()  ) ) 	
		}
			
		
	}
}