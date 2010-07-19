package com.degrafa.repeaters
{
    import com.degrafa.core.*;
    import com.degrafa.core.collections.*;
    import com.degrafa.geometry.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.utils.*;
    import mx.events.*;

    public class GeometryRepeater extends Geometry implements IGeometry
    {
        private var _y:Number;
        public var renderOnFinalIteration:Boolean = false;
        private var _sourceGeometry:Geometry;
        private var _height:Number;
        private var _count:int = 1;
        private var _bounds:Rectangle;
        private var _curIteration:int = -1;
        private var _isDrawing:Boolean = false;
        private var _width:Number;
        private var _x:Number;
        private var _modifiers:RepeaterModifierCollection;

        public function GeometryRepeater()
        {
            return;
        }// end function

        override public function dispatchEvent(event:Event) : Boolean
        {
            if (event.type == "iterationChanged")
            {
                return eventDispatcher.dispatchEvent(event);
            }
            if (suppressEventProcessing || _isDrawing)
            {
                event.stopImmediatePropagation();
                this.invalidated = true;
                return false;
            }
            return eventDispatcher.dispatchEvent(event);
        }// end function

        override public function get bounds() : Rectangle
        {
            return _bounds;
        }// end function

        override public function get width() : Number
        {
            if (!_width)
            {
                return 0;
            }
            return _width;
        }// end function

        override public function get y() : Number
        {
            if (!_y)
            {
                return 0;
            }
            return _y;
        }// end function

        private function initModifiersCollection() : void
        {
            if (!_modifiers)
            {
                _modifiers = new RepeaterModifierCollection();
                if (enableEvents)
                {
                    _modifiers.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        override public function draw(param1:Graphics, param2:Rectangle) : void
        {
            var _loc_6:IRepeaterModifier = null;
            var _loc_7:Object = null;
            preDraw();
            if (!this.isInitialized)
            {
                return;
            }
            _isDrawing = true;
            var _loc_3:* = getTimer();
            calcBounds();
            var _loc_4:* = suppressEventProcessing;
            suppressEventProcessing = true;
            var _loc_5:int = 0;
            while (_loc_5 < _count)
            {
                
                _curIteration = _loc_5;
                dispatchEvent(new Event("iterationChanged"));
                if (_modifiers)
                {
                    for each (_loc_6 in _modifiers.items)
                    {
                        
                        DegrafaObject(_loc_6).parent = this;
                        DegrafaObject(_loc_6).suppressEventProcessing = true;
                        if (_loc_5 == 0)
                        {
                            _loc_6.beginModify(geometryCollection);
                        }
                        _loc_6.apply();
                    }
                }
                if (renderOnFinalIteration == true && _loc_5 == (_count - 1) || !renderOnFinalIteration)
                {
                    if (param1)
                    {
                        super.draw(param1, param2);
                    }
                    else if (graphicsTarget)
                    {
                        for each (_loc_7 in graphicsTarget)
                        {
                            
                            if (_loc_7)
                            {
                                if (autoClearGraphicsTarget)
                                {
                                    _loc_7.graphics.clear();
                                }
                                super.draw(_loc_7.graphics, param2);
                            }
                        }
                    }
                }
                _loc_5++;
            }
            if (_modifiers)
            {
                for each (_loc_6 in _modifiers.items)
                {
                    
                    _loc_6.end();
                    DegrafaObject(_loc_6).suppressEventProcessing = false;
                }
            }
            suppressEventProcessing = _loc_4;
            _isDrawing = false;
            _curIteration = -1;
            this.invalidated = false;
            return;
        }// end function

        override public function preDraw() : void
        {
            if (invalidated)
            {
                commandStack.length = 0;
            }
            super.preDraw();
            return;
        }// end function

        public function get count() : int
        {
            return _count;
        }// end function

        override public function set height(param1:Number) : void
        {
            if (_height != param1)
            {
                _height = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get modifierCollection() : RepeaterModifierCollection
        {
            initModifiersCollection();
            return _modifiers;
        }// end function

        override public function get x() : Number
        {
            if (!_x)
            {
                return 0;
            }
            return _x;
        }// end function

        override public function set width(param1:Number) : void
        {
            if (_width != param1)
            {
                _width = param1;
                invalidated = true;
            }
            return;
        }// end function

        public function get iteration() : int
        {
            return _curIteration;
        }// end function

        public function set count(param1:int) : void
        {
            var _loc_2:int = 0;
            _loc_2 = _count;
            _count = param1;
            invalidated = true;
            initChange("count", _loc_2, _count, this);
            return;
        }// end function

        override public function set y(param1:Number) : void
        {
            if (_y != param1)
            {
                _y = param1;
                invalidated = true;
            }
            return;
        }// end function

        override protected function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            if (_isDrawing || this.suppressEventProcessing == true)
            {
                this.invalidated = true;
                return;
            }
            super.propertyChangeHandler(event);
            return;
        }// end function

        override public function get height() : Number
        {
            if (!_height)
            {
                return 0;
            }
            return _height;
        }// end function

        override public function set x(param1:Number) : void
        {
            if (_x != param1)
            {
                _x = param1;
                invalidated = true;
            }
            return;
        }// end function

        private function calcBounds() : void
        {
            _bounds = new Rectangle();
            _bounds.x = x;
            _bounds.y = y;
            _bounds.width = width;
            _bounds.height = height;
            return;
        }// end function

        public function set modifiers(param1:Array) : void
        {
            initModifiersCollection();
            _modifiers.items = param1;
            return;
        }// end function

        public function get modifiers() : Array
        {
            initModifiersCollection();
            return _modifiers.items;
        }// end function

    }
}
