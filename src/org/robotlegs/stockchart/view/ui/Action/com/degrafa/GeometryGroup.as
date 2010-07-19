package com.degrafa
{
    import com.degrafa.core.collections.*;
    import com.degrafa.geometry.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class GeometryGroup extends Graphic implements IGraphic, IGeometry
    {
        private var _geometry:GeometryCollection;

        public function GeometryGroup()
        {
            return;
        }// end function

        private function initGeometryCollection() : void
        {
            if (!_geometry)
            {
                _geometry = new GeometryCollection();
                if (enableEvents)
                {
                    _geometry.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function set data(param1:Object) : void
        {
            return;
        }// end function

        public function get geometryCollection() : GeometryCollection
        {
            initGeometryCollection();
            return _geometry;
        }// end function

        public function get geometry() : Array
        {
            initGeometryCollection();
            return _geometry.items;
        }// end function

        public function get data() : Object
        {
            return null;
        }// end function

        public function set geometry(param1:Array) : void
        {
            var _loc_2:IGeometry = null;
            initGeometryCollection();
            _geometry.items = param1;
            for each (_loc_2 in _geometry.items)
            {
                
                if (_loc_2 is IGraphic)
                {
                    addChild(DisplayObject(_loc_2));
                }
                if (_loc_2 is Geometry)
                {
                    Geometry(_loc_2).IGraphicParent = this;
                }
            }
            return;
        }// end function

        private function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            draw(null, null);
            return;
        }// end function

        override public function draw(param1:Graphics, param2:Rectangle) : void
        {
            var _loc_3:IGeometry = null;
            if (!parent)
            {
                return;
            }
            super.draw(null, null);
            if (_geometry)
            {
                for each (_loc_3 in _geometry.items)
                {
                    
                    if (_loc_3 is IGraphic)
                    {
                        _loc_3.draw(null, null);
                        continue;
                    }
                    _loc_3.draw(this.graphics, null);
                }
            }
            super.endDraw(null);
            return;
        }// end function

    }
}
