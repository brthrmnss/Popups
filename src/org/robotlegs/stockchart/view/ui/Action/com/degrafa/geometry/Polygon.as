package com.degrafa.geometry
{
    import com.degrafa.*;
    import com.degrafa.core.collections.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class Polygon extends Geometry implements IGeometry
    {
        private var _x:Number;
        private var _points:GraphicPointCollection;
        private var _y:Number;

        public function Polygon(param1:Array = null)
        {
            if (param1)
            {
                this.points = param1;
            }
            return;
        }// end function

        override public function set y(param1:Number) : void
        {
            var _loc_2:* = this.y;
            if (_loc_2 !== param1)
            {
                this._121y = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "y", _loc_2, param1));
            }
            return;
        }// end function

        public function set points(param1:Array) : void
        {
            var _loc_2:* = this.points;
            if (_loc_2 !== param1)
            {
                this._982754077points = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "points", _loc_2, param1));
            }
            return;
        }// end function

        override public function preDraw() : void
        {
            var _loc_1:int = 0;
            var _loc_2:int = 0;
            if (invalidated)
            {
                if (!_points || !_points.items || _points.items.length < 1)
                {
                    return;
                }
                commandStack.length = 0;
                commandStack.addMoveTo(_points.items[0].x + x, _points.items[0].y + y);
                _loc_1 = 0;
                _loc_2 = _points.items.length;
                while (_loc_1 < _loc_2)
                {
                    
                    commandStack.addLineTo(_points.items[_loc_1].x + x, _points.items[_loc_1].y + y);
                    _loc_1++;
                }
                if (_points.items[(_points.items.length - 1)].x + x != _points.items[0].x + x || _points.items[(_points.items.length - 1)].y + y != _points.items[0].y + y)
                {
                    commandStack.addLineTo(_points.items[0].x + x, _points.items[0].y + y);
                }
                invalidated = false;
            }
            return;
        }// end function

        public function get pointCollection() : GraphicPointCollection
        {
            initPointsCollection();
            return _points;
        }// end function

        public function set _120x(param1:Number) : void
        {
            if (_x != param1)
            {
                _x = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function initPointsCollection() : void
        {
            if (!_points)
            {
                _points = new GraphicPointCollection();
                if (enableEvents)
                {
                    _points.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        override public function draw(param1:Graphics, param2:Rectangle) : void
        {
            if (invalidated)
            {
                preDraw();
            }
            if (_layoutConstraint)
            {
                calculateLayout();
            }
            super.draw(param1, param2 ? (param2) : (bounds));
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            var _loc_2:* = this.data;
            if (_loc_2 !== param1)
            {
                this._3076010data = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "data", _loc_2, param1));
            }
            return;
        }// end function

        public function set derive(param1:Polygon) : void
        {
            if (!fill)
            {
                fill = param1.fill;
            }
            if (!stroke)
            {
                stroke = param1.stroke;
            }
            if (!_x)
            {
                _x = param1.x;
            }
            if (!_y)
            {
                _y = param1.y;
            }
            if (!_points && param1.points.length != 0)
            {
                points = param1.points;
            }
            return;
        }// end function

        public function set _121y(param1:Number) : void
        {
            if (_y != param1)
            {
                _y = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _982754077points(param1:Array) : void
        {
            initPointsCollection();
            _points.items = param1;
            invalidated = true;
            return;
        }// end function

        public function get points() : Array
        {
            initPointsCollection();
            return _points.items;
        }// end function

        override protected function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            invalidated = true;
            super.propertyChangeHandler(event);
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
                    if (isNaN(_layoutConstraint.width))
                    {
                        _loc_2.width = bounds.width;
                    }
                    if (isNaN(_layoutConstraint.height))
                    {
                        _loc_2.height = bounds.height;
                    }
                    _loc_2.x = _x ? (_x) : (0);
                    _loc_2.y = _y ? (_y) : (0);
                    super.calculateLayout(_loc_2);
                    _layoutRectangle = _layoutConstraint.layoutRectangle;
                }
            }
            return;
        }// end function

        override public function set x(param1:Number) : void
        {
            var _loc_2:* = this.x;
            if (_loc_2 !== param1)
            {
                this._120x = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "x", _loc_2, param1));
            }
            return;
        }// end function

        override public function get x() : Number
        {
            if (!_x)
            {
                return 0;
            }
            return _x;
        }// end function

        override public function get y() : Number
        {
            if (!_y)
            {
                return 0;
            }
            return _y;
        }// end function

        public function set _3076010data(param1:Object) : void
        {
            var _loc_2:Array = null;
            var _loc_3:Array = null;
            var _loc_4:Array = null;
            var _loc_5:int = 0;
            var _loc_6:int = 0;
            if (super.data != param1)
            {
                super.data = param1;
                _loc_2 = param1.split(" ");
                _loc_3 = [];
                _loc_5 = 0;
                _loc_6 = _loc_2.length;
                while (_loc_5 < _loc_6)
                {
                    
                    _loc_4 = String(_loc_2[_loc_5]).split(",");
                    if (_loc_4.length == 2)
                    {
                        _loc_3.push(new GraphicPoint(_loc_4[0], _loc_4[1]));
                    }
                    _loc_5++;
                }
                points = _loc_3;
                invalidated = true;
            }
            return;
        }// end function

    }
}
