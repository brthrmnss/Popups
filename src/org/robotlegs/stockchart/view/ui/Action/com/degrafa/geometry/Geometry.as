package com.degrafa.geometry
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.core.collections.*;
    import com.degrafa.events.*;
    import com.degrafa.geometry.command.*;
    import com.degrafa.geometry.layout.*;
    import com.degrafa.states.*;
    import com.degrafa.transform.*;
    import com.degrafa.triggers.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;
    import mx.binding.utils.*;
    import mx.core.*;
    import mx.events.*;

    public class Geometry extends DegrafaObject implements IDegrafaObject, IGeometryComposition, IDegrafaStateClient, ISimpleStyleClient
    {
        private var _IGraphicParent:IGraphic;
        private var _maskSpace:String;
        private var _graphicsTarget:DisplayObjectCollection;
        private var _maskMode:String;
        public var hasFilters:Boolean;
        private var _stateEvent:String;
        private var _autoClearGraphicsTarget:Boolean = true;
        private var _clippingRectangle:Rectangle = null;
        private var _styleName:Object;
        private var _alpha:Number;
        protected var _fill:IGraphicsFill;
        public var hasLayout:Boolean;
        public var hasTriggers:Boolean;
        private var _currentState:String = "";
        private var _data:Object;
        private var methodQueue:Array;
        private var _filters:FilterCollection;
        private var _invalidated:Boolean;
        public var _currentGraphicsTarget:Sprite;
        private var _transformContext:Matrix;
        private var targetDictionary:Dictionary;
        private var _inheritStroke:Boolean = true;
        protected var _layoutConstraint:LayoutConstraint;
        private var _triggers:Array;
        private var _states:Array;
        protected var _layoutRectangle:Rectangle;
        private var _visible:Boolean = true;
        private var _decorators:DecoratorCollection;
        public var hasStates:Boolean;
        protected var _stroke:IGraphicsStroke;
        private var _inheritFill:Boolean = true;
        private var _scaleOnLayout:Boolean = true;
        public var _layoutMatrix:Matrix;
        private var _state:String;
        private var _mask:IGeometryComposition;
        private var _geometry:GeometryCollection;
        public var hasDecorators:Boolean;
        private var stateManager:StateManager;
        private var _isRootGeometry:Boolean = false;
        private var _commandStack:CommandStack;
        private var _transform:ITransform;
        private var _stage:Stage;

        public function Geometry()
        {
            methodQueue = [];
            targetDictionary = new Dictionary(true);
            _triggers = [];
            _states = [];
            return;
        }// end function

        public function set commandStack(param1:CommandStack) : void
        {
            _commandStack = param1;
            return;
        }// end function

        public function get states() : Array
        {
            return _states;
        }// end function

        private function onTargetRender(event:Event) : void
        {
            if (!_stage)
            {
                _stage = event.currentTarget.stage;
            }
            if (_stage)
            {
                event.currentTarget.removeEventListener(Event.RENDER, onTargetRender);
                event.currentTarget.removeEventListener(Event.ADDED_TO_STAGE, onTargetRender);
                if (event.currentTarget is UIComponent)
                {
                    event.currentTarget.removeEventListener(FlexEvent.UPDATE_COMPLETE, onTargetRender);
                }
            }
            else
            {
                return;
            }
            if (event.currentTarget is UIComponent)
            {
                initLayoutChangeWatcher(event.currentTarget as UIComponent);
            }
            initDrawQueue();
            queueDraw(event.currentTarget, event.currentTarget.graphics, null);
            return;
        }// end function

        public function get left() : Number
        {
            return hasLayout ? (layoutConstraint.left) : (NaN);
        }// end function

        public function set states(param1:Array) : void
        {
            var _loc_2:State = null;
            _states = param1;
            if (param1)
            {
                if (!stateManager)
                {
                    stateManager = new StateManager(this);
                    for each (_loc_2 in _states)
                    {
                        
                        _loc_2.stateManager = stateManager;
                    }
                }
            }
            else
            {
                stateManager = null;
            }
            if (param1 && param1.length != 0)
            {
                hasStates = true;
            }
            else
            {
                hasStates = false;
            }
            return;
        }// end function

        public function get maintainAspectRatio() : Boolean
        {
            return hasLayout ? (layoutConstraint.maintainAspectRatio) : (false);
        }// end function

        public function set left(param1:Number) : void
        {
            layoutConstraint.left = param1;
            return;
        }// end function

        public function set maintainAspectRatio(param1:Boolean) : void
        {
            layoutConstraint.maintainAspectRatio = param1;
            return;
        }// end function

        public function get minHeight() : Number
        {
            return hasLayout ? (layoutConstraint.minHeight) : (NaN);
        }// end function

        public function get right() : Number
        {
            return hasLayout ? (layoutConstraint.right) : (NaN);
        }// end function

        private function onTargetChange(event:Event) : void
        {
            var _loc_3:Array = null;
            var _loc_4:ChangeWatcher = null;
            var _loc_5:UIComponent = null;
            var _loc_6:Rectangle = null;
            var _loc_2:* = requestTarget(event.currentTarget as UIComponent);
            if (_loc_2)
            {
                _loc_3 = _loc_2.data.watchers;
            }
            if (_loc_2)
            {
                if (!hasLayout)
                {
                    for each (_loc_4 in _loc_3)
                    {
                        
                        _loc_4.unwatch();
                    }
                    removeTarget(event.currentTarget as UIComponent);
                    return;
                }
            }
            if (_loc_2)
            {
                _loc_5 = event.currentTarget as UIComponent;
                _loc_6 = new Rectangle(_loc_5.x, _loc_5.y, _loc_5.width, _loc_5.height);
                if (!_loc_6.equals(_loc_2.data.oldbounds))
                {
                    addUpdateTarget(_loc_5, {oldbounds:_loc_6, watchers:_loc_3});
                    queueDraw(_loc_5, _loc_5.graphics, null);
                }
            }
            return;
        }// end function

        public function set inheritStroke(param1:Boolean) : void
        {
            _inheritStroke = param1;
            return;
        }// end function

        public function get bottom() : Number
        {
            return hasLayout ? (layoutConstraint.bottom) : (NaN);
        }// end function

        public function calculateLayout(param1:Rectangle = null) : void
        {
            var _loc_2:Rectangle = null;
            var _loc_3:Geometry = null;
            var _loc_4:Geometry = null;
            var _loc_5:DisplayObject = null;
            var _loc_6:Rectangle = null;
            var _loc_7:Rectangle = null;
            var _loc_8:Rectangle = null;
            if (_layoutConstraint)
            {
                if (!param1)
                {
                    param1 = new Rectangle(0, 0, 1, 1);
                }
                if (parent && parent is Geometry)
                {
                    _loc_3 = Geometry(parent);
                    while (_loc_3 && !_loc_2)
                    {
                        
                        if (!Geometry(parent).layoutRectangle.isEmpty())
                        {
                            _loc_2 = _loc_3.layoutRectangle;
                            continue;
                        }
                        _loc_4 = _loc_3;
                        _loc_3 = _loc_3.parent as Geometry;
                    }
                }
                if (_loc_4 && !_loc_2)
                {
                    if (!_loc_4._currentGraphicsTarget)
                    {
                        if (_loc_4.IGraphicParent)
                        {
                            _loc_5 = _loc_4.IGraphicParent as DisplayObject;
                            _loc_6 = (_loc_4.IGraphicParent as DisplayObject).getRect(_loc_5);
                            if (_loc_6.isEmpty())
                            {
                                if (_loc_5.width != 0 || _loc_5.height != 0)
                                {
                                    _loc_6.x = _loc_5.x;
                                    _loc_6.y = _loc_5.y;
                                    _loc_6.width = _loc_5.width;
                                    _loc_6.height = _loc_5.height;
                                }
                            }
                            if (!_loc_6.isEmpty())
                            {
                                _loc_2 = _loc_6.clone();
                            }
                        }
                    }
                }
                if (_currentGraphicsTarget && !_loc_2)
                {
                    _loc_7 = _currentGraphicsTarget.getRect(_currentGraphicsTarget);
                    if (_loc_7.isEmpty())
                    {
                        if (_currentGraphicsTarget.width != 0 || _currentGraphicsTarget.height != 0)
                        {
                            _loc_7.x = _currentGraphicsTarget.x;
                            _loc_7.y = _currentGraphicsTarget.y;
                            _loc_7.width = _currentGraphicsTarget.width;
                            _loc_7.height = _currentGraphicsTarget.height;
                        }
                    }
                    if (_loc_7)
                    {
                        _loc_2 = _loc_7.clone();
                    }
                }
                if (!_loc_2)
                {
                    _loc_8 = new Rectangle();
                    if (_loc_4)
                    {
                        if (_loc_4.graphicsTarget.length != 0)
                        {
                            if (_loc_4.graphicsTarget[0] is IGraphicSkin)
                            {
                                _loc_8.x = _loc_4.graphicsTarget[0].x;
                                _loc_8.y = _loc_4.graphicsTarget[0].y;
                                _loc_8.width = _loc_4.graphicsTarget[0].width;
                                _loc_8.height = _loc_4.graphicsTarget[0].height;
                            }
                            if (_loc_8)
                            {
                                _loc_2 = _loc_8.clone();
                            }
                        }
                    }
                    else if (graphicsTarget.length != 0)
                    {
                        if (graphicsTarget[0] is IGraphicSkin)
                        {
                            _loc_8.x = graphicsTarget[0].x;
                            _loc_8.y = graphicsTarget[0].y;
                            _loc_8.width = graphicsTarget[0].width;
                            _loc_8.height = graphicsTarget[0].height;
                        }
                        if (_loc_8)
                        {
                            _loc_2 = _loc_8.clone();
                        }
                    }
                }
                if (document && !_loc_2)
                {
                    _loc_2 = new Rectangle(document.x, document.y, document.width, document.height);
                }
                _layoutConstraint.computeLayoutRectangle(param1, _loc_2);
            }
            return;
        }// end function

        public function set minHeight(param1:Number) : void
        {
            layoutConstraint.minHeight = param1;
            return;
        }// end function

        public function get stroke() : IGraphicsStroke
        {
            return _stroke;
        }// end function

        public function set inheritFill(param1:Boolean) : void
        {
            _inheritFill = param1;
            return;
        }// end function

        public function get minX() : Number
        {
            return hasLayout ? (layoutConstraint.minX) : (NaN);
        }// end function

        public function get minY() : Number
        {
            return hasLayout ? (layoutConstraint.minY) : (NaN);
        }// end function

        public function set height(param1:Number) : void
        {
            layoutConstraint.height = param1;
            return;
        }// end function

        public function set right(param1:Number) : void
        {
            layoutConstraint.right = param1;
            return;
        }// end function

        public function set bottom(param1:Number) : void
        {
            layoutConstraint.bottom = param1;
            return;
        }// end function

        public function angleAt(param1:Number) : Number
        {
            return commandStack.pathAngleAt(param1);
        }// end function

        public function set stroke(param1:IGraphicsStroke) : void
        {
            var _loc_2:Object = null;
            if (_stroke != param1)
            {
                _loc_2 = _stroke;
                if (_stroke)
                {
                    if (_stroke.hasEventManager)
                    {
                        _stroke.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                    }
                }
                _stroke = param1;
                if (enableEvents && _stroke)
                {
                    _stroke.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler, false, 0, true);
                }
                initChange("stroke", _loc_2, _stroke, this);
            }
            return;
        }// end function

        public function get x() : Number
        {
            return hasLayout ? (layoutConstraint.x) : (NaN);
        }// end function

        public function get visible() : Boolean
        {
            return _visible;
        }// end function

        public function get y() : Number
        {
            return hasLayout ? (layoutConstraint.y) : (NaN);
        }// end function

        public function get geometry() : Array
        {
            initGeometryCollection();
            return _geometry.items;
        }// end function

        public function get geometricLength() : Number
        {
            return commandStack.pathLength;
        }// end function

        public function get percentWidth() : Number
        {
            return hasLayout ? (layoutConstraint.percentWidth) : (NaN);
        }// end function

        public function set minX(param1:Number) : void
        {
            layoutConstraint.minX = param1;
            return;
        }// end function

        public function preDraw() : void
        {
            return;
        }// end function

        public function get invalidated() : Boolean
        {
            return _invalidated;
        }// end function

        public function get state() : String
        {
            return _state;
        }// end function

        public function get minWidth() : Number
        {
            return hasLayout ? (layoutConstraint.minWidth) : (NaN);
        }// end function

        public function set minY(param1:Number) : void
        {
            layoutConstraint.minY = param1;
            return;
        }// end function

        public function get currentState() : String
        {
            return stateManager ? (stateManager.currentState) : ("");
        }// end function

        public function get targetCoordinateSpace() : DisplayObject
        {
            return hasLayout ? (layoutConstraint.targetCoordinateSpace) : (null);
        }// end function

        public function get stateEvent() : String
        {
            return _stateEvent;
        }// end function

        public function get transformContext() : Matrix
        {
            return _transformContext;
        }// end function

        public function set scaleOnLayout(param1:Boolean) : void
        {
            _scaleOnLayout = param1;
            return;
        }// end function

        public function get layoutConstraint() : LayoutConstraint
        {
            if (!_layoutConstraint)
            {
                layoutConstraint = new LayoutConstraint();
            }
            return _layoutConstraint;
        }// end function

        public function set top(param1:Number) : void
        {
            layoutConstraint.top = param1;
            return;
        }// end function

        public function get maskMode() : String
        {
            return _maskMode ? (_maskMode) : ("clip");
        }// end function

        public function initFill(param1:Graphics, param2:Rectangle) : void
        {
            if (parent)
            {
                if (inheritFill && !_fill && parent is Geometry)
                {
                    _fill = Geometry(parent).fill;
                }
            }
            if (_fill)
            {
                if (_fill is ITransformablePaint)
                {
                    (_fill as ITransformablePaint).requester = this;
                }
                _fill.begin(param1, param2 ? (param2) : (null));
                CommandStack.currentFill = _fill;
            }
            else
            {
                CommandStack.currentFill = null;
            }
            return;
        }// end function

        public function get bounds() : Rectangle
        {
            return commandStack.bounds;
        }// end function

        public function get geometryCollection() : GeometryCollection
        {
            initGeometryCollection();
            return _geometry;
        }// end function

        private function processMethodQueue(event:Event) : void
        {
            if (methodQueue.length == 0)
            {
                return;
            }
            var _loc_2:* = methodQueue;
            var _loc_3:* = _loc_2.length;
            var _loc_4:int = 0;
            while (_loc_4 < _loc_3)
            {
                
                _loc_2[_loc_4].method.apply(null, [_loc_2[_loc_4].args[0]]);
                _loc_4++;
            }
            methodQueue.length = 0;
            _loc_2.length = 0;
            if (methodQueue.length == 0 && _stage)
            {
                _stage.removeEventListener(Event.ENTER_FRAME, processMethodQueue);
            }
            return;
        }// end function

        public function get maxWidth() : Number
        {
            return hasLayout ? (layoutConstraint.maxWidth) : (NaN);
        }// end function

        public function endDraw(param1:Graphics) : void
        {
            var _loc_2:IGeometryComposition = null;
            if (fill)
            {
                param1.lineStyle.apply(param1, null);
                fill.end(param1);
            }
            if (stroke && !fill)
            {
                param1.moveTo.call(param1, null, null);
            }
            if (geometry)
            {
                for each (_loc_2 in geometry)
                {
                    
                    _loc_2.draw(param1, null);
                }
            }
            CommandStack.unstackAlpha();
            dispatchEvent(new DegrafaEvent(DegrafaEvent.RENDER));
            return;
        }// end function

        public function set alpha(param1:Number) : void
        {
            if (param1 != _alpha)
            {
                var _loc_2:* = param1;
                _alpha = param1;
                initChange("alpha", alpha, _loc_2, this);
            }
            return;
        }// end function

        public function get clippingRectangle() : Rectangle
        {
            return _clippingRectangle;
        }// end function

        public function set transform(param1:ITransform) : void
        {
            var _loc_2:Object = null;
            if (parent && (parent as Geometry).transform)
            {
                _transformContext = (parent as Geometry).transform.getTransformFor(parent as Geometry);
            }
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

        public function set verticalCenter(param1:Number) : void
        {
            layoutConstraint.verticalCenter = param1;
            return;
        }// end function

        public function set visible(param1:Boolean) : void
        {
            var _loc_2:Boolean = false;
            if (_visible != param1)
            {
                _loc_2 = _visible;
                _visible = param1;
                invalidated = true;
                initChange("visible", _loc_2, _visible, this);
            }
            return;
        }// end function

        public function set maxX(param1:Number) : void
        {
            layoutConstraint.maxX = param1;
            return;
        }// end function

        public function set geometry(param1:Array) : void
        {
            initGeometryCollection();
            _geometry.items = param1;
            return;
        }// end function

        public function get mask() : IGeometryComposition
        {
            return _mask;
        }// end function

        public function set x(param1:Number) : void
        {
            layoutConstraint.x = param1;
            return;
        }// end function

        private function initGraphicsTargetCollection() : void
        {
            if (!_graphicsTarget)
            {
                _graphicsTarget = new DisplayObjectCollection();
                if (enableEvents)
                {
                    _graphicsTarget.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function set y(param1:Number) : void
        {
            layoutConstraint.y = param1;
            return;
        }// end function

        public function set autoClearGraphicsTarget(param1:Boolean) : void
        {
            _autoClearGraphicsTarget = param1;
            return;
        }// end function

        public function set maxY(param1:Number) : void
        {
            layoutConstraint.maxY = param1;
            return;
        }// end function

        private function addUpdateTarget(param1:UIComponent, param2:Object) : void
        {
            if (!targetDictionary[param1])
            {
                targetDictionary[param1] = [];
                targetDictionary[param1].data = param2;
            }
            else
            {
                targetDictionary[param1].data = param2;
            }
            return;
        }// end function

        private function initDrawQueue() : void
        {
            _stage.addEventListener(Event.ENTER_FRAME, processMethodQueue);
            return;
        }// end function

        public function get isInvalidated() : Boolean
        {
            return _invalidated;
        }// end function

        private function requestTarget(param1:UIComponent) : Object
        {
            return targetDictionary[param1];
        }// end function

        public function set maskSpace(param1:String) : void
        {
            if (param1 == "local" || param1 == "global")
            {
                if (_mask)
                {
                    var _loc_2:* = param1;
                    _maskSpace = param1;
                    initChange("maskSpace", maskSpace, _loc_2, this);
                }
                else
                {
                    _maskSpace = param1;
                }
            }
            return;
        }// end function

        public function set fill(param1:IGraphicsFill) : void
        {
            var _loc_2:Object = null;
            if (_fill != param1)
            {
                _loc_2 = _fill;
                if (_fill)
                {
                    if (_fill.hasEventManager)
                    {
                        _fill.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                    }
                }
                _fill = param1;
                if (enableEvents)
                {
                    _fill.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler, false, 0, true);
                }
                initChange("fill", _loc_2, _fill, this);
            }
            return;
        }// end function

        public function set percentWidth(param1:Number) : void
        {
            layoutConstraint.percentWidth = param1;
            return;
        }// end function

        public function get inheritStroke() : Boolean
        {
            return _inheritStroke;
        }// end function

        public function set invalidated(param1:Boolean) : void
        {
            if (_invalidated != param1)
            {
                _invalidated = param1;
                if (_invalidated && _isRootGeometry)
                {
                    drawToTargets();
                }
            }
            return;
        }// end function

        public function get inheritFill() : Boolean
        {
            return _inheritFill;
        }// end function

        public function set state(param1:String) : void
        {
            _state = param1;
            return;
        }// end function

        public function drawToTargets() : void
        {
            var _loc_1:Object = null;
            if (_graphicsTarget)
            {
                for each (_loc_1 in _graphicsTarget.items)
                {
                    
                    queueDraw(_loc_1, _loc_1.graphics, null);
                }
            }
            _currentGraphicsTarget = null;
            return;
        }// end function

        public function get height() : Number
        {
            return hasLayout ? (layoutConstraint.height) : (NaN);
        }// end function

        public function set minWidth(param1:Number) : void
        {
            layoutConstraint.minWidth = param1;
            return;
        }// end function

        public function set stateEvent(param1:String) : void
        {
            _stateEvent = param1;
            return;
        }// end function

        public function set decorators(param1:Array) : void
        {
            initDecoratorsCollection();
            _decorators.items = param1;
            if (param1 && param1.length != 0)
            {
                hasDecorators = true;
            }
            else
            {
                hasDecorators = false;
            }
            return;
        }// end function

        public function set horizontalCenter(param1:Number) : void
        {
            layoutConstraint.horizontalCenter = param1;
            return;
        }// end function

        private function removeTarget(param1:UIComponent) : void
        {
            delete targetDictionary[param1];
            return;
        }// end function

        public function get decoratorCollection() : DecoratorCollection
        {
            initDecoratorsCollection();
            return _decorators;
        }// end function

        public function set targetCoordinateSpace(param1:DisplayObject) : void
        {
            layoutConstraint.targetCoordinateSpace = param1;
            return;
        }// end function

        public function set currentState(param1:String) : void
        {
            stateManager.currentState = param1;
            return;
        }// end function

        public function get transformBounds() : Rectangle
        {
            return commandStack.transformBounds;
        }// end function

        public function draw(param1:Graphics, param2:Rectangle) : void
        {
            if (!visible)
            {
                return;
            }
            CommandStack.stackAlpha(alpha);
            if (!param1)
            {
                return;
            }
            if (!commandStack.draw(param1, param2))
            {
                endDraw(param1);
            }
            return;
        }// end function

        public function set transformContext(param1:Matrix) : void
        {
            _transformContext = param1;
            return;
        }// end function

        public function set layoutConstraint(param1:LayoutConstraint) : void
        {
            var _loc_2:Object = null;
            if (_layoutConstraint != param1)
            {
                _loc_2 = _layoutConstraint;
                if (_layoutConstraint)
                {
                    if (_layoutConstraint.hasEventManager)
                    {
                        _layoutConstraint.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                    }
                }
                _layoutConstraint = param1;
                if (enableEvents)
                {
                    _layoutConstraint.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler, false, 0, true);
                }
                initChange("layoutConstraint", _loc_2, _layoutConstraint, this);
                hasLayout = true;
            }
            return;
        }// end function

        private function drawToTarget(param1:Object) : void
        {
            if (param1)
            {
                if (autoClearGraphicsTarget)
                {
                    param1.graphics.clear();
                }
                _currentGraphicsTarget = param1 as Sprite;
                draw(param1.graphics, null);
            }
            return;
        }// end function

        public function get scaleOnLayout() : Boolean
        {
            return _scaleOnLayout;
        }// end function

        public function get top() : Number
        {
            return hasLayout ? (layoutConstraint.top) : (NaN);
        }// end function

        public function set maxHeight(param1:Number) : void
        {
            layoutConstraint.maxHeight = param1;
            return;
        }// end function

        public function set data(param1:Object) : void
        {
            _data = param1;
            return;
        }// end function

        public function set maskMode(param1:String) : void
        {
            if (param1 == "alpha" || param1 == "clip" || param1 == "svgClip")
            {
                if (_mask)
                {
                    var _loc_2:* = param1;
                    _maskMode = param1;
                    initChange("maskMode", maskMode, _loc_2, this);
                }
                else
                {
                    _maskMode = param1;
                }
            }
            return;
        }// end function

        public function get layoutRectangle() : Rectangle
        {
            return _layoutRectangle ? (_layoutRectangle) : (bounds);
        }// end function

        private function initFilterCollection() : void
        {
            if (!_filters)
            {
                _filters = new FilterCollection();
                _filters.parent = this;
                if (enableEvents)
                {
                    _filters.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function initStroke(param1:Graphics, param2:Rectangle) : void
        {
            if (parent)
            {
                if (inheritStroke && !_stroke && parent is Geometry)
                {
                    _stroke = Geometry(parent).stroke;
                }
            }
            if (_stroke)
            {
                if (_stroke is ITransformablePaint)
                {
                    (_stroke as ITransformablePaint).requester = this;
                }
                _stroke.apply(param1, param2 ? (param2) : (null));
                CommandStack.currentStroke = _stroke;
            }
            else
            {
                param1.lineStyle();
                CommandStack.currentStroke = null;
            }
            return;
        }// end function

        public function get verticalCenter() : Number
        {
            return hasLayout ? (layoutConstraint.verticalCenter) : (NaN);
        }// end function

        public function get transform() : ITransform
        {
            return _transform;
        }// end function

        public function get alpha() : Number
        {
            return isNaN(_alpha) ? (1) : (_alpha);
        }// end function

        public function get maxX() : Number
        {
            return hasLayout ? (layoutConstraint.maxX) : (NaN);
        }// end function

        public function get maxY() : Number
        {
            return hasLayout ? (layoutConstraint.maxY) : (NaN);
        }// end function

        public function set triggers(param1:Array) : void
        {
            var _loc_2:ITrigger = null;
            _triggers = param1;
            if (_triggers)
            {
                for each (_loc_2 in _triggers)
                {
                    
                    _loc_2.triggerParent = this;
                }
            }
            if (param1 && param1.length != 0)
            {
                hasTriggers = true;
            }
            else
            {
                hasTriggers = false;
            }
            return;
        }// end function

        public function get autoClearGraphicsTarget() : Boolean
        {
            return _autoClearGraphicsTarget;
        }// end function

        public function get maskSpace() : String
        {
            return _maskSpace ? (_maskSpace) : ("local");
        }// end function

        public function get fill() : IGraphicsFill
        {
            return _fill;
        }// end function

        public function set maxWidth(param1:Number) : void
        {
            layoutConstraint.maxWidth = param1;
            return;
        }// end function

        private function initDecoratorsCollection() : void
        {
            if (!_decorators)
            {
                _decorators = new DecoratorCollection();
                if (enableEvents)
                {
                    _decorators.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function set width(param1:Number) : void
        {
            layoutConstraint.width = param1;
            return;
        }// end function

        public function get decorators() : Array
        {
            initDecoratorsCollection();
            return _decorators.items;
        }// end function

        public function get horizontalCenter() : Number
        {
            return hasLayout ? (layoutConstraint.horizontalCenter) : (NaN);
        }// end function

        public function set clippingRectangle(param1:Rectangle) : void
        {
            var _loc_2:Rectangle = null;
            if (_clippingRectangle != param1)
            {
                _loc_2 = _clippingRectangle;
                _clippingRectangle = param1;
                initChange("clippingRectangle", _loc_2, _clippingRectangle, this);
            }
            return;
        }// end function

        public function set percentHeight(param1:Number) : void
        {
            layoutConstraint.percentHeight = param1;
            return;
        }// end function

        protected function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            if (!parent)
            {
                dispatchEvent(event);
                drawToTargets();
            }
            else
            {
                dispatchEvent(event);
            }
            return;
        }// end function

        public function get data() : Object
        {
            return _data;
        }// end function

        public function get maxHeight() : Number
        {
            return hasLayout ? (layoutConstraint.maxHeight) : (NaN);
        }// end function

        private function initLayoutChangeWatcher(param1:UIComponent) : void
        {
            var _loc_2:* = new Rectangle(param1.x, param1.y, param1.width, param1.height);
            var _loc_3:Array = [];
            _loc_3.push(ChangeWatcher.watch(param1, "width", onTargetChange, true));
            _loc_3.push(ChangeWatcher.watch(param1, "height", onTargetChange, true));
            _loc_3.push(ChangeWatcher.watch(param1, "x", onTargetChange, true));
            _loc_3.push(ChangeWatcher.watch(param1, "y", onTargetChange, true));
            if (!requestTarget(param1))
            {
                addUpdateTarget(param1, {oldbounds:_loc_2, watchers:_loc_3});
            }
            return;
        }// end function

        public function get triggers() : Array
        {
            return _triggers;
        }// end function

        public function get isRootGeometry() : Boolean
        {
            return _isRootGeometry;
        }// end function

        public function get graphicsTargetCollection() : DisplayObjectCollection
        {
            initGraphicsTargetCollection();
            return _graphicsTarget;
        }// end function

        public function styleChanged(param1:String) : void
        {
            return;
        }// end function

        public function get width() : Number
        {
            return hasLayout ? (_layoutConstraint.width) : (NaN);
        }// end function

        public function set styleName(param1:Object) : void
        {
            _styleName = param1;
            return;
        }// end function

        public function get percentHeight() : Number
        {
            return hasLayout ? (layoutConstraint.percentHeight) : (NaN);
        }// end function

        public function set IGraphicParent(param1:IGraphic) : void
        {
            if (parent == null)
            {
                if (_IGraphicParent != param1)
                {
                    _IGraphicParent = param1;
                }
            }
            return;
        }// end function

        public function set mask(param1:IGeometryComposition) : void
        {
            var _loc_2:IGeometryComposition = null;
            if (_mask != param1 && param1 != this)
            {
                if (_mask)
                {
                    Geometry(_mask).removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
                _loc_2 = _mask;
                _mask = param1;
                Geometry(_mask).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                initChange("mask", _loc_2, _mask, this);
            }
            return;
        }// end function

        private function initGeometryCollection() : void
        {
            if (!_geometry)
            {
                _geometry = new GeometryCollection();
                _geometry.parent = this;
                if (enableEvents)
                {
                    _geometry.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function get IGraphicParent() : IGraphic
        {
            return _IGraphicParent;
        }// end function

        public function pointAt(param1:Number) : Point
        {
            return commandStack.pathPointAt(param1);
        }// end function

        public function get styleName() : Object
        {
            return _styleName;
        }// end function

        public function clearGraphicsTargets() : void
        {
            var _loc_1:Object = null;
            if (graphicsTarget)
            {
                for each (_loc_1 in graphicsTarget)
                {
                    
                    if (_loc_1)
                    {
                        _loc_1.graphics.clear();
                    }
                }
            }
            return;
        }// end function

        private function queueDraw(... args) : void
        {
            args = null;
            for each (args in methodQueue)
            {
                
                if (args.args[0] == args[0])
                {
                    return;
                }
            }
            methodQueue.push({method:drawToTarget, args:args});
            if (_stage)
            {
                _stage.addEventListener(Event.ENTER_FRAME, processMethodQueue, false, 0, true);
            }
            else if (graphicsTarget.length)
            {
                if (graphicsTarget[0].stage)
                {
                    _stage = graphicsTarget[0].stage;
                    _stage.addEventListener(Event.ENTER_FRAME, processMethodQueue, false, 0, true);
                }
            }
            return;
        }// end function

        public function set filters(param1:Array) : void
        {
            var _loc_2:Array = null;
            initFilterCollection();
            if (_filters.items != param1)
            {
                _loc_2 = _filters.items;
                _filters.items = param1;
                initChange("filters", _loc_2, _filters.items, this);
            }
            if (param1 && param1.length != 0)
            {
                hasFilters = true;
            }
            else
            {
                hasFilters = false;
            }
            return;
        }// end function

        public function set graphicsTarget(param1:Array) : void
        {
            var _loc_2:Object = null;
            var _loc_3:DisplayObject = null;
            if (!param1)
            {
                return;
            }
            for each (_loc_2 in param1)
            {
                
                if (!_loc_2)
                {
                    return;
                }
            }
            initGraphicsTargetCollection();
            _graphicsTarget.items = param1;
            for each (_loc_3 in _graphicsTarget.items)
            {
                
                if (!(_loc_3 is IGraphicSkin))
                {
                    _loc_3.addEventListener(Event.RENDER, onTargetRender);
                    _loc_3.addEventListener(Event.ADDED_TO_STAGE, onTargetRender);
                    if (_loc_3 is UIComponent)
                    {
                        _loc_3.addEventListener(FlexEvent.UPDATE_COMPLETE, onTargetRender);
                    }
                }
            }
            _isRootGeometry = true;
            return;
        }// end function

        public function get filters() : Array
        {
            initFilterCollection();
            return _filters.items;
        }// end function

        public function get graphicsTarget() : Array
        {
            initGraphicsTargetCollection();
            return _graphicsTarget.items;
        }// end function

        public function get commandStack() : CommandStack
        {
            if (!_commandStack)
            {
                _commandStack = new CommandStack(this);
            }
            return _commandStack;
        }// end function

    }
}
