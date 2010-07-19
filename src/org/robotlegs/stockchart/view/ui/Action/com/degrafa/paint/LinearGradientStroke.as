package com.degrafa.paint
{
    import flash.display.*;
    import flash.geom.*;

    public class LinearGradientStroke extends GradientStrokeBase
    {
        private var _x:Number;
        private var _height:Number;
        private var _width:Number;
        private var _y:Number;

        public function LinearGradientStroke()
        {
            super.gradientType = "linear";
            return;
        }// end function

        override public function get focalPointRatio() : Number
        {
            return 0;
        }// end function

        public function set y(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_y != param1)
            {
                _loc_2 = _y;
                _y = param1;
                initChange("y", _loc_2, _y, this);
            }
            return;
        }// end function

        override public function apply(param1:Graphics, param2:Rectangle) : void
        {
            if (_x && _y && _width && _height)
            {
                if (_coordType == "relative")
                {
                    super.apply(param1, new Rectangle(param2.x + x, param2.y + y, width, height));
                }
                else if (_coordType == "ratio")
                {
                    super.apply(param1, new Rectangle(param2.x + x * param2.width, param2.y + y * param2.height, width * param2.width, height * param2.height));
                }
                else
                {
                    super.apply(param1, new Rectangle(x, y, width, height));
                }
            }
            else if (_width && _height)
            {
                if (_coordType == "relative")
                {
                    super.apply(param1, new Rectangle(param2.x, param2.y, width, height));
                }
                else if (_coordType == "ratio")
                {
                    super.apply(param1, new Rectangle(param2.x, param2.y, width * param2.width, height * param2.height));
                }
                else
                {
                    super.apply(param1, new Rectangle(0, 0, width, height));
                }
            }
            else
            {
                super.apply(param1, param2);
            }
            return;
        }// end function

        public function set derive(param1:LinearGradientStroke) : void
        {
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
            if (!_caps)
            {
                _caps = param1.caps;
            }
            if (!_joints)
            {
                _joints = param1.joints;
            }
            if (!_miterLimit)
            {
                _miterLimit = param1.miterLimit;
            }
            if (!_pixelHinting)
            {
                _pixelHinting = param1.pixelHinting;
            }
            if (!_scaleMode)
            {
                _scaleMode = param1.scaleMode;
            }
            if (!_weight)
            {
                _weight = param1.weight;
            }
            if (!_angle)
            {
                _angle = param1.angle;
            }
            if (!_interpolationMethod)
            {
                _interpolationMethod = param1.interpolationMethod;
            }
            if (!_gradientStops && param1.gradientStops.length != 0)
            {
                gradientStops = param1.gradientStops;
            }
            if (!_degrafaScaling)
            {
                _degrafaScaling = param1.degrafaScaling ? (1) : (-1);
            }
            return;
        }// end function

        public function get width() : Number
        {
            if (!_width)
            {
                return 0;
            }
            return _width;
        }// end function

        override public function set focalPointRatio(param1:Number) : void
        {
            return;
        }// end function

        public function set width(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_width != param1)
            {
                _loc_2 = _width;
                _width = param1;
                initChange("width", _loc_2, _width, this);
            }
            return;
        }// end function

        public function set x(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_x != param1)
            {
                _loc_2 = _x;
                _x = param1;
                initChange("x", _loc_2, _x, this);
            }
            return;
        }// end function

        public function get height() : Number
        {
            if (!_height)
            {
                return 0;
            }
            return _height;
        }// end function

        public function get x() : Number
        {
            if (!_x)
            {
                return 0;
            }
            return _x;
        }// end function

        public function get y() : Number
        {
            if (!_y)
            {
                return 0;
            }
            return _y;
        }// end function

        public function set height(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_height != param1)
            {
                _loc_2 = _height;
                _height = param1;
                initChange("height", _loc_2, _height, this);
            }
            return;
        }// end function

    }
}
