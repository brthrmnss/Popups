package com.degrafa.geometry.command
{
    import com.degrafa.geometry.utilities.*;
    import flash.geom.*;
    import flash.net.*;

    final public class CommandStackItem extends Object
    {
        private var _y:Number;
        private var _y1:Number;
        private var _cy:Number;
        public var id:String;
        private var _segmentLength:Number = 0;
        var indexInParent:uint;
        private var _cx:Number;
        var parent:CommandStack;
        private var _renderDelegateStart:Array;
        private var _renderDelegateEnd:Array;
        public var type:int;
        private var _lengthInvalidated:Boolean = true;
        private var _invalidated:Boolean = true;
        public var reference:String;
        private var _next:CommandStackItem;
        private var _bounds:Rectangle;
        private var _previous:CommandStackItem;
        private var _x1:Number;
        private var _commandStack:CommandStack;
        private var _delegate:Function;
        private var _x:Number;
        public var skip:Boolean;
        public static const LINE_TO:int = 1;
        public static const MOVE_TO:int = 0;
        public static const CURVE_TO:int = 2;
        public static const COMMAND_STACK:int = 4;
        public static const DELEGATE_TO:int = 3;
        public static const IS_REGISTERED:Boolean = !(registerClassAlias("com.degrafa.geometry.command.CommandStackItem", CommandStackItem) || registerClassAlias("flash.geom.Point", Point) || registerClassAlias("flash.geom.Rectangle", Rectangle));

        public function CommandStackItem(param1:int = 0, param2:Number = NaN, param3:Number = NaN, param4:Number = NaN, param5:Number = NaN, param6:Number = NaN, param7:Number = NaN, param8:CommandStack = null)
        {
            invalidated = true;
            this.type = param1;
            _x = param2;
            _y = param3;
            _x1 = param4;
            _y1 = param5;
            _cx = param6;
            _cy = param7;
            if (param8)
            {
                this.commandStack = param8;
            }
            return;
        }// end function

        public function get y() : Number
        {
            return _y;
        }// end function

        public function get commandStack() : CommandStack
        {
            return _commandStack;
        }// end function

        public function get delegate() : Function
        {
            return _delegate;
        }// end function

        public function set lengthInvalidated(param1:Boolean) : void
        {
            _lengthInvalidated = param1;
            if (_lengthInvalidated != param1)
            {
                _lengthInvalidated = param1;
                if (_lengthInvalidated)
                {
                    parent.lengthInvalidated = param1;
                }
            }
            return;
        }// end function

        public function get invalidated() : Boolean
        {
            return _invalidated;
        }// end function

        public function set delegate(param1:Function) : void
        {
            if (_delegate != param1)
            {
                _delegate = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function curvePointAt(param1:Number, param2:Point = null, param3:Point = null) : Point
        {
            var _loc_4:* = Point.interpolate(control, start, param1);
            var _loc_5:* = Point.interpolate(end, control, param1);
            return Point.interpolate(_loc_5, _loc_4, param1);
        }// end function

        public function get segmentLength() : Number
        {
            if (!_segmentLength || lengthInvalidated)
            {
                switch(type)
                {
                    case CommandStackItem.MOVE_TO:
                    {
                        _segmentLength = 0;
                        break;
                    }
                    case CommandStackItem.LINE_TO:
                    {
                        _segmentLength = lineLength(start, end);
                        break;
                    }
                    case CommandStackItem.CURVE_TO:
                    {
                        _segmentLength = curveLength();
                        break;
                    }
                    case CommandStackItem.COMMAND_STACK:
                    {
                        _segmentLength = commandStack.pathLength;
                        break;
                    }
                    default:
                    {
                        _segmentLength = 0;
                        break;
                        break;
                    }
                }
            }
            return _segmentLength;
        }// end function

        public function set invalidated(param1:Boolean) : void
        {
            _invalidated = param1;
            if (_invalidated != param1)
            {
                _invalidated = param1;
                if (_invalidated)
                {
                    parent.invalidated = _invalidated;
                    lengthInvalidated = _invalidated;
                }
            }
            return;
        }// end function

        private function curveAngleAt(param1:Number, param2:Point = null, param3:Point = null) : Number
        {
            param2 = linePointAt(param1, start, control);
            param3 = linePointAt(param1, control, end);
            return lineAngleAt(param1, param2, param3);
        }// end function

        public function set y(param1:Number) : void
        {
            if (_y != param1)
            {
                _y = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get renderDelegateEnd() : Array
        {
            return _renderDelegateEnd;
        }// end function

        private function lineLength(param1:Point = null, param2:Point = null) : Number
        {
            if (!param1)
            {
                param1 = start;
            }
            if (!param2)
            {
                param2 = end;
            }
            var _loc_3:* = param2.x - param1.x;
            var _loc_4:* = param2.y - param1.y;
            return Math.sqrt(_loc_3 * _loc_3 + _loc_4 * _loc_4);
        }// end function

        public function set x1(param1:Number) : void
        {
            if (_x1 != param1)
            {
                _x1 = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function derive(param1:CommandStackItem) : void
        {
            if (!type)
            {
                type = param1.type;
            }
            if (!x)
            {
                _x = param1.x;
            }
            if (!y)
            {
                _y = param1.y;
            }
            if (!x1)
            {
                _x1 = param1.x1;
            }
            if (!y1)
            {
                _y1 = param1.y1;
            }
            if (!cx)
            {
                _cx = param1.cx;
            }
            if (!cy)
            {
                _cy = param1.cy;
            }
            if (!reference)
            {
                reference = param1.reference;
            }
            invalidated = true;
            return;
        }// end function

        public function get bounds() : Rectangle
        {
            if (invalidated)
            {
                calcBounds();
            }
            return _bounds;
        }// end function

        public function set end(param1:Point) : void
        {
            if (type == 1 || type == 0)
            {
                x = param1.x;
                y = param1.y;
            }
            else
            {
                x1 = param1.x;
                y1 = param1.y;
            }
            return;
        }// end function

        public function get x1() : Number
        {
            return _x1;
        }// end function

        private function curveLength(param1:int = 5, param2:Point = null, param3:Point = null, param4:Point = null) : Number
        {
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_14:Point = null;
            var _loc_15:int = 0;
            if (!param2)
            {
                param2 = start;
            }
            if (!param3)
            {
                param3 = control;
            }
            if (!param4)
            {
                param4 = end;
            }
            var _loc_5:* = param4.x - param2.x;
            var _loc_6:* = param4.y - param2.y;
            var _loc_7:* = _loc_5 == 0 ? (0) : ((param3.x - param2.x) / _loc_5);
            var _loc_8:* = _loc_6 == 0 ? (0) : ((param3.y - param2.y) / _loc_6);
            var _loc_12:Number = 0;
            var _loc_13:* = param2;
            _loc_15 = 1;
            while (_loc_15 < param1)
            {
                
                _loc_11 = _loc_15 / param1;
                _loc_9 = 2 * _loc_11 * (1 - _loc_11);
                _loc_10 = _loc_11 * _loc_11;
                _loc_14 = new Point(param2.x + _loc_5 * (_loc_9 * _loc_7 + _loc_10), param2.y + _loc_6 * (_loc_9 * _loc_8 + _loc_10));
                _loc_12 = _loc_12 + lineLength(_loc_13, _loc_14);
                _loc_13 = _loc_14;
                _loc_15++;
            }
            return _loc_12 + lineLength(_loc_13, param4);
        }// end function

        public function set y1(param1:Number) : void
        {
            if (_y1 != param1)
            {
                _y1 = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set renderDelegateEnd(param1:Array) : void
        {
            if (_renderDelegateEnd != param1)
            {
                _renderDelegateEnd = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set control(param1:Point) : void
        {
            cx = param1.x;
            cy = param1.y;
            return;
        }// end function

        public function get lengthInvalidated() : Boolean
        {
            return _lengthInvalidated;
        }// end function

        public function set renderDelegateStart(param1:Array) : void
        {
            if (_renderDelegateStart != param1)
            {
                _renderDelegateStart = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function linePointAt(param1:Number, param2:Point = null, param3:Point = null) : Point
        {
            if (!param2)
            {
                param2 = start;
            }
            if (!param3)
            {
                param3 = end;
            }
            var _loc_4:* = param3.x - param2.x;
            var _loc_5:* = param3.y - param2.y;
            return new Point(param2.x + _loc_4 * param1, param2.y + _loc_5 * param1);
        }// end function

        public function get transformedLength() : Number
        {
            if (!CommandStack.transMatrix)
            {
                return segmentLength;
            }
            var _loc_1:* = CommandStack.transMatrix;
            if (!_segmentLength || lengthInvalidated)
            {
                switch(type)
                {
                    case CommandStackItem.MOVE_TO:
                    {
                        return 0;
                    }
                    case CommandStackItem.LINE_TO:
                    {
                        return lineLength(_loc_1.transformPoint(start), _loc_1.transformPoint(end));
                    }
                    case CommandStackItem.CURVE_TO:
                    {
                        return curveLength(5, _loc_1.transformPoint(start), _loc_1.transformPoint(control), _loc_1.transformPoint(end));
                    }
                    case CommandStackItem.COMMAND_STACK:
                    {
                        return commandStack.transformedPathLength;
                    }
                    default:
                    {
                        break;
                        break;
                    }
                }
            }
            return 0;
        }// end function

        private function lineAngleAt(param1:Number, param2:Point = null, param3:Point = null) : Number
        {
            if (!param2)
            {
                param2 = start;
            }
            if (!param3)
            {
                param3 = end;
            }
            return Math.atan2(param3.y - param2.y, param3.x - param2.x);
        }// end function

        public function get control() : Point
        {
            return new Point(cx, cy);
        }// end function

        public function get y1() : Number
        {
            return _y1;
        }// end function

        public function segmentAngleAt(param1:Number) : Number
        {
            switch(type)
            {
                case CommandStackItem.MOVE_TO:
                {
                    return 0;
                }
                case CommandStackItem.LINE_TO:
                {
                    return lineAngleAt(param1);
                }
                case CommandStackItem.CURVE_TO:
                {
                    return curveAngleAt(param1);
                }
                case CommandStackItem.COMMAND_STACK:
                {
                    return commandStack.pathAngleAt(param1);
                }
                default:
                {
                    return 0;
                    break;
                }
            }
        }// end function

        public function get start() : Point
        {
            if (_previous)
            {
                if (_previous.skip)
                {
                    return _previous.start;
                }
                return _previous.end;
            }
            else
            {
                return new Point(0, 0);
            }
        }// end function

        public function set next(param1:CommandStackItem) : void
        {
            if (_next != param1)
            {
                _next = param1;
                if (type == CommandStackItem.COMMAND_STACK)
                {
                    commandStack.lastNonCommandStackItem.next = param1;
                }
            }
            return;
        }// end function

        public function get renderDelegateStart() : Array
        {
            return _renderDelegateStart;
        }// end function

        public function segmentPointAt(param1:Number) : Point
        {
            switch(type)
            {
                case CommandStackItem.MOVE_TO:
                {
                    return start.clone();
                }
                case CommandStackItem.LINE_TO:
                {
                    return linePointAt(param1, start, end);
                }
                case CommandStackItem.CURVE_TO:
                {
                    return curvePointAt(param1);
                }
                case CommandStackItem.COMMAND_STACK:
                {
                    return commandStack.pathPointAt(param1);
                }
                default:
                {
                    return null;
                    break;
                }
            }
        }// end function

        public function calcBounds() : void
        {
            var _loc_1:Point = null;
            if (!invalidated)
            {
                return;
            }
            switch(type)
            {
                case CommandStackItem.MOVE_TO:
                {
                    if (isNaN(_x) || isNaN(_y))
                    {
                        _bounds = new Rectangle();
                        skip = true;
                        break;
                    }
                    _bounds = new Rectangle(x, y, 0, 0);
                    break;
                }
                case CommandStackItem.LINE_TO:
                {
                    if (isNaN(_x) || isNaN(_y))
                    {
                        _bounds = new Rectangle();
                        skip = true;
                        break;
                    }
                    _loc_1 = this.start;
                    _bounds = new Rectangle(Math.min(x, _loc_1.x), Math.min(y, _loc_1.y), Math.abs(x - _loc_1.x), Math.abs(y - _loc_1.y));
                    if (!_bounds.width)
                    {
                        _bounds.width = 0.0001;
                    }
                    if (!_bounds.height)
                    {
                        _bounds.height = 0.0001;
                    }
                    break;
                }
                case CommandStackItem.CURVE_TO:
                {
                    if (isNaN(_cx) || isNaN(_cy) || isNaN(_x1) || isNaN(_y1))
                    {
                        _bounds = new Rectangle();
                        skip = true;
                        break;
                    }
                    _loc_1 = this.start;
                    _bounds = GeometryUtils.bezierBounds(_loc_1.x, _loc_1.y, cx, cy, x1, y1).clone();
                    break;
                }
                case CommandStackItem.COMMAND_STACK:
                {
                    _bounds = commandStack.bounds;
                    break;
                }
                default:
                {
                    break;
                }
            }
            invalidated = false;
            return;
        }// end function

        public function set cy(param1:Number) : void
        {
            if (_cy != param1)
            {
                _cy = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set previous(param1:CommandStackItem) : void
        {
            if (_previous != param1)
            {
                _previous = param1;
                if (param1.type == CommandStackItem.COMMAND_STACK)
                {
                    _previous = param1.commandStack.lastNonCommandStackItem;
                }
                if (type == CommandStackItem.COMMAND_STACK && commandStack.length)
                {
                    CommandStackItem(commandStack.source[0]).previous = _previous;
                }
            }
            return;
        }// end function

        public function set x(param1:Number) : void
        {
            if (_x != param1)
            {
                _x = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set cx(param1:Number) : void
        {
            if (_cx != param1)
            {
                _cx = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get next() : CommandStackItem
        {
            return _next;
        }// end function

        public function get cy() : Number
        {
            return _cy;
        }// end function

        public function get previous() : CommandStackItem
        {
            return _previous;
        }// end function

        public function get x() : Number
        {
            return _x;
        }// end function

        public function set commandStack(param1:CommandStack) : void
        {
            if (_commandStack != param1)
            {
                _commandStack = param1;
                param1.parent = this;
                invalidated = true;
            }
            return;
        }// end function

        public function get cx() : Number
        {
            return _cx;
        }// end function

        public function get end() : Point
        {
            return new Point(type == 1 || type == 0 ? (_x) : (_x1), type == 1 || type == 0 ? (_y) : (_y1));
        }// end function

    }
}
