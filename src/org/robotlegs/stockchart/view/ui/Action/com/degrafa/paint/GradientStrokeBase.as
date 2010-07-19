package com.degrafa.paint
{
    import com.degrafa.geometry.*;
    import com.degrafa.geometry.command.*;
    import com.degrafa.transform.*;
    import flash.display.*;
    import flash.geom.*;

    public class GradientStrokeBase extends GradientFillBase implements IGraphicsStroke
    {
        private var _lastRect:Rectangle;
        protected var _scaleMode:String;
        protected var _weight:Number;
        protected var _caps:String;
        protected var _joints:String;
        protected var _miterLimit:Number;
        protected var _degrafaScaling:int;
        private var _lastArgs:Array;
        private var _lastContext:Graphics;
        protected var _pixelHinting:Boolean = false;

        public function GradientStrokeBase()
        {
            _lastArgs = [];
            return;
        }// end function

        public function get reApplyFunction() : Function
        {
            var copy:Array;
            var last:Graphics;
            copy = _lastArgs.concat();
            last = _lastContext;
            if (!_lastContext)
            {
                return function (param1:Graphics = null, param2:Array = null) : void
            {
                return;
            }// end function
            ;
            }
            return function (param1:Graphics = null, param2:Array = null) : void
            {
                var _loc_3:* = param2 ? (param2) : (copy);
                if (param1)
                {
                    param1.lineStyle.apply(param1, _loc_3[0]);
                    param1.lineGradientStyle.apply(param1, _loc_3[1]);
                }
                else
                {
                    last.lineStyle.apply(last, _loc_3[0]);
                    last.lineGradientStyle.apply(last, _loc_3[1]);
                }
                return;
            }// end function
            ;
        }// end function

        public function get scaleMode() : String
        {
            if (!_scaleMode)
            {
                return "normal";
            }
            return _scaleMode;
        }// end function

        override public function get lastRectangle() : Rectangle
        {
            return _lastRect.clone();
        }// end function

        public function set scaleMode(param1:String) : void
        {
            var _loc_2:String = null;
            if (_scaleMode != param1)
            {
                _loc_2 = _scaleMode;
                _scaleMode = param1;
                initChange("scaleMode", _loc_2, _scaleMode, this);
            }
            return;
        }// end function

        public function get pixelHinting() : Boolean
        {
            return _pixelHinting;
        }// end function

        override public function get lastArgs() : Array
        {
            return _lastArgs;
        }// end function

        public function get joints() : String
        {
            if (!_joints)
            {
                return "round";
            }
            return _joints;
        }// end function

        public function set pixelHinting(param1:Boolean) : void
        {
            var _loc_2:Boolean = false;
            if (_pixelHinting != param1)
            {
                _loc_2 = _pixelHinting;
                _pixelHinting = param1;
                initChange("pixelHinting", _loc_2, _pixelHinting, this);
            }
            return;
        }// end function

        public function get miterLimit() : Number
        {
            if (!_miterLimit)
            {
                return 3;
            }
            return _miterLimit;
        }// end function

        public function get degrafaScaling() : Boolean
        {
            return _degrafaScaling < 1;
        }// end function

        public function set caps(param1:String) : void
        {
            var _loc_2:String = null;
            if (_caps != param1)
            {
                _loc_2 = _caps;
                _caps = param1;
                initChange("caps", _loc_2, _caps, this);
            }
            return;
        }// end function

        public function set joints(param1:String) : void
        {
            var _loc_2:String = null;
            if (_joints != param1)
            {
                _loc_2 = _joints;
                _joints = param1;
                initChange("joints", _loc_2, _joints, this);
            }
            return;
        }// end function

        public function get caps() : String
        {
            if (!_caps)
            {
                return "round";
            }
            return _caps;
        }// end function

        public function set degrafaScaling(param1:Boolean) : void
        {
            if (_degrafaScaling > 0 != param1)
            {
                _degrafaScaling = param1 ? (1) : (-1);
                initChange("degrafaScaling", !param1, param1, this);
            }
            return;
        }// end function

        public function set weight(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_weight != param1)
            {
                _loc_2 = _weight;
                _weight = param1;
                initChange("weight", _loc_2, _weight, this);
            }
            return;
        }// end function

        public function set miterLimit(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_miterLimit != param1)
            {
                _loc_2 = _miterLimit;
                _miterLimit = param1;
                initChange("miterLimit", _loc_2, _miterLimit, this);
            }
            return;
        }// end function

        public function apply(param1:Graphics, param2:Rectangle) : void
        {
            var matrix:Matrix;
            var transformRequest:ITransform;
            var csAlpha:Number;
            var xp:Number;
            var yp:Number;
            var geom:Geometry;
            var regPoint:Point;
            var tempmat:Matrix;
            var m:Matrix;
            var s:Number;
            var graphics:* = param1;
            var rc:* = param2;
            if (!_caps)
            {
                _caps = "round";
            }
            if (!_joints)
            {
                _joints = "round";
            }
            if (!_miterLimit)
            {
                _miterLimit = 3;
            }
            if (!_scaleMode)
            {
                _scaleMode = "normal";
            }
            if (!_weight)
            {
                _weight = 1;
            }
            if (rc)
            {
                matrix = new Matrix();
                matrix.createGradientBox(rc.width, rc.height, angle / 180 * Math.PI, rc.x, rc.y);
                xp = angle % 90 / 90;
                yp = 1 - xp;
                processEntries(rc.width * xp + rc.height * yp);
            }
            else
            {
                matrix;
            }
            if (_requester && (_requester as Geometry).hasLayout)
            {
                geom = _requester as Geometry;
                if (geom._layoutMatrix)
                {
                    matrix.concat(geom._layoutMatrix);
                }
            }
            if (_transform && !_transform.isIdentity)
            {
                tempmat = new Matrix();
                regPoint = _transform.getRegPointForRectangle(rc);
                tempmat.translate(-regPoint.x, -regPoint.y);
                tempmat.concat(_transform.transformMatrix);
                tempmat.translate(regPoint.x, regPoint.y);
                matrix.concat(tempmat);
            }
            var weight:* = this.weight;
            var _loc_4:* = (_requester as Geometry).transform;
            transformRequest = (_requester as Geometry).transform;
            if (_requester && (_loc_4 || (_requester as Geometry).transformContext))
            {
                if (transformRequest)
                {
                    matrix.concat(transformRequest.getTransformFor(_requester));
                }
                else
                {
                    matrix.concat((_requester as Geometry).transformContext);
                }
                if (_degrafaScaling > 0 && scaleMode != "none")
                {
                    m = CommandStack.transMatrix;
                    switch(_scaleMode)
                    {
                        case "normal":
                        {
                            s = Math.sqrt(Math.abs(m.a * m.d - m.b * m.c));
                            break;
                        }
                        case "vertical":
                        {
                            s = m.b + m.d;
                            break;
                        }
                        case "horizontal":
                        {
                            s = m.a + m.c;
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    weight = weight * s;
                }
                _requester = null;
            }
            csAlpha = CommandStack.currentAlpha;
            var _alphas:* = this._alphas;
            if (csAlpha != 1)
            {
                _alphas = _alphas.concat();
                _alphas.forEach(function (param1, param2:uint, param3:Array) : void
            {
                param3[param2] = param3[param2] * csAlpha;
                return;
            }// end function
            , null);
            }
            if (caps == "round" && joints == "round" && miterLimit == 3)
            {
                graphics.lineStyle(weight, 0, 1, pixelHinting, scaleMode);
                _lastArgs[0] = [weight, 0, 1, pixelHinting, scaleMode];
                _lastArgs[1] = [gradientType, _colors, _alphas, _ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio];
            }
            else
            {
                graphics.lineStyle(weight, 0, 1, pixelHinting, scaleMode, caps, joints, miterLimit);
                _lastArgs[0] = [weight, 0, 1, pixelHinting, scaleMode, caps, joints, miterLimit];
                _lastArgs[1] = [gradientType, _colors, _alphas, _ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio];
            }
            _lastContext = graphics;
            _lastRect = rc;
            graphics.lineGradientStyle(gradientType, _colors, _alphas, _ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
            return;
        }// end function

        public function get weight() : Number
        {
            if (!_weight)
            {
                return 1;
            }
            return _weight;
        }// end function

    }
}
