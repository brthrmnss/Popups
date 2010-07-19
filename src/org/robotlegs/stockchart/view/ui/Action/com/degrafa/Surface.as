package com.degrafa
{
    import com.degrafa.core.collections.*;
    import flash.display.*;
    import flash.events.*;
    import mx.core.*;
    import mx.events.*;

    public class Surface extends UIComponent
    {
        private var _strokes:StrokeCollection;
        private var _fills:FillCollection;
        private var _suppressEventProcessing:Boolean = false;
        private var _enableEvents:Boolean = true;
        private var _graphicsData:GraphicsCollection;

        public function Surface()
        {
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

        public function get fillCollection() : FillCollection
        {
            initFillsCollection();
            return _fills;
        }// end function

        public function get strokeCollection() : StrokeCollection
        {
            initSrokesCollection();
            return _strokes;
        }// end function

        public function dispatchPropertyChange(param1:Boolean = false, param2:Object = null, param3:Object = null, param4:Object = null, param5:Object = null) : Boolean
        {
            return dispatchEvent(new PropertyChangeEvent("propertyChange", param1, false, PropertyChangeEventKind.UPDATE, param2, param3, param4, param5));
        }// end function

        public function get graphicsCollection() : GraphicsCollection
        {
            initGraphicsCollection();
            return _graphicsData;
        }// end function

        public function get fills() : Array
        {
            initFillsCollection();
            return _fills.items;
        }// end function

        public function get graphicsData() : Array
        {
            initGraphicsCollection();
            return _graphicsData.items;
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

        public function set fills(param1:Array) : void
        {
            initFillsCollection();
            _fills.items = param1;
            return;
        }// end function

        private function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            dispatchEvent(event);
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

        public function set graphicsData(param1:Array) : void
        {
            var _loc_2:IGraphic = null;
            initGraphicsCollection();
            _graphicsData.items = param1;
            for each (_loc_2 in _graphicsData.items)
            {
                
                addChild(DisplayObject(_loc_2));
                if (_loc_2.target == null)
                {
                    _loc_2.target = this;
                }
            }
            return;
        }// end function

        public function get hasEventManager() : Boolean
        {
            return true;
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

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            super.updateDisplayList(param1, param2);
            setActualSize(getExplicitOrMeasuredWidth(), getExplicitOrMeasuredHeight());
            return;
        }// end function

        private function initGraphicsCollection() : void
        {
            if (!_graphicsData)
            {
                _graphicsData = new GraphicsCollection();
                if (enableEvents)
                {
                    _graphicsData.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function get strokes() : Array
        {
            initSrokesCollection();
            return _strokes.items;
        }// end function

        public function get enableEvents() : Boolean
        {
            return _enableEvents;
        }// end function

        public function set strokes(param1:Array) : void
        {
            initSrokesCollection();
            _strokes.items = param1;
            return;
        }// end function

        public function set enableEvents(param1:Boolean) : void
        {
            _enableEvents = param1;
            return;
        }// end function

    }
}
