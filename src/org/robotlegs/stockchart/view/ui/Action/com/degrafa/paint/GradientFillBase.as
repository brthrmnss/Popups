package com.degrafa.paint
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.core.collections.*;
    import com.degrafa.geometry.*;
    import com.degrafa.geometry.command.*;
    import com.degrafa.transform.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class GradientFillBase extends DegrafaObject implements ITransformablePaint
    {
        private var _lastRect:Rectangle;
        protected var _colors:Array;
        protected var _spreadMethod:String;
        protected var _blendMode:String;
        private var _lastArgs:Array;
        protected var _coordType:String = "absolute";
        protected var _angle:Number;
        protected var _gradientStops:GradientStopsCollection;
        protected var _interpolationMethod:String;
        protected var _ratios:Array;
        protected var _gradientType:String;
        protected var _transform:ITransform;
        protected var _focalPointRatio:Number;
        private var _lastContext:Graphics;
        protected var _alphas:Array;
        protected var _requester:IGeometryComposition;

        public function GradientFillBase()
        {
            _colors = [];
            _ratios = [];
            _alphas = [];
            _lastArgs = [];
            return;
        }// end function

        public function get restartFunction() : Function
        {
            var copy:Array;
            var last:Graphics;
            copy = _lastArgs.concat();
            last = _lastContext;
            if (!_lastContext)
            {
                return function (param1:Graphics = null) : void
            {
                return;
            }// end function
            ;
            }
            return function (param1:Graphics = null) : void
            {
                if (param1)
                {
                    param1.beginGradientFill.apply(param1, copy);
                }
                else
                {
                    last.beginGradientFill.apply(last, copy);
                }
                return;
            }// end function
            ;
        }// end function

        public function get gradientType() : String
        {
            if (!_gradientType)
            {
                return "linear";
            }
            return _gradientType;
        }// end function

        public function get blendMode() : String
        {
            if (!_blendMode)
            {
                return null;
            }
            return _blendMode;
        }// end function

        public function get lastArgs() : Array
        {
            return _lastArgs;
        }// end function

        public function set gradientType(param1:String) : void
        {
            var _loc_2:String = null;
            if (_gradientType != param1)
            {
                _loc_2 = _gradientType;
                _gradientType = param1;
                initChange("gradientType", _loc_2, _gradientType, this);
            }
            return;
        }// end function

        public function get focalPointRatio() : Number
        {
            if (!_focalPointRatio)
            {
                return 0;
            }
            return _focalPointRatio;
        }// end function

        protected function processEntries(param1:Number) : void
        {
            var _loc_3:int = 0;
            var _loc_5:GradientStop = null;
            var _loc_6:Number = NaN;
            var _loc_7:int = 0;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:int = 0;
            _colors = [];
            _ratios = [];
            _alphas = [];
            if (!_gradientStops || _gradientStops.items.length == 0)
            {
                return;
            }
            var _loc_2:Number = 255;
            var _loc_4:* = _gradientStops.items.length;
            _loc_3 = 0;
            while (_loc_3 < _loc_4)
            {
                
                _loc_5 = _gradientStops.items[_loc_3];
                _colors.push(_loc_5.color);
                _alphas.push(_loc_5.alpha);
                if (_loc_5.measure != null && _loc_5.measure.value >= 0)
                {
                    _loc_6 = _loc_5.measure.relativeTo(param1) / param1;
                    _ratios.push(Math.min(_loc_6, 1) * _loc_2);
                }
                else
                {
                    _ratios.push(NaN);
                }
                _loc_3++;
            }
            if (isNaN(_ratios[0]))
            {
                _ratios[0] = 0;
            }
            if (isNaN(_ratios[(_loc_4 - 1)]))
            {
                _ratios[(_loc_4 - 1)] = 255;
            }
            _loc_3 = 1;
            while (true)
            {
                
                while (_loc_3 < _loc_4 && !isNaN(_ratios[_loc_3]))
                {
                    
                    _loc_3++;
                }
                if (_loc_3 == _loc_4)
                {
                    break;
                }
                _loc_7 = _loc_3 - 1;
                while (_loc_3 < _loc_4 && isNaN(_ratios[_loc_3]))
                {
                    
                    _loc_3++;
                }
                _loc_8 = _ratios[_loc_7];
                _loc_9 = _ratios[_loc_3];
                _loc_10 = 1;
                while (_loc_10 < _loc_3 - _loc_7)
                {
                    
                    _ratios[_loc_10] = _loc_8 + _loc_10 * (_loc_9 - _loc_8) / (_loc_3 - _loc_7);
                    _loc_10++;
                }
            }
            return;
        }// end function

        public function set coordinateType(param1:String) : void
        {
            if (param1 != _coordType)
            {
                var _loc_2:* = param1;
                _coordType = param1;
                initChange("coordinateType", _coordType, _loc_2, this);
            }
            return;
        }// end function

        private function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        public function set angle(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_angle != param1)
            {
                _loc_2 = _angle;
                _angle = param1;
                initChange("angle", _loc_2, _angle, this);
            }
            return;
        }// end function

        public function set blendMode(param1:String) : void
        {
            if (_blendMode != param1)
            {
                var _loc_2:* = param1;
                _blendMode = param1;
                initChange("blendMode", _blendMode, _loc_2, this);
            }
            return;
        }// end function

        public function begin(param1:Graphics, param2:Rectangle) : void
        {
            var matrix:Matrix;
            var transformRequest:ITransform;
            var csAlpha:Number;
            var xp:Number;
            var yp:Number;
            var geom:Geometry;
            var regPoint:Point;
            var tempmat:Matrix;
            var graphics:* = param1;
            var rc:* = param2;
            if (!_angle)
            {
                _angle = 0;
            }
            if (!_focalPointRatio)
            {
                _focalPointRatio = 0;
            }
            if (!_spreadMethod)
            {
                _spreadMethod = "pad";
            }
            if (!_interpolationMethod)
            {
                _interpolationMethod = "rgb";
            }
            matrix = new Matrix();
            if (rc)
            {
                matrix.createGradientBox(rc.width, rc.height, _angle / 180 * Math.PI, rc.x, rc.y);
                xp = angle % 90 / 90;
                yp = 1 - xp;
                processEntries(rc.width * xp + rc.height * yp);
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
            _lastArgs.length = 0;
            _lastArgs[0] = gradientType;
            _lastArgs[1] = _colors;
            _lastArgs[2] = _alphas;
            _lastArgs[3] = _ratios;
            _lastArgs[4] = matrix;
            _lastArgs[5] = spreadMethod;
            _lastArgs[6] = interpolationMethod;
            _lastArgs[7] = focalPointRatio;
            _lastContext = graphics;
            _lastRect = rc;
            graphics.beginGradientFill(gradientType, _colors, _alphas, _ratios, matrix, spreadMethod, interpolationMethod, focalPointRatio);
            return;
        }// end function

        public function get interpolationMethod() : String
        {
            if (!_interpolationMethod)
            {
                return "rgb";
            }
            return _interpolationMethod;
        }// end function

        private function initGradientStopsCollection() : void
        {
            if (!_gradientStops)
            {
                _gradientStops = new GradientStopsCollection();
                if (enableEvents)
                {
                    _gradientStops.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function get spreadMethod() : String
        {
            if (!_spreadMethod)
            {
                return "pad";
            }
            return _spreadMethod;
        }// end function

        public function set focalPointRatio(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_focalPointRatio != param1)
            {
                _loc_2 = _focalPointRatio;
                _focalPointRatio = param1;
                initChange("focalPointRatio", _loc_2, _focalPointRatio, this);
            }
            return;
        }// end function

        public function set gradientStops(param1:Array) : void
        {
            initGradientStopsCollection();
            _gradientStops.items = param1;
            return;
        }// end function

        public function set interpolationMethod(param1:String) : void
        {
            var _loc_2:String = null;
            if (_interpolationMethod != param1)
            {
                _loc_2 = _interpolationMethod;
                _interpolationMethod = param1;
                initChange("interpolationMethod", _loc_2, _interpolationMethod, this);
            }
            return;
        }// end function

        public function get angle() : Number
        {
            if (!_angle)
            {
                return 0;
            }
            return _angle;
        }// end function

        public function set transform(param1:ITransform) : void
        {
            var _loc_2:Object = null;
            if (_transform != param1)
            {
                _loc_2 = _transform;
                if (_transform)
                {
                    if (_transform.hasEventManager)
                    {
                        _transform.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                    }
                }
                _transform = param1;
                if (enableEvents)
                {
                    _transform.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler, false, 0, true);
                }
                initChange("transform", _loc_2, _transform, this);
            }
            return;
        }// end function

        public function get coordinateType() : String
        {
            return _coordType;
        }// end function

        public function end(param1:Graphics) : void
        {
            param1.endFill();
            return;
        }// end function

        public function get gradientStopsCollection() : GradientStopsCollection
        {
            initGradientStopsCollection();
            return _gradientStops;
        }// end function

        public function get gradientStops() : Array
        {
            initGradientStopsCollection();
            return _gradientStops.items;
        }// end function

        public function set spreadMethod(param1:String) : void
        {
            var _loc_2:String = null;
            if (_spreadMethod != param1)
            {
                _loc_2 = _spreadMethod;
                _spreadMethod = param1;
                initChange("spreadMethod", _loc_2, _spreadMethod, this);
            }
            return;
        }// end function

        public function get transform() : ITransform
        {
            return _transform;
        }// end function

        public function get lastRectangle() : Rectangle
        {
            return _lastRect.clone();
        }// end function

        public function set requester(param1:IGeometryComposition) : void
        {
            _requester = param1;
            return;
        }// end function

    }
}
