package com.degrafa.geometry
{
    import com.degrafa.geometry.command.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class RoundedRectangleComplex extends Geometry implements IGeometry
    {
        private var _x:Number;
        private var bottomRightCorner1:CommandStackItem;
        private var bottomRightCorner2:CommandStackItem;
        private var leftLine:CommandStackItem;
        private var _bottomRightRadius:Number;
        private var _permitCornerInversion:uint;
        private var _topLeftRadius:Number;
        private var topRightCorner1:CommandStackItem;
        private var topRightCorner2:CommandStackItem;
        private var rightLine:CommandStackItem;
        private var bottomLine:CommandStackItem;
        private var _width:Number;
        private var bottomLeftCorner1:CommandStackItem;
        private var bottomLeftCorner2:CommandStackItem;
        private var _height:Number;
        private var startPoint:CommandStackItem;
        private var _topRightRadius:Number;
        private var topLeftCorner2:CommandStackItem;
        private var _bottomLeftRadius:Number;
        private var topLine:CommandStackItem;
        private var topLeftCorner1:CommandStackItem;
        private var _y:Number;
        private static const TRIG:Number = 0.414214;

        public function RoundedRectangleComplex(param1:Number = NaN, param2:Number = NaN, param3:Number = NaN, param4:Number = NaN, param5:Number = NaN, param6:Number = NaN, param7:Number = NaN, param8:Number = NaN)
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
            if (param5)
            {
                this.topLeftRadius = param5;
            }
            if (param6)
            {
                this.topRightRadius = param6;
            }
            if (param7)
            {
                this.bottomLeftRadius = param7;
            }
            if (param8)
            {
                this.bottomRightRadius = param8;
            }
            return;
        }// end function

        public function set topRightRadius(param1:Number) : void
        {
            var _loc_2:* = this.topRightRadius;
            if (_loc_2 !== param1)
            {
                this._1764836665topRightRadius = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topRightRadius", _loc_2, param1));
            }
            return;
        }// end function

        public function get bottomLeftRadius() : Number
        {
            if (!_bottomLeftRadius)
            {
                return 0;
            }
            return _bottomLeftRadius;
        }// end function

        override public function preDraw() : void
        {
            var _loc_1:CommandStackItem = null;
            if (invalidated)
            {
                if (!commandStack.length)
                {
                    _loc_1 = commandStack.addItem(new CommandStackItem(CommandStackItem.DELEGATE_TO));
                    _loc_1.delegate = updateCommandStack;
                    startPoint = commandStack.addItem(new CommandStackItem(CommandStackItem.MOVE_TO));
                    topLine = commandStack.addItem(new CommandStackItem(CommandStackItem.LINE_TO));
                    topRightCorner1 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                    topRightCorner2 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                    rightLine = commandStack.addItem(new CommandStackItem(CommandStackItem.LINE_TO));
                    bottomRightCorner1 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                    bottomRightCorner2 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                    bottomLine = commandStack.addItem(new CommandStackItem(CommandStackItem.LINE_TO));
                    bottomLeftCorner1 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                    bottomLeftCorner2 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                    leftLine = commandStack.addItem(new CommandStackItem(CommandStackItem.LINE_TO));
                    topLeftCorner1 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                    topLeftCorner2 = commandStack.addItem(new CommandStackItem(CommandStackItem.CURVE_TO));
                }
                updateCommandStack();
                invalidated = false;
            }
            return;
        }// end function

        public function set bottomLeftRadius(param1:Number) : void
        {
            var _loc_2:* = this.bottomLeftRadius;
            if (_loc_2 !== param1)
            {
                this._1770689540bottomLeftRadius = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomLeftRadius", _loc_2, param1));
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

        public function set _120x(param1:Number) : void
        {
            if (_x != param1)
            {
                _x = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set bottomRightRadius(param1:Number) : void
        {
            var _loc_2:* = this.bottomRightRadius;
            if (_loc_2 !== param1)
            {
                this._1194415453bottomRightRadius = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomRightRadius", _loc_2, param1));
            }
            return;
        }// end function

        private function set _2143243950topLeftRadius(param1:Number) : void
        {
            if (_topLeftRadius != param1)
            {
                _topLeftRadius = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function set _1194415453bottomRightRadius(param1:Number) : void
        {
            if (_bottomRightRadius != param1)
            {
                _bottomRightRadius = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get bottomRightRadius() : Number
        {
            if (!_bottomRightRadius)
            {
                return 0;
            }
            return _bottomRightRadius;
        }// end function

        override public function get height() : Number
        {
            if (!_height)
            {
                return hasLayout ? (1) : (0);
            }
            return _height;
        }// end function

        public function get permitCornerInversion() : Boolean
        {
            return _permitCornerInversion ? (true) : (false);
        }// end function

        public function get topLeftRadius() : Number
        {
            if (!_topLeftRadius)
            {
                return 0;
            }
            return _topLeftRadius;
        }// end function

        public function get topRightRadius() : Number
        {
            if (!_topRightRadius)
            {
                return 0;
            }
            return _topRightRadius;
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

        override public function get bounds() : Rectangle
        {
            return new Rectangle(x, y, width, height);
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

        override public function get width() : Number
        {
            if (!_width)
            {
                return hasLayout ? (1) : (0);
            }
            return _width;
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
                        _width = _layoutRectangle.width;
                        _height = _layoutRectangle.height;
                        _x = isNaN(_x) ? (_layoutRectangle.x) : (_x);
                        _y = isNaN(_y) ? (_layoutRectangle.y) : (_y);
                        invalidated = true;
                    }
                }
            }
            return;
        }// end function

        private function set _134970461permitCornerInversion(param1:Boolean) : void
        {
            var _loc_2:* = !_permitCornerInversion;
            param1 = !_permitCornerInversion;
            if (_loc_2)
            {
                _permitCornerInversion = param1 ? (1) : (0);
                invalidated = true;
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

        public function set permitCornerInversion(param1:Boolean) : void
        {
            var _loc_2:* = this.permitCornerInversion;
            if (_loc_2 !== param1)
            {
                this._134970461permitCornerInversion = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "permitCornerInversion", _loc_2, param1));
            }
            return;
        }// end function

        public function set topLeftRadius(param1:Number) : void
        {
            var _loc_2:* = this.topLeftRadius;
            if (_loc_2 !== param1)
            {
                this._2143243950topLeftRadius = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topLeftRadius", _loc_2, param1));
            }
            return;
        }// end function

        private function updateCommandStack(param1:CommandStack = null, param2:CommandStackItem = null, param3:Graphics = null, param4:int = 0) : CommandStackItem
        {
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_26:Number = NaN;
            var _loc_27:Number = NaN;
            var _loc_28:Number = NaN;
            var _loc_29:Number = NaN;
            var _loc_30:Number = NaN;
            var _loc_31:Number = NaN;
            var _loc_32:Number = NaN;
            var _loc_33:Number = NaN;
            var _loc_34:Number = NaN;
            var _loc_35:Boolean = false;
            var _loc_36:Number = NaN;
            if (hasLayout && param1)
            {
                CommandStack.transMatrix = CommandStack.currentTransformMatrix;
                _loc_5 = layoutRectangle.x;
                _loc_6 = layoutRectangle.y;
                _loc_7 = layoutRectangle.width;
                _loc_8 = layoutRectangle.height;
            }
            else
            {
                _loc_5 = this.x;
                _loc_6 = this.y;
                _loc_7 = this.width;
                _loc_8 = this.height;
            }
            var _loc_9:* = Math.min(_loc_7, _loc_8) * 0.5;
            var _loc_10:* = Math.abs(this.topLeftRadius) < _loc_9 ? (this.topLeftRadius) : (_loc_9 * (this.topLeftRadius < 0 ? (-1) : (1)));
            var _loc_11:* = Math.abs(this.topRightRadius) < _loc_9 ? (this.topRightRadius) : (_loc_9 * (this.topRightRadius < 0 ? (-1) : (1)));
            var _loc_12:* = Math.abs(this.bottomLeftRadius) < _loc_9 ? (this.bottomLeftRadius) : (_loc_9 * (this.bottomLeftRadius < 0 ? (-1) : (1)));
            var _loc_13:* = Math.abs(this.bottomRightRadius) < _loc_9 ? (this.bottomRightRadius) : (_loc_9 * (this.bottomRightRadius < 0 ? (-1) : (1)));
            if (!_permitCornerInversion)
            {
                if (_loc_10 < 0)
                {
                    _loc_10 = 0;
                }
                if (_loc_11 < 0)
                {
                    _loc_11 = 0;
                }
                if (_loc_12 < 0)
                {
                    _loc_12 = 0;
                }
                if (_loc_13 < 0)
                {
                    _loc_13 = 0;
                }
            }
            var _loc_14:Number = 0;
            var _loc_15:Number = 0;
            if (stroke && stroke.weight < 4)
            {
                _loc_34 = 0.15;
                var _loc_37:* = Math.abs(_loc_5 - Math.round(_loc_5));
                _loc_36 = Math.abs(_loc_5 - Math.round(_loc_5));
                if (stroke.weight != 2 && _loc_37 < _loc_34)
                {
                    _loc_14 = (_loc_34 - _loc_36) * (_loc_35 ? (-1) : (1));
                    _loc_5 = _loc_5 + _loc_14;
                }
                else if (stroke.weight == 2)
                {
                    _loc_35 = _loc_5 < Math.round(_loc_5 * 2) / 2;
                    var _loc_37:* = Math.abs(_loc_5 - Math.round(_loc_5 * 2) / 2);
                    _loc_36 = Math.abs(_loc_5 - Math.round(_loc_5 * 2) / 2);
                    if (_loc_37 < _loc_34)
                    {
                        _loc_14 = (_loc_34 - _loc_36) * (_loc_35 ? (-1) : (1));
                        _loc_5 = _loc_5 + _loc_14;
                    }
                }
                _loc_35 = _loc_6 < Math.round(_loc_6);
                var _loc_37:* = Math.abs(_loc_6 - Math.round(_loc_6));
                _loc_36 = Math.abs(_loc_6 - Math.round(_loc_6));
                if (stroke.weight != 2 && _loc_37 < _loc_34)
                {
                    _loc_15 = (_loc_34 - _loc_36) * (_loc_35 ? (-1) : (1));
                    _loc_6 = _loc_6 + _loc_15;
                }
                else if (stroke.weight == 2)
                {
                    var _loc_37:* = Math.abs(_loc_6 - Math.round(_loc_6 * 2) / 2);
                    _loc_36 = Math.abs(_loc_6 - Math.round(_loc_6 * 2) / 2);
                    if (_loc_37 < _loc_34)
                    {
                        _loc_35 = _loc_6 < Math.round(_loc_6 * 2) / 2;
                        _loc_15 = (_loc_34 - _loc_36) * (_loc_35 ? (-1) : (1));
                        _loc_6 = _loc_6 + _loc_14;
                    }
                }
            }
            var _loc_16:* = _loc_6 + _loc_8 - _loc_14;
            var _loc_17:* = _loc_5 + _loc_7 - _loc_15;
            var _loc_18:* = _loc_5 + _loc_7 - _loc_15 - Math.abs(_loc_11);
            var _loc_19:* = _loc_17 - Math.abs(_loc_13);
            var _loc_20:* = _loc_5 + Math.abs(_loc_10);
            var _loc_21:* = _loc_5 + Math.abs(_loc_12);
            var _loc_22:* = _loc_6 + Math.abs(_loc_10);
            var _loc_23:* = _loc_6 + Math.abs(_loc_11);
            var _loc_24:* = _loc_16 - Math.abs(_loc_12);
            var _loc_25:* = _loc_16 - Math.abs(_loc_13);
            startPoint.x = _loc_20;
            startPoint.y = _loc_6;
            topLine.x = _loc_18;
            topLine.y = _loc_6;
            rightLine.x = _loc_17;
            rightLine.y = _loc_25;
            bottomLine.x = _loc_21;
            bottomLine.y = _loc_16;
            leftLine.x = _loc_5;
            leftLine.y = _loc_22;
            var _loc_37:* = _loc_11 ? (false) : (true);
            topRightCorner2.skip = _loc_11 ? (false) : (true);
            topRightCorner1.skip = _loc_37;
            var _loc_37:* = _loc_13 ? (false) : (true);
            bottomRightCorner2.skip = _loc_13 ? (false) : (true);
            bottomRightCorner1.skip = _loc_37;
            var _loc_37:* = _loc_12 ? (false) : (true);
            bottomLeftCorner2.skip = _loc_12 ? (false) : (true);
            bottomLeftCorner1.skip = _loc_37;
            var _loc_37:* = _loc_10 ? (false) : (true);
            topLeftCorner2.skip = _loc_10 ? (false) : (true);
            topLeftCorner1.skip = _loc_37;
            if (_loc_11)
            {
                _loc_26 = Math.SQRT1_2 * _loc_11;
                _loc_27 = TRIG * _loc_11;
                if (_loc_11 < 0)
                {
                    _loc_28 = _loc_18;
                    _loc_29 = _loc_6 - _loc_27;
                    _loc_32 = _loc_17 + _loc_26;
                    _loc_33 = _loc_6 - _loc_26;
                    _loc_30 = _loc_17 + _loc_27;
                    _loc_31 = _loc_23;
                }
                else
                {
                    _loc_28 = _loc_18 + _loc_27;
                    _loc_29 = _loc_6;
                    _loc_30 = _loc_17;
                    _loc_31 = _loc_23 - _loc_27;
                    _loc_32 = _loc_18 + _loc_26;
                    _loc_33 = _loc_23 - _loc_26;
                }
                topRightCorner1.cx = _loc_28;
                topRightCorner1.cy = _loc_29;
                topRightCorner1.x1 = _loc_32;
                topRightCorner1.y1 = _loc_33;
                topRightCorner2.cx = _loc_30;
                topRightCorner2.cy = _loc_31;
                topRightCorner2.x1 = _loc_17;
                topRightCorner2.y1 = _loc_23;
            }
            if (_loc_13)
            {
                _loc_26 = Math.SQRT1_2 * _loc_13;
                _loc_27 = TRIG * _loc_13;
                if (_loc_13 < 0)
                {
                    _loc_28 = _loc_17 + _loc_27;
                    _loc_29 = _loc_25;
                    _loc_32 = _loc_17 + _loc_26;
                    _loc_33 = _loc_16 + _loc_26;
                    _loc_30 = _loc_19;
                    _loc_31 = _loc_16 + _loc_27;
                }
                else
                {
                    _loc_28 = _loc_17;
                    _loc_29 = _loc_25 + _loc_27;
                    _loc_30 = _loc_19 + _loc_27;
                    _loc_31 = _loc_16;
                    _loc_32 = _loc_19 + _loc_26;
                    _loc_33 = _loc_25 + _loc_26;
                }
                bottomRightCorner1.cx = _loc_28;
                bottomRightCorner1.cy = _loc_29;
                bottomRightCorner1.x1 = _loc_32;
                bottomRightCorner1.y1 = _loc_33;
                bottomRightCorner2.cx = _loc_30;
                bottomRightCorner2.cy = _loc_31;
                bottomRightCorner2.x1 = _loc_19;
                bottomRightCorner2.y1 = _loc_16;
            }
            if (_loc_12)
            {
                _loc_26 = Math.SQRT1_2 * _loc_12;
                _loc_27 = TRIG * _loc_12;
                if (_loc_12 < 0)
                {
                    _loc_28 = _loc_21;
                    _loc_29 = _loc_16 + _loc_27;
                    _loc_32 = _loc_5 - _loc_26;
                    _loc_33 = _loc_16 + _loc_26;
                    _loc_30 = _loc_5 - _loc_27;
                    _loc_31 = _loc_24;
                }
                else
                {
                    _loc_28 = _loc_21 - _loc_27;
                    _loc_29 = _loc_16;
                    _loc_30 = _loc_5;
                    _loc_31 = _loc_24 + _loc_27;
                    _loc_32 = _loc_21 - _loc_26;
                    _loc_33 = _loc_24 + _loc_26;
                }
                bottomLeftCorner1.cx = _loc_28;
                bottomLeftCorner1.cy = _loc_29;
                bottomLeftCorner1.x1 = _loc_32;
                bottomLeftCorner1.y1 = _loc_33;
                bottomLeftCorner2.cx = _loc_30;
                bottomLeftCorner2.cy = _loc_31;
                bottomLeftCorner2.x1 = _loc_5;
                bottomLeftCorner2.y1 = _loc_24;
            }
            if (_loc_10)
            {
                _loc_26 = Math.SQRT1_2 * _loc_10;
                _loc_27 = TRIG * _loc_10;
                if (_loc_10 < 0)
                {
                    _loc_28 = _loc_5 - _loc_27;
                    _loc_29 = _loc_22;
                    _loc_32 = _loc_5 - _loc_26;
                    _loc_33 = _loc_6 - _loc_26;
                    _loc_30 = _loc_20;
                    _loc_31 = _loc_6 - _loc_27;
                }
                else
                {
                    _loc_28 = _loc_5;
                    _loc_29 = _loc_22 - _loc_27;
                    _loc_30 = _loc_20 - _loc_27;
                    _loc_31 = _loc_6;
                    _loc_32 = _loc_20 - _loc_26;
                    _loc_33 = _loc_22 - _loc_26;
                }
                topLeftCorner1.cx = _loc_28;
                topLeftCorner1.cy = _loc_29;
                topLeftCorner1.x1 = _loc_32;
                topLeftCorner1.y1 = _loc_33;
                topLeftCorner2.cx = _loc_30;
                topLeftCorner2.cy = _loc_31;
                topLeftCorner2.x1 = _loc_20;
                topLeftCorner2.y1 = _loc_6;
            }
            return commandStack.source[0];
        }// end function

        public function set derive(param1:RoundedRectangleComplex) : void
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
            if (!_bottomLeftRadius)
            {
                _bottomLeftRadius = param1.bottomLeftRadius;
            }
            if (!_bottomRightRadius)
            {
                _bottomRightRadius = param1.bottomRightRadius;
            }
            if (!_topLeftRadius)
            {
                _topLeftRadius = param1.topLeftRadius;
            }
            if (!_topRightRadius)
            {
                _topRightRadius = param1.topRightRadius;
            }
            if (isNaN(_permitCornerInversion))
            {
                _permitCornerInversion = param1.permitCornerInversion ? (1) : (0);
            }
            return;
        }// end function

        private function set _1764836665topRightRadius(param1:Number) : void
        {
            if (_topRightRadius != param1)
            {
                _topRightRadius = param1;
                invalidated = true;
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

        public function set _3076010data(param1:Object) : void
        {
            var _loc_2:Array = null;
            if (super.data != param1)
            {
                super.data = param1;
                _loc_2 = param1.split(" ");
                if (_loc_2.length == 8)
                {
                    _x = _loc_2[0];
                    _y = _loc_2[1];
                    _width = _loc_2[2];
                    _height = _loc_2[3];
                    _topLeftRadius = _loc_2[4];
                    _topRightRadius = _loc_2[5];
                    _bottomLeftRadius = _loc_2[6];
                    _bottomRightRadius = _loc_2[7];
                    invalidated = true;
                }
            }
            return;
        }// end function

        private function set _1770689540bottomLeftRadius(param1:Number) : void
        {
            if (_bottomLeftRadius != param1)
            {
                _bottomLeftRadius = param1;
                invalidated = true;
            }
            return;
        }// end function

    }
}
