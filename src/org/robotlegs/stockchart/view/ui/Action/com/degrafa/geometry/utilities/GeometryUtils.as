package com.degrafa.geometry.utilities
{
    import com.degrafa.geometry.command.*;
    import flash.geom.*;

    public class GeometryUtils extends Object
    {
        private static var returnResult:Array;
        private static var m3:Number;
        private static var dx:Number;
        private static var dy:Number;
        private static var dx2:Number;
        private static var m1:Number;
        private static var sx:Number;
        private static var bezBoundsRect:Rectangle = new Rectangle();
        private static var half:Number = 0.5;
        private static var m2:Number;
        private static var sy:Number;
        private static var dx1:Number;

        public function GeometryUtils()
        {
            return;
        }// end function

        public static function cubicToQuadratic(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:CommandStack) : Array
        {
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            if (!returnResult)
            {
                returnResult = [];
            }
            dx1 = param3 - param1;
            dx2 = param5 - param7;
            if (param2 == param8 && param4 == param2 && param6 == param8)
            {
                returnResult.push(param10.addLineTo(param7, param8));
                return returnResult;
            }
            if (!dx1 && !dx2 && param1 == param7)
            {
                returnResult.push(param10.addLineTo(param7, param8));
                return returnResult;
            }
            if (!dx1)
            {
                sx = param1;
                sy = (param6 - param8) / dx2 * (param1 - param7) + param8;
                dx = (param1 + param7 + sx * 4 - (param3 + param5) * 3) * 0.125;
                dy = (param2 + param8 + sy * 4 - (param4 + param6) * 3) * 0.125;
            }
            else if (!dx2)
            {
                sx = param7;
                sy = (param4 - param2) / dx1 * (param7 - param1) + param2;
                dx = (param1 + param7 + sx * 4 - (param3 + param5) * 3) * 0.125;
                dy = (param2 + param8 + sy * 4 - (param4 + param6) * 3) * 0.125;
            }
            else
            {
                m1 = (param4 - param2) / dx1;
                m2 = (param6 - param8) / dx2;
                if (Math.abs(m1) == Math.abs(m2))
                {
                    m3 = (param8 - param2) / (param7 - param1);
                    if (m1 == m2 && m3 == m1)
                    {
                        returnResult.push(param10.addLineTo(param7, param8));
                        return returnResult;
                    }
                    if (m1 > m3 && m2 < m3 || m1 < m3 && m2 > m3)
                    {
                        sx = (param3 + param5) / 2;
                        sy = (param4 + param6) / 2;
                        dx = (param1 + param7 + sx * 4 - (param3 + param5) * 3) * 0.125;
                        dy = (param2 + param8 + sy * 4 - (param4 + param6) * 3) * 0.125;
                    }
                    else
                    {
                        dx = param9;
                        dy = param9;
                    }
                }
                else
                {
                    sx = ((-m2) * param7 + param8 + m1 * param1 - param2) / (m1 - m2);
                    sy = m1 * (sx - param1) + param2;
                    dx = (param1 + param7 + sx * 4 - (param3 + param5) * 3) * 0.125;
                    dy = (param2 + param8 + sy * 4 - (param4 + param6) * 3) * 0.125;
                }
            }
            if (dx * dx + dy * dy > param9)
            {
                _loc_11 = (param1 + param3) * half;
                _loc_12 = (param2 + param4) * half;
                _loc_13 = (param3 + param5) * half;
                _loc_14 = (param4 + param6) * half;
                _loc_15 = (param5 + param7) * half;
                _loc_16 = (param6 + param8) * half;
                _loc_17 = (_loc_11 + _loc_13) * half;
                _loc_18 = (_loc_12 + _loc_14) * half;
                _loc_19 = (_loc_13 + _loc_15) * half;
                _loc_20 = (_loc_14 + _loc_16) * half;
                _loc_21 = (_loc_17 + _loc_19) * half;
                _loc_22 = (_loc_18 + _loc_20) * half;
                cubicToQuadratic(param1, param2, _loc_11, _loc_12, _loc_17, _loc_18, _loc_21, _loc_22, param9, param10);
                cubicToQuadratic(_loc_21, _loc_22, _loc_19, _loc_20, _loc_15, _loc_16, param7, param8, param9, param10);
            }
            else
            {
                returnResult.push(param10.addCurveTo(sx, sy, param7, param8));
            }
            return returnResult;
        }// end function

        public static function lineIntersects(param1:Point, param2:Point, param3:Point, param4:Point) : Point
        {
            var _loc_5:* = param1.x;
            var _loc_6:* = param1.y;
            var _loc_7:* = param4.x;
            var _loc_8:* = param4.y;
            var _loc_9:* = param2.x - _loc_5;
            var _loc_10:* = param3.x - _loc_7;
            var _loc_11:* = new Point();
            if (!(_loc_9 || _loc_10))
            {
                _loc_11.x = 0;
                _loc_11.y = 0;
            }
            var _loc_12:* = (param2.y - _loc_6) / _loc_9;
            var _loc_13:* = (param3.y - _loc_8) / _loc_10;
            if (!_loc_9)
            {
                _loc_11.x = _loc_5;
                _loc_11.y = _loc_13 * (_loc_5 - _loc_7) + _loc_8;
                return _loc_11;
            }
            if (!_loc_10)
            {
                _loc_11.x = _loc_7;
                _loc_11.y = _loc_12 * (_loc_7 - _loc_5) + _loc_6;
                return _loc_11;
            }
            var _loc_14:* = ((-_loc_13) * _loc_7 + _loc_8 + _loc_12 * _loc_5 - _loc_6) / (_loc_12 - _loc_13);
            var _loc_15:* = _loc_12 * (_loc_14 - _loc_5) + _loc_6;
            _loc_11.x = _loc_14;
            _loc_11.y = _loc_15;
            return _loc_11;
        }// end function

        public static function splitBezier(param1:Point, param2:Point, param3:Point, param4:Point) : Object
        {
            var _loc_5:* = midPoint(param1, param2);
            var _loc_6:* = midPoint(param2, param3);
            var _loc_7:* = midPoint(param3, param4);
            var _loc_8:* = midPoint(_loc_5, _loc_6);
            var _loc_9:* = midPoint(_loc_6, _loc_7);
            var _loc_10:* = midPoint(_loc_8, _loc_9);
            return {b0:{p1:param1, c1:_loc_5, c2:_loc_8, p2:_loc_10}, b1:{p1:_loc_10, c1:_loc_9, c2:_loc_7, p2:param4}};
        }// end function

        public static function barycenter(param1:Number, param2:Number, param3:Number, param4:Number) : Number
        {
            return (1 - param4) * (1 - param4) * param1 + 2 * (1 - param4) * param4 * param2 + param4 * param4 * param3;
        }// end function

        public static function perimeter(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Number
        {
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_7:* = param1;
            var _loc_8:* = param2;
            var _loc_9:Number = 0;
            var _loc_15:Number = 0;
            while (_loc_15 <= 1)
            {
                
                _loc_10 = barycenter(param1, param3, param5, _loc_15);
                _loc_11 = barycenter(param2, param4, param6, _loc_15);
                _loc_12 = Math.abs(_loc_10 - _loc_7);
                _loc_13 = Math.abs(_loc_11 - _loc_8);
                _loc_14 = Math.sqrt(_loc_12 * _loc_12 + _loc_13 * _loc_13);
                _loc_9 = _loc_9 + _loc_14;
                _loc_7 = _loc_10;
                _loc_8 = _loc_11;
                _loc_15 = _loc_15 + 0.001;
            }
            return _loc_9;
        }// end function

        public static function rotatePointOnCenterPoint(param1:Point, param2:Point, param3:Number) : Point
        {
            var _loc_4:* = new Point();
            var _loc_5:* = param3 / 180 * Math.PI;
            _loc_4.x = param2.x + (Math.cos(_loc_5) * (param1.x - param2.x) - Math.sin(_loc_5) * (param1.y - param2.y));
            _loc_4.y = param2.y + (Math.sin(_loc_5) * (param1.x - param2.x) + Math.cos(_loc_5) * (param1.y - param2.y));
            return _loc_4;
        }// end function

        public static function midPoint(param1:Point, param2:Point) : Point
        {
            return new Point((param1.x + param2.x) * half, (param1.y + param2.y) * half);
        }// end function

        public static function roundTo(param1:Number, param2:Number) : Number
        {
            return Math.round(param1 * Math.pow(10, param2)) / Math.pow(10, param2);
        }// end function

        public static function radiusToDegress(param1:Number) : Number
        {
            return param1 * (180 / Math.PI);
        }// end function

        public static function pointOnQuadraticCurve(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number) : Object
        {
            var _loc_8:* = param1 / 100;
            return {x:param2 + _loc_8 * (2 * (1 - _loc_8) * (param4 - param2) + _loc_8 * (param6 - param2)), y:param3 + _loc_8 * (2 * (1 - _loc_8) * (param5 - param3) + _loc_8 * (param7 - param3))};
        }// end function

        public static function degressToRadius(param1:Number) : Number
        {
            return param1 * (Math.PI / 180);
        }// end function

        public static function bezierBounds(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : Rectangle
        {
            var _loc_7:Number = NaN;
            if (param1 == param3 && param3 == param5)
            {
                bezBoundsRect.x = param1;
                bezBoundsRect.y = Math.min(param2, param6);
                bezBoundsRect.width = 0.0001;
                bezBoundsRect.height = Math.abs(param6 - param2);
                return bezBoundsRect;
            }
            if (param2 == param4 && param4 == param6)
            {
                bezBoundsRect.x = Math.min(param1, param5);
                bezBoundsRect.y = param2;
                bezBoundsRect.width = Math.abs(param5 - param1);
                bezBoundsRect.height = 0.0001;
                return bezBoundsRect;
            }
            if (param2 > param6)
            {
                if (param4 > param6)
                {
                    bezBoundsRect.y = param6;
                }
                else
                {
                    _loc_7 = (-(param4 - param2)) / (param6 - 2 * param4 + param2);
                    bezBoundsRect.y = (1 - _loc_7) * (1 - _loc_7) * param2 + 2 * _loc_7 * (1 - _loc_7) * param4 + _loc_7 * _loc_7 * param6;
                }
            }
            else if (param4 > param2)
            {
                bezBoundsRect.y = param2;
            }
            else
            {
                _loc_7 = (-(param4 - param2)) / (param6 - 2 * param4 + param2);
                bezBoundsRect.y = (1 - _loc_7) * (1 - _loc_7) * param2 + 2 * _loc_7 * (1 - _loc_7) * param4 + _loc_7 * _loc_7 * param6;
            }
            if (param2 > param6)
            {
                if (param4 < param2)
                {
                    bezBoundsRect.bottom = param2;
                }
                else
                {
                    _loc_7 = (-(param4 - param2)) / (param6 - 2 * param4 + param2);
                    bezBoundsRect.bottom = (1 - _loc_7) * (1 - _loc_7) * param2 + 2 * _loc_7 * (1 - _loc_7) * param4 + _loc_7 * _loc_7 * param6;
                }
            }
            else if (param6 > param4)
            {
                bezBoundsRect.bottom = param6;
            }
            else
            {
                _loc_7 = (-(param4 - param2)) / (param6 - 2 * param4 + param2);
                bezBoundsRect.bottom = (1 - _loc_7) * (1 - _loc_7) * param2 + 2 * _loc_7 * (1 - _loc_7) * param4 + _loc_7 * _loc_7 * param6;
            }
            if (param1 > param5)
            {
                if (param3 > param5)
                {
                    bezBoundsRect.x = param5;
                }
                else
                {
                    _loc_7 = (-(param3 - param1)) / (param5 - 2 * param3 + param1);
                    bezBoundsRect.x = (1 - _loc_7) * (1 - _loc_7) * param1 + 2 * _loc_7 * (1 - _loc_7) * param3 + _loc_7 * _loc_7 * param5;
                }
            }
            else if (param3 > param1)
            {
                bezBoundsRect.x = param1;
            }
            else
            {
                _loc_7 = (-(param3 - param1)) / (param5 - 2 * param3 + param1);
                bezBoundsRect.x = (1 - _loc_7) * (1 - _loc_7) * param1 + 2 * _loc_7 * (1 - _loc_7) * param3 + _loc_7 * _loc_7 * param5;
            }
            if (param1 > param5)
            {
                if (param3 < param1)
                {
                    bezBoundsRect.right = param1;
                }
                else
                {
                    _loc_7 = (-(param3 - param1)) / (param5 - 2 * param3 + param1);
                    bezBoundsRect.right = (1 - _loc_7) * (1 - _loc_7) * param1 + 2 * _loc_7 * (1 - _loc_7) * param3 + _loc_7 * _loc_7 * param5;
                }
            }
            else if (param3 < param5)
            {
                bezBoundsRect.right = param5;
            }
            else
            {
                _loc_7 = (-(param3 - param1)) / (param5 - 2 * param3 + param1);
                bezBoundsRect.right = (1 - _loc_7) * (1 - _loc_7) * param1 + 2 * _loc_7 * (1 - _loc_7) * param3 + _loc_7 * _loc_7 * param5;
            }
            return bezBoundsRect;
        }// end function

        public static function rotatePoint(param1:Point, param2:Number) : Point
        {
            var _loc_3:* = Math.sqrt(Math.pow(param1.x, 2) + Math.pow(param1.y, 2));
            param2 = Math.atan2(param1.y, param1.x) + degressToRadius(param2);
            return new Point(roundTo(_loc_3 * Math.cos(param2), 3), roundTo(_loc_3 * Math.sin(param2), 3));
        }// end function

    }
}
