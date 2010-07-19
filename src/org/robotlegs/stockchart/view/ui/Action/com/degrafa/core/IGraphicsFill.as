package com.degrafa.core
{
    import com.degrafa.*;
    import flash.geom.*;

    public interface IGraphicsFill extends IDegrafaObject, IFill
    {

        public function IGraphicsFill();

        function set requester(param1:IGeometryComposition) : void;

        function get lastRectangle() : Rectangle;

        function get lastArgs() : Array;

        function get restartFunction() : Function;

    }
}
