package org.syncon.popups.controller
{
	
	import org.robotlegs.mvcs.Command;
	import org.syncon.popups.model.PopupModel;
	import org.syncon.popups.view.IPopup;
	
	public class AddPopupsKeyboardShortcutsCommand extends Command
	{
	/*	static public var ENABLE_KEYBOARD_SHORTCUTS  : String = 'ENABLE_KEYBOARD_SHORTCUTS';
		static public var ADD_KEYBOARD_SHORTCUTS  : String = 'ADD_KEYBOARD_SHORTCUT';	
		*/
		[Inject] public var event:AddKeyboardShortcutToOpenPopupEvent;
		[Inject] public var popupModel:PopupModel;
		
		override public function execute():void
		{
			if ( event.type == AddKeyboardShortcutToOpenPopupEvent.ENABLE_KEYBOARD_SHORTCUTS )
			{
				this.popupModel.registerKeyboardEvent( this.mediatorMap )
			}
			if ( event.type == AddKeyboardShortcutToOpenPopupEvent.ADD_KEYBOARD_SHORTCUTS )
			{
				//add to model list
				this.popupModel.registerPopupShortcut( event.name, event.class_, event.popup, event.keyToOpen, event.ctrlKey, event.altKey )
			}
		}
		
	 
	}
}