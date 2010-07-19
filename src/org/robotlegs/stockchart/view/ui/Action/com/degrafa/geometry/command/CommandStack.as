package com.degrafa.geometry.command
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.core.collections.*;
    import com.degrafa.decorators.*;
    import com.degrafa.geometry.*;
    import com.degrafa.geometry.display.*;
    import com.degrafa.geometry.utilities.*;
    import com.degrafa.transform.*;
    import flash.display.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.net.*;

    final public class CommandStack extends Object
    {
        private var hasmask:Boolean;
        private var _container:Sprite;
        private var lineTo:Function;
        private var _pathLength:Number = 0;
        public var source:Array;
        private var hasRenderDecoration:Boolean;
        private var hasfilters:Boolean;
        public var parent:CommandStackItem;
        private var moveTo:Function;
        private var _fxShape:Shape;
        private var _original:Sprite;
        public var owner:Geometry;
        private var _maskRender:Shape;
        private var _globalRenderDelegateStart:Array;
        private var _invalidated:Boolean = true;
        private var curveTo:Function;
        private var _transformedPathLength:Number = 0;
        private var isComp:Boolean;
        private var _lengthInvalidated:Boolean = true;
        private var _bounds:Rectangle;
        private var _cursor:DegrafaCursor;
        private var _globalRenderDelegateEnd:Array;
        public static var transMatrix:Matrix = new Matrix();
        private static var alphaStack:Array = [];
        public static var currentStroke:IGraphicsStroke;
        public static var currentTransformMatrix:Matrix = new Matrix();
        private static var transCP:Point = new Point();
        public static var currentFill:IGraphicsFill;
        private static var _cacheable:Array = ["alphaStack", "currentContext", "currentFill", "currentLayoutMatrix", "currentStroke", "currentTransformMatrix", "transMatrix"];
        public static var currentLayoutMatrix:Matrix = new Matrix();
        private static var transXY:Point = new Point();
        private static var ignorePaint:Array;
        public static var currentContext:Graphics;
        public static const IS_REGISTERED:Boolean = !registerClassAlias("com.degrafa.geometry.command.CommandStack", CommandStack);

        public function CommandStack(param1:Geometry = null)
        {
            source = [];
            _bounds = new Rectangle();
            this.owner = param1;
            return;
        }// end function

        public function pathAngleAt(param1:Number) : Number
        {
            var curLength:Number;
            var item:CommandStackItem;
            var firstSegment:CommandStackItem;
            var t:* = param1;
            if (!source.length)
            {
                return 0;
            }
            t = cleant(t);
            curLength;
            if (t == 0)
            {
                firstSegment = firstSegmentWithLength;
                curLength = firstSegment.segmentLength;
                return firstSegment.segmentAngleAt(t);
            }
            if (t == 1)
            {
                return lastSegmentWithLength.segmentAngleAt(t);
            }
            var tLength:* = t * pathLength;
            var lastLength:Number;
            var n:* = source.length;
            var _loc_3:int = 0;
            var _loc_4:* = source;
            while (_loc_4 in _loc_3)
            {
                
                item = _loc_4[_loc_3];
                var _loc_5:* = item;
                with (item)
                {
                    if (type != 0)
                    {
                        curLength = curLength + segmentLength;
                        break;
                    }
                }
                continue;
                if (tLength <= curLength)
                {
                    return segmentAngleAt((tLength - lastLength) / segmentLength);
                }
                lastLength = ;
            }
            return 0;
        }// end function

        public function addCubicBezierTo(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:int = 1) : Array
        {
            return GeometryUtils.cubicToQuadratic(param1, param2, param3, param4, param5, param6, param7, param8, 1, this);
        }// end function

        public function pathPointAt(param1:Number) : Point
        {
            var curLength:Number;
            var item:CommandStackItem;
            var firstSegment:CommandStackItem;
            var t:* = param1;
            if (!source.length)
            {
                return new Point(0, 0);
            }
            t = cleant(t);
            curLength;
            if (t == 0)
            {
                firstSegment = firstSegmentWithLength;
                curLength = firstSegment.segmentLength;
                return adjustPointToLayoutAndTransform(firstSegment.segmentPointAt(t));
            }
            if (t == 1)
            {
                return adjustPointToLayoutAndTransform(lastSegmentWithLength.segmentPointAt(t));
            }
            var tLength:* = t * pathLength;
            var lastLength:Number;
            var n:* = source.length;
            var _loc_3:int = 0;
            var _loc_4:* = source;
            while (_loc_4 in _loc_3)
            {
                
                item = _loc_4[_loc_3];
                var _loc_5:* = item;
                with (item)
                {
                    if (type != 0)
                    {
                        curLength = curLength + segmentLength;
                        break;
                    }
                }
                continue;
                if (tLength <= curLength)
                {
                    return adjustPointToLayoutAndTransform(segmentPointAt((tLength - lastLength) / segmentLength));
                }
                lastLength = ;
            }
            return new Point(0, 0);
        }// end function

        public function set globalRenderDelegateStart(param1:Array) : void
        {
            if (_globalRenderDelegateStart != param1)
            {
                _globalRenderDelegateStart = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function set lengthInvalidated(param1:Boolean) : void
        {
            if (_lengthInvalidated != param1)
            {
                _lengthInvalidated = param1;
            }
            return;
        }// end function

        public function get invalidated() : Boolean
        {
            return _invalidated;
        }// end function

        public function set invalidated(param1:Boolean) : void
        {
            if (_invalidated != param1)
            {
                _invalidated = param1;
                if (_invalidated)
                {
                    lengthInvalidated = true;
                }
            }
            return;
        }// end function

        private function updateToFilterRectangle(param1:Rectangle, param2:DisplayObject) : Rectangle
        {
            var _loc_4:BitmapFilter = null;
            var _loc_3:* = new BitmapData(param1.width, param1.height, true, 0);
            for each (_loc_4 in owner.filters)
            {
                
                param1 = param1.union(_loc_3.generateFilterRect(param1, _loc_4));
            }
            return param1;
        }// end function

        public function get firstSegmentWithLength() : CommandStackItem
        {
            var _loc_1:CommandStackItem = null;
            for each (_loc_1 in source)
            {
                
                switch(_loc_1.type)
                {
                    case 1:
                    case 2:
                    {
                        return _loc_1;
                    }
                    case 4:
                    {
                        return _loc_1.commandStack.firstSegmentWithLength;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return source[0];
        }// end function

        public function getItem(param1:int) : CommandStackItem
        {
            return source[param1];
        }// end function

        public function addLineTo(param1:Number, param2:Number) : CommandStackItem
        {
            var _loc_3:* = source.push(new CommandStackItem(CommandStackItem.LINE_TO, param1, param2, NaN, NaN, NaN, NaN)) - 1;
            updateItemRelations(source[_loc_3], _loc_3);
            source[_loc_3].indexInParent = _loc_3;
            source[_loc_3].parent = this;
            invalidated = true;
            return source[_loc_3];
        }// end function

        private function processDelegateArray(param1:Array, param2:CommandStackItem, param3:Graphics, param4:int) : CommandStackItem
        {
            var _loc_5:Function = null;
            for each (_loc_5 in param1)
            {
                
                param2 = this._loc_5(this, param2, param3, param4);
            }
            return param2;
        }// end function

        public function get lastNonCommandStackItem() : CommandStackItem
        {
            var _loc_1:* = source.length - 1;
            while (_loc_1 > 0)
            {
                
                if (source[_loc_1].type != CommandStackItem.COMMAND_STACK)
                {
                    return source[_loc_1];
                }
                return CommandStackItem(source[_loc_1]).commandStack.lastNonCommandStackItem;
            }
            return source[0];
        }// end function

        public function addMoveTo(param1:Number, param2:Number) : CommandStackItem
        {
            var _loc_3:* = source.push(new CommandStackItem(CommandStackItem.MOVE_TO, param1, param2, NaN, NaN, NaN, NaN)) - 1;
            updateItemRelations(source[_loc_3], _loc_3);
            source[_loc_3].indexInParent = _loc_3;
            return source[_loc_3];
        }// end function

        private function delegateGraphicsCall(param1:String, param2:Graphics, param3:Number = 0, param4:Number = 0, param5:Number = 0, param6:Number = 0, param7:Number = 0, param8:Number = 0)
        {
            var _loc_9:IRenderDecorator = null;
            for each (_loc_9 in owner.decorators)
            {
                
                switch(param1)
                {
                    case "moveTo":
                    {
                        return _loc_9.moveTo(param3, param4, param2);
                    }
                    case "lineTo":
                    {
                        return _loc_9.lineTo(param3, param4, param2);
                    }
                    case "curveTo":
                    {
                        return _loc_9.curveTo(param5, param6, param7, param8, param2);
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            return;
        }// end function

        private function renderCommandStack(param1:Graphics, param2:Rectangle, param3:DegrafaCursor = null) : void
        {
            var item:CommandStackItem;
            var graphics:* = param1;
            var rc:* = param2;
            var cursor:* = param3;
            while (cursor.moveNext())
            {
                
                item = cursor.current;
                if (item.renderDelegateStart)
                {
                    item = processDelegateArray(item.renderDelegateStart, item, graphics, cursor.currentIndex);
                }
                if (_globalRenderDelegateStart)
                {
                    item = processDelegateArray(_globalRenderDelegateStart, item, graphics, cursor.currentIndex);
                }
                if (item.skip)
                {
                    continue;
                }
                var _loc_5:* = item;
                with (item)
                {
                    switch(type)
                    {
                        case CommandStackItem.MOVE_TO:
                        {
                            if (transMatrix)
                            {
                                transXY.x = x;
                                transXY.y = y;
                                transXY = transMatrix.transformPoint(transXY);
                                if (hasRenderDecoration)
                                {
                                    delegateGraphicsCall("moveTo", graphics, transXY.x, transXY.y);
                                }
                                else
                                {
                                    moveTo(transXY.x, transXY.y);
                                }
                            }
                            else if (hasRenderDecoration)
                            {
                                delegateGraphicsCall("moveTo", graphics, x, y);
                            }
                            else
                            {
                                moveTo(x, y);
                            }
                            break;
                        }
                        case CommandStackItem.LINE_TO:
                        {
                            if (transMatrix)
                            {
                                transXY.x = x;
                                transXY.y = y;
                                transXY = transMatrix.transformPoint(transXY);
                                if (hasRenderDecoration)
                                {
                                    delegateGraphicsCall("lineTo", graphics, transXY.x, transXY.y);
                                }
                                else
                                {
                                    lineTo(transXY.x, transXY.y);
                                }
                            }
                            else if (hasRenderDecoration)
                            {
                                delegateGraphicsCall("lineTo", graphics, x, y);
                            }
                            else
                            {
                                lineTo(x, y);
                            }
                            break;
                        }
                        case CommandStackItem.CURVE_TO:
                        {
                            if (transMatrix)
                            {
                                transXY.x = x1;
                                transXY.y = y1;
                                transCP.x = cx;
                                transCP.y = cy;
                                transXY = transMatrix.transformPoint(transXY);
                                transCP = transMatrix.transformPoint(transCP);
                                if (hasRenderDecoration)
                                {
                                    delegateGraphicsCall("curveTo", graphics, 0, 0, transCP.x, transCP.y, transXY.x, transXY.y);
                                }
                                else
                                {
                                    curveTo(transCP.x, transCP.y, transXY.x, transXY.y);
                                }
                            }
                            else if (hasRenderDecoration)
                            {
                                delegateGraphicsCall("curveTo", graphics, 0, 0, cx, cy, x1, y1);
                            }
                            else
                            {
                                curveTo(cx, cy, x1, y1);
                            }
                            break;
                        }
                        case CommandStackItem.DELEGATE_TO:
                        {
                            item.delegate(this, item, graphics, cursor.currentIndex);
                            break;
                        }
                        case CommandStackItem.COMMAND_STACK:
                        {
                            renderCommandStack(graphics, rc, new DegrafaCursor(commandStack.source));
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                }
                if (item.renderDelegateEnd)
                {
                    item = processDelegateArray(item.renderDelegateEnd, item, graphics, cursor.currentIndex);
                }
                if (_globalRenderDelegateEnd)
                {
                    item = processDelegateArray(_globalRenderDelegateEnd, item, graphics, cursor.currentIndex);
                }
            }
            return;
        }// end function

        public function get bounds() : Rectangle
        {
            var _loc_1:CommandStackItem = null;
            if (!invalidated)
            {
                return _bounds;
            }
            _bounds.setEmpty();
            for each (_loc_1 in source)
            {
                
                if (_loc_1.bounds)
                {
                    _bounds = _bounds.union(_loc_1.bounds);
                }
            }
            invalidated = false;
            if (_bounds.height != 0.0001 && _bounds.height != int(_bounds.height))
            {
                _bounds.height = int(_bounds.height * 10000) / 10000;
            }
            if (_bounds.width != 0.0001 && _bounds.width != int(_bounds.width))
            {
                _bounds.width = int(_bounds.width * 10000) / 10000;
            }
            if (_bounds.isEmpty())
            {
                invalidated = true;
            }
            return _bounds;
        }// end function

        public function get globalRenderDelegateEnd() : Array
        {
            return _globalRenderDelegateEnd ? (_globalRenderDelegateEnd) : (null);
        }// end function

        public function addCommandStack(param1:CommandStack) : CommandStackItem
        {
            var _loc_2:* = source.push(new CommandStackItem(CommandStackItem.COMMAND_STACK, NaN, NaN, NaN, NaN, NaN, NaN, param1)) - 1;
            updateItemRelations(source[_loc_2], _loc_2);
            source[_loc_2].indexInParent = _loc_2;
            source[_loc_2].parent = this;
            invalidated = true;
            return source[_loc_2];
        }// end function

        public function addItemAt(param1:CommandStackItem, param2:int = -1) : CommandStackItem
        {
            var _loc_3:* = param2;
            if (_loc_3 == -1)
            {
                _loc_3 = source.push(param1) - 1;
            }
            else
            {
                source.splice(_loc_3, 0, param1);
                _loc_3 = _loc_3 + -1;
            }
            updateItemRelations(source[_loc_3], _loc_3);
            param1.indexInParent = _loc_3;
            param1.parent = this;
            invalidated = true;
            return source[_loc_3];
        }// end function

        public function get lengthInvalidated() : Boolean
        {
            return _lengthInvalidated;
        }// end function

        public function draw(param1:Graphics, param2:Rectangle) : Boolean
        {
            var _loc_3:DisplayObject = null;
            var _loc_4:DisplayObject = null;
            var _loc_5:Matrix = null;
            var _loc_6:Matrix = null;
            var _loc_7:Matrix = null;
            var _loc_8:Matrix = null;
            var _loc_9:* = owner is GeometryComposition && (owner.hasFilters || owner.mask);
            isComp = owner is GeometryComposition && (owner.hasFilters || owner.mask);
            if (!_loc_9)
            {
                if (source.length == 0 && !(owner is IDisplayObjectProxy))
                {
                    return false;
                }
            }
            currentContext = param1;
            predraw();
            if (owner is IDisplayObjectProxy)
            {
                if (!IDisplayObjectProxy(owner).displayObject)
                {
                    return false;
                }
                _loc_3 = IDisplayObjectProxy(owner).displayObject;
                if (owner.hasFilters)
                {
                    _loc_3.filters = owner.filters;
                }
                else if (_loc_3.filters.length)
                {
                    _loc_3.filters = [];
                }
                if (transMatrix && (IDisplayObjectProxy(owner).transformBeforeRender || owner._layoutMatrix && IDisplayObjectProxy(owner).layoutMode == "scale"))
                {
                    if (Sprite(_loc_3).numChildren != 0)
                    {
                        _loc_4 = Sprite(_loc_3).getChildAt(0);
                        if (!IDisplayObjectProxy(owner).transformBeforeRender)
                        {
                            _loc_4.transform.matrix = CommandStack.currentLayoutMatrix;
                        }
                        else if (IDisplayObjectProxy(owner).layoutMode == "scale")
                        {
                            _loc_4.transform.matrix = CommandStack.transMatrix;
                        }
                        else if (owner._layoutMatrix)
                        {
                            _loc_5 = owner._layoutMatrix.clone();
                            _loc_5.a = 1;
                            _loc_5.d = 1;
                            _loc_5.concat(CommandStack.currentTransformMatrix);
                            _loc_4.transform.matrix = _loc_5;
                        }
                        else
                        {
                            _loc_4.transform.matrix = CommandStack.currentTransformMatrix;
                        }
                    }
                }
                if (!ignorePaint)
                {
                    owner.initStroke(param1, param2);
                }
                if (!ignorePaint)
                {
                    owner.initFill(param1, param2);
                }
                renderBitmapDatatoContext(IDisplayObjectProxy(owner).displayObject, param1, !IDisplayObjectProxy(owner).transformBeforeRender, param2);
                return false;
            }
            else
            {
                _cursor = new DegrafaCursor(source);
                hasmask = owner.mask != null;
                hasfilters = owner.hasFilters;
                if (hasfilters || hasmask)
                {
                    if (!_fxShape)
                    {
                        _fxShape = new Shape();
                        _container = new Sprite();
                        _original = new Sprite();
                        _original.addChild(_fxShape);
                        _container.addChild(_original);
                    }
                    else
                    {
                        _fxShape.graphics.clear();
                    }
                    if (hasmask)
                    {
                        if (!_maskRender)
                        {
                            _maskRender = new Shape();
                            _container.addChild(_maskRender);
                        }
                        _maskRender.graphics.clear();
                        if (owner.maskSpace == "local" && transMatrix)
                        {
                            _maskRender.transform.matrix = transMatrix;
                        }
                        else
                        {
                            _maskRender.transform.matrix = new Matrix();
                        }
                        _loc_6 = currentLayoutMatrix ? (currentLayoutMatrix.clone()) : (null);
                        _loc_7 = currentTransformMatrix ? (currentTransformMatrix.clone()) : (null);
                        _loc_8 = transMatrix ? (transMatrix.clone()) : (null);
                        if (owner.maskMode == "svgClip")
                        {
                            _maskRender.graphics.lineStyle();
                            _maskRender.graphics.beginFill(0, 1);
                            ignorePaint = ignorePaint ? (ignorePaint.concat(true)) : ([true]);
                            owner.mask.draw(_maskRender.graphics, owner.mask.bounds);
                            var _loc_9:* = ignorePaint;
                            var _loc_10:* = ignorePaint.length - 1;
                            _loc_9.length = _loc_10;
                            if (!ignorePaint.length)
                            {
                                ignorePaint = null;
                            }
                        }
                        else
                        {
                            owner.mask.draw(_maskRender.graphics, owner.mask.bounds);
                        }
                        var _loc_9:* = owner.maskMode == "alpha";
                        _maskRender.cacheAsBitmap = owner.maskMode == "alpha";
                        _original.cacheAsBitmap = _loc_9;
                        currentLayoutMatrix = _loc_6;
                        currentTransformMatrix = _loc_7;
                        transMatrix = _loc_8;
                        if (hasfilters)
                        {
                            hasfilters = false;
                            _fxShape.filters = owner.filters;
                        }
                        else if (_fxShape.filters.length)
                        {
                            _fxShape.filters = [];
                        }
                        _original.mask = _maskRender;
                    }
                    else
                    {
                        if (_maskRender)
                        {
                            _maskRender.cacheAsBitmap = false;
                            _maskRender.graphics.clear();
                        }
                        _original.cacheAsBitmap = false;
                        if (_fxShape.mask)
                        {
                            _fxShape.mask = null;
                        }
                        if (_fxShape.filters.length)
                        {
                            _fxShape.filters = [];
                        }
                    }
                    if (!ignorePaint)
                    {
                        owner.initStroke(_fxShape.graphics, param2);
                    }
                    if (!ignorePaint)
                    {
                        owner.initFill(_fxShape.graphics, param2);
                    }
                    if (owner.hasDecorators)
                    {
                        initDecorators();
                    }
                    lineTo = _fxShape.graphics.lineTo;
                    curveTo = _fxShape.graphics.curveTo;
                    moveTo = _fxShape.graphics.moveTo;
                    if (!isComp)
                    {
                        renderCommandStack(_fxShape.graphics, param2, _cursor);
                    }
                    else
                    {
                        owner.endDraw(_fxShape.graphics);
                    }
                    if (owner.hasDecorators)
                    {
                        endDecorators();
                    }
                    renderBitmapDatatoContext(_container, param1);
                    return isComp;
                }
                else
                {
                    if (!ignorePaint)
                    {
                        owner.initStroke(param1, param2);
                    }
                    if (!ignorePaint)
                    {
                        owner.initFill(param1, param2);
                    }
                    if (owner.hasDecorators)
                    {
                        initDecorators();
                    }
                    lineTo = param1.lineTo;
                    curveTo = param1.curveTo;
                    moveTo = param1.moveTo;
                    renderCommandStack(param1, param2, _cursor);
                    if (owner.hasDecorators)
                    {
                        endDecorators();
                    }
                    return false;
                }
            }
        }// end function

        public function addDelegate(param1:Function) : CommandStackItem
        {
            var _loc_2:* = source.push(new CommandStackItem(CommandStackItem.DELEGATE_TO)) - 1;
            source[_loc_2].delegate = param1;
            updateItemRelations(source[_loc_2], _loc_2);
            source[_loc_2].indexInParent = _loc_2;
            source[_loc_2].parent = this;
            return source[_loc_2];
        }// end function

        private function initDecorators() : void
        {
            var _loc_1:IDecorator = null;
            for each (_loc_1 in owner.decorators)
            {
                
                _loc_1.initialize(this);
                if (_loc_1 is IRenderDecorator)
                {
                    hasRenderDecoration = true;
                }
            }
            return;
        }// end function

        public function get globalRenderDelegateStart() : Array
        {
            return _globalRenderDelegateStart ? (_globalRenderDelegateStart) : (null);
        }// end function

        public function set length(param1:int) : void
        {
            source.length = param1;
            invalidated = true;
            return;
        }// end function

        public function get firstNonCommandStackItem() : CommandStackItem
        {
            var _loc_1:* = source.length - 1;
            while (_loc_1 < (source.length - 1))
            {
                
                if (source[_loc_1].type != CommandStackItem.COMMAND_STACK)
                {
                    return source[_loc_1];
                }
                return CommandStackItem(source[_loc_1]).commandStack.firstNonCommandStackItem;
            }
            return null;
        }// end function

        public function get transformBounds() : Rectangle
        {
            if (transMatrix)
            {
                return TransformBase.transformBounds(_bounds.clone(), transMatrix);
            }
            return _bounds;
        }// end function

        private function cleant(param1:Number, param2:Number = NaN) : Number
        {
            if (isNaN(param1))
            {
                param1 = param2;
            }
            else if (param1 < 0 || param1 > 1)
            {
                param1 = param1 % 1;
                if (param1 == 0)
                {
                    param1 = param2;
                }
                else if (param1 < 0)
                {
                    param1 = param1 + 1;
                }
            }
            return param1;
        }// end function

        private function endDecorators() : void
        {
            var _loc_1:IDecorator = null;
            for each (_loc_1 in owner.decorators)
            {
                
                _loc_1.end(this);
                if (_loc_1 is IRenderDecorator)
                {
                    hasRenderDecoration = true;
                }
            }
            return;
        }// end function

        public function get cursor() : DegrafaCursor
        {
            if (!_cursor)
            {
                _cursor = new DegrafaCursor(source);
            }
            return _cursor;
        }// end function

        private function updateItemRelations(param1:CommandStackItem, param2:int) : void
        {
            param1.previous = param2 > 0 ? (source[(param2 - 1)]) : (null);
            if (param1.previous)
            {
                if (param1.previous.type == CommandStackItem.COMMAND_STACK)
                {
                    param1.previous = param1.previous.commandStack.lastNonCommandStackItem;
                }
                param1.previous.next = param1.type == CommandStackItem.COMMAND_STACK ? (param1.commandStack.firstNonCommandStackItem) : (param1);
            }
            return;
        }// end function

        public function get transformedPathLength() : Number
        {
            var _loc_1:CommandStackItem = null;
            _transformedPathLength = 0;
            for each (_loc_1 in source)
            {
                
                _transformedPathLength = _transformedPathLength + _loc_1.transformedLength;
            }
            return _transformedPathLength;
        }// end function

        public function adjustPointToLayoutAndTransform(param1:Point) : Point
        {
            if (!owner)
            {
                return param1;
            }
            if (transMatrix)
            {
                return transMatrix.transformPoint(param1);
            }
            return param1;
        }// end function

        public function resetBounds() : void
        {
            if (_bounds)
            {
                _bounds.setEmpty();
                invalidated = true;
            }
            return;
        }// end function

        private function renderBitmapDatatoContext(param1:DisplayObject, param2:Graphics, param3:Boolean = false, param4:Rectangle = null) : void
        {
            var _loc_7:BitmapData = null;
            var _loc_9:Matrix = null;
            var _loc_10:Matrix = null;
            var _loc_11:Matrix = null;
            if (!param1)
            {
                return;
            }
            var _loc_5:* = param1.getBounds(param1);
            if (param1.getBounds(param1).isEmpty())
            {
                return;
            }
            var _loc_6:* = _loc_5.clone();
            if (hasfilters)
            {
                param1.filters = owner.filters;
                var _loc_12:int = 0;
                _loc_6.y = 0;
                _loc_6.x = _loc_12;
                _loc_6.width = Math.ceil(_loc_6.width);
                _loc_6.height = Math.ceil(_loc_6.height);
                if (!_loc_6.width || !_loc_6.height)
                {
                    return;
                }
                _loc_6 = updateToFilterRectangle(_loc_6, param1);
                _loc_6.offset(_loc_5.x, _loc_5.y);
            }
            var _loc_8:* = owner.clippingRectangle ? (owner.clippingRectangle) : (null);
            if (_loc_6.width < 1 || _loc_6.height < 1)
            {
                return;
            }
            var _loc_12:* = Math.floor(_loc_6.x);
            _loc_6.x = Math.floor(_loc_6.x);
            _loc_6.width = Math.ceil(_loc_6.width + (_loc_6.x - _loc_12));
            var _loc_12:* = Math.floor(_loc_6.y);
            _loc_6.y = Math.floor(_loc_6.y);
            _loc_6.height = Math.ceil(_loc_6.height + (_loc_6.y - _loc_12));
            if (_loc_6.width > 2880 || _loc_6.height > 2880)
            {
                return;
            }
            if (owner is IDisplayObjectProxy)
            {
                _loc_7 = new BitmapData(_loc_6.width + 4, _loc_6.height + 4, true, 0);
                _loc_9 = new Matrix(1, 0, 0, 1, 2 - _loc_6.x, 2 - _loc_6.y);
            }
            else
            {
                _loc_7 = new BitmapData(_loc_6.width, _loc_6.height, true, 0);
                _loc_9 = new Matrix(1, 0, 0, 1, -_loc_6.x, -_loc_6.y);
            }
            _loc_7.draw(param1, _loc_9, null, null, _loc_8, true);
            _loc_9.invert();
            if (!param3)
            {
                if (owner.hasFilters && !_loc_5.equals(_loc_6) && owner is IDisplayObjectProxy)
                {
                    _loc_9 = new Matrix(_loc_5.width / _loc_6.width, 0, 0, _loc_5.height / _loc_6.height, _loc_9.tx, _loc_9.ty);
                    param2.lineStyle();
                    param2.beginBitmapFill(_loc_7, _loc_9, false, true);
                    param2.drawRect(Math.floor(_loc_5.x), Math.floor(_loc_5.y), Math.ceil(_loc_5.width), Math.ceil(_loc_5.height));
                    param2.endFill();
                }
                else
                {
                    param2.lineStyle();
                    param2.beginBitmapFill(_loc_7, _loc_9, false, true);
                    param2.drawRect(_loc_6.x, _loc_6.y, _loc_6.width, _loc_6.height);
                    param2.endFill();
                }
            }
            else
            {
                if (transMatrix)
                {
                    if (owner is IDisplayObjectProxy)
                    {
                        if (owner._layoutMatrix && IDisplayObjectProxy(owner).layoutMode == "scale")
                        {
                            _loc_9.concat(CommandStack.currentTransformMatrix);
                        }
                        else
                        {
                            _loc_9.concat(currentTransformMatrix);
                            transMatrix = currentTransformMatrix;
                        }
                    }
                    else
                    {
                        _loc_9.concat(transMatrix);
                    }
                }
                param2.beginBitmapFill(_loc_7, _loc_9, false, true);
                lineTo = param2.lineTo;
                curveTo = param2.curveTo;
                moveTo = param2.moveTo;
                renderCommandStack(param2, param4, new DegrafaCursor(this.source));
            }
            return;
        }// end function

        public function simpleRender(param1:Graphics, param2:Rectangle) : void
        {
            lineTo = param1.lineTo;
            curveTo = param1.curveTo;
            moveTo = param1.moveTo;
            renderCommandStack(param1, param2, new DegrafaCursor(this.source));
            return;
        }// end function

        public function addCurveTo(param1:Number, param2:Number, param3:Number, param4:Number) : CommandStackItem
        {
            var _loc_5:* = source.push(new CommandStackItem(CommandStackItem.CURVE_TO, NaN, NaN, param3, param4, param1, param2)) - 1;
            updateItemRelations(source[_loc_5], _loc_5);
            source[_loc_5].indexInParent = _loc_5;
            source[_loc_5].parent = this;
            invalidated = true;
            return source[_loc_5];
        }// end function

        public function get pathLength() : Number
        {
            var _loc_1:CommandStackItem = null;
            if (lengthInvalidated)
            {
                lengthInvalidated = false;
                _pathLength = 0;
                for each (_loc_1 in source)
                {
                    
                    _pathLength = _pathLength + _loc_1.segmentLength;
                }
            }
            return _pathLength;
        }// end function

        public function addItem(param1:CommandStackItem) : CommandStackItem
        {
            var _loc_2:* = source.push(param1) - 1;
            updateItemRelations(source[_loc_2], _loc_2);
            param1.indexInParent = _loc_2;
            param1.parent = this;
            invalidated = true;
            return source[_loc_2];
        }// end function

        public function get length() : int
        {
            return source.length;
        }// end function

        private function predraw() : void
        {
            var _loc_4:Rectangle = null;
            var _loc_5:Rectangle = null;
            var _loc_1:* = owner;
            while (_loc_1.parent)
            {
                
                _loc_1 = _loc_1.parent as Geometry;
                if (_loc_1.transform)
                {
                    owner.transformContext = _loc_1.transform.getTransformFor(_loc_1);
                    break;
                }
            }
            var _loc_2:* = owner.hasLayout;
            transMatrix = null;
            currentLayoutMatrix.identity();
            if (_loc_2)
            {
                _loc_4 = owner is IDisplayObjectProxy ? (owner.bounds) : (bounds);
                _loc_5 = owner.layoutRectangle;
                if (!_loc_4.equals(_loc_5))
                {
                    if (_loc_5.width != _loc_4.width || _loc_5.height != _loc_4.width)
                    {
                        currentLayoutMatrix.translate(-_loc_4.x, -_loc_4.y);
                        if (owner.scaleOnLayout)
                        {
                            currentLayoutMatrix.scale(_loc_5.width / _loc_4.width, _loc_5.height / _loc_4.height);
                        }
                        currentLayoutMatrix.translate(_loc_5.x, _loc_5.y);
                    }
                    else
                    {
                        currentLayoutMatrix.translate(_loc_5.x - _loc_4.x, _loc_5.y - _loc_4.y);
                    }
                    owner._layoutMatrix = currentLayoutMatrix.clone();
                    transMatrix = currentLayoutMatrix.clone();
                }
                else
                {
                    _loc_2 = false;
                    owner._layoutMatrix = null;
                    currentLayoutMatrix.identity();
                }
            }
            else if (owner._layoutMatrix)
            {
                owner._layoutMatrix = null;
            }
            var _loc_3:* = owner.transformContext || owner.transform && !owner.transform.isIdentity;
            if (_loc_3)
            {
                currentTransformMatrix = owner.transform ? (owner.transform.getTransformFor(owner)) : (owner.transformContext);
                if (!_loc_2)
                {
                    transMatrix = owner.transform ? (owner.transform.getTransformFor(owner)) : (owner.transformContext);
                }
                else
                {
                    transMatrix.concat(owner.transform ? (owner.transform.getTransformFor(owner)) : (owner.transformContext));
                }
            }
            else
            {
                currentTransformMatrix.identity();
                if (!_loc_2)
                {
                    transMatrix = null;
                }
            }
            return;
        }// end function

        public function get lastSegmentWithLength() : CommandStackItem
        {
            var _loc_1:* = source.length - 1;
            while (_loc_1 > 0)
            {
                
                if (source[_loc_1].type == 1 || source[_loc_1].type == 2)
                {
                    return source[_loc_1];
                }
                if (source[_loc_1].type == 4)
                {
                    return source[_loc_1].commandStack.lastSegmentWithLength;
                }
                _loc_1 = _loc_1 - 1;
            }
            return source[(length - 1)];
        }// end function

        public function set globalRenderDelegateEnd(param1:Array) : void
        {
            if (_globalRenderDelegateEnd != param1)
            {
                _globalRenderDelegateEnd = param1;
                invalidated = true;
            }
            return;
        }// end function

        public static function unstackAlpha() : void
        {
            if (!alphaStack.length)
            {
                trace("error: unmatched unstackAlpha calls");
                return;
            }
            var _loc_1:* = alphaStack;
            var _loc_2:* = alphaStack.length - 1;
            _loc_1.length = _loc_2;
            return;
        }// end function

        public static function get currentAlpha() : Number
        {
            if (!alphaStack.length)
            {
                return 1;
            }
            return alphaStack[(alphaStack.length - 1)];
        }// end function

        public static function getSettingsCache() : Object
        {
            var _loc_2:String = null;
            var _loc_3:Object = null;
            var _loc_1:Object = {};
            for each (_loc_2 in _cacheable)
            {
                
                _loc_3 = CommandStack[_loc_2];
                if (_loc_3 is Array)
                {
                    _loc_1[_loc_2] = (_loc_3 as Array).concat();
                    continue;
                }
                if (_loc_3 is Matrix)
                {
                    _loc_1[_loc_2] = (_loc_3 as Matrix).clone();
                    continue;
                }
                _loc_1[_loc_2] = CommandStack[_loc_2];
            }
            return _loc_1;
        }// end function

        public static function resetCacheValues(param1:Object) : void
        {
            var _loc_2:String = null;
            for (_loc_2 in param1)
            {
                
                CommandStack[_loc_2] = param1[_loc_2];
            }
            return;
        }// end function

        public static function stackAlpha(param1:Number) : void
        {
            if (!alphaStack.length)
            {
                alphaStack.push(param1);
            }
            else
            {
                alphaStack.push(param1 * alphaStack[(alphaStack.length - 1)]);
            }
            return;
        }// end function

    }
}
