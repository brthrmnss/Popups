package   sss.Shelpers.Shelpers
{
	import flash.filters.BlurFilter;
	import flash.filters.ColorMatrixFilter;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter; 
	
	public class  FilterHelpers 
	{
		
		
		static public var Block : Boolean = false
			static public function addLightDropShadow ( e : Object, distance : int = 5 , angle : Number = 135, blur : Number = 0)  : DropShadowFilter
			{
	 			var shadow :  DropShadowFilter = FilterHelpers.addDropShadow( e, 0, angle, distance, 0.2, blur  ) 		
	 			return shadow	
			}		
		
			static public function addDropShadow ( e : Object,  color : uint = 0x000000, angle : int = 135, distance : int = -1, alpha : Number= 0.7, 
				blurX : int = 0 )  : DropShadowFilter
			{
	 			var shadow :  DropShadowFilter = new DropShadowFilter()
	 			if ( distance == -1 ) distance = FilterHelpers.DefaultShadowDistance
	 			shadow.distance = distance
	 			shadow.alpha = alpha
	 			shadow.color = color
	 			//shadow.angle = -45
	 			shadow.angle = angle
 				shadow.blurX = shadow.blurY = blurX
	 			FilterHelpers.addThisToFilters( e, shadow )		
	 			return shadow	
			}
			static public function addInnerShadow ( e : Object,  color : uint = 0x000000, angle : int = 135, distance : int = -1, alpha : Number= 0.7, 
				blurX : int = 0 )  : DropShadowFilter
			{
	 			var shadow :  DropShadowFilter = new DropShadowFilter()
	 			if ( distance == -1 ) distance = FilterHelpers.DefaultShadowDistance
	 			shadow.distance = distance
	 			shadow.alpha = alpha
	 			shadow.color = color
	 			shadow.inner = true; 
	 			//shadow.angle = -45
	 			shadow.angle = angle
 				shadow.blurX = shadow.blurY = blurX
	 			FilterHelpers.addThisToFilters( e, shadow )		
	 			return shadow	
			}
						
		  
		
			static public function makeBlackAndWhite ( e : Object )  : void
			{
           var rLum:Number = 0.2225;
          var gLum:Number = 0.7169;
          var bLum:Number = 0.0606;
				
				var bwMatrix:Array = [rLum, gLum, bLum, 0, 0,
				                            rLum, gLum, bLum, 0, 0,
				                            rLum, gLum, bLum, 0, 0,
				                            0, 0, 0, 1, 0];
			var ee : ColorMatrixFilter = new ColorMatrixFilter( bwMatrix ) 
	 			FilterHelpers.addThisToFilters( e, ee )		
			}
					  
		  
			static public function addOutline ( e :  Object,  color : uint = 0x000000,  distance : int = 4, strength : int = 8,
				 inner : Boolean = false, knockOut : Boolean = false, alpha : Number = 0.7, xDistance : int = -1)  : GlowFilter
			{
				if ( xDistance == -1 ) xDistance = distance
	 			var glow :   GlowFilter = new GlowFilter()
	 			glow.alpha = alpha
	 			glow.color = color
	 			//shadow.angle = -45
	 			//glow.angle = 45+90
	 			glow.knockout = knockOut
	 			glow.blurX = xDistance
	 			glow.blurY = distance
	 			glow.strength = strength
	 			glow.inner = inner
	 			FilterHelpers.addThisToFilters( e, glow )			
	 			return glow 
			}		  
		  
			static public function addGlow ( e :  Object,  color : uint = 0x000000,  distance : int = 4, strength : int = 2,
				 inner : Boolean = false, knockOut : Boolean = false, alpha : Number = 0.7, xDistance : int = -1, yDistance : int = -1, quality : int = 1 )  : GlowFilter
			{
				if ( xDistance == -1 ) xDistance = distance
				if ( yDistance == -1 ) yDistance = distance
	 			var glow :   GlowFilter = new GlowFilter()
	 			glow.alpha = alpha
	 			glow.color = color
	 			//shadow.angle = -45
	 			//glow.angle = 45+90
	 			glow.knockout = knockOut
	 			glow.blurX = xDistance
	 			glow.blurY = yDistance
	 			glow.strength = strength
	 			glow.inner = inner
	 			glow.quality = quality
	 			FilterHelpers.addThisToFilters( e, glow )			
	 			return glow 
			}
					  
			static public var DefaultShadowDistance : int = 3  
			static public function addBlur ( e :  Object,    distance : int = 3 ) :  BlurFilter
			{
				var blur :    BlurFilter = new BlurFilter()
	 			 blur.blurX = distance
	 			 blur.blurY = distance
	 			FilterHelpers.addThisToFilters( e, blur )		
	 			return blur 	
			}					  
	 	
	 		static public function addThisToFilters ( e : Object, newFilter : Object )  : void
	 		{
	 			if ( FilterHelpers.Block )
	 				return; 
	 			var filters:Array = e.filters
	 			 if ( filters == null ) filters = new Array();
	 			filters.push( newFilter )
	 			e.filters = filters				 			
	 		}
	 		
	 		static public function removeFilters ( e : Object  )  : void
	 		{ 
	 			var   filters: Array  = new Array();
	 			 
	 			e.filters = filters				 			
	 		}	 		
	}
}