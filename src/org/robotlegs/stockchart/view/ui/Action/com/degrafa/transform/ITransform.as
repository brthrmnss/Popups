package com.degrafa.transform
{
    import com.degrafa.*;
    import flash.geom.*;

    public interface ITransform extends IDegrafaObject
    {

        public function ITransform();

        function hasExplicitSetting() : Boolean;

        function get centerX() : Number;

        function get centerY() : Number;

        function set centerX(param1:Number) : void;

        function set centerY(param1:Number) : void;

        function get data() : String;

        function get transformMatrix() : Matrix;

        function set registrationPoint(param1:String) : void;

        function get isIdentity() : Boolean;

        function getRegPoint(param1:IGeometryComposition) : Point;

        function getTransformFor(param1:IGeometryComposition) : Matrix;

        function set data(param1:String) : void;

        function get scaleX() : Number;

        function get scaleY() : Number;

        function get registrationPoint() : String;

        function getRegPointForRectangle(param1:Rectangle) : Point;

        function get y() : Number;

        function get angle() : Number;

        function get skewX() : Number;

        function get skewY() : Number;

        function get x() : Number;

    }
}
