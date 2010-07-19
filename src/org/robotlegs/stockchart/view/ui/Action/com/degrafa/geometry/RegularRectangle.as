package com.degrafa.geometry
{
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class RegularRectangle extends Geometry implements IGeometry
    {
        private var _width:Number;
        private var _height:Number;
        private var _x:Number;
        private var _y:Number;

        public function RegularRectangle(param1:Number = NaN, param2:Number = NaN, param3:Number = NaN, param4:Number = NaN)
        {
            if (param1)
            {
                this.x = param1;
            }
            if (param2)
            {
                this.y = param2;
            }
            if (param3)
            {
                this.width = param3;
            }
            if (param4)
            {
                this.height = param4;
            }
            return;
        }// end function

        override public function get y() : Number
        {
            if (isNaN(_y))
            {
                return 0;
            }
            return _y;
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

        public function set _3076010data(param1:Object) : void
        {
            var _loc_2:Array = null;
            if (super.data != param1)
            {
                super.data = param1;
                _loc_2 = param1.split(" ");
                if (_loc_2.length == 4)
                {
                    _x = _loc_2[0];
                    _y = _loc_2[1];
                    _width = _loc_2[2];
                    _height = _loc_2[3];
                }
                invalidated = true;
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

        override public function get width() : Number
        {
            if (isNaN(_width))
            {
                return hasLayout ? (1) : (0);
            }
            return _width;
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

        override public function preDraw() : void
        {
            if (invalidated)
            {
                commandStack.length = 0;
                commandStack.addMoveTo(x, y);
                commandStack.addLineTo(x + width, y);
                commandStack.addLineTo(x + width, y + height);
                commandStack.addLineTo(x, y + height);
                commandStack.addLineTo(x, y);
                invalidated = false;
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

        override public function set width(param1:Number) : void
        {
            var _loc_2:* = this.width;
            if (_loc_2 !== param1)
            {
                this._113126854width = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "width", _loc_2, param1));
            }
            return;
        }// end function

        public function set derive(param1:RegularRectangle) : void
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
            if (!_width)
            {
                _width = param1.width;
            }
            if (!_height)
            {
                _height = param1.height;
            }
            return;
        }// end function

        public function set _113126854width(param1:Number) : void
        {
            if (_width != param1)
            {
                _width = param1;
                invalidated = true;
            }
            return;
        }// end function

        override public function set height(param1:Number) : void
        {
            var _loc_2:* = this.height;
            if (_loc_2 !== param1)
            {
                this._1221029593height = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "height", _loc_2, param1));
            }
            return;
        }// end function

        override public function get height() : Number
        {
            if (isNaN(_height))
            {
                return hasLayout ? (1) : (0);
            }
            return _height;
        }// end function

        override public function calculateLayout(param1:Rectangle = null) : void
        {
            var _loc_2:Rectangle = null;
            if (_layoutConstraint)
            {
                if (_layoutConstraint.invalidated)
                {
                    _loc_2 = new Rectangle(0, 0, 1, 1);
                    if (_width)
                    {
                        _loc_2.width = _width;
                    }
                    if (_height)
                    {
                        _loc_2.height = _height;
                    }
                    if (_x)
                    {
                        _loc_2.x = _x;
                    }
                    if (_y)
                    {
                        _loc_2.y = _y;
                    }
                    super.calculateLayout(_loc_2);
                    _layoutRectangle = _layoutConstraint.layoutRectangle;
                    if (isNaN(_width) || isNaN(_height))
                    {
                        _width = isNaN(_width) ? (layoutRectangle.width) : (_width);
                        _height = isNaN(_height) ? (layoutRectangle.height) : (_height);
                        invalidated = true;
                    }
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
            if (isNaN(_x))
            {
                return 0;
            }
            return _x;
        }// end function

        public function set _1221029593height(param1:Number) : void
        {
            if (_height != param1)
            {
                _height = param1;
                invalidated = true;
            }
            return;
        }// end function

    }
}
