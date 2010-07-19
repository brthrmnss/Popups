package com.degrafa.geometry.layout
{
    import flash.geom.*;

    public interface ILayout extends IDegrafaObject
    {

        public function ILayout();

        function get layoutRectangle() : Rectangle;

        function computeLayoutRectangle(param1:Rectangle, param2:Rectangle) : Rectangle;

    }
}
