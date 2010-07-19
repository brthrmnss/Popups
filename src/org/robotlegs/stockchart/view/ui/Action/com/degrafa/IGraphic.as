package com.degrafa
{
    import com.degrafa.core.*;
    import flash.display.*;
    import flash.geom.*;

    public interface IGraphic
    {

        public function IGraphic();

        function get percentWidth() : Number;

        function set percentWidth(param1:Number) : void;

        function get fill() : IGraphicsFill;

        function draw(param1:Graphics, param2:Rectangle) : void;

        function get width() : Number;

        function get stroke() : IGraphicsStroke;

        function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void;

        function get name() : String;

        function set width(param1:Number) : void;

        function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void;

        function set height(param1:Number) : void;

        function get fills() : Array;

        function get target() : DisplayObjectContainer;

        function get percentHeight() : Number;

        function get measuredHeight() : Number;

        function set fill(param1:IGraphicsFill) : void;

        function set name(param1:String) : void;

        function set percentHeight(param1:Number) : void;

        function set fills(param1:Array) : void;

        function set target(param1:DisplayObjectContainer) : void;

        function get height() : Number;

        function get parent() : DisplayObjectContainer;

        function get measuredWidth() : Number;

        function set x(param1:Number) : void;

        function set y(param1:Number) : void;

        function set strokes(param1:Array) : void;

        function set stroke(param1:IGraphicsStroke) : void;

        function get x() : Number;

        function get y() : Number;

        function get strokes() : Array;

        function endDraw(param1:Graphics) : void;

    }
}
