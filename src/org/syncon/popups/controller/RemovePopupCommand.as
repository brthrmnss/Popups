package org.syncon.popups.controller
{
	import mx.core.UIComponent;
	
	import org.robotlegs.mvcs.Command;
	import org.syncon.popups.model.PopupModel;
	import org.syncon.popups.views.IPopup;
	
	import sss.Shelpers.Shelpers.ui.PopupCode;
	
	public class RemovePopupCommand extends Command
	{
		[Inject] public var event:RemovePopupEvent;
		[Inject] public var popupModel:PopupModel;
		
		override public function execute():void
		{
			var popup : IPopup = this.popupModel.removePopup( event.name, event.class_, event.popup ) 
			popup.popupCode.destroy()
		}
	}
}