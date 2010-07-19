package com.degrafa.transform
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.geometry.*;
    import flash.geom.*;
    import mx.events.*;

    public class TransformBase extends DegrafaObject implements ITransform
    {
        private var _data:String;
        protected var _transformMatrix:Matrix;
        protected var _skewX:Number = 0;
        protected var _skewY:Number = 0;
        private var _952764791invalidated:Boolean;
        protected var _tx:Number = 0;
        protected var _ty:Number = 0;
        protected var _registrationPoint:String;
        protected var _angle:Number = 0;
        protected var _centerX:Number = NaN;
        protected var _centerY:Number = NaN;
        protected var _scaleX:Number = 1;
        protected var _scaleY:Number = 1;
        private static var identity:Matrix = new Matrix();

        public function TransformBase()
        {
            _transformMatrix = new Matrix();
            return;
        }// end function

        public function hasExplicitSetting() : Boolean
        {
            return _registrationPoint || !(isNaN(_centerX) || isNaN(_centerY));
        }// end function

        public function get isIdentity() : Boolean
        {
            var _loc_1:Matrix = null;
            if (invalidated)
            {
                _loc_1 = transformMatrix;
            }
            return _transformMatrix.a == 1 && !_transformMatrix.b && !_transformMatrix.c && _transformMatrix.d == 1 && !_transformMatrix.tx && !_transformMatrix.ty;
        }// end function

        public function get skewX() : Number
        {
            return _skewX;
        }// end function

        public function get skewY() : Number
        {
            return _skewY;
        }// end function

        public function set invalidated(param1:Boolean) : void
        {
            var _loc_2:* = this._952764791invalidated;
            if (_loc_2 !== param1)
            {
                this._952764791invalidated = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "invalidated", _loc_2, param1));
            }
            return;
        }// end function

        public function set transformMatrix(param1:Matrix) : void
        {
            var _loc_2:* = this.transformMatrix;
            if (_loc_2 !== param1)
            {
                this._854217139transformMatrix = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "transformMatrix", _loc_2, param1));
            }
            return;
        }// end function

        protected function getRegistrationPoint(param1:IGeometryComposition, param2:Rectangle = null) : Point
        {
            var _loc_3:Point = null;
            if (param1)
            {
                param2 = (param1 as Geometry).hasLayout ? (Geometry(param1).layoutRectangle) : (Geometry(param1).bounds);
            }
            switch(_registrationPoint)
            {
                case "topLeft":
                {
                    _loc_3 = param2.topLeft;
                    break;
                }
                case "centerLeft":
                {
                    _loc_3 = new Point(param2.left, param2.y + param2.height / 2);
                    break;
                }
                case "bottomLeft":
                {
                    _loc_3 = new Point(param2.left, param2.bottom);
                    break;
                }
                case "centerTop":
                {
                    _loc_3 = new Point(param2.x + param2.width / 2, param2.y);
                    break;
                }
                case "center":
                {
                    _loc_3 = new Point(param2.x + param2.width / 2, param2.y + param2.height / 2);
                    break;
                }
                case "centerBottom":
                {
                    _loc_3 = new Point(param2.x + param2.width / 2, param2.bottom);
                    break;
                }
                case "topRight":
                {
                    _loc_3 = new Point(param2.right, param2.top);
                    break;
                }
                case "centerRight":
                {
                    _loc_3 = new Point(param2.right, param2.y + param2.height / 2);
                    break;
                }
                case "bottomRight":
                {
                    _loc_3 = param2.bottomRight;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return _loc_3;
        }// end function

        public function get centerY() : Number
        {
            return isNaN(_centerY) ? (0) : (_centerY);
        }// end function

        private function set _665239204centerY(param1:Number) : void
        {
            if (_centerY != param1)
            {
                _centerY = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get data() : String
        {
            return _data;
        }// end function

        private function set _854217139transformMatrix(param1:Matrix) : void
        {
            _transformMatrix = param1;
            return;
        }// end function

        public function set registrationPoint(param1:String) : void
        {
            var _loc_2:* = this.registrationPoint;
            if (_loc_2 !== param1)
            {
                this._1359411113registrationPoint = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "registrationPoint", _loc_2, param1));
            }
            return;
        }// end function

        public function get centerX() : Number
        {
            return isNaN(_centerX) ? (0) : (_centerX);
        }// end function

        public function getTransformFor(param1:IGeometryComposition) : Matrix
        {
            var _loc_2:* = _registrationPoint ? (getRegistrationPoint(param1)) : (new Point(centerX, centerY));
            var _loc_3:* = param1 as Geometry;
            var _loc_4:* = _loc_3.transformContext;
            if (!_loc_3.transformContext)
            {
                while (_loc_3.parent)
                {
                    
                    _loc_3 = _loc_3.parent as Geometry;
                    if (_loc_3.transform)
                    {
                        _loc_4 = _loc_3.transform.getTransformFor(_loc_3);
                        break;
                    }
                }
            }
            var _loc_5:* = new Matrix();
            new Matrix().translate(-_loc_2.x, -_loc_2.y);
            _loc_5.concat(transformMatrix);
            _loc_5.translate(_loc_2.x, _loc_2.y);
            if (_loc_4)
            {
                _loc_5.concat(_loc_4);
            }
            return _loc_5;
        }// end function

        public function get invalidated() : Boolean
        {
            return this._952764791invalidated;
        }// end function

        public function getRegPointForRectangle(param1:Rectangle) : Point
        {
            var _loc_2:Point = null;
            if (_registrationPoint)
            {
                _loc_2 = getRegistrationPoint(null, param1);
            }
            else
            {
                _loc_2 = new Point(param1.x + param1.width / 2 + centerX, param1.y + param1.height / 2 + centerY);
            }
            return _loc_2;
        }// end function

        public function get transformMatrix() : Matrix
        {
            var _loc_1:Matrix = null;
            if (!invalidated)
            {
                return _transformMatrix;
            }
            _transformMatrix.identity();
            if (_scaleX != 1 || _scaleY != 1)
            {
                _transformMatrix.scale(_scaleX, _scaleY);
            }
            if (_skewX || _skewY)
            {
                _loc_1 = new Matrix();
                _loc_1.a = Math.cos(_skewY * Math.PI / 180);
                _loc_1.b = Math.sin(_skewY * Math.PI / 180);
                _loc_1.c = -Math.sin(_skewX * Math.PI / 180);
                _loc_1.d = Math.cos(_skewX * Math.PI / 180);
                _transformMatrix.concat(_loc_1);
            }
            if (_angle)
            {
                _transformMatrix.rotate(_angle * Math.PI / 180);
            }
            if (_tx || _ty)
            {
                _transformMatrix.translate(_tx, _ty);
            }
            invalidated = false;
            return _transformMatrix;
        }// end function

        public function get scaleX() : Number
        {
            return _scaleX;
        }// end function

        public function getRegPoint(param1:IGeometryComposition) : Point
        {
            if (_registrationPoint)
            {
                return getRegistrationPoint(param1);
            }
            return new Point(centerX, centerY);
        }// end function

        public function get angle() : Number
        {
            return _angle;
        }// end function

        public function get scaleY() : Number
        {
            return _scaleY;
        }// end function

        public function get registrationPoint() : String
        {
            return _registrationPoint;
        }// end function

        private function set _665239203centerX(param1:Number) : void
        {
            if (_centerX != param1)
            {
                _centerX = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _1359411113registrationPoint(param1:String) : void
        {
            var _loc_2:String = null;
            if (_registrationPoint != param1)
            {
                _loc_2 = _registrationPoint;
                _registrationPoint = param1;
            }
            return;
        }// end function

        public function set centerX(param1:Number) : void
        {
            var _loc_2:* = this.centerX;
            if (_loc_2 !== param1)
            {
                this._665239203centerX = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "centerX", _loc_2, param1));
            }
            return;
        }// end function

        public function set centerY(param1:Number) : void
        {
            var _loc_2:* = this.centerY;
            if (_loc_2 !== param1)
            {
                this._665239204centerY = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "centerY", _loc_2, param1));
            }
            return;
        }// end function

        public function set data(param1:String) : void
        {
            var _loc_2:* = this.data;
            if (_loc_2 !== param1)
            {
                this._3076010data = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "data", _loc_2, param1));
            }
            return;
        }// end function

        public function get x() : Number
        {
            return _tx;
        }// end function

        public function get y() : Number
        {
            return _ty;
        }// end function

        private function set _3076010data(param1:String) : void
        {
            _data = param1;
            return;
        }// end function

        public function getTransformedBoundsFor(param1:IGeometryComposition) : Rectangle
        {
            var _loc_2:* = param1 as Geometry;
            var _loc_3:* = getTransformFor(param1);
            return transformBounds(_loc_2.bounds, _loc_3);
        }// end function

        public static function getRenderedBounds(param1:IGeometryComposition) : Rectangle
        {
            var _loc_3:Matrix = null;
            var _loc_2:* = param1 as Geometry;
            if (_loc_2.transform)
            {
                return (_loc_2.transform as TransformBase).getTransformedBoundsFor(param1);
            }
            _loc_3 = _loc_2.transformContext;
            if (!_loc_3)
            {
                while (_loc_2.parent)
                {
                    
                    _loc_2 = _loc_2.parent as Geometry;
                    if (_loc_2.transform)
                    {
                        _loc_3 = _loc_2.transform.getTransformFor(_loc_2);
                        break;
                    }
                }
            }
            if (_loc_3)
            {
                return transformBounds(_loc_2.bounds, _loc_3);
            }
            return _loc_2.bounds.clone();
        }// end function

        public static function transformBounds(param1:Rectangle, param2:Matrix) : Rectangle
        {
            var _loc_6:Point = null;
            var _loc_7:Point = null;
            var _loc_9:Point = null;
            var _loc_3:* = param1.clone();
            var _loc_4:* = _loc_3.topLeft;
            var _loc_5:* = _loc_3.bottomRight;
            var _loc_10:* = _loc_4.clone();
            _loc_6 = _loc_4.clone();
            _loc_10.offset(_loc_5.x - _loc_4.x, 0);
            var _loc_10:* = _loc_4.clone();
            _loc_7 = _loc_4.clone();
            _loc_10.offset(0, _loc_5.y - _loc_4.y);
            var _loc_8:Array = [param2.transformPoint(_loc_4), param2.transformPoint(_loc_5), param2.transformPoint(_loc_6), param2.transformPoint(_loc_7)];
            _loc_3.setEmpty();
            _loc_3.topLeft = param2.transformPoint(_loc_4);
            for each (_loc_9 in _loc_8)
            {
                
                if (_loc_3.right < _loc_9.x)
                {
                    _loc_3.right = _loc_9.x;
                }
                if (_loc_3.top > _loc_9.y)
                {
                    _loc_3.top = _loc_9.y;
                }
                if (_loc_3.left > _loc_9.x)
                {
                    _loc_3.left = _loc_9.x;
                }
                if (_loc_3.bottom < _loc_9.y)
                {
                    _loc_3.bottom = _loc_9.y;
                }
            }
            return _loc_3;
        }// end function

    }
}
