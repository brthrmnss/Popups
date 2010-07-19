package com.degrafa.decorators
{
    import flash.display.*;

    public interface IRenderDecorator extends IDecorator
    {

        public function IRenderDecorator();

        function curveTo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Graphics) : void;

        function moveTo(param1:Number, param2:Number, param3:Graphics) : void;

        function lineTo(param1:Number, param2:Number, param3:Graphics) : void;

    }
}
