package sss.Shelpers.Shelpers.ui
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.controls.scrollClasses.ScrollBar;
	import mx.controls.scrollClasses.ScrollThumb;
	import mx.core.SpriteAsset;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.MoveEvent;
	import mx.events.ResizeEvent;
	import mx.events.ScrollEvent;
	
	import sss.Shelpers.Shelpers.FilterHelpers;
	import sss.Shelpers.Shelpers.ShelpersPopups;
	import sss.Shelpers.Shelpers.ShelpersUI;
	import sss.Shelpers.Shelpers.ShelpersUI_Part2;
	
 
   public class PopupCode  
   {
   		/**
   		 * Callled by 'closeEvery' method to remove the window
   		 * 
   		 * */
 		public var externaCloseFx : Function;
 		static public var POPUP_OPENED : String = 'POPUP_OPENED'; 
 		static public var POPUP_CLOSED : String = 'POPUP_CLOSED'; 
		public var creationComplete : Boolean = false 
		public var popupName : String = '' 
		public function onCreate(e:FlexEvent):void
		{
			this.creationComplete = true; 
			(this.popup as UIComponent).removeEventListener(FlexEvent.CREATION_COMPLETE, this.onCreate )
		}
	  static   public function Create ( obj :  Object, app : Object , addAsPopup : Boolean = true, addAtIndex0 : Boolean = false) :  PopupCode    
	{
	//	if ( obj.hasOwnProperty('popupCode' ) == false  )
	//		throw  'class isnot compatiblie inned a p opupcode' 
		  		

		var po : PopupCode = new PopupCode(); 
				if ( addAsPopup )
				{
	 			 	ShelpersPopups.addPopup(obj as UIComponent,  app , false );
	 			}
	 			 else
	 			 {
	 			 	po.nonPopup = true
	 			 	obj.alpha = 1
	 			 	if ( addAtIndex0 ) 
	 			 		app.addChildAt( obj, 0 ) 	 			 	
	 			 	else
	 			 		app.addChild( obj ) 
	 			 }
	 			 	
	 			 	 			obj.visible = false; // = popup
	 			 po.popup =  obj	  
				po.popup.addEventListener(FlexEvent.CREATION_COMPLETE, po.onCreate, false, 0, true ) 
					 
	 			 return po; 
	}	            
     public var popup :  Object; 
     public var showing : Boolean = false; 
     /**
     * Flag indicates if item is a popup or added to a component
     * */
     public var nonPopup : Boolean = false; 
     public var adjustAlpha : Boolean = true;
     public var maxAlpha : Number = 1
     public var centerByDefault : Boolean = false
     static public var centerFunction : Function; 
     public var fadeTime : Number = 0.6
     public function open( toggle : Boolean = true, center : Boolean = false,bringToTop : Boolean = true  )  : void
     {
     	if ( this.showing == false) 
     	{
     		this.showing = true
     		if ( center || ( centerByDefault && center == false  )  ) 
     		{
     			if ( centerFunction == null ) 
     				ShelpersPopups.Center( popup )
     			else
     				centerFunction( popup ) 
     		}
     		if ( bringToTop && this.nonPopup == false  ) 
     			this.bringToFront()
     		if ( this.adjustAlpha ) 
     			ShelpersUI.FadeIn( popup, fadeTime, maxAlpha )
     		else
     			popup.visible = true
     		try 
     		{
     		(this.popup as DisplayObject).dispatchEvent(new Event( POPUP_OPENED ) ) 
     		}
     		catch ( e : Error ) 
     		{}
     		
     		return
     	}
     	//if in tolggle mode, don't automatically close this
     	if ( toggle == false ) 
     	{
     		if ( bringToTop ) 
     			this.bringToFront()
     		return; 
     	}
     		this.showing = false
     		if ( this.adjustAlpha ) 
     		{
     			ShelpersUI.FadeOut( popup, fadeTime )
     			this.popup.dispatchEvent(new Event( POPUP_CLOSED ) ) 
     		}
     		return     	
     }
    
    private var oldObj :  Object; 
    //close if this is the same objec t.... 
     public function closeIfSimiliar(closeIfSimiliarToThis :Object )  :  Boolean
     {
     	if ( closeIfSimiliarToThis  == oldObj && this.showing ) 
     	{
     		this.close2()
     		return true;
     	}
     	oldObj = closeIfSimiliarToThis
     	return false
     	
     }    
     public function close( )  : void
     {
     	if ( this.showing == false) 
     	{
     		return;
     	}
    
 		this.showing = false
 		if ( this.adjustAlpha ) 
 		{
 			
 			ShelpersUI.FadeOut( popup, fadeTime )
 		}
 		else
 		{
 			setTimeout( this.hideMe, fadeTime*1000 ); //, [popup] )
 		} 
 		 (this.popup as DisplayObject).dispatchEvent(new Event( POPUP_CLOSED ) ) 
     }    
    public function hideMe()  : void
    {
    	if ( this.showing == false ) 
    	{
    		this.popup.visible = false; 
    	}
    }
    public function close2()  : void
    {
    	if ( this.externaCloseFx != null ) 
    	{
    		this.externaCloseFx()
    		return; 
    	}
    	this.close() 
    }
    
    public function center()  : void
    {
    	ShelpersPopups.Center( popup ) 
    }
    
    
    public function makeMoveable(uiMover : UIComponent=null) :void
    {
            var addToUI : UIComponent = this.popup as UIComponent
            if ( uiMover != null ) addToUI  = uiMover;
            
            addToUI.addEventListener(MouseEvent.MOUSE_DOWN, tbMouseDownHandler,  false, 0, true);
            addToUI.addEventListener(MouseEvent.MOUSE_UP, tbMouseUpHandler,  false, 0, true);
            addToUI.addEventListener(MouseEvent.ROLL_OUT, tbMouseUpHandler,  false, 0, true);
            addToUI.useHandCursor = true
            addToUI.buttonMode = true
        }
        
        private var xOff:Number;
           private var yOff:Number;
            
        private function tbMouseDownHandler(event: MouseEvent):void {
            
	if ( event.target is ScrollBar || event.target is ScrollThumb || event.target is SpriteAsset ) // != this.popup ) //we added it to the entire popup  
            		return;   
            		
            	//var dbg  : Array = []  	
                xOff = event.currentTarget.mouseX;
                yOff = event.currentTarget.mouseY;
                 this.popup.addEventListener(MouseEvent.MOUSE_MOVE, tbMouseMoveHandler,  false, 0, true);
               // parent.setChildIndex(this,parent.numChildren-1);  //probably essential coe
                
            }
            
       private function tbMouseMoveHandler(event:MouseEvent):void {
            
            // Compensate for the mouse pointer's location in the title bar.
            
            var tempX:int = popup.parent.mouseX - xOff;
            popup.x = tempX;
            
            var tempY:int = popup.parent.mouseY - yOff;
            popup.y = tempY;    
                    
        }
        
        private function tbMouseUpHandler(event:MouseEvent):void {

           popup.removeEventListener(MouseEvent.MOUSE_MOVE, tbMouseMoveHandler);    
        
        }
            
    
    	public function moveTo ( x : Number, y  : Number )  : void
    	{
    		this.popup.x = x
    		this.popup.y = y 
    	}
    
    
   
    	public function moveToComponent (  ui : UIComponent , corner : String = 'tl',  tween : Boolean = true,
    	 locally : Boolean = false, setValue :  Boolean = true , xOffset : Number = 0, 
			 yOffset : Number = 0 )  : void
    	{
    		var ee : ShelpersUI_Part2
    		//trace('Moved to component ok')
    		ShelpersUI_Part2.putMeAtYourCorner( this.popup as UIComponent, ui, corner , tween, locally, setValue, xOffset, yOffset ) 
    	}
        
      
    
    	public function destroy()  : void
    	{
			var po : PopupCode = new PopupCode(); 
			if ( nonPopup == false )
			{
				ShelpersPopups.removeMe( this.popup as UIComponent ) 
			}
			else
			{
				this.popup.parent.removeChild( this.popup ) 
			}
			
    	}
    	
    	import flash.utils.setTimeout;
    	
    	//////////////////////////
    	
    	import flash.utils.setTimeout;
    	public function hideWait(  e : Number )  : void
    	{ 
    		//wait time ..
    		
    		setTimeout( this.tryToHide, e, false )  
    	}
    	
    	
 			public function tryToHide( spawn : Object = null, retry : Boolean = true)  : void
 			{
 				//if could not hide, who again in a second ...
 				if ( this.hide(spawn) && retry )
 					setTimeout( this.tryToHide, msToWaitWhileTryingToHide )	
 					
 			}
 			public var msToWaitWhileTryingToHide : Number = 2000 
 			public function tryToHideEvery( spawn : Object = null, retry : Boolean = true)  : void
 			{
 				
 				//if could not hide, who again in a second ...
 				//always hides instnatly 
 			//	if ( this.hide(spawn) && retry )
 			//	{
 
 				 	this.tryingToHideOn = spawn
 					setTimeout( this.tryToHideEvery2, msToWaitWhileTryingToHide, spawn )
 			//	}	
 					
 			} 			
 			
 			public var tryingToHideOn : Object; 
 			private function tryToHideEvery2( spawn : Object = null)  : void
 			{
 				if ( this.showing == false ) 
 				{
 					trace( 'not showing anymore --- ' + spawn.data + ' // ' + tryingToHideOn.data  )
 					//but likely alpha has not been changed
 					return;  					
 				}
 				//if could not hide, who again in a second ...
 				if ( tryingToHideOn != spawn ) 
 				{
 					trace( 'exiting autoclose loop ' + spawn.data + ' // ' + tryingToHideOn.data  )
 					return; 
 				}
 				if ( this.hide(spawn)  )
 				{
 					var overObject : Object = ShelpersUI_Part2.isUserOverMeSWho( this.popup, spawn  ) 
 					trace ( 'try to hide again ' + spawn  + spawn.data + ' over ' + overObject  )
 					setTimeout( this.tryToHideEvery2, msToWaitWhileTryingToHide, spawn )
 				}	
 				else
 				{
 					trace ( 'stopped spawining' )
 				}
 			} 			 			
 			
 			public function tryToClose( otherUi : Object)  : void
 			{
 				this.hide( otherUi )
 			}
 			
			public function hide( spawn :  Object =null )  :   Boolean
			{
				 var over : Boolean  = ShelpersUI_Part2.isUserOverMeS( this.popup, spawn  ) 
				 var overObject : Object = ShelpersUI_Part2.isUserOverMeSWho( this.popup, spawn  ) 
				if ( over == false ) 
				{
					this.close2();
				}	
				return over;  
			}	 				
 			    
 		public var userOverMany : Array = new Array()				
/*  	static public function isUserOverMe ( me : UIComponent ) :  Boolean
	{
		
     			var mousePt :   Point = new Point( me.mouseX, me.mouseY )
     			var over : Boolean = me.hitTestPoint( me.mouseX, me.mouseY )
     			
     			var rer : Boolean = false; 
     			if ( mousePt.x > 0 && mousePt.y > 0 )
     			{
     				if ( mousePt.x < me.width && mousePt.y < me.height ) 
     				{
     					//if ( this.clickedDown )
     						rer = true
     				}
     			}
 
     			return rer
     		}
		
	static public function isUserOverMeS ( ... uicomponents  ) :  Boolean
	{
		 for each ( var j : UIComponent in uicomponents ) 
		 {
		 	if ( j == null ) 
		 		continue
		 	var over : Boolean = PopupCode.isUserOverMe( j ) 
		 	if ( over == true ) 
		 		return true
		 }
		 
		 return false; 
      }
	
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		public function bringToFront() : void
		{
			 ShelpersPopups.BringToFront( popup ) 
		}
		public function bringToBack(  )  : void
		{
			return; 
			this.popup.systemManager.popUpChildren.setChildIndex(DisplayObject(this.popup),
				0)
		}	   	
    	
    	public function styleMeNicely(seperateTarget : Object=null, showBorder : Boolean = true)  : void
    	{
    		var setStyleOn : Object  = this.popup
    		if ( seperateTarget != null ) 
    			setStyleOn = seperateTarget	
    		if ( showBorder == false ) 
    			setStyleOn.setStyle('borderThickness', 0 )
    		setStyleOn.setStyle('borderStyle', 'solid' )
    		setStyleOn.setStyle('borderColor', '0xd2d2d2' )
    		setStyleOn.setStyle('backgroundAlpha', '1' )
    		setStyleOn.setStyle('backgroundColor', '0xFFFFFF' )
    		FilterHelpers.addLightDropShadow(setStyleOn )
    	}
    	public function removeBorder(seperateTarget : Object=null)  : void
    	{
			var setStyleOn : Object  = this.popup
    		if ( seperateTarget != null ) 
    			setStyleOn = seperateTarget	    		
    		setStyleOn.setStyle('borderThickness', 0 )
    	}
    	public var stickToUi  : UIComponent
    	public var stickToAnotherUI : UIComponent
    	public var settings : Array; 
     public function stickTo( ui : UIComponent ,  corner : String = 'tl',  tween : Boolean = true,
    	 locally : Boolean = false, setValue :  Boolean = true , xOffset : Number = 0, 
			 yOffset : Number = 0, stickToAditionalUI : UIComponent = null )  : void
     {
     	this.removeStickiness();
		stickToUi = ui
		this.settings = new Array()
		var ee : MoveEvent
		this.settings = [  ui, corner , tween, locally, setValue, xOffset, yOffset ]
		 //ResizeEvent.RESIZE
		// var ee : ResizeEvent
		//this.popup.parentApplication.removeEventListener( ScrollEvent.SCROLL, this.moveBackToSticktoUi 
		
		this.popup.parentApplication.addEventListener( ScrollEvent.SCROLL, this.moveBackToSticktoUi , false, 0, true ) 
		this.popup.parentApplication.addEventListener( ResizeEvent.RESIZE, this.moveBackToSticktoUi , false, 0, true ) 
		this.popup.addEventListener( ResizeEvent.RESIZE, this.moveBackToSticktoUi , false, 0, true ) 
		//moveEvent
		stickToAnotherUI = stickToAditionalUI
		if ( stickToAditionalUI!= null ) 
			stickToAnotherUI.addEventListener( MoveEvent.MOVE , this.moveBackToSticktoUi , false, 0, true ) 
 		this.moveBackToSticktoUi()
 		//Shelpers.alert( Shelpers.stringify('stuck to proc') )// ' , this.stickToUi.id, this.stickToUi ) )
     }    	
     
     public function removeStickiness()  : void
     {
		stickToUi = null
		this.settings = new Array()
		this.popup.parentApplication.removeEventListener( ScrollEvent.SCROLL, this.moveBackToSticktoUi );  
		this.popup.parentApplication.removeEventListener( ResizeEvent.RESIZE, this.moveBackToSticktoUi );
		this.popup.removeEventListener( ResizeEvent.RESIZE, this.moveBackToSticktoUi );
		
		if ( stickToAnotherUI != null ) 
				stickToAnotherUI.removeEventListener( MoveEvent.MOVE , this.moveBackToSticktoUi    ) 		
 		//this.moveBackToSticktoUi()     	
     }
 
 	public function     moveBackToSticktoUi( e : Object = null )  : void
 	{
 		//var ee :  Function
 		if ( this.showing  == false ) 
 		{
 			//Shelpers.alert( Shelpers.stringify('qqq stuck to proc') )
 			return; 
 			
 		}
 		this.moveToComponent.apply( this, this.settings ) 
 		
 		//var ee : Shelpers
 		//Shelpers.alert( Shelpers.stringify('stuck to ' , this.stickToUi.id, this.stickToUi ) ) 
 		//this.stickToUi.callLater( this.moveToComponent.apply, [this, this.settings] )
 		
 		//setTimeout( this.moveBackToSticktoUi(
 		//this.moveToComponent( this.stickToUi, settings[0] )
 	}
     
     public function stickToAppCenter()  : void
     {
     	this.stickTo( this.popup.parentApplication, 'c', true ) 
     }
     
     /*
     * allows custom listeners
     */
     public function setupListenerForResize_Scrolling_Movement_Of( ui  : Object, fx : Function )  : void
     {
     		ui.addEventListener( ScrollEvent.SCROLL, fx , false, 0, true ) 
			ui.addEventListener( ResizeEvent.RESIZE, fx , false, 0, true ) 
			ui.addEventListener( MoveEvent.MOVE , fx, false, 0, true    ) 					
     }
     public function removeListenerForResize_Scrolling_Movement_Of( ui  : Object, fx : Function )  : void
     {
     		ui.removeEventListener( ScrollEvent.SCROLL, fx , false, 0, true ) 
			ui.removeEventListener( ResizeEvent.RESIZE, fx , false, 0, true ) 
			ui.removeEventListener( MoveEvent.MOVE , fx, false, 0, true    ) 					
     }
          
     
     
     
	}
}
