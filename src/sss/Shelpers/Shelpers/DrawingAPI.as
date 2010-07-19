package  sss.Shelpers.Shelpers
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.geom.Matrix;
	
	import mx.core.UIComponent;
	

public class DrawingAPI
{
 
		 
		static public function getScreenshotOfComponent ( c :  DisplayObject )  :  BitmapData
		{
            return DrawingAPI.drawComponent(c)
		}		
		
		
		static public function drawComponent2 ( c :  DisplayObject , bd : BitmapData )  : void
		{
		//	var bitmapData  : BitmapData = new BitmapData(c.width, c.height ,  true, 0 );
            var mat : Matrix = new Matrix();
            bd.draw(c, mat)         
		}
		 		
		
		static public function drawComponent ( c :  DisplayObject )  :  BitmapData
		{
			var bitmapData  : BitmapData = new BitmapData(c.width, c.height ,  true, 0 );
            
            var mat : Matrix = new Matrix();
 
            bitmapData.draw(c, mat) //, new ColorTransform(), 'normal', rect ) ;                 
            return bitmapData
		}
		 
		static public function drawOnToComponent ( c : UIComponent , bitmapData : BitmapData)  :  void
		{
            var drawThumb: Matrix = new Matrix();			
			c.graphics.clear();
            c.graphics.beginBitmapFill( bitmapData,  drawThumb, false, true ); 
           	c.graphics.drawRect(0, 0, c.width,c.height );	 
		}		
		
		 static public function drawBDOntoComponent ( c : UIComponent , bitmapData : BitmapData, clearFirst : Boolean = true,
		 	 x :  Number = 0 , y : Number = 0, scaleX : Number = 1 , scaleY  : Number = 1, smoothing : Boolean = true)  :  void
		{
            var drawThumb: Matrix = new Matrix();		
            if ( clearFirst)	
				c.graphics.clear();
				 drawThumb.scale( scaleX, scaleY )
			drawThumb.translate( x, y )
			
            c.graphics.beginBitmapFill( bitmapData,  drawThumb, false, smoothing ); 
           	c.graphics.drawRect(x, y,  x+(bitmapData.width*scaleX) ,y+(bitmapData.height*scaleY) );
           	//c.graphics.endFill();	 
		}		 
		
		static public function drawOnToComponentAtRatio ( c : UIComponent )  :  void
		{
			/*
            var drawThumb:Matrix = new Matrix();			
			c.graphics.clear();
            c.graphics.beginBitmapFill( bitmapData,  drawThumb, false, true ); 
           	c.graphics.drawRect(0, 0, cropBox.layer.width*ratio, cropBox.layer.height*ratio);	 
           	*/
		}		
		
		static public function drawCompAontoCombB ( c : UIComponent, v : UIComponent )  :  void
		{
			//resize component
			v.height = c.height
			v.width = c.width
			drawOnToComponent( v, drawComponent( c) )
		}				
				
		static public function resizeBitmap ( c :   BitmapData , newWidth : int )  :   BitmapData
		{
			var w : Number = c.width
			var h : Number = c.height
			var ratio : Number = w/h
			var rratio : Number = w/newWidth
			
			var rrratio : Number = newWidth/w //top is the one you want to go to?
			var newHeight : Number = h*rrratio
			var b : BitmapData = new BitmapData( newWidth, newHeight)
			Shelpers.traceS('old and new', w, h, 'new', newWidth, newHeight, 'ratio', rratio)
			var mat : Matrix = new Matrix()
			mat.scale( rrratio, rrratio )
			
			b.draw( c, mat, null, null, null, true )
			
			//b.
			return b
		}				
		
							
		static public function getRatioFrom (   currentDimensions : Object  )  : Number 
		{
			var w : Number = currentDimensions.width
			var h : Number = currentDimensions.height
			var ratio : Number = h/w
			
			return ratio
		}	
		static public function ratioCalc_Height (   currentDimensions : Object,  newWidth : Number  )  : Number 
		{
			var w : Number = currentDimensions.width
			var h : Number = currentDimensions.height
			var ratio : Number = h/w
			var newHEight : Number = newWidth*ratio
			
			return newHEight
		}					
		static public function ratioCalc_Width (   currentDimensions : Object,  newHeight : Number  )  : Number 
		{
			var w : Number = currentDimensions.width
			var h : Number = currentDimensions.height
			var ratio : Number = w/h
			var newHEight : Number = newHeight*ratio
			
			return newHEight
		}									
	

		static public function copyWH (   a  : Object,  b :  Object   )  :  void 
		{
			b.height = a.height
			b.width = a.width
			
		}									
		
	
		
	
				
	}
	
	
}
