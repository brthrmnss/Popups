package com.degrafa.geometry
{
    import com.degrafa.core.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class Line extends Geometry implements IGeometry
    {
        private var _length:Number;
        private var _x1:Number;
        private var _y1:Number;
        private var _x:Number;
        private var _y:Number;

        public function Line(param1:Number = NaN, param2:Number = NaN, param3:Number = NaN, param4:Number = NaN)
        {
            this.x = param1;
            this.y = param2;
            this.x1 = param3;
            this.y1 = param4;
            return;
        }// end function

        public function get x1() : Number
        {
            if (!_x1)
            {
                return hasLayout ? (1) : (0);
            }
            return _x1;
        }// end function

        public function set x1(param1:Number) : void
        {
            var _loc_2:* = this.x1;
            if (_loc_2 !== param1)
            {
                this._3769x1 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "x1", _loc_2, param1));
            }
            return;
        }// end function

        override public function draw(param1:Graphics, param2:Rectangle) : void
        {
            if (_layoutConstraint)
            {
                calculateLayout();
            }
            if (invalidated)
            {
                preDraw();
            }
            super.draw(param1, param2 ? (param2) : (bounds));
            return;
        }// end function

        override public function set fill(param1:IGraphicsFill) : void
        {
            var _loc_2:* = this.fill;
            if (_loc_2 !== param1)
            {
                this._3143043fill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fill", _loc_2, param1));
            }
            return;
        }// end function

        override public function preDraw() : void
        {
            if (invalidated)
            {
                commandStack.length = 0;
                commandStack.addMoveTo(x, y);
                commandStack.addLineTo(x1, y1);
                invalidated = false;
            }
            return;
        }// end function

        override public function get y() : Number
        {
            if (!_y)
            {
                return 0;
            }
            return _y;
        }// end function

        public function set length(param1:Number) : void
        {
            var _loc_2:* = this.length;
            if (_loc_2 !== param1)
            {
                this._1106363674length = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "length", _loc_2, param1));
            }
            return;
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

        override public function calculateLayout(param1:Rectangle = null) : void
        {
            var _loc_2:Rectangle = null;
            if (_layoutConstraint)
            {
                if (_layoutConstraint.invalidated)
                {
                    _loc_2 = new Rectangle(0, 0, 0.0001, 0.0001);
                    if (!isNaN(_x1) || !isNaN(_x))
                    {
                        if (_x1 ? (_x1) : (-_x ? (_x) : (0)))
                        {
                            _loc_2.width = Math.abs(_x1 ? (_x1) : (-_x ? (_x) : (0)));
                        }
                    }
                    if (!isNaN(_y1) || !isNaN(_y))
                    {
                        if (_y1 ? (_y1) : (-_y ? (_y) : (0)))
                        {
                            _loc_2.height = Math.abs(_y1 ? (_y1) : (-_y ? (_y) : (0)));
                        }
                    }
                    if (!isNaN(_x) || !isNaN(_x1))
                    {
                        _loc_2.x = Math.min(_x ? (_x) : (0), _x1 ? (_x1) : (0));
                    }
                    if (!isNaN(_y) || !isNaN(_y1))
                    {
                        _loc_2.y = Math.min(_y ? (_y) : (0), _y1 ? (_y1) : (0));
                    }
                    super.calculateLayout(_loc_2);
                    _layoutRectangle = _layoutConstraint.layoutRectangle;
                    if (isNaN(_x1) && isNaN(_y1) && !_x && !_y)
                    {
                        _x = _layoutRectangle.x;
                        _y = _layoutRectangle.y;
                        _x1 = _layoutRectangle.right;
                        _y1 = _layoutRectangle.bottom;
                        invalidated = true;
                    }
                }
            }
            return;
        }// end function

        public function get angle() : Number
        {
            return Math.atan((y1 - y) / (x1 - x));
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

        public function set derive(param1:Line) : void
        {
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
            if (!_x1)
            {
                _x1 = param1.x1;
            }
            if (!_y1)
            {
                _y1 = param1.y1;
            }
            if (!_length)
            {
                _length = param1.length;
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

        public function get y1() : Number
        {
            if (!_y1)
            {
                return hasLayout ? (1) : (0);
            }
            return _y1;
        }// end function

        private function set _1106363674length(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            if (_length != param1)
            {
                _length = param1;
                if (!_x1 && !_y1)
                {
                    _x1 = _length;
                }
                _loc_2 = Math.abs(_length * Math.cos(angle));
                _loc_3 = Math.abs(_length * Math.sin(angle));
                _x1 = _loc_2;
                _y1 = _loc_3;
                invalidated = true;
            }
            return;
        }// end function

        public function set y1(param1:Number) : void
        {
            var _loc_2:* = this.y1;
            if (_loc_2 !== param1)
            {
                this._3800y1 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "y1", _loc_2, param1));
            }
            return;
        }// end function

        public function get length() : Number
        {
            var _loc_1:* = x1 - x;
            var _loc_2:* = y1 - y;
            return Math.sqrt(_loc_1 * _loc_1 + _loc_2 * _loc_2);
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

        public function set _3143043fill(param1:IGraphicsFill) : void
        {
            return;
        }// end function

        private function set _3800y1(param1:Number) : void
        {
            if (_y1 != param1)
            {
                _y1 = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set _3076010data(param1:Object) : void
        {
            var _loc_2:Array = null;
            if (super.data != param1)
            {
                _loc_2 = param1.split(" ");
                if (_loc_2.length == 4)
                {
                    _x = _loc_2[0];
                    _y = _loc_2[1];
                    _x1 = _loc_2[2];
                    _y1 = _loc_2[3];
                }
                invalidated = true;
            }
            return;
        }// end function

        private function set _3769x1(param1:Number) : void
        {
            if (_x1 != param1)
            {
                _x1 = param1;
                invalidated = true;
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

    }
}
