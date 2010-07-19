package com.degrafa.geometry.display
{
    import flash.display.*;

    public interface IDisplayObjectProxy
    {

        public function IDisplayObjectProxy();

        function get transformBeforeRender() : Boolean;

        function get displayObject() : DisplayObject;

        function get layoutMode() : String;

    }
}
