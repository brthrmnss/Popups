package  org.syncon.popups.view
{
	import sss.Shelpers.Shelpers.ui.PopupCode;
	
	/**
	 * Defines basic interface for popups 
	 * @author m3skm00
	 * 
	 */
	public interface IPopup
	{
		function create(app:Object ): IPopup

		function get  popupCode ():PopupCode;
		function set  popupCode ( _popupCode :PopupCode ) : void ;		
/*		
		function get  popupName ():String;
		function set  popupName ( _popupName : String ) : void ;		*/		
		
		/**
		 * Shows component  
		 * 
		 */		
		function show( ) : void
		/**
		 * Closes component  
		 * 
		 */					
		function hide( ) : void
			
		/**
		 * Write your own more complex functions 
		 * */
			//function open( ... ) : void
			//function close(... ) 
		
		/**
		 * To allow users to easily call functions, provide rerouting functions 
		 * that take either an array of arguments, or a {}
		 * */
		//function open( ... ) : void
		//function close(... ) 		
	}

}