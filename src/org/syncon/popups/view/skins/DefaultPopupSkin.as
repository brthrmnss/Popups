package  org.syncon.popups.view.skins { 

  import flash.display.Graphics;
  
  import mx.core.EdgeMetrics;
  import mx.graphics.RectangularDropShadow;
  import mx.skins.Border;

  public class DefaultPopupSkin extends     Border {

    private var dropShadow:RectangularDropShadow;

    // Constructor.
    public function DefaultPopupSkin() {
    	
    }
 
	 private var _borderMetrics:EdgeMetrics;

    override public function get borderMetrics():EdgeMetrics {
        if (_borderMetrics) {
           return _borderMetrics;
        }
        var borderThickness:Number = getStyle("borderThickness");
     	if ( isNaN( borderThickness ) ) borderThickness = 10; 
        _borderMetrics = new EdgeMetrics(borderThickness, 
            borderThickness, borderThickness, borderThickness);
        return _borderMetrics;
     }


    override protected function updateDisplayList(unscaledWidth:Number, 
       unscaledHeight:Number):void 
    {

       super.updateDisplayList(unscaledWidth, unscaledHeight);

       var cornerRadius:Number = getStyle("cornerRadius");
       var backgroundColor:int = getStyle("backgroundColor");
       if  ( getStyle("backgroundColor") == null )
       {
       		backgroundColor=0xFFFFFF
       		cornerRadius  = 10;
       }
       cornerRadius  = 16;
       var backgroundAlpha:Number = getStyle("backgroundAlpha");
       graphics.clear();
       
		var borderThickness:Number = getStyle("borderThickness");
		borderThickness = 10; 
		/* 
       // Background
       drawRoundRect(0, 0, unscaledWidth, unscaledHeight, 
           {tl: 0, tr:cornerRadius, bl: cornerRadius, br: 0},  
           backgroundColor, backgroundAlpha);
 */

 
       
       var g :  Graphics = this.graphics;
 /*        g.beginFill(backgroundColor,1.0);
      // g.lineStyle(borderThickness, backgroundColor);
        g.drawRect(-10, -10, unscaledWidth+20, unscaledHeight+20);
       g.endFill()
 */
        
        g.beginFill(backgroundColor,1.0);
     //  g.lineStyle(1, 0xd2d2d2, 1, true);
     //   g.drawRect(-10, -10, unscaledWidth+20, unscaledHeight+20);
//       // Background
       drawRoundRect(-10, -10, unscaledWidth+20, unscaledHeight+20,
           {tl:cornerRadius, tr:cornerRadius, bl:cornerRadius, br:cornerRadius},  
           backgroundColor, backgroundAlpha);        
       g.endFill()
 		g.lineStyle(0, 0,0);
 		
 		
 		
       // Shadow
       if (!dropShadow)
          dropShadow = new RectangularDropShadow();

       dropShadow.distance = 4;
       dropShadow.angle = 45;
       dropShadow.color = 0;
       dropShadow.alpha = 0.3;
       dropShadow.tlRadius = cornerRadius;
       dropShadow.trRadius = cornerRadius;
       dropShadow.blRadius = cornerRadius;
       dropShadow.brRadius = cornerRadius;
       dropShadow.drawShadow(graphics, -10, -10, unscaledWidth+20, unscaledHeight+20);

        
    }
  }
}
