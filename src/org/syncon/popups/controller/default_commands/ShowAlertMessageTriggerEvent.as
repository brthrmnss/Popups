package  org.syncon.popups.controller.default_commands
{
	import flash.events.Event;
	
	public class ShowAlertMessageTriggerEvent extends Event
	{
		public static const SHOW_ALERT_POPUP:String = 'showAlertPopup';
		/**
		 * The default alert popup name
		 * */
		public var popupName : String = 'popup_alert'; 
		public var windowTitle : String = '';
		public var fx : String = ''; 
		public var buttonLabel :  String = 'OK'; 
		public var showButton : Boolean = true
		public function arrayArgs()  :   Array
		{
			return [this.message, windowTitle, this.buttonLabel, this.showButton]
		}
		
		public var message :  String; 
		
		public function ShowAlertMessageTriggerEvent(type:String, message : String ,
				 windowTitle : String = 'Alert',  popupName_ : String = '', buttonLabel_ : String = 'OK', 
				 showButton_ : Boolean = true )
		{	
			this.message = message
			this.windowTitle = windowTitle
			this.fx = 'loadAlert'
			if ( popupName_ != '' ) 
				this.popupName = popupName_
			this.buttonLabel = buttonLabel_
			this.showButton = showButton_
			super(type, true);
		}
	
	}
}