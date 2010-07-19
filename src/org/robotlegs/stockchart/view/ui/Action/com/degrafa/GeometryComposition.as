package com.degrafa
{
    import com.degrafa.core.collections.*;
    import com.degrafa.geometry.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class GeometryComposition extends Geometry implements IGeometry
    {
        private var _fills:FillCollection;
        private var _bounds:Rectangle;
        private var _strokes:StrokeCollection;

        public function GeometryComposition()
        {
            return;
        }// end function

        public function set fills(param1:Array) : void
        {
            initFillsCollection();
            _fills.items = param1;
            return;
        }// end function

        public function get fillCollection() : FillCollection
        {
            initFillsCollection();
            return _fills;
        }// end function

        override public function preDraw() : void
        {
            calcBounds();
            return;
        }// end function

        public function get childBounds() : Rectangle
        {
            var _loc_1:Rectangle = null;
            var _loc_2:Geometry = null;
            for each (_loc_2 in geometry)
            {
                
                if (!_loc_1 || _loc_1.isEmpty())
                {
                    _loc_1 = _loc_2.bounds;
                    continue;
                }
                _loc_1 = _loc_1.union(_loc_2.bounds);
            }
            return _loc_1;
        }// end function

        public function calcBounds() : void
        {
            if (_layoutConstraint)
            {
                super.calculateLayout();
                _bounds = layoutRectangle;
            }
            else if (parent && parent is Geometry)
            {
                _bounds = Geometry(parent).bounds;
            }
            else if (_currentGraphicsTarget)
            {
                _bounds = _currentGraphicsTarget.getRect(_currentGraphicsTarget);
            }
            else
            {
                _bounds = new Rectangle();
            }
            return;
        }// end function

        override public function draw(param1:Graphics, param2:Rectangle) : void
        {
            calculateLayout();
            preDraw();
            super.draw(param1, param2 ? (param2) : (_bounds));
            return;
        }// end function

        public function get fills() : Array
        {
            initFillsCollection();
            return _fills.items;
        }// end function

        override public function get bounds() : Rectangle
        {
            return _bounds;
        }// end function

        public function set strokes(param1:Array) : void
        {
            initSrokesCollection();
            _strokes.items = param1;
            return;
        }// end function

        private function initSrokesCollection() : void
        {
            if (!_strokes)
            {
                _strokes = new StrokeCollection();
                if (enableEvents)
                {
                    _strokes.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function get strokes() : Array
        {
            initSrokesCollection();
            return _strokes.items;
        }// end function

        public function get strokeCollection() : StrokeCollection
        {
            initSrokesCollection();
            return _strokes;
        }// end function

        private function initFillsCollection() : void
        {
            if (!_fills)
            {
                _fills = new FillCollection();
                if (enableEvents)
                {
                    _fills.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        override public function calculateLayout(param1:Rectangle = null) : void
        {
            var _loc_2:Rectangle = null;
            if (_layoutConstraint)
            {
                if (_layoutConstraint.invalidated)
                {
                    _loc_2 = new Rectangle(0, 0, 1, 1);
                    super.calculateLayout(_loc_2);
                    _layoutRectangle = _layoutConstraint.layoutRectangle;
                }
            }
            return;
        }// end function

    }
}
