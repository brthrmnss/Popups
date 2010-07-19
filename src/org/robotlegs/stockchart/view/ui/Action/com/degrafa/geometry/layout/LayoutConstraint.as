package com.degrafa.geometry.layout
{
    import com.degrafa.core.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class LayoutConstraint extends DegrafaObject implements ILayout
    {
        private var _right:Number;
        private var _maxWidth:Number;
        private var _minX:Number;
        private var _minY:Number;
        private var _maxHeight:Number;
        private var _layoutRectangle:Rectangle;
        private var _maintainAspectRatio:Boolean = false;
        private var _height:Number;
        private var _maxY:Number;
        private var _bottom:Number;
        private var _maxX:Number;
        private var _percentWidth:Number;
        private var container:Rectangle;
        private var _verticalCenter:Number;
        private var _top:Number;
        private var _minHeight:Number;
        private var _targetCoordinateSpace:DisplayObject;
        private var _width:Number;
        private var _invalidated:Boolean;
        private var _percentHeight:Number;
        private var _left:Number;
        private var _minWidth:Number;
        private var _horizontalCenter:Number;
        private var _x:Number;
        private var _y:Number;

        public function LayoutConstraint()
        {
            _layoutRectangle = new Rectangle();
            return;
        }// end function

        public function set y(param1:Number) : void
        {
            var _loc_2:* = this.y;
            if (_loc_2 !== param1)
            {
                this._121y = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "y", _loc_2, param1));
            }
            return;
        }// end function

        private function set _3351623minY(param1:Number) : void
        {
            if (_minY != param1)
            {
                _minY = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get left() : Number
        {
            if (!_left)
            {
                return NaN;
            }
            return _left;
        }// end function

        public function get maintainAspectRatio() : Boolean
        {
            return _maintainAspectRatio;
        }// end function

        private function set _3351622minX(param1:Number) : void
        {
            if (_minX != param1)
            {
                _minX = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _3344244maxX(param1:Number) : void
        {
            if (_maxX != param1)
            {
                _maxX = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _120x(param1:Number) : void
        {
            if (_x != param1)
            {
                _x = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set percentWidth(param1:Number) : void
        {
            var _loc_2:* = this.percentWidth;
            if (_loc_2 !== param1)
            {
                this._1127236479percentWidth = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "percentWidth", _loc_2, param1));
            }
            return;
        }// end function

        public function set invalidated(param1:Boolean) : void
        {
            _invalidated = param1;
            return;
        }// end function

        public function set left(param1:Number) : void
        {
            var _loc_2:* = this.left;
            if (_loc_2 !== param1)
            {
                this._3317767left = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "left", _loc_2, param1));
            }
            return;
        }// end function

        public function set maintainAspectRatio(param1:Boolean) : void
        {
            var _loc_2:* = this.maintainAspectRatio;
            if (_loc_2 !== param1)
            {
                this._574021640maintainAspectRatio = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maintainAspectRatio", _loc_2, param1));
            }
            return;
        }// end function

        private function set _3344245maxY(param1:Number) : void
        {
            if (_maxY != param1)
            {
                _maxY = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get right() : Number
        {
            if (!_right)
            {
                return NaN;
            }
            return _right;
        }// end function

        private function calculateLayoutRectangle() : void
        {
            var _loc_1:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_2:* = isNaN(_left);
            var _loc_3:* = isNaN(_right);
            var _loc_4:* = isNaN(_horizontalCenter);
            var _loc_5:* = !Boolean(_loc_2);
            var _loc_6:* = !Boolean(_loc_3);
            if (container)
            {
                if (!_loc_5 && !_loc_6)
                {
                    if (_loc_4)
                    {
                        _layoutRectangle.width = isNaN(_percentWidth) ? (_width) : (_percentWidth > 1 ? (_percentWidth / 100 * container.width) : (_percentWidth * container.width));
                        _layoutRectangle.x = isNaN(_x) ? (0) : (_x + container.left);
                    }
                    else
                    {
                        _layoutRectangle.width = isNaN(_percentWidth) ? (_width) : (_percentWidth > 1 ? (_percentWidth / 100 * container.width) : (_percentWidth * container.width));
                        _layoutRectangle.x = _horizontalCenter - _layoutRectangle.width / 2 + container.left + container.width / 2;
                    }
                }
                else if (!_loc_6)
                {
                    _layoutRectangle.width = isNaN(_percentWidth) ? (_width) : (_percentWidth > 1 ? (_percentWidth / 100 * container.width) : (_percentWidth * container.width));
                    _layoutRectangle.x = container.left + _left;
                }
                else if (!_loc_5)
                {
                    _layoutRectangle.width = isNaN(_percentWidth) ? (_width) : (_percentWidth > 1 ? (_percentWidth / 100 * container.width) : (_percentWidth * container.width));
                    _layoutRectangle.x = container.right - _right - _layoutRectangle.width;
                }
                else
                {
                    _layoutRectangle.right = container.right - _right;
                    _layoutRectangle.left = container.left + _left;
                }
            }
            if (!isNaN(_minX))
            {
                _loc_1 = container.x + _minX;
                if (_loc_1 > _layoutRectangle.x)
                {
                    _layoutRectangle.x = _loc_1;
                }
            }
            if (!isNaN(_maxX))
            {
                _loc_1 = container.x + _maxX;
                if (_loc_1 < _layoutRectangle.x)
                {
                    _layoutRectangle.x = _loc_1;
                }
            }
            _loc_1 = 0;
            if (!isNaN(_minWidth) && _minWidth > _layoutRectangle.width)
            {
                _loc_1 = _layoutRectangle.width - _minWidth;
            }
            else if (!isNaN(_maxWidth) && _maxWidth < _layoutRectangle.width)
            {
                _loc_1 = _layoutRectangle.width - _maxWidth;
            }
            if (_loc_1)
            {
                if (!_loc_5)
                {
                    if (_loc_6)
                    {
                        _layoutRectangle.x = _layoutRectangle.x + _loc_1;
                    }
                    else if (!_loc_4)
                    {
                        _layoutRectangle.x = _layoutRectangle.x + _loc_1 / 2;
                    }
                }
                else if (_loc_5 && _loc_6)
                {
                    _layoutRectangle.x = _layoutRectangle.x + _loc_1 / 2;
                }
                _layoutRectangle.width = _layoutRectangle.width - _loc_1;
            }
            var _loc_7:* = isNaN(_top);
            var _loc_8:* = isNaN(_bottom);
            var _loc_9:* = isNaN(_verticalCenter);
            var _loc_10:* = !Boolean(_loc_7);
            var _loc_11:* = !Boolean(_loc_8);
            if (container)
            {
                if (!_loc_10 && !_loc_11)
                {
                    if (_loc_9)
                    {
                        _layoutRectangle.height = isNaN(_percentHeight) ? (_height) : (_percentHeight > 1 ? (_percentHeight / 100 * container.height) : (_percentHeight * container.height));
                        _layoutRectangle.y = isNaN(_y) ? (0) : (_y + container.top);
                    }
                    else
                    {
                        _layoutRectangle.height = isNaN(_percentHeight) ? (_height) : (_percentHeight > 1 ? (_percentHeight / 100 * container.height) : (_percentHeight * container.height));
                        _layoutRectangle.y = _verticalCenter - _layoutRectangle.height / 2 + container.top + container.height / 2;
                    }
                }
                else if (!_loc_11)
                {
                    _layoutRectangle.height = isNaN(_percentHeight) ? (_height) : (_percentHeight > 1 ? (_percentHeight / 100 * container.height) : (_percentHeight * container.height));
                    _layoutRectangle.y = container.top + _top;
                }
                else if (!_loc_10)
                {
                    _layoutRectangle.height = isNaN(_percentHeight) ? (_height) : (_percentHeight > 1 ? (_percentHeight / 100 * container.height) : (_percentHeight * container.height));
                    _layoutRectangle.y = container.bottom - _bottom - _layoutRectangle.height;
                }
                else
                {
                    _layoutRectangle.bottom = container.bottom - _bottom;
                    _layoutRectangle.top = container.top + _top;
                }
            }
            if (!isNaN(_minY))
            {
                _loc_1 = container.y + _minY;
                if (_loc_1 > _layoutRectangle.y)
                {
                    _layoutRectangle.y = _loc_1;
                }
            }
            if (!isNaN(_maxY))
            {
                _loc_1 = container.y + _maxY;
                if (_loc_1 < _layoutRectangle.y)
                {
                    _layoutRectangle.y = _loc_1;
                }
            }
            _loc_1 = 0;
            if (!isNaN(_minHeight) && _minHeight > _layoutRectangle.height)
            {
                _loc_1 = _layoutRectangle.height - _minHeight;
            }
            else if (!isNaN(_maxHeight) && _maxHeight < _layoutRectangle.height)
            {
                _loc_1 = _layoutRectangle.height - _maxHeight;
            }
            if (_loc_1)
            {
                if (!_loc_10)
                {
                    if (_loc_11)
                    {
                        _layoutRectangle.y = _layoutRectangle.y + _loc_1;
                    }
                    else if (!_loc_9)
                    {
                        _layoutRectangle.y = _layoutRectangle.y + _loc_1 / 2;
                    }
                }
                else if (_loc_10 && _loc_11)
                {
                    _layoutRectangle.y = _layoutRectangle.y + _loc_1 / 2;
                }
                _layoutRectangle.height = _layoutRectangle.height - _loc_1;
            }
            if (_maintainAspectRatio && _height && _width)
            {
                _loc_12 = _height / _width;
                _loc_13 = _layoutRectangle.height / _layoutRectangle.width;
                if (_loc_12 > _loc_13)
                {
                    _loc_1 = _layoutRectangle.height / _loc_12;
                    if (!_loc_5)
                    {
                        if (_loc_6)
                        {
                            _layoutRectangle.x = _layoutRectangle.x + (_layoutRectangle.width - _loc_1);
                        }
                        else if (!_loc_4)
                        {
                            _layoutRectangle.x = _layoutRectangle.x + (_layoutRectangle.width - _loc_1) / 2;
                        }
                    }
                    else if (_loc_5 && _loc_6)
                    {
                        _layoutRectangle.x = _layoutRectangle.x + (_layoutRectangle.width - _loc_1) / 2;
                    }
                    _layoutRectangle.width = _loc_1;
                }
                else if (_loc_12 < _loc_13)
                {
                    _loc_1 = _layoutRectangle.width * _loc_12;
                    if (!_loc_10)
                    {
                        if (_loc_11)
                        {
                            _layoutRectangle.y = _layoutRectangle.y + (_layoutRectangle.height - _loc_1);
                        }
                        else if (!_loc_9)
                        {
                            _layoutRectangle.y = _layoutRectangle.y + (_layoutRectangle.height - _loc_1) / 2;
                        }
                    }
                    else if (_loc_10 && _loc_11)
                    {
                        _layoutRectangle.y = _layoutRectangle.y + (_layoutRectangle.height - _loc_1) / 2;
                    }
                    _layoutRectangle.height = _loc_1;
                }
            }
            return;
        }// end function

        public function get minHeight() : Number
        {
            return _minHeight;
        }// end function

        private function set _926273685verticalCenter(param1:Number) : void
        {
            if (_verticalCenter != param1)
            {
                _verticalCenter = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _574021640maintainAspectRatio(param1:Boolean) : void
        {
            if (_maintainAspectRatio != param1)
            {
                _maintainAspectRatio = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get height() : Number
        {
            return _height;
        }// end function

        public function set minWidth(param1:Number) : void
        {
            var _loc_2:* = this.minWidth;
            if (_loc_2 !== param1)
            {
                this._1375815020minWidth = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minWidth", _loc_2, param1));
            }
            return;
        }// end function

        public function get bottom() : Number
        {
            if (!_bottom)
            {
                return NaN;
            }
            return _bottom;
        }// end function

        public function computeLayoutRectangle(param1:Rectangle, param2:Rectangle) : Rectangle
        {
            if (param2.isEmpty())
            {
                return null;
            }
            _layoutRectangle = param1.clone();
            if (isNaN(_width))
            {
                _width = layoutRectangle.width ? (layoutRectangle.width) : (1);
            }
            if (isNaN(_height))
            {
                _height = layoutRectangle.height ? (layoutRectangle.height) : (1);
            }
            if (isNaN(_x))
            {
                _x = layoutRectangle.x ? (layoutRectangle.x) : (0);
            }
            if (isNaN(_y))
            {
                _y = layoutRectangle.y ? (layoutRectangle.y) : (0);
            }
            container = param2.clone();
            calculateLayoutRectangle();
            return layoutRectangle;
        }// end function

        public function set horizontalCenter(param1:Number) : void
        {
            var _loc_2:* = this.horizontalCenter;
            if (_loc_2 !== param1)
            {
                this._2016110183horizontalCenter = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "horizontalCenter", _loc_2, param1));
            }
            return;
        }// end function

        public function set right(param1:Number) : void
        {
            var _loc_2:* = this.right;
            if (_loc_2 !== param1)
            {
                this._108511772right = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "right", _loc_2, param1));
            }
            return;
        }// end function

        public function set minHeight(param1:Number) : void
        {
            var _loc_2:* = this.minHeight;
            if (_loc_2 !== param1)
            {
                this._133587431minHeight = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minHeight", _loc_2, param1));
            }
            return;
        }// end function

        private function set _1854666595targetCoordinateSpace(param1:DisplayObject) : void
        {
            if (_targetCoordinateSpace != param1)
            {
                _targetCoordinateSpace = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _400381634maxWidth(param1:Number) : void
        {
            if (_maxWidth != param1)
            {
                _maxWidth = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get minX() : Number
        {
            return _minX;
        }// end function

        public function get minY() : Number
        {
            return _minY;
        }// end function

        private function set _1383228885bottom(param1:Number) : void
        {
            if (_bottom != param1)
            {
                _bottom = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set derive(param1:LayoutConstraint) : void
        {
            if (!_x)
            {
                _x = param1.x;
            }
            if (!_minX)
            {
                _minX = param1.minX;
            }
            if (!_maxX)
            {
                _maxX = param1.maxX;
            }
            if (!_y)
            {
                _y = param1.y;
            }
            if (!_minY)
            {
                _minY = param1.minY;
            }
            if (!_maxY)
            {
                _maxY = param1.maxY;
            }
            if (!_width)
            {
                _width = param1.width;
            }
            if (!_minWidth)
            {
                _minWidth = param1.minWidth;
            }
            if (!_maxWidth)
            {
                _maxWidth = param1.maxWidth;
            }
            if (!_percentWidth)
            {
                _percentWidth = param1.percentWidth;
            }
            if (!_height)
            {
                _height = param1.height;
            }
            if (!_minHeight)
            {
                _minHeight = param1.minHeight;
            }
            if (!_maxHeight)
            {
                _maxHeight = param1.maxHeight;
            }
            if (!_percentHeight)
            {
                _percentHeight = param1.percentHeight;
            }
            if (!_top)
            {
                _top = param1.top;
            }
            if (!_right)
            {
                _right = param1.right;
            }
            if (!_bottom)
            {
                _bottom = param1.bottom;
            }
            if (!_left)
            {
                _left = param1.left;
            }
            if (!_horizontalCenter)
            {
                _horizontalCenter = param1.horizontalCenter;
            }
            if (!_verticalCenter)
            {
                _verticalCenter = param1.verticalCenter;
            }
            if (!_maintainAspectRatio)
            {
                _maintainAspectRatio = param1.maintainAspectRatio;
            }
            if (!_targetCoordinateSpace)
            {
                _targetCoordinateSpace = param1.targetCoordinateSpace;
            }
            invalidated = true;
            return;
        }// end function

        private function set _121y(param1:Number) : void
        {
            if (_y != param1)
            {
                _y = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _108511772right(param1:Number) : void
        {
            if (_right != param1)
            {
                _right = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set targetCoordinateSpace(param1:DisplayObject) : void
        {
            var _loc_2:* = this.targetCoordinateSpace;
            if (_loc_2 !== param1)
            {
                this._1854666595targetCoordinateSpace = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "targetCoordinateSpace", _loc_2, param1));
            }
            return;
        }// end function

        public function get top() : Number
        {
            if (!_top)
            {
                return NaN;
            }
            return _top;
        }// end function

        public function set maxHeight(param1:Number) : void
        {
            var _loc_2:* = this.maxHeight;
            if (_loc_2 !== param1)
            {
                this._906066005maxHeight = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxHeight", _loc_2, param1));
            }
            return;
        }// end function

        private function set _1127236479percentWidth(param1:Number) : void
        {
            if (_percentWidth != param1)
            {
                _percentWidth = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set height(param1:Number) : void
        {
            var _loc_2:* = this.height;
            if (_loc_2 !== param1)
            {
                this._1221029593height = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "height", _loc_2, param1));
            }
            return;
        }// end function

        private function set _113126854width(param1:Number) : void
        {
            if (_width != param1)
            {
                _width = param1;
                _percentWidth = NaN;
                invalidated = true;
            }
            return;
        }// end function

        public function get layoutRectangle() : Rectangle
        {
            return _layoutRectangle.clone();
        }// end function

        public function get verticalCenter() : Number
        {
            if (!_verticalCenter)
            {
                return NaN;
            }
            return _verticalCenter;
        }// end function

        private function set _2016110183horizontalCenter(param1:Number) : void
        {
            if (_horizontalCenter != param1)
            {
                _horizontalCenter = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _3317767left(param1:Number) : void
        {
            if (_left != param1)
            {
                _left = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get maxY() : Number
        {
            return _maxY;
        }// end function

        public function get x() : Number
        {
            return _x;
        }// end function

        public function get y() : Number
        {
            return _y;
        }// end function

        public function get maxX() : Number
        {
            return _maxX;
        }// end function

        public function set bottom(param1:Number) : void
        {
            var _loc_2:* = this.bottom;
            if (_loc_2 !== param1)
            {
                this._1383228885bottom = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottom", _loc_2, param1));
            }
            return;
        }// end function

        public function set maxWidth(param1:Number) : void
        {
            var _loc_2:* = this.maxWidth;
            if (_loc_2 !== param1)
            {
                this._400381634maxWidth = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxWidth", _loc_2, param1));
            }
            return;
        }// end function

        public function get percentWidth() : Number
        {
            if (!_percentWidth)
            {
                return NaN;
            }
            return _percentWidth;
        }// end function

        public function get invalidated() : Boolean
        {
            return _invalidated;
        }// end function

        private function set _1375815020minWidth(param1:Number) : void
        {
            if (_minWidth != param1)
            {
                _minWidth = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _906066005maxHeight(param1:Number) : void
        {
            if (_maxHeight != param1)
            {
                _maxHeight = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set minY(param1:Number) : void
        {
            var _loc_2:* = this.minY;
            if (_loc_2 !== param1)
            {
                this._3351623minY = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minY", _loc_2, param1));
            }
            return;
        }// end function

        public function set percentHeight(param1:Number) : void
        {
            var _loc_2:* = this.percentHeight;
            if (_loc_2 !== param1)
            {
                this._1017587252percentHeight = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "percentHeight", _loc_2, param1));
            }
            return;
        }// end function

        public function get horizontalCenter() : Number
        {
            if (!_horizontalCenter)
            {
                return NaN;
            }
            return _horizontalCenter;
        }// end function

        public function get minWidth() : Number
        {
            return _minWidth;
        }// end function

        public function get targetCoordinateSpace() : DisplayObject
        {
            if (!_targetCoordinateSpace)
            {
                return null;
            }
            return _targetCoordinateSpace;
        }// end function

        public function set width(param1:Number) : void
        {
            var _loc_2:* = this.width;
            if (_loc_2 !== param1)
            {
                this._113126854width = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "width", _loc_2, param1));
            }
            return;
        }// end function

        public function set top(param1:Number) : void
        {
            var _loc_2:* = this.top;
            if (_loc_2 !== param1)
            {
                this._115029top = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "top", _loc_2, param1));
            }
            return;
        }// end function

        public function get maxHeight() : Number
        {
            return _maxHeight;
        }// end function

        public function set minX(param1:Number) : void
        {
            var _loc_2:* = this.minX;
            if (_loc_2 !== param1)
            {
                this._3351622minX = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "minX", _loc_2, param1));
            }
            return;
        }// end function

        private function set _115029top(param1:Number) : void
        {
            if (_top != param1)
            {
                _top = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _1221029593height(param1:Number) : void
        {
            if (_height != param1)
            {
                _height = param1;
                _percentHeight = NaN;
                invalidated = true;
            }
            return;
        }// end function

        public function get maxWidth() : Number
        {
            return _maxWidth;
        }// end function

        public function get width() : Number
        {
            return _width;
        }// end function

        public function get percentHeight() : Number
        {
            if (!_percentHeight)
            {
                return NaN;
            }
            return _percentHeight;
        }// end function

        private function set _133587431minHeight(param1:Number) : void
        {
            if (_minHeight != param1)
            {
                _minHeight = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set verticalCenter(param1:Number) : void
        {
            var _loc_2:* = this.verticalCenter;
            if (_loc_2 !== param1)
            {
                this._926273685verticalCenter = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "verticalCenter", _loc_2, param1));
            }
            return;
        }// end function

        private function set _1017587252percentHeight(param1:Number) : void
        {
            if (_percentHeight != param1)
            {
                _percentHeight = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set maxX(param1:Number) : void
        {
            var _loc_2:* = this.maxX;
            if (_loc_2 !== param1)
            {
                this._3344244maxX = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxX", _loc_2, param1));
            }
            return;
        }// end function

        public function set maxY(param1:Number) : void
        {
            var _loc_2:* = this.maxY;
            if (_loc_2 !== param1)
            {
                this._3344245maxY = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "maxY", _loc_2, param1));
            }
            return;
        }// end function

        public function set x(param1:Number) : void
        {
            var _loc_2:* = this.x;
            if (_loc_2 !== param1)
            {
                this._120x = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "x", _loc_2, param1));
            }
            return;
        }// end function

    }
}
