package sss.Shelpers.Shelpers 
{
	import flash.display.GradientType;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Point;
	
	import mx.containers.Canvas;
	import mx.core.DragSource;
	import mx.core.IFlexDisplayObject;
	import mx.core.IUIComponent;
	import mx.core.UIComponent;
	import mx.events.DragEvent;
	import mx.events.FlexEvent;
	import mx.managers.DragManager;
	
	import sss.Shelpers.Shelpers.other.TweenerHelpers;
	

public class ShelpersUI_Part2 
{
  
					
	static public function addCreationComplete(   ui :  Object,fx :Function )  : void
	{			
		ui.addEventListener( FlexEvent.CREATION_COMPLETE, fx, false, 0, true )
			
	}						
					 
	static public function toggleBtnLabel( one : String, two : String, ui :  Object, bol : Object = null  )  : void
	{			
		if ( ui.label == one )
			ui.label = two
		else
			ui.label = one
			
		if ( bol != null )
		{
			if ( bol == true )
				ui.label = one
			else
				ui.label = two
		}
			
			
	}	
	
	static public function toggleStates( one : String, two : String, ui :  Object  )  : void
	{			
		//we consider the first state equavalent to null , so on first call it wil go to the second state
		
		if ( ui.currentState == '' || ui.currentState == null || ui.currentState == one  )
			ui.currentState = two
		else
			ui.currentState = one
			
	}	
		
	
	
	//////////////////////////////// simple version ........................
	
	  public function makeDraggableCanvas ( e : Canvas, itemSenfFx :  Function) : void
	{
		//can only recieve from a data lister 
		e.addEventListener( DragEvent.DRAG_ENTER, this.dragEnterHandler, false, 0, true ) 	
		e.addEventListener( DragEvent.DRAG_DROP, this.dragDropHandler, false, 0, true ) 	
		this.itemSenfFx = itemSenfFx
		this.skip = false		
	}
	
	public var skip : Boolean = false; 
	
	  public function stopDragging ( e : Canvas) : void
	{
		this.skip = true
		//can only recieve from a data lister 
		e.removeEventListener(  DragEvent.DRAG_ENTER, this.dragEnterHandler )
		e.removeEventListener( DragEvent.DRAG_DROP, this.dragDropHandler )
		this.itemSenfFx = null		
	}	
	
	
	static public function putMeAtYourXY ( me : UIComponent,  referenceUIObject :  Object) : void
	{
		
		var pt : Point = referenceUIObject.localToGlobal( new Point(0, 0) )
		var asdf : Array = [referenceUIObject.x, referenceUIObject.y]
		//Shelpers.traceS('tracking', e.x, e.y, 'boo', pt.x, pt.y ) 
		
	//	if ( locally ) 
			pt = me.globalToLocal( pt )  
		//Shelpers.traceS('after' , pt.x, pt.y )
		me.x = pt.x
		me.y = pt.y	
		
	}		
	/* 
	
	adjusting the move values will disable tweening on that property
	
	 */
	static public function putMeAtYourCorner ( me : UIComponent,  referenceUIObject :  Object , corner : String = 'tl',
			 tween : Boolean = true, locally : Boolean = false, setValue :  Boolean = true , xOffset : Number = 0, 
			 yOffset : Number = 0 , moveX :Boolean = true, moveY : Boolean = true ) :  Object
	{
		
		var pt : Point = referenceUIObject.localToGlobal( new Point(0, 0) )
		var startingPt : Point = pt.clone()
		var newPt : Object = new Object(); 
		var asdf : Array = [referenceUIObject.x, referenceUIObject.y, pt.x, pt.y]
		if ( false == true )
		{
			pt.x+=referenceUIObject.x
			pt.y+=referenceUIObject.y		
		}
		//Shelpers.traceS('tracking', e.x, e.y, 'boo', pt.x, pt.y ) 
		if ( locally ) //this should nto be used if it isnot a popup  
			pt = me.parent.globalToLocal( pt )  
		
		pt.x+=xOffset
		pt.y+=yOffset				
		var traceItOut : Boolean = false; 
		if ( traceItOut ) 
		{
			Shelpers.traceS('after' , pt.x, pt.y )
			Shelpers.traceS('')
		}
		corner = corner.toLowerCase()
		if ( corner == 'tl' )
		{ 
			newPt.x = pt.x
			newPt.y = pt.y
		}	
		if ( corner == 'tr' )
		{ 
			newPt.x = pt.x+referenceUIObject.width
			newPt.y = pt.y
		}	
		if ( corner == 'tc' )
		{ 
			//var ee : Object = referenceUIObject.width/2
			newPt.x = pt.x+referenceUIObject.width/2-me.width/2
			//if ( referenceUIObject.width == 0 ) 
			
			newPt.y = pt.y
		}				
		if ( corner == 'c' )
		{ 
			//var ee : Object = referenceUIObject.width/2
			newPt.x = pt.x+referenceUIObject.width/2-me.width/2
			newPt.y = pt.y+referenceUIObject.height/2-me.height/2
		}					
		if ( corner == 'br' )
		{ 
			newPt.x = pt.x+referenceUIObject.width
			newPt.y = pt.y+referenceUIObject.height
		}	
		if ( corner == 'bl' )
		{ 
			newPt.x = pt.x
			newPt.y = pt.y+referenceUIObject.height
		}		
		if ( corner == 'bc' )
		{ 
			newPt.x = pt.x+referenceUIObject.width/2-me.width/2
			newPt.y = pt.y+referenceUIObject.height
		}			
		if ( moveX == false )
			newPt.x = 0; //startingPt.x //doesn't mean set it to 0, it means don't set it at all
		if ( moveY == false )
			newPt.y = startingPt.y //doesn't mean set it to 0, it means don't set it at all			
		if ( setValue ) 
		{
			if ( tween ) 
			TweenerHelpers.tweeenToXY( me, 1.2, newPt.x, newPt.y )
			else
			{ 
					me.x = newPt.x
					 me.y = newPt.y
			 } 
		}
		
		return newPt; 
	}			
	
	static public function isUserOverMe ( me : UIComponent ) :  Boolean
	{
		
     			var mousePt :  Point = new Point( me.mouseX, me.mouseY )
     			if ( me.stage == null ) 
     				return false; 
     			var   stagePt : Point = new Point( me.stage.mouseX, me.stage.mouseY)
     			var over : Boolean = me.hitTestPoint( stagePt.x, stagePt.y)
     			
     			var rer : Boolean = false; 
     			if ( mousePt.x > 0 && mousePt.y > 0 )
     			{
     				if ( mousePt.x < me.width && mousePt.y < me.height ) 
     				{
     					//if ( this.clickedDown )
     						rer = true
     				}
     			}
/*      			if ( rer && this.clickedDown == false ) 
     			{
     				Shelpers.traceS('not clicked ... ' ) ; //can something like this be trusted ? ... 
     				return false
     			}
     			//Shelpers.traceS( 'stuff', this.mouseX, this.mouseY, 'over', rer, this.clickedDown   ) */
     			return rer
     		}
	
	
	static public function isUserOverMeS ( ... uicomponents  ) :  Boolean
	{
		 for each ( var j : UIComponent in uicomponents ) 
		 {
		 	if ( j == null ) 
		 		continue
		 	var over : Boolean = ShelpersUI_Part2.isUserOverMe( j ) 
		 	if ( over == true ) 
		 		return true
		 }
		 
		 return false; 
      }
		
		static public function isUserOverMeSWho ( ... uicomponents  ) :   Object
	{
		 for each ( var j : UIComponent in uicomponents ) 
		 {
		 	if ( j == null ) 
		 		continue
		 	var over : Boolean = ShelpersUI_Part2.isUserOverMe( j ) 
		 	if ( over == true ) 
		 		return j
		 }
		 
		 return null ; 
      }
	
	public var itemSenfFx : Function; 
	
              private function mouseMoveHandler(event: MouseEvent):void 
            {                
                var dragInitiator: Object= (event.currentTarget);
                var ds: DragSource = new DragSource();
                ds.addData(dragInitiator, "img");               
var eee :  DragManager
var eeeeee : DragSource
                DragManager.doDrag(dragInitiator as   IUIComponent, ds, event);
            }
            
            // The dragEnter event handler for the Canvas container
            // enables dropping.
              private function dragEnterHandler(event:DragEvent):void {
              //  if (event.dragSource.hasFormat("img"))
               // {
               	if ( skip ) 
               		return 
               		
                    DragManager.acceptDragDrop(Canvas(event.currentTarget));
             //   }
            }

            // The dragDrop event handler for the Canvas container
            // sets the Image control's position by 
            // "dropping" it in its new location.
              private function dragDropHandler(event:DragEvent):void {
            	
            	var ar : Array = event.dragSource.dataForFormat('items') as  Array 
            	var e  : Shelpers
            	Shelpers.ifFxNotNullSendData( this.itemSenfFx, ar ) 
            	trace('dragDropHandler')
            	return;
               
            }
   			
   			
   			public var getDataForDragFx : Function; 
   			
   			public function makeDragSource( ui : UIComponent, customFx : Function , dragSource :  Object = null) : void
   			{
   			//	ui.addEventListener(MouseEvent.MOUSE_MOVE, this.dragIt, false, 0, true ) 
   				//ui.addEventListener(DragEvent.DRAG_START , this.dragIt, false, 0, true ) 
   				 ui.addEventListener(MouseEvent.MOUSE_MOVE, this.dragIt, false, 0, true ) 
   				this.getDataForDragFx = customFx
   				this.dragSource = dragSource 
   				this.skip = false; 
   			}
   	
   			public var dragSource :   Object; 
   	/*
   	     private function dragIt(event:DragEvent ):void 
            {
				if ( this.getDataForDragFx == null )
				{
					Shelpers.traceS('need a fx for this to wrok' ) 
					return; 
				}
			
                // Get the drag initiator component from the event object.
                //image can be anythign though 
                var dragInitiator: UIComponent = event.currentTarget   as UIComponent
    
                // Create a DragSource object.
                var dragSource:DragSource = new DragSource();
    
                // Add the data to the object.

                dragSource.addData([getDataForDragFx()], 'items');
    
                // Create a copy of the coin image to use as a drag proxy.
             //   var dragProxy:Image = new Image();
            //    dragProxy.source = event.currentTarget.source;
    				var dragProxy: Object = dragInitiator
                // Call the DragManager doDrag() method to start the drag. 

                DragManager.doDrag(dragInitiator, dragSource, event, dragProxy as IFlexDisplayObject);
            }
   	
   	*/
   	            private function dragIt(event:MouseEvent ):void 
            {
				if ( this.getDataForDragFx == null )
				{
					Shelpers.traceS('need a fx for this to wrok' ) 
					return; 
				}
			
				if ( skip ) 
					return 
			
                // Get the drag initiator component from the event object.
                //image can be anythign though 
                var dragInitiator: UIComponent = event.currentTarget   as UIComponent
    
                // Create a DragSource object.
                var dragSource:DragSource = new DragSource();
    
                // Add the data to the object.

                dragSource.addData([getDataForDragFx()], 'items');
    
                // Create a copy of the coin image to use as a drag proxy.
             //   var dragProxy:Image = new Image();
            //    dragProxy.source = event.currentTarget.source;
    				var dragProxy: Object = dragInitiator
    				if  ( this.dragSource != null )
    					dragProxy = this.dragSource
                // Call the DragManager doDrag() method to start the drag. 

                DragManager.doDrag(dragInitiator, dragSource, event, dragProxy as IFlexDisplayObject);
            }
 	
   				
	/*
	
	  public function makeDraggableSourceCanvas ( e : Canvas, itemSenfFx :  Function) : void
	{
		//can only recieve from a data lister 
		e.addEventListener( DragEvent.DRAG_ENTER, this.dragEnterHandler, false, 0, true ) 	
		e.addEventListener( DragEvent.DRAG_DROP, this.dragDropHandler, false, 0, true ) 	
		this.itemSenfFx = itemSenfFx		
	}
	
	public var itemSenfFx : Function; 
	
              private function mouseMoveHandler(event: MouseEvent):void 
            {                
                var dragInitiator: Object= (event.currentTarget);
                var ds: DragSource = new DragSource();
                ds.addData(dragInitiator, "img");               
var eee :  DragManager
var eeeeee : DragSource
                DragManager.doDrag(dragInitiator as   IUIComponent, ds, event);
            }
            
            // The dragEnter event handler for the Canvas container
            // enables dropping.
              private function dragEnterHandler(event:DragEvent):void {
              //  if (event.dragSource.hasFormat("img"))
               // {
                    DragManager.acceptDragDrop(Canvas(event.currentTarget));
             //   }
            }

            // The dragDrop event handler for the Canvas container
            // sets the Image control's position by 
            // "dropping" it in its new location.
              private function dragDropHandler(event:DragEvent):void {
            	
            	var ar : Array = event.dragSource.dataForFormat('items') as  Array 
            	var e  : Shelpers
            	Shelpers.ifFxNotNullSendData( this.itemSenfFx, ar ) 
            	trace()
            	return;
               
            }
   			
   		*/		
	
	/*
		send in ui comp if u wnat a diofferent one... 
	*/
	static public function getLocalOfMouseClick(  e :  MouseEvent, uicomp : UIComponent = null )  :  Point
	{
		if ( uicomp == null ) 
			uicomp = e.currentTarget as UIComponent
		var pt : Point = uicomp.globalToLocal( new Point( e.stageX, e.stageY )  ) 
		
		return pt 
	}
	
	/**
	*	returns local coordinates of a global point on an object
	*/
	static public function getLocalPointOf(  xx : int, yy : int, uicomp : UIComponent   )  :  Point
	{
		var pt : Point = uicomp.globalToLocal( new Point( xx, yy )  ) 
		return pt 
	}
		
	
	/**
	*	returns global coordinates of a local  point on an object
	*/
	static public function getGlobalPointOf(  xx : int, yy : int, uicomp : UIComponent   )  :  Point
	{
		var pt : Point = uicomp.localToGlobal( new Point( xx, yy )  ) 
		return pt 
	}
			
	/**
	*	returns local coordinates of a global point on an object
	*/
	static public function getLocalPointOfAsPt( point : Point,  uicomp : UIComponent  )  :  Point
	{
		var pt : Point = uicomp.globalToLocal(point ) 
		return pt 
	}
		
	
	/**
	*	returns global coordinates of a local  point on an object
	*/
	static public function getGlobalPointAsPt( point : Point, uicomp : UIComponent   )  :  Point
	{
		var pt : Point = uicomp.localToGlobal( point ) 
		return pt 
	}
					
	
	static public function applyRadialGradient(  e : UIComponent, color1 : uint= 0xffffff, color2 : uint  = 0xd2d2d2, 
	startX : Number=0, startY  : Number = 0, width : Number = -1, height : Number = -1)  : void
	{
	      		var colors : Array  = [color1, color2 ];
	    var alphas:Array = [1, 1];
	    var ratios:Array = [0, 0xFF];
	    var matrix: Matrix = new Matrix();
	    matrix.createGradientBox(e.width,e.height, (3 * Math.PI / 2), 0, 10);
	    var focalPoint:Number = .5;
	 //   Shelpers.traceS('ok', this.stage.x, this.stage.y, this.verticalScrollPosition ) 
	    //e.graphics.clear() 
	    var max :  Number = Math.min( e.width, e.height )
	 //   var werwe : Array = [e.width, e.height ]
	 //   e.width = e.height = max
	  //  e.setStyle('backgroundColor', colors[0] ) 
	        e.graphics.clear();
/**
* 
*/			
			if ( width == -1 ) 
				width = e.width
			if ( height == -1 )
				height = e.height
	        e.graphics.beginGradientFill(GradientType.RADIAL, colors, alphas, ratios, matrix, SpreadMethod.PAD, InterpolationMethod.RGB, focalPoint);
	       e.graphics.drawRect(startX,startY , width, height);
	        e.graphics.endFill();		
	}
		
	
	/**
	 *The getXOfWidth function takes a mouseevent, (usually a click ) 
	 * and uses the localX property to determine a decimal value for 
	 * how far along the x axis the user clicked. Commonly used for 
	 * volume controls and such  
	 * @param e
	 * @return 
	 * 
	 */
	/*  */
	static public function getXOfWidth(  e :  MouseEvent )  : Number
	{
	   var uiComp : UIComponent = e.currentTarget as UIComponent
	   var xOf : Number = e.localX/uiComp.width
	   return xOf
	}
			
	
		
	}
	
	
}
