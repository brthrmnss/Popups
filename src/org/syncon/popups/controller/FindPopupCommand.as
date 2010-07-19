package org.syncon.popups.controller
{
	import mx.core.UIComponent;
	
	import org.robotlegs.mvcs.Command;
	import org.syncon.popups.model.PopupModel;
	import org.syncon.popups.view.IPopup;
	
	public class FindPopupCommand extends Command
	{
		[Inject] public var event:RemovePopupEvent;
		[Inject] public var popupModel:PopupModel;
		
		override public function execute():void
		{
			//this.popupModel.findPopup( event.name, event.class_  ) 
		}
	}
}