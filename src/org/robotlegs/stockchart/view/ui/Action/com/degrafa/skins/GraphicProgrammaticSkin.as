package com.degrafa.skins
{
    import com.degrafa.core.*;
    import com.degrafa.core.collections.*;
    import com.degrafa.geometry.*;
    import com.degrafa.states.*;
    import com.degrafa.triggers.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import mx.events.*;
    import mx.skins.*;

    public class GraphicProgrammaticSkin extends ProgrammaticSkin implements IGraphicSkin, IDegrafaStateClient
    {
        private var _triggers:Array;
        private var _states:Array;
        private var _stateEvent:String;
        private var _fills:FillCollection;
        private var _stroke:IGraphicsStroke;
        private var _fill:IGraphicsFill;
        private var _enableEvents:Boolean = true;
        private var _currentState:String = "";
        private var _data:Object;
        private var _1937862396skinHeight:Number = 0;
        private var _state:String;
        private var _surpressEventProcessing:Boolean = false;
        private var _2029665865skinWidth:Number = 0;
        private var _geometry:GeometryCollection;
        private var stateManager:StateManager;
        private var _strokes:StrokeCollection;

        public function GraphicProgrammaticSkin()
        {
            _triggers = [];
            _states = [];
            addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
            return;
        }// end function

        public function set percentWidth(param1:Number) : void
        {
            return;
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
            return;
        }// end function

        public function set fill(param1:IGraphicsFill) : void
        {
            _fill = param1;
            return;
        }// end function

        public function set skinHeight(param1:Number) : void
        {
            var _loc_2:* = this._1937862396skinHeight;
            if (_loc_2 !== param1)
            {
                this._1937862396skinHeight = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skinHeight", _loc_2, param1));
            }
            return;
        }// end function

        public function dispatchPropertyChange(param1:Boolean = false, param2:Object = null, param3:Object = null, param4:Object = null, param5:Object = null) : Boolean
        {
            return dispatchEvent(new PropertyChangeEvent("propertyChange", param1, false, PropertyChangeEventKind.UPDATE, param2, param3, param4, param5));
        }// end function

        public function get states() : Array
        {
            return _states;
        }// end function

        public function get skinHeight() : Number
        {
            return this._1937862396skinHeight;
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

        public function set stateEvent(param1:String) : void
        {
            _stateEvent = param1;
            return;
        }// end function

        public function set target(param1:DisplayObjectContainer) : void
        {
            return;
        }// end function

        public function set currentState(param1:String) : void
        {
            stateManager.currentState = param1;
            return;
        }// end function

        public function set state(param1:String) : void
        {
            _state = param1;
            return;
        }// end function

        override public function dispatchEvent(event:Event) : Boolean
        {
            if (_surpressEventProcessing)
            {
                return false;
            }
            return super.dispatchEvent(event);
        }// end function

        public function get strokes() : Array
        {
            initSrokesCollection();
            return _strokes.items;
        }// end function

        public function draw(param1:Graphics, param2:Rectangle) : void
        {
            var _loc_3:Geometry = null;
            var _loc_4:Array = null;
            var _loc_5:int = 0;
            if (!parent)
            {
                return;
            }
            this.graphics.clear();
            if (geometry)
            {
                for each (_loc_3 in _geometry.items)
                {
                    
                    if (_loc_3.state == "" || _loc_3.state == null)
                    {
                        if (states)
                        {
                            prepareState();
                        }
                        _loc_3.draw(this.graphics, null);
                        continue;
                    }
                    _loc_4 = _loc_3.state.split(" ");
                    if (_loc_4.length > 0)
                    {
                        _loc_5 = 0;
                        while (_loc_5 < _loc_4.length)
                        {
                            
                            if (name == _loc_4[_loc_5])
                            {
                                _loc_3.draw(this.graphics, null);
                                break;
                            }
                            _loc_5++;
                        }
                        continue;
                    }
                    if (_loc_3.state == name)
                    {
                        _loc_3.draw(this.graphics, null);
                    }
                }
            }
            return;
        }// end function

        public function get stroke() : IGraphicsStroke
        {
            return _stroke;
        }// end function

        public function get fills() : Array
        {
            initFillsCollection();
            return _fills.items;
        }// end function

        public function get skinWidth() : Number
        {
            return this._2029665865skinWidth;
        }// end function

        public function get isInitialized() : Boolean
        {
            return true;
        }// end function

        public function set data(param1:Object) : void
        {
            _data = param1;
            return;
        }// end function

        public function get hasEventManager() : Boolean
        {
            return true;
        }// end function

        public function set stroke(param1:IGraphicsStroke) : void
        {
            _stroke = param1;
            return;
        }// end function

        public function get geometry() : Array
        {
            initGeometryCollection();
            return _geometry.items;
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
            return;
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

        public function get fillCollection() : FillCollection
        {
            initFillsCollection();
            return _fills;
        }// end function

        public function get fill() : IGraphicsFill
        {
            return _fill;
        }// end function

        public function get percentWidth() : Number
        {
            return 0;
        }// end function

        public function get target() : DisplayObjectContainer
        {
            return null;
        }// end function

        public function set percentHeight(param1:Number) : void
        {
            return;
        }// end function

        public function get stateEvent() : String
        {
            return _stateEvent;
        }// end function

        private function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            dispatchEvent(event);
            invalidateDisplayList();
            return;
        }// end function

        private function onAddedToStage(event:Event) : void
        {
            var _loc_2:Object = null;
            var _loc_3:ITrigger = null;
            if (triggers.length != 0)
            {
                _loc_2 = Object(this)._bindingsByDestination;
                for each (_loc_3 in triggers)
                {
                    
                    if (!_loc_3.source)
                    {
                        if (_loc_2[_loc_3.id + ".source"])
                        {
                            _loc_2[_loc_3.id + ".source"].execute(_loc_3);
                        }
                    }
                }
            }
            return;
        }// end function

        public function get data() : Object
        {
            return _data;
        }// end function

        public function set fills(param1:Array) : void
        {
            initFillsCollection();
            _fills.items = param1;
            return;
        }// end function

        public function get geometryCollection() : GeometryCollection
        {
            initGeometryCollection();
            return _geometry;
        }// end function

        public function set surpressEventProcessing(param1:Boolean) : void
        {
            if (_surpressEventProcessing == true && param1 == false)
            {
                _surpressEventProcessing = param1;
                initChange("surpressEventProcessing", false, true, this);
            }
            else
            {
                _surpressEventProcessing = param1;
            }
            return;
        }// end function

        public function get triggers() : Array
        {
            return _triggers;
        }// end function

        public function get state() : String
        {
            return _state;
        }// end function

        public function get currentState() : String
        {
            return stateManager ? (stateManager.currentState) : ("");
        }// end function

        private function prepareState() : void
        {
            var _loc_1:State = null;
            for each (_loc_1 in states)
            {
                
                if (_loc_1.name == name)
                {
                    currentState = name;
                }
            }
            return;
        }// end function

        public function set skinWidth(param1:Number) : void
        {
            var _loc_2:* = this._2029665865skinWidth;
            if (_loc_2 !== param1)
            {
                this._2029665865skinWidth = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "skinWidth", _loc_2, param1));
            }
            return;
        }// end function

        public function get percentHeight() : Number
        {
            return 0;
        }// end function

        public function endDraw(param1:Graphics) : void
        {
            if (fill)
            {
                fill.end(this.graphics);
            }
            return;
        }// end function

        public function get graphicsData() : Array
        {
            return null;
        }// end function

        public function set graphicsData(param1:Array) : void
        {
            return;
        }// end function

        public function get surpressEventProcessing() : Boolean
        {
            return _surpressEventProcessing;
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

        private function initGeometryCollection() : void
        {
            if (!_geometry)
            {
                _geometry = new GeometryCollection();
                if (enableEvents)
                {
                    _geometry.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        public function set geometry(param1:Array) : void
        {
            var _loc_2:Geometry = null;
            initGeometryCollection();
            _geometry.items = param1;
            for each (_loc_2 in _geometry.items)
            {
                
                _loc_2.autoClearGraphicsTarget = false;
                _loc_2.graphicsTarget = [this];
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

        public function get strokeCollection() : StrokeCollection
        {
            initSrokesCollection();
            return _strokes;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            skinWidth = param1;
            skinHeight = param2;
            draw(null, null);
            endDraw(null);
            return;
        }// end function

        public function set enableEvents(param1:Boolean) : void
        {
            _enableEvents = param1;
            return;
        }// end function

    }
}
