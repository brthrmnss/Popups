package com.degrafa
{
    import com.degrafa.core.*;
    import com.degrafa.core.collections.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import mx.events.*;
    import mx.utils.*;

    public class Graphic extends Sprite implements IMXMLObject
    {
        private var _suppressEventProcessing:Boolean = false;
        private var _target:DisplayObjectContainer;
        private var _id:String;
        private var _width:Number = 0;
        private var _height:Number = 0;
        private var _fills:FillCollection;
        private var _percentHeight:Number;
        private var _stroke:IGraphicsStroke;
        private var _enableEvents:Boolean = true;
        private var _fill:IGraphicsFill;
        private var _percentWidth:Number;
        private var _document:Object;
        private var _strokes:StrokeCollection;

        public function Graphic()
        {
            return;
        }// end function

        public function get percentWidth() : Number
        {
            return _percentWidth;
        }// end function

        public function set percentWidth(param1:Number) : void
        {
            if (_percentWidth == param1)
            {
                return;
            }
            _percentWidth = param1;
            return;
        }// end function

        public function get fill() : IGraphicsFill
        {
            return _fill;
        }// end function

        public function set fill(param1:IGraphicsFill) : void
        {
            _fill = param1;
            return;
        }// end function

        public function set enableEvents(param1:Boolean) : void
        {
            _enableEvents = param1;
            return;
        }// end function

        public function get fillCollection() : FillCollection
        {
            initFillsCollection();
            return _fills;
        }// end function

        public function get enableEvents() : Boolean
        {
            return _enableEvents;
        }// end function

        public function get measuredHeight() : Number
        {
            return _height;
        }// end function

        public function get target() : DisplayObjectContainer
        {
            return _target;
        }// end function

        override public function set width(param1:Number) : void
        {
            _width = param1;
            draw(null, null);
            dispatchEvent(new Event("change"));
            return;
        }// end function

        private function initSrokesCollection() : void
        {
            if (!_strokes)
            {
                _strokes = new StrokeCollection();
                if (enableEvents)
                {
                    _strokes.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function set percentHeight(param1:Number) : void
        {
            if (_percentHeight == param1)
            {
                return;
            }
            _percentHeight = param1;
            return;
        }// end function

        public function get id() : String
        {
            if (_id)
            {
                return _id;
            }
            _id = NameUtil.createUniqueName(this);
            name = _id;
            return _id;
        }// end function

        public function set fills(param1:Array) : void
        {
            initFillsCollection();
            _fills.items = param1;
            return;
        }// end function

        public function dispatchPropertyChange(param1:Boolean = false, param2:Object = null, param3:Object = null, param4:Object = null, param5:Object = null) : Boolean
        {
            return dispatchEvent(new PropertyChangeEvent("propertyChange", param1, false, PropertyChangeEventKind.UPDATE, param2, param3, param4, param5));
        }// end function

        public function set target(param1:DisplayObjectContainer) : void
        {
            if (!param1)
            {
                return;
            }
            if (_target != param1 && _target != null)
            {
                _target.removeChild(this);
            }
            _target = param1;
            _target.addChild(this);
            draw(null, null);
            endDraw(null);
            return;
        }// end function

        private function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            draw(null, null);
            return;
        }// end function

        public function get measuredWidth() : Number
        {
            return _width;
        }// end function

        public function get document() : Object
        {
            return _document;
        }// end function

        override public function get height() : Number
        {
            return _height;
        }// end function

        public function set suppressEventProcessing(param1:Boolean) : void
        {
            if (_suppressEventProcessing == true && param1 == false)
            {
                _suppressEventProcessing = param1;
                initChange("suppressEventProcessing", false, true, this);
            }
            else
            {
                _suppressEventProcessing = param1;
            }
            return;
        }// end function

        public function get stroke() : IGraphicsStroke
        {
            return _stroke;
        }// end function

        public function get strokes() : Array
        {
            initSrokesCollection();
            return _strokes.items;
        }// end function

        public function set id(param1:String) : void
        {
            _id = param1;
            name = _id;
            return;
        }// end function

        public function endDraw(param1:Graphics) : void
        {
            if (fill)
            {
                fill.end(this.graphics);
            }
            return;
        }// end function

        override public function get width() : Number
        {
            return _width;
        }// end function

        public function draw(param1:Graphics, param2:Rectangle) : void
        {
            var _loc_3:Rectangle = null;
            if (!parent)
            {
                return;
            }
            if (percentWidth || percentHeight)
            {
                _width = parent.width / 100 * _percentHeight;
                _height = parent.height / 100 * _percentHeight;
            }
            this.graphics.clear();
            if (stroke)
            {
                if (!param2)
                {
                    stroke.apply(this.graphics, null);
                }
                else
                {
                    stroke.apply(this.graphics, param2);
                }
            }
            else
            {
                this.graphics.lineStyle(0, 16777215, 0);
            }
            if (fill)
            {
                if (!param2)
                {
                    _loc_3 = new Rectangle(0, 0, width, height);
                    fill.begin(this.graphics, _loc_3);
                }
                else
                {
                    fill.begin(this.graphics, param2);
                }
            }
            return;
        }// end function

        public function get percentHeight() : Number
        {
            return _percentHeight;
        }// end function

        override public function set height(param1:Number) : void
        {
            _height = param1;
            draw(null, null);
            dispatchEvent(new Event("change"));
            return;
        }// end function

        override public function dispatchEvent(event:Event) : Boolean
        {
            if (_suppressEventProcessing)
            {
                return false;
            }
            return super.dispatchEvent(event);
        }// end function

        public function get fills() : Array
        {
            initFillsCollection();
            return _fills.items;
        }// end function

        public function get suppressEventProcessing() : Boolean
        {
            return _suppressEventProcessing;
        }// end function

        private function initFillsCollection() : void
        {
            if (!_fills)
            {
                _fills = new FillCollection();
                if (enableEvents)
                {
                    _fills.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function initialized(param1:Object, param2:String) : void
        {
            if (!_id)
            {
                if (param2)
                {
                    _id = param2;
                }
                else
                {
                    _id = NameUtil.createUniqueName(this);
                }
            }
            name = _id;
            _document = param1;
            if (enableEvents && !suppressEventProcessing)
            {
                dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
            }
            return;
        }// end function

        public function initChange(param1:String, param2:Object, param3:Object, param4:Object) : void
        {
            if (hasEventManager)
            {
                dispatchPropertyChange(false, param1, param2, param3, param4);
            }
            return;
        }// end function

        public function set stroke(param1:IGraphicsStroke) : void
        {
            _stroke = param1;
            return;
        }// end function

        override public function set y(param1:Number) : void
        {
            super.y = param1;
            return;
        }// end function

        public function get hasEventManager() : Boolean
        {
            return true;
        }// end function

        public function set strokes(param1:Array) : void
        {
            initSrokesCollection();
            _strokes.items = param1;
            return;
        }// end function

        override public function set x(param1:Number) : void
        {
            super.x = param1;
            return;
        }// end function

        override public function get x() : Number
        {
            return super.x;
        }// end function

        override public function get y() : Number
        {
            return super.y;
        }// end function

        public function get strokeCollection() : StrokeCollection
        {
            initSrokesCollection();
            return _strokes;
        }// end function

    }
}
