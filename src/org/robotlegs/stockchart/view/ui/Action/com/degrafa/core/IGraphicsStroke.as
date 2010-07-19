package com.degrafa.core
{
    import flash.display.*;
    import flash.geom.*;

    public interface IGraphicsStroke extends IDegrafaObject
    {

        public function IGraphicsStroke();

        function get caps() : String;

        function set caps(param1:String) : void;

        function get joints() : String;

        function set pixelHinting(param1:Boolean) : void;

        function get lastArgs() : Array;

        function set miterLimit(param1:Number) : void;

        function get scaleMode() : String;

        function apply(param1:Graphics, param2:Rectangle) : void;

        function set weight(param1:Number) : void;

        function set joints(param1:String) : void;

        function get reApplyFunction() : Function;

        function get pixelHinting() : Boolean;

        function get miterLimit() : Number;

        function get weight() : Number;

        function get lastRectangle() : Rectangle;

        function set scaleMode(param1:String) : void;

    }
}
