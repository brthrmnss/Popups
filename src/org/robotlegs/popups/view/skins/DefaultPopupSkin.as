package  org.robotlegs.popups.view.skins { // Use unnamed package if this skin is not in its own package.
  // skins/CustomContainerBorderSkin.as
  
  // Import necessary classes here.
  import mx.graphics.RectangularDropShadow;
  import mx.skins.ProgrammaticSkin;

  public class DefaultPopupSkin extends  ProgrammaticSkin {

    private var dropShadow:RectangularDropShadow;

    // Constructor.
    public function DefaultPopupSkin() {
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
       }
       var backgroundAlpha:Number = getStyle("backgroundAlpha");
       graphics.clear();

       // Background
       drawRoundRect(0, 0, unscaledWidth, unscaledHeight, 
           {tl: 0, tr:cornerRadius, bl: cornerRadius, br: 0}, 
           backgroundColor, backgroundAlpha);

       // Shadow
       if (!dropShadow)
          dropShadow = new RectangularDropShadow();

       dropShadow.distance = 4;
       dropShadow.angle = 65;
       dropShadow.color = 0;
       dropShadow.alpha = 0.3;
       dropShadow.tlRadius = 0;
       dropShadow.trRadius = cornerRadius;
       dropShadow.blRadius = cornerRadius;
       dropShadow.brRadius = 0;
       dropShadow.drawShadow(graphics, 0, 0, unscaledWidth, unscaledHeight);
    }
  }
}
