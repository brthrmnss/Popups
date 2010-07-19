package com.degrafa.core
{
    import com.degrafa.core.collections.*;

    public interface IGraphicSkin extends IGraphic
    {

        public function IGraphicSkin();

        function get geometryCollection() : GeometryCollection;

        function get geometry() : Array;

        function set geometry(param1:Array) : void;

        function invalidateDisplayList() : void;

    }
}
