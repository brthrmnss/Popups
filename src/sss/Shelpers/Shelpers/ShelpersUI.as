package   sss.Shelpers.Shelpers
{
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	import mx.core.ClassFactory;
	import mx.core.Container;
	import mx.core.UIComponent;
	
	import sss.Shelpers.Shelpers.other.TweenerHelpers;
	

	public class ShelpersUI
	{
	 	/* mor exotic helper functiosn ... */
	   	static public function ceneterOnCanvas ( obj : Object ) :  void
		{
	 				obj.setStyle('horizontalCenter', '0' )
				obj.setStyle('verticalCenter', '0' )	
		}
	   	static public function unCenter ( obj : Object ) :  void
		{
	 				obj.setStyle('horizontalCenter',null )
				obj.setStyle('verticalCenter',null )	
		}
				
		
	   	static public function centerOnObj ( obj : Object, centerBased : UIComponent ) :  void
		{
			//obj is attached to canvas so can move,
			//ceneter based on another object ... 
			var globalorigin : Point = centerBased.contentToGlobal( new Point( 0, 0 ) )
			var bottomRight : Point = centerBased.contentToGlobal( new Point( 
			centerBased.width+centerBased.x, centerBased.height+centerBased.y ) )
			
			
	 				obj.setStyle('horizontalCenter', '0' )
				obj.setStyle('verticalCenter', '0' )	
		}		
		static public function tryToRemove(   ui : UIComponent ) :  UIComponent
		{
			if ( ui == null )
				return null;
			var parent : UIComponent = ui.parent as UIComponent
			if ( ui.parent != null )
				ui.parent.removeChild( ui )
			
			//if ( ui.parent == null ) 
			//	return parent; 
			// return null
			return parent
		}
		
		static public function setScale( obj : Object,   ui :  Object ) :  Object
		{
			var oldWh : Object = [ obj.width, obj.height] 
			var scaleX :  Number= ui.width/obj.width
			var scaleY :  Number= ui.height/obj.height
			ui.scaleX = scaleX
			ui.scaleY = scaleY
			
			return oldWh
		}
				
		static public function clearScales(   ui :  Object ) :  void
		{
			ui.scaleX = 1
			ui.scaleY = 1
		}
				
				
		
		
		static public function tryToAddTo(   ui : UIComponent , pparent : UIComponent, atIndex : int = -1, 
						tryToRemoveFromPaRENT : Boolean = true) :  UIComponent
		{
			if ( ui == null )
			{
				return null; 
			}
			if ( ui.parent == pparent ) 
				return null
			
			var oldParent : UIComponent = ShelpersUI.tryToRemove( ui ) //just have to ...
			if ( ui.parent == null )
			{
				if ( atIndex == -1 ) 
					pparent.addChild(   ui )
				else
					pparent.addChildAt( ui, atIndex ) 
			}
			else
			{
				var j : Object
			}
			
			return oldParent ; 
		}
		
		static public function hideMany(  ... args   ) : void
		{
			for each ( var j : Object in args ) 
			{
				j.visible = false
			}
		}			
		static public function showMany(  ... args   ) : void
		{
			for each ( var j : Object in args ) 
			{
				j.visible = true
			}
		}		
		
		static public function fixAutofieldsLabelWidth(   ui : UIComponent  ) : void
		{
			ui.setStyle('labelWidth', 100 )
		}				
		static public function autofields_hideLabels(   ui : UIComponent  ) : void
		{
			ui.setStyle('labelWidth', 0 )
		}				
				
		static public function setChildOfUIContainer(   ui :  Object , child : UIComponent , delayMs:int=0 ) : void
		{
			if ( child == null ) return;
			
			import flash.utils.setTimeout;
			
			if ( delayMs != 0 )
			{
				setTimeout( ShelpersUI.setChildOfUIContainer, delayMs,  ui, child )
				return
			}
				ui.selectedIndex = ui.getChildIndex( child ) 
		}				
	 
		static public function limitStringToLength(    str :   String , maxLength : int, more_str : String = '...'  ) :   String
		{
				var ret : String = str
				if ( str.length > maxLength ) 
				{
					ret = str.slice(0, maxLength-1) + more_str
				}
				return ret
		}		 
	 
				
		static public function SuperTabNavigator_init(   ui :    Container   ) : void
		{
			var children : Array = ui.getChildren() 
			for each ( var j : UIComponent in children )
			{
				j.setStyle('width', '100%' )
				j.setStyle('height', '100%')
				//j.percentHeight
				//j.percentWidth
				//j.percentHeight = NaN
				j.setStyle('paddingLeft', 10 )
				j.setStyle('paddingBottom', 10)
			}
				//ui.selectedIndex = ui.getChildIndex( child ) 
		}	
		
		static public function tabNavInit1(   ui :     UIComponent   ) : void
		{
				ui.setStyle('width', '100%' )
				ui.setStyle('height', '100%')
				ui.setStyle('paddingLeft', 10 )
				ui.setStyle('paddingBottom', 10)
		}			
		
		
		
		static public function makeNewInstanceOfClass (ofClass :   Class ) :   Object
		{
 				var newCl :       ClassFactory = new ClassFactory( ofClass )
            	var newItem :   Object  = newCl.newInstance()			
            	return newItem		
		}			
		
				
		
		static public function point_whatIsPointOnAinTermsOfB(  pt :  Point,  a : UIComponent , b : UIComponent) :  Point
		{
			var globally : Point = a.localToGlobal( pt )
			var onb : Point = b.globalToLocal( globally )
			return onb
		}		
		
		static public function getXyOf(   b :  Object, msg :  String) :  void
		{
			if (  b != null ) 
				Shelpers.traceS(msg, b.x, b.y ) 
			else
				Shelpers.traceS(msg, 'was null, couldnt trace it' ) 
	 	}		
	 	
		static public function pad(    j : UIComponent, amt : int = 10) :  void
		{
			 j.setStyle('paddingRight', amt )
			j.setStyle('paddingTop', amt)			
			 j.setStyle('paddingLeft', amt )
			j.setStyle('paddingBottom', amt)
		}		
		static public function removePadding(    j : UIComponent ) :  void
		{
			ShelpersUI.pad( j, 0 ) 
		}		
				
		static public function removeScrollbars(    a : UIComponent  , horiz : Boolean = true, verticla : Boolean = true  ) : void
		{
		if ( horiz ) 	a.setStyle('horizontalScrollPolicy', 'off' )	 
		//	a.setStyle('alpha', 0.1 )
		
		if ( verticla )
			a.setStyle('verticalScrollPolicy', 'off' )	 
			//textareas ave this annoying property
			if ( horiz ) {
			 if ( a.hasOwnProperty('horizontalScrollPolicy') ) a['horizontalScrollPolicy'] = 'off'
			}
			
			if ( verticla ) {
			if ( a.hasOwnProperty('verticalScrollPolicy') ) a['verticalScrollPolicy'] = 'off'
			}
				//e.setStyle('horizontalScrollPolicy', 'off')
			//	e.setStyle('verticalScrollPolicy', 'off')				
			 			
		}	 				
				 
		
		static public function removeScrollbarsM(    ... args   ) : void
		{

			for each ( var j : UIComponent in args )
			{
				ShelpersUI.removeScrollbars( j ) 
			}			
			 			
		}	 		 
 
 		static public function copyHw( u : Object )  : Object
 		{
 			var e : Object = new Object()
 			e.width = u.width
 			e.height = u.height 
 			return e
 		}
	 
 		static public function copyHwFromAtoB( a : Object, b : Object )  : void
 		{
 			b.width = a.width
 			b.height = a.height 
 			 
 		}	 
 		static public function copyHwFromAtoB_MaintainAspectFit( a : Object, b : Object )  : void
 		{
 			//first try to fit width 
 			//if too big fit height 
 			ShelpersUI.resizeUItoWidthMaintainAspect(b, a.width )	
			if ( b.height > a.height     ) 
			{
				ShelpersUI.resizeUItoHeightMaintainAspect(b, a.height )	
			}
 
 			 
 		}	  		
	 			
		static public function  resizeUItoHeightMaintainAspect ( ui :  Object,  i : int )  : void
		{
				var newWidth : Number = DrawingAPI.ratioCalc_Width( ui, i )
				ui.width = newWidth
				ui.height = i  
		}
		
		static public function resizeUItoWidthMaintainAspect( ui : Object, i : int )  : void
		{
				var newHeight : Number = DrawingAPI.ratioCalc_Height(ui, i )
				ui.height =  newHeight 
				ui.width = i		 
		}	 			
	 			
	 			
 		static public function shoutwH( msg : String, b : Object )  :  String
 		{
 			return Shelpers.traceS(msg, b.width, 'x', b.height )
 			 
 		}	 	 			
	 		 
	 		 
 		static public function shoutXy( msg : String, b : Object )  :  String
 		{
 			return Shelpers.traceS(msg, b.x, 'x', b.y )
 			 
 		}	 	 			
	 		 
	 		 
	 		 	 		 	 		 
 		static public function moveToOrigin(   b : Object )  :   void
 		{
 			b.x = 0
 			b.y = 0
 			 
 		}	
				 
 		static public function FadeIn(   b : Object,  time :  Number = 1.2, maxAlpha : Number = 1, dontResetAlphaTo0 : Boolean = false)  :   void
 		{
 			var ee : TweenerHelpers 
 			TweenerHelpers.FadeIn2( b, time, dontResetAlphaTo0, 0, maxAlpha )
 			 
 		}			
		static public function FadeOut( b : Object ,  time : Number = 1.2 , makeInvisible : Boolean = true, removeWhenDone : Boolean = false  )  : void
		{
			if ( b.alpha == 0 )
				return; 
			if ( makeInvisible ) 
			TweenerHelpers.TweenProp(b, 'alpha', 0, time, 0, ShelpersUI.MakeInvisible, [b, removeWhenDone]  ) //, ShelpersPopups.removeMe )
			else
			TweenerHelpers.TweenProp(b, 'alpha', 0, time, 0 ) //, ShelpersUI.MakeInvisible, b  )
		} 		
		
 		static public function FadeInOut_Bool(  bool : Boolean ,  b : Object,  time :  Number = 1.2, resetTo0 : Boolean = true, 
 		maxAlpha : Number = 1)  :   void
 		{
 			 if ( bool )
 			 {
 			 	ShelpersUI.FadeIn( b, time, maxAlpha, resetTo0 == false ) 
 			 }
 			 else
 			 {
 			 	ShelpersUI.FadeOut( b, time, true, resetTo0 == false  ) 
 			 }
 			 
 		}			
		
		static public function MakeInvisible( b : Object , removeWhenDone : Boolean = false   )  : void
		{
			b.visible = false
			if ( removeWhenDone) 
			{
				ShelpersUI.tryToRemove( b as UIComponent ) 
			}
		} 					 
				 
				 
				 
				 
				 
		static public function flatten( all : Array   )  : void
		{
	 		for each ( var j :  Object in all  ) 
	 		{
	 				j.height = 0 
	 		}
		} 						 
			
		static public function flattenAll_But( all : Array, but : Object  )  : void
		{
			ShelpersUI.flatten( all ) 
	 		 but.percentHeight = 100; // = this.initHeights[j.id] 
		} 						 
				 				 
			
		static public function stylizeLikeAPopup(seperateTarget : Object, showBorder : Boolean = true)  : void
    	{
    		var setStyleOn : Object  = seperateTarget
    	 
    		if ( showBorder == false ) 
    			setStyleOn.setStyle('borderThickness', 0 )
    		setStyleOn.setStyle('borderStyle', 'solid' )
    		setStyleOn.setStyle('borderColor', '0xd2d2d2' )
    		setStyleOn.setStyle('backgroundAlpha', '1' )
    		setStyleOn.setStyle('backgroundColor', '0xFFFFFF' )
    		FilterHelpers.addLightDropShadow(setStyleOn )
    	}
				 
				 
	}
}
