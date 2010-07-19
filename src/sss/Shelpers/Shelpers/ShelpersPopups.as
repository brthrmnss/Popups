package sss.Shelpers.Shelpers 
{
	import flash.geom.Point;
	
	import mx.containers.VBox;
	import mx.core.IFlexDisplayObject;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	import sss.Shelpers.Shelpers.other.TweenerHelpers;
	//import sss.Shelpers.Shelpers.ui.ShelperPopup;

public class  	ShelpersPopups 
{
 
 		 
		public static function Center (  me : Object) : void
		{
			 PopUpManager.centerPopUp(me as IFlexDisplayObject);
		} 
		public static function BringToFront (  me : Object) : void
		{
			 PopUpManager.bringToFront( me as IFlexDisplayObject);
		} 		
		
		public static function MoveTo (popup : UIComponent, comp : UIComponent, offset:Point=null, tween:Boolean=true, duration:Number=1.2 ) : void
		{
			
			ShelpersPopups.Center( popup ) // until ou make it so they don't scrape teh top ....  
			return
			var pt : Point = comp.contentToGlobal( new Point(0,0) ) 
			 
			 var tweenDuration :Number = 0 
			 if( tween )
			 	tweenDuration = duration
			 
			 //popup.x = pt.x+comp.width //popup.width
			 //popup.y = pt.y
			 
			 var newX : Number = pt.x+comp.width
			 var newY :  Number = pt.y 
			 
			 if ( offset != null )
			 {
			 	newX+=offset.x
			 	newY+=offset.y
			 }
			 
			 TweenerHelpers.TweenProp(popup, 'x', newX, tweenDuration, 0 )
			 TweenerHelpers.TweenProp(popup, 'y', newY, tweenDuration, 0 )
			 
			 //make sure doens't exend off screen, if so adjust height plz
		} 
		
 
		public static function addPopup (  u : UIComponent, parent :  Object, modeal : Boolean = true)  : void
		{
	 		PopUpManager.addPopUp( u, parent as UIComponent, modeal )
			if ( u.hasOwnProperty( 'addborder' ) ) //&& u.addborder == true) 
			{
				u.setStyle('borderStyle', 'solid' ) 
				u.setStyle('borderThickness', 1 ) 
				u.setStyle('backgroundColor', 0xFFFFFF )
				
				if ( u is VBox )
				{
					ShelpersUI.pad(  u ) 
				}
			}
		} 			
		public static var lowerLeft : String = 'LL'
		public static var PlacementTopRight : String = 'TR'
		/*	
		public static function addPopup2 (  u : UIComponent, parent :  Object, modeal : Boolean = true, 
			stickToParent : UIComponent = null, placement : String = 'LL', title : String = '')  :  ShelperPopup
		{
			var wer : ShelperPopup = new ShelperPopup()
			wer.addThsiChild  = u  
			wer.stickToParent = stickToParent
			wer.stickToParentPlacement = placement
			wer.title = title
	 		PopUpManager.addPopUp( wer, parent as UIComponent, modeal )
			if ( u.hasOwnProperty( 'addborder' ) ) //&& u.addborder == true) 
			{
				u.setStyle('borderStyle', 'solid' ) 
				u.setStyle('borderThickness', 1 ) 
				u.setStyle('backgroundColor', 0xFFFFFF )
				
				if ( u is VBox )
				{
					ShelpersUI.pad(  u ) 
				}
			}
			return wer
		} 					
		*/
		public static function removeMe (  u : UIComponent )  : void
		{
	 		PopUpManager.removePopUp( u )
			
		} 
		public static function invisible (  u : UIComponent )  : void
		{
	 		u.visible = false
			
		} 		
		
		public static function closeParent (u : UIComponent    )  : void
		{
			u.isPopUp
			if ( u.parentDocument.isPopUp )
				ShelpersPopups.removeMe( u.parentDocument as UIComponent )
		} 			
		
		 
		static public function fadeOutAndClose( u : UIComponent,removeAtEnd:Boolean=true )  : void
		{
			//just a commense sense thing, for popups ... either u are a popup, or your parent is a popup
			if ( u.hasOwnProperty('parentDocument' ) && u.parentDocument.isPopUp )
				var close : UIComponent = u.parentDocument as UIComponent
			else
				close = u
				
		//	import flash.utils.setTimeout;
			if ( removeAtEnd )
				var endFx:Function =   ShelpersPopups.removeMe 
			else
			{	
			
				var endParams : Array = [ u ]
				endFx =   ShelpersPopups.invisible 
				//
			}
				
			TweenerHelpers.TweenProp(close, 'alpha', 0, 2, 0 , endFx, endParams ) //, ShelpersPopups.removeMe )
		}
				
		public static function compactEach ( arr : Object, meth : String, listName : String = '', space : String = '')  :  String
		{
	 		var count : int = 0 ; 
	 		var str : String = ''
			for each ( var s :  Object in arr )
			{
				count++
				if ( s != null )
					var val :  Object = s[meth]
				str += (space+' '+count+'. '+val )
			}
			trace( str )
			return str
		} 					
		
 
 
		
	
 
	
	
	}
	
	
}
