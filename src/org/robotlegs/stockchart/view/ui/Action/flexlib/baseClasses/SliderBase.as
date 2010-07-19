package flexlib.baseClasses
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import flexlib.controls.sliderClasses.*;
    import mx.controls.sliderClasses.*;
    import mx.core.*;
    import mx.effects.*;
    import mx.events.*;
    import mx.formatters.*;
    import mx.resources.*;
    import mx.styles.*;

    public class SliderBase extends UIComponent
    {
        private var _enabled:Boolean;
        private var snapIntervalChanged:Boolean = false;
        protected var _direction:String = "horizontal";
        protected var _thumbClass:Class;
        private var _labels:Array;
        public var allowTrackClick:Boolean = true;
        private var valuesChanged:Boolean = false;
        var keyInteraction:Boolean = false;
        private var directionChanged:Boolean = false;
        private var enabledChanged:Boolean = false;
        protected var dataFormatter:NumberBase;
        protected var track:IFlexDisplayObject;
        private var _values:Array;
        private var initValues:Boolean = true;
        public var liveDragging:Boolean = false;
        protected var thumbs:UIComponent;
        private var _tickInterval:Number = 0;
        private var ticksChanged:Boolean = false;
        private var minimumSet:Boolean = false;
        private var ticks:UIComponent;
        private var _thumbCount:int = 1;
        protected var labelObjects:UIComponent;
        public var allowThumbOverlap:Boolean = false;
        private var snapIntervalPrecision:int = -1;
        protected var dataTip:SliderDataTip;
        private var _snapInterval:Number = 0;
        private var thumbsChanged:Boolean = true;
        private var _tabIndex:Number;
        private var _sliderDataTipClass:Class;
        private var tabIndexChanged:Boolean;
        private var _tickValues:Array;
        private var labelsChanged:Boolean = false;
        protected var interactionClickTarget:String;
        protected var trackHighlightChanged:Boolean = true;
        private var _minimum:Number = 0;
        public var showDataTip:Boolean = true;
        var innerSlider:UIComponent;
        private var labelStyleChanged:Boolean = false;
        protected var _dataTipFormatFunction:Function;
        private var trackHitArea:UIComponent;
        protected var highlightTrack:IFlexDisplayObject;
        private var _maximum:Number = 10;
        private static var sharedResources:ResourceBundle = ResourceBundle.getResourceBundle("SharedResources", ApplicationDomain.currentDomain);
        private static var resourceDecimalSeparatorTo:String;
        private static var resourceThousandsSeparatorFrom:String;
        private static var resourceDecimalSeparatorFrom:String;

        public function SliderBase()
        {
            _labels = [];
            _thumbClass = SliderThumb;
            _sliderDataTipClass = SliderDataTip;
            _tickValues = [];
            _values = [0, 0];
            tabChildren = true;
            return;
        }// end function

        public function get sliderThumbClass() : Class
        {
            return _thumbClass;
        }// end function

        public function set sliderThumbClass(param1:Class) : void
        {
            _thumbClass = param1;
            thumbsChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        public function set tickInterval(param1:Number) : void
        {
            _tickInterval = param1;
            ticksChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        public function set direction(param1:String) : void
        {
            _direction = param1;
            directionChanged = true;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            return;
        }// end function

        public function get minimum() : Number
        {
            return _minimum;
        }// end function

        override protected function commitProperties() : void
        {
            var _loc_1:int = 0;
            var _loc_2:int = 0;
            var _loc_3:Boolean = false;
            var _loc_4:int = 0;
            var _loc_5:SliderLabel = null;
            var _loc_6:String = null;
            var _loc_7:Number = NaN;
            super.commitProperties();
            if (trackHighlightChanged)
            {
                trackHighlightChanged = false;
                if (getStyle("showTrackHighlight"))
                {
                    createHighlightTrack();
                }
                else if (highlightTrack)
                {
                    innerSlider.removeChild(DisplayObject(highlightTrack));
                    highlightTrack = null;
                }
            }
            if (directionChanged)
            {
                directionChanged = false;
                _loc_3 = _direction == SliderDirection.HORIZONTAL;
                if (_loc_3)
                {
                    DisplayObject(innerSlider).rotation = 0;
                }
                else
                {
                    DisplayObject(innerSlider).rotation = -90;
                    innerSlider.y = unscaledHeight;
                }
                if (labelObjects)
                {
                    _loc_4 = labelObjects.numChildren - 1;
                    while (_loc_4 >= 0)
                    {
                        
                        _loc_5 = SliderLabel(labelObjects.getChildAt(_loc_4));
                        _loc_5.rotation = _loc_3 ? (0) : (90);
                        _loc_4 = _loc_4 - 1;
                    }
                }
            }
            if (labelStyleChanged && !labelsChanged)
            {
                labelStyleChanged = false;
                if (labelObjects)
                {
                    _loc_6 = getStyle("labelStyleName");
                    _loc_1 = labelObjects.numChildren;
                    _loc_2 = 0;
                    while (_loc_2 < _loc_1)
                    {
                        
                        ISimpleStyleClient(labelObjects.getChildAt(_loc_2)).styleName = _loc_6;
                        _loc_2++;
                    }
                }
            }
            if (thumbsChanged)
            {
                thumbsChanged = false;
                createThumbs();
            }
            if (ticksChanged)
            {
                ticksChanged = false;
                createTicks();
            }
            if (labelsChanged)
            {
                labelsChanged = false;
                createLabels();
            }
            if (initValues)
            {
                initValues = false;
                if (!valuesChanged)
                {
                    _loc_7 = minimum;
                    _loc_1 = _thumbCount;
                    _loc_2 = 0;
                    while (_loc_2 < _loc_1)
                    {
                        
                        _values[_loc_2] = _loc_7;
                        setValueAt(_loc_7, _loc_2);
                        if (_snapInterval && _snapInterval != 0)
                        {
                            _loc_7 = _loc_7 + snapInterval;
                        }
                        else
                        {
                            _loc_7 = _loc_7 + 1;
                        }
                        _loc_2++;
                    }
                    snapIntervalChanged = false;
                }
            }
            if (snapIntervalChanged)
            {
                snapIntervalChanged = false;
                if (!valuesChanged)
                {
                    _loc_1 = thumbs.numChildren;
                    _loc_2 = 0;
                    while (_loc_2 < _loc_1)
                    {
                        
                        setValueAt(getValueFromX(SliderThumb(thumbs.getChildAt(_loc_2)).xPosition), _loc_2);
                        _loc_2++;
                    }
                }
            }
            if (valuesChanged)
            {
                valuesChanged = false;
                _loc_1 = _thumbCount;
                _loc_2 = 0;
                while (_loc_2 < _loc_1)
                {
                    
                    setValueAt(getValueFromX(getXFromValue(Math.min(Math.max(values[_loc_2], minimum), maximum))), _loc_2);
                    _loc_2++;
                }
            }
            if (enabledChanged)
            {
                enabledChanged = false;
                _loc_1 = thumbs.numChildren;
                _loc_2 = 0;
                while (_loc_2 < _loc_1)
                {
                    
                    SliderThumb(thumbs.getChildAt(_loc_2)).enabled = _enabled;
                    _loc_2++;
                }
                _loc_1 = labelObjects ? (labelObjects.numChildren) : (0);
                _loc_2 = 0;
                while (_loc_2 < _loc_1)
                {
                    
                    SliderLabel(labelObjects.getChildAt(_loc_2)).enabled = _enabled;
                    _loc_2++;
                }
            }
            if (tabIndexChanged)
            {
                tabIndexChanged = false;
                _loc_1 = thumbs.numChildren;
                _loc_2 = 0;
                while (_loc_2 < _loc_1)
                {
                    
                    SliderThumb(thumbs.getChildAt(_loc_2)).tabIndex = _tabIndex;
                    _loc_2++;
                }
            }
            return;
        }// end function

        function getSnapValue(param1:Number, param2:SliderThumb = null) : Number
        {
            var _loc_3:Number = NaN;
            var _loc_4:Boolean = false;
            var _loc_5:Object = null;
            var _loc_6:SliderThumb = null;
            var _loc_7:SliderThumb = null;
            if (!isNaN(_snapInterval) && _snapInterval != 0)
            {
                _loc_3 = getValueFromX(param1);
                if (param2 && thumbs.numChildren > 1 && !allowThumbOverlap)
                {
                    _loc_4 = true;
                    _loc_5 = getXBounds(param2.thumbIndex);
                    _loc_6 = param2.thumbIndex > 0 ? (SliderThumb(thumbs.getChildAt((param2.thumbIndex - 1)))) : (null);
                    _loc_7 = (param2.thumbIndex + 1) < thumbs.numChildren ? (SliderThumb(thumbs.getChildAt((param2.thumbIndex + 1)))) : (null);
                    if (_loc_6)
                    {
                        _loc_5.min = _loc_5.min - _loc_6.width / 2;
                        if (_loc_3 == minimum)
                        {
                            if (getValueFromX(_loc_6.xPosition - _loc_6.width / 2) != minimum)
                            {
                                _loc_4 = false;
                            }
                        }
                    }
                    else if (_loc_3 == minimum)
                    {
                        _loc_4 = false;
                    }
                    if (_loc_7)
                    {
                        _loc_5.max = _loc_5.max + _loc_7.width / 2;
                        if (_loc_3 == maximum)
                        {
                            if (getValueFromX(_loc_7.xPosition + _loc_7.width / 2) != maximum)
                            {
                                _loc_4 = false;
                            }
                        }
                    }
                    else if (_loc_3 == maximum)
                    {
                        _loc_4 = false;
                    }
                    if (_loc_4)
                    {
                        _loc_3 = Math.min(Math.max(_loc_3, getValueFromX(Math.round(_loc_5.min)) + _snapInterval), getValueFromX(Math.round(_loc_5.max)) - _snapInterval);
                    }
                }
                return getXFromValue(_loc_3);
            }
            return param1;
        }// end function

        protected function createHighlightTrack() : void
        {
            var _loc_2:Class = null;
            var _loc_1:* = getStyle("showTrackHighlight");
            if (!highlightTrack && _loc_1)
            {
                _loc_2 = getStyle("trackHighlightSkin");
                highlightTrack = new _loc_2;
                if (highlightTrack is ISimpleStyleClient)
                {
                    ISimpleStyleClient(highlightTrack).styleName = this;
                }
                innerSlider.addChildAt(DisplayObject(highlightTrack), (innerSlider.getChildIndex(DisplayObject(track)) + 1));
            }
            return;
        }// end function

        function drawTrackHighlight() : void
        {
            var _loc_1:Number = NaN;
            var _loc_2:Number = NaN;
            var _loc_3:SliderThumb = null;
            var _loc_4:SliderThumb = null;
            if (highlightTrack)
            {
                _loc_3 = SliderThumb(thumbs.getChildAt(0));
                if (_thumbCount > 1)
                {
                    _loc_1 = _loc_3.xPosition;
                    _loc_4 = SliderThumb(thumbs.getChildAt(1));
                    _loc_2 = _loc_4.xPosition - _loc_3.xPosition;
                }
                else
                {
                    _loc_1 = track.x;
                    _loc_2 = _loc_3.xPosition - _loc_1;
                }
                highlightTrack.move(_loc_1, (track.y + 1));
                highlightTrack.setActualSize(_loc_2 > 0 ? (_loc_2) : (0), highlightTrack.height);
            }
            return;
        }// end function

        function getXBounds(param1:int) : Object
        {
            var _loc_2:* = track.x + track.width;
            var _loc_3:* = track.x;
            if (allowThumbOverlap)
            {
                return {max:_loc_2, min:_loc_3};
            }
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_6:* = param1 > 0 ? (SliderThumb(thumbs.getChildAt((param1 - 1)))) : (null);
            var _loc_7:* = (param1 + 1) < thumbs.numChildren ? (SliderThumb(thumbs.getChildAt((param1 + 1)))) : (null);
            if (_loc_6)
            {
                _loc_4 = _loc_6.xPosition + _loc_6.width / 2;
            }
            if (_loc_7)
            {
                _loc_5 = _loc_7.xPosition - _loc_7.width / 2;
            }
            if (isNaN(_loc_4))
            {
                _loc_4 = _loc_3;
            }
            else
            {
                _loc_4 = Math.min(Math.max(_loc_3, _loc_4), _loc_2);
            }
            if (isNaN(_loc_5))
            {
                _loc_5 = _loc_2;
            }
            else
            {
                _loc_5 = Math.max(Math.min(_loc_2, _loc_5), _loc_3);
            }
            return {max:_loc_5, min:_loc_4};
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_11:Number = NaN;
            var _loc_23:SliderLabel = null;
            var _loc_24:SliderLabel = null;
            var _loc_25:SliderThumb = null;
            super.updateDisplayList(param1, param2);
            var _loc_3:* = _direction == SliderDirection.HORIZONTAL;
            var _loc_4:* = labelObjects ? (labelObjects.numChildren) : (0);
            var _loc_5:* = thumbs ? (thumbs.numChildren) : (0);
            var _loc_6:* = getStyle("trackMargin");
            var _loc_7:Number = 6;
            var _loc_8:* = SliderThumb(thumbs.getChildAt(0));
            if (thumbs && _loc_8)
            {
                _loc_7 = _loc_8.getExplicitOrMeasuredWidth();
            }
            var _loc_9:* = _loc_7 / 2;
            var _loc_10:* = _loc_7 / 2;
            var _loc_12:Number = 0;
            if (_loc_4 > 0)
            {
                _loc_23 = SliderLabel(labelObjects.getChildAt(0));
                _loc_12 = _loc_3 ? (_loc_23.getExplicitOrMeasuredWidth()) : (_loc_23.getExplicitOrMeasuredHeight());
            }
            var _loc_13:Number = 0;
            if (_loc_4 > 1)
            {
                _loc_24 = SliderLabel(labelObjects.getChildAt((_loc_4 - 1)));
                _loc_13 = _loc_3 ? (_loc_24.getExplicitOrMeasuredWidth()) : (_loc_24.getExplicitOrMeasuredHeight());
            }
            if (!isNaN(_loc_6))
            {
                _loc_11 = _loc_6;
            }
            else
            {
                _loc_11 = (_loc_12 + _loc_13) / 2;
            }
            if (_loc_4 > 0)
            {
                if (!isNaN(_loc_6))
                {
                    _loc_9 = Math.max(_loc_9, _loc_11 / (_loc_4 > 1 ? (2) : (1)));
                }
                else
                {
                    _loc_9 = Math.max(_loc_9, _loc_12 / 2);
                }
            }
            else
            {
                _loc_9 = Math.max(_loc_9, _loc_11 / 2);
            }
            var _loc_14:* = getComponentBounds();
            var _loc_15:* = ((_loc_3 ? (param2) : (param1)) - (Number(_loc_14.lower) - Number(_loc_14.upper))) / 2 - Number(_loc_14.upper);
            track.move(Math.round(_loc_9), _loc_15);
            track.setActualSize((_loc_3 ? (param1) : (param2)) - _loc_9 * 2, track.height);
            var _loc_16:* = track.y + (track.height - _loc_8.getExplicitOrMeasuredHeight()) / 2 + getStyle("thumbOffset");
            var _loc_17:* = _thumbCount;
            var _loc_18:int = 0;
            while (_loc_18 < _loc_17)
            {
                
                _loc_25 = SliderThumb(thumbs.getChildAt(_loc_18));
                SliderThumb(thumbs.getChildAt(_loc_18)).move(_loc_25.x, _loc_16);
                _loc_25.visible = true;
                _loc_25.setActualSize(_loc_25.getExplicitOrMeasuredWidth(), _loc_25.getExplicitOrMeasuredHeight());
                _loc_18++;
            }
            var _loc_19:* = trackHitArea.graphics;
            var _loc_20:Number = 0;
            if (_tickInterval > 0 || _tickValues && _tickValues.length > 0)
            {
                _loc_20 = getStyle("tickLength");
            }
            _loc_19.clear();
            _loc_19.beginFill(0, 0);
            var _loc_21:* = _loc_8.getExplicitOrMeasuredHeight();
            var _loc_22:* = !_loc_8.getExplicitOrMeasuredHeight() ? (0) : (_loc_21 / 2);
            _loc_19.drawRect(track.x, track.y - _loc_22 - _loc_20, track.width, track.height + _loc_21 + _loc_20);
            _loc_19.endFill();
            if (_direction != SliderDirection.HORIZONTAL)
            {
                innerSlider.y = param2;
            }
            layoutTicks();
            layoutLabels();
            setPosFromValue();
            drawTrackHighlight();
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            dataFormatter = new NumberBase(resourceDecimalSeparatorFrom, resourceThousandsSeparatorFrom, resourceDecimalSeparatorTo, "");
            if (!innerSlider)
            {
                innerSlider = new UIComponent();
                UIComponent(innerSlider).tabChildren = true;
                addChild(innerSlider);
            }
            createBackgroundTrack();
            if (!trackHitArea)
            {
                trackHitArea = new UIComponent();
                innerSlider.addChild(trackHitArea);
                trackHitArea.addEventListener(MouseEvent.MOUSE_DOWN, track_mouseDownHandler);
            }
            invalidateProperties();
            return;
        }// end function

        public function set minimum(param1:Number) : void
        {
            _minimum = param1;
            ticksChanged = true;
            if (!initValues)
            {
                valuesChanged = true;
            }
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        public function get tickValues() : Array
        {
            return _tickValues;
        }// end function

        public function get maximum() : Number
        {
            return _maximum;
        }// end function

        private function createBackgroundTrack() : void
        {
            var _loc_1:Class = null;
            if (!track)
            {
                _loc_1 = getStyle("trackSkin");
                track = new _loc_1;
                if (track is ISimpleStyleClient)
                {
                    ISimpleStyleClient(track).styleName = this;
                }
                innerSlider.addChildAt(DisplayObject(track), 0);
            }
            return;
        }// end function

        protected function positionDataTip(param1:Object) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:* = param1.x;
            var _loc_5:* = param1.y;
            var _loc_6:* = getStyle("dataTipPlacement");
            var _loc_7:* = getStyle("dataTipOffset");
            if (_direction == SliderDirection.HORIZONTAL)
            {
                _loc_2 = _loc_4;
                _loc_3 = _loc_5;
                if (_loc_6 == "left")
                {
                    _loc_2 = _loc_2 - (_loc_7 + dataTip.width);
                    _loc_3 = _loc_3 + (param1.height - dataTip.height) / 2;
                }
                else if (_loc_6 == "right")
                {
                    _loc_2 = _loc_2 + (_loc_7 + param1.width);
                    _loc_3 = _loc_3 + (param1.height - dataTip.height) / 2;
                }
                else if (_loc_6 == "top")
                {
                    _loc_3 = _loc_3 - (_loc_7 + dataTip.height);
                    _loc_2 = _loc_2 - (dataTip.width - param1.width) / 2;
                }
                else if (_loc_6 == "bottom")
                {
                    _loc_3 = _loc_3 + (_loc_7 + param1.height);
                    _loc_2 = _loc_2 - (dataTip.width - param1.width) / 2;
                }
            }
            else
            {
                _loc_2 = _loc_5;
                _loc_3 = unscaledHeight - _loc_4 - (dataTip.height + param1.width) / 2;
                if (_loc_6 == "left")
                {
                    _loc_2 = _loc_2 - (_loc_7 + dataTip.width);
                }
                else if (_loc_6 == "right")
                {
                    _loc_2 = _loc_2 + (_loc_7 + param1.height);
                }
                else if (_loc_6 == "top")
                {
                    _loc_3 = _loc_3 - (_loc_7 + (dataTip.height + param1.width) / 2);
                    _loc_2 = _loc_2 - (dataTip.width - param1.height) / 2;
                }
                else if (_loc_6 == "bottom")
                {
                    _loc_3 = _loc_3 + (_loc_7 + (dataTip.height + param1.width) / 2);
                    _loc_2 = _loc_2 - (dataTip.width - param1.height) / 2;
                }
            }
            var _loc_8:* = new Point(_loc_2, _loc_3);
            var _loc_9:* = localToGlobal(_loc_8);
            dataTip.x = _loc_9.x < 0 ? (0) : (_loc_9.x);
            dataTip.y = _loc_9.y < 0 ? (0) : (_loc_9.y);
            return;
        }// end function

        public function get values() : Array
        {
            return _values;
        }// end function

        private function createLabels() : void
        {
            var _loc_1:SliderLabel = null;
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_5:String = null;
            if (labelObjects)
            {
                _loc_2 = labelObjects.numChildren - 1;
                while (_loc_2 >= 0)
                {
                    
                    labelObjects.removeChildAt(_loc_2);
                    _loc_2 = _loc_2 - 1;
                }
            }
            else
            {
                labelObjects = new UIComponent();
                innerSlider.addChildAt(labelObjects, innerSlider.getChildIndex(trackHitArea));
            }
            if (_labels)
            {
                _loc_3 = _labels.length;
                _loc_4 = 0;
                while (_loc_4 < _loc_3)
                {
                    
                    _loc_1 = new SliderLabel();
                    _loc_1.text = _labels[_loc_4] is String ? (_labels[_loc_4]) : (_labels[_loc_4].toString());
                    if (_direction != SliderDirection.HORIZONTAL)
                    {
                        _loc_1.rotation = 90;
                    }
                    _loc_5 = getStyle("labelStyleName");
                    if (_loc_5)
                    {
                        _loc_1.styleName = _loc_5;
                    }
                    labelObjects.addChild(_loc_1);
                    _loc_4++;
                }
            }
            return;
        }// end function

        private function destroyDataTip() : void
        {
            if (dataTip)
            {
                systemManager.toolTipChildren.removeChild(dataTip);
                dataTip = null;
            }
            return;
        }// end function

        protected function setValueFromPos(param1:int) : void
        {
            var _loc_2:* = SliderThumb(thumbs.getChildAt(param1));
            setValueAt(getValueFromX(_loc_2.xPosition), param1);
            return;
        }// end function

        public function set tickValues(param1:Array) : void
        {
            _tickValues = param1;
            ticksChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        override public function get enabled() : Boolean
        {
            return _enabled;
        }// end function

        public function set values(param1:Array) : void
        {
            _values = param1;
            valuesChanged = true;
            minimumSet = true;
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        function getXFromValue(param1:Number) : Number
        {
            var _loc_2:Number = NaN;
            if (param1 == minimum)
            {
                _loc_2 = track.x;
            }
            else if (param1 == maximum)
            {
                _loc_2 = track.x + track.width;
            }
            else
            {
                _loc_2 = track.x + (param1 - minimum) * track.width / (maximum - minimum);
            }
            return _loc_2;
        }// end function

        public function set maximum(param1:Number) : void
        {
            _maximum = param1;
            ticksChanged = true;
            if (!initValues)
            {
                valuesChanged = true;
            }
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        function onThumbPress(param1:Object) : void
        {
            var _loc_3:String = null;
            var _loc_4:String = null;
            if (showDataTip)
            {
                if (!dataTip)
                {
                    dataTip = SliderDataTip(new sliderDataTipClass());
                    systemManager.toolTipChildren.addChild(dataTip);
                    _loc_4 = getStyle("dataTipStyleName");
                    if (_loc_4)
                    {
                        dataTip.styleName = _loc_4;
                    }
                }
                if (_dataTipFormatFunction != null)
                {
                    _loc_3 = this._dataTipFormatFunction(getValueFromX(param1.xPosition));
                }
                else
                {
                    _loc_3 = dataFormatter.formatPrecision(String(getValueFromX(param1.xPosition)), getStyle("dataTipPrecision"));
                }
                dataTip.text = _loc_3;
                dataTip.validateNow();
                dataTip.setActualSize(dataTip.getExplicitOrMeasuredWidth(), dataTip.getExplicitOrMeasuredHeight());
                positionDataTip(param1);
            }
            keyInteraction = false;
            var _loc_2:* = new SliderEvent(SliderEvent.THUMB_PRESS);
            _loc_2.thumbIndex = param1.thumbIndex;
            dispatchEvent(_loc_2);
            return;
        }// end function

        public function setThumbValueAt(param1:int, param2:Number) : void
        {
            setValueAt(param2, param1);
            valuesChanged = true;
            invalidateProperties();
            invalidateDisplayList();
            return;
        }// end function

        public function set snapInterval(param1:Number) : void
        {
            _snapInterval = param1;
            var _loc_2:* = new String(1 + param1).split(".");
            if (_loc_2.length == 2)
            {
                snapIntervalPrecision = _loc_2[1].length;
            }
            else
            {
                snapIntervalPrecision = -1;
            }
            if (!isNaN(param1) && param1 != 0)
            {
                snapIntervalChanged = true;
                invalidateProperties();
                invalidateDisplayList();
            }
            return;
        }// end function

        function unRegisterMouseMove(param1:Function) : void
        {
            innerSlider.removeEventListener(MouseEvent.MOUSE_MOVE, param1);
            return;
        }// end function

        function getTrackHitArea() : UIComponent
        {
            return trackHitArea;
        }// end function

        private function layoutTicks() : void
        {
            var _loc_1:Graphics = null;
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Boolean = false;
            var _loc_9:int = 0;
            var _loc_10:Number = NaN;
            if (ticks)
            {
                _loc_1 = ticks.graphics;
                _loc_2 = getStyle("tickLength");
                _loc_3 = getStyle("tickOffset");
                _loc_4 = getStyle("tickThickness");
                _loc_5 = _loc_4 / 2;
                _loc_7 = getStyle("tickColor");
                _loc_8 = _tickValues && _tickValues.length > 0 ? (true) : (false);
                _loc_9 = 0;
                _loc_10 = _loc_8 ? (_tickValues[_loc_9++]) : (minimum);
                _loc_1.clear();
                if (_tickInterval > 0 || _loc_8)
                {
                    _loc_1.lineStyle(_loc_4, _loc_7, 100);
                    do
                    {
                        
                        _loc_6 = Math.round(getXFromValue(_loc_10) - _loc_5);
                        _loc_1.moveTo(_loc_6, _loc_2);
                        _loc_1.lineTo(_loc_6, 0);
                        _loc_10 = _loc_8 ? (_loc_9 < _tickValues.length ? (_tickValues[_loc_9++]) : (NaN)) : (_tickInterval + _loc_10);
                    }while (_loc_10 < maximum || _loc_8 && _loc_9 < _tickValues.length)
                    if (!_loc_8 || _loc_10 == maximum)
                    {
                        _loc_6 = track.x + track.width - 1 - _loc_5;
                        _loc_1.moveTo(_loc_6, _loc_2);
                        _loc_1.lineTo(_loc_6, 0);
                    }
                    ticks.y = Math.round(track.y + _loc_3 - _loc_2);
                }
            }
            return;
        }// end function

        public function getThumbAt(param1:int) : SliderThumb
        {
            return param1 >= 0 && param1 < thumbs.numChildren ? (SliderThumb(thumbs.getChildAt(param1))) : (null);
        }// end function

        private function setPosFromValue() : void
        {
            var _loc_3:SliderThumb = null;
            var _loc_1:* = _thumbCount;
            var _loc_2:int = 0;
            while (_loc_2 < _loc_1)
            {
                
                _loc_3 = SliderThumb(thumbs.getChildAt(_loc_2));
                _loc_3.xPosition = getXFromValue(values[_loc_2]);
                _loc_2++;
            }
            return;
        }// end function

        protected function createThumbs() : void
        {
            var _loc_1:int = 0;
            var _loc_2:int = 0;
            var _loc_3:SliderThumb = null;
            if (thumbs)
            {
                _loc_1 = thumbs.numChildren;
                _loc_2 = _loc_1 - 1;
                while (_loc_2 >= 0)
                {
                    
                    thumbs.removeChildAt(_loc_2);
                    _loc_2 = _loc_2 - 1;
                }
            }
            else
            {
                thumbs = new UIComponent();
                thumbs.tabChildren = true;
                thumbs.tabEnabled = false;
                innerSlider.addChild(thumbs);
            }
            _loc_1 = _thumbCount;
            _loc_2 = 0;
            while (_loc_2 < _loc_1)
            {
                
                _loc_3 = SliderThumb(new _thumbClass());
                _loc_3.owner = this;
                _loc_3.styleName = this;
                _loc_3.thumbIndex = _loc_2;
                _loc_3.visible = true;
                _loc_3.enabled = enabled;
                _loc_3.upSkinName = "thumbUpSkin";
                _loc_3.downSkinName = "thumbDownSkin";
                _loc_3.disabledSkinName = "thumbDisabledSkin";
                _loc_3.overSkinName = "thumbOverSkin";
                thumbs.addChild(_loc_3);
                _loc_3.addEventListener(FocusEvent.FOCUS_IN, thumb_focusInHandler);
                _loc_3.addEventListener(FocusEvent.FOCUS_OUT, thumb_focusOutHandler);
                _loc_2++;
            }
            return;
        }// end function

        override public function set tabIndex(param1:int) : void
        {
            super.tabIndex = param1;
            _tabIndex = param1;
            tabIndexChanged = true;
            invalidateProperties();
            return;
        }// end function

        public function get direction() : String
        {
            return _direction;
        }// end function

        override public function set enabled(param1:Boolean) : void
        {
            _enabled = param1;
            enabledChanged = true;
            invalidateProperties();
            return;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            var _loc_1:* = direction == SliderDirection.HORIZONTAL;
            var _loc_2:* = labelObjects ? (labelObjects.numChildren) : (0);
            var _loc_3:* = getStyle("trackMargin");
            var _loc_4:* = DEFAULT_MEASURED_WIDTH;
            if (!isNaN(_loc_3))
            {
                if (_loc_2 > 0)
                {
                    _loc_4 = _loc_4 + (_loc_1 ? (SliderLabel(labelObjects.getChildAt(0)).getExplicitOrMeasuredWidth() / 2) : (SliderLabel(labelObjects.getChildAt(0)).getExplicitOrMeasuredHeight() / 2));
                }
                if (_loc_2 > 1)
                {
                    _loc_4 = _loc_4 + (_loc_1 ? (SliderLabel(labelObjects.getChildAt((_loc_2 - 1))).getExplicitOrMeasuredWidth() / 2) : (SliderLabel(labelObjects.getChildAt((_loc_2 - 1))).getExplicitOrMeasuredHeight() / 2));
                }
            }
            var _loc_5:* = getComponentBounds();
            var _loc_6:* = getComponentBounds().lower - _loc_5.upper;
            var _loc_7:* = _loc_1 ? (_loc_4) : (_loc_6);
            measuredWidth = _loc_1 ? (_loc_4) : (_loc_6);
            measuredMinWidth = _loc_7;
            var _loc_7:* = _loc_1 ? (_loc_6) : (_loc_4);
            measuredHeight = _loc_1 ? (_loc_6) : (_loc_4);
            measuredMinHeight = _loc_7;
            return;
        }// end function

        public function get value() : Number
        {
            return _values[0];
        }// end function

        public function get tickInterval() : Number
        {
            return _tickInterval;
        }// end function

        function getSnapIntervalWidth() : Number
        {
            return _snapInterval * track.width / (maximum - minimum);
        }// end function

        protected function thumb_focusOutHandler(event:FocusEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        public function get snapInterval() : Number
        {
            return _snapInterval;
        }// end function

        public function set thumbCount(param1:int) : void
        {
            var _loc_2:* = param1 > 2 ? (2) : (param1);
            _loc_2 = param1 < 1 ? (1) : (param1);
            if (_loc_2 != _thumbCount)
            {
                _thumbCount = _loc_2;
                thumbsChanged = true;
                initValues = true;
                invalidateProperties();
                invalidateDisplayList();
            }
            return;
        }// end function

        function registerMouseMove(param1:Function) : void
        {
            innerSlider.addEventListener(MouseEvent.MOUSE_MOVE, param1);
            return;
        }// end function

        public function set dataTipFormatFunction(param1:Function) : void
        {
            _dataTipFormatFunction = param1;
            return;
        }// end function

        override public function styleChanged(param1:String) : void
        {
            var _loc_2:* = param1 == null || param1 == "styleName";
            super.styleChanged(param1);
            if (param1 == "showTrackHighlight" || _loc_2)
            {
                trackHighlightChanged = true;
                invalidateProperties();
            }
            if (param1 == "trackHighlightSkin" || _loc_2)
            {
                if (innerSlider && highlightTrack)
                {
                    innerSlider.removeChild(DisplayObject(highlightTrack));
                    highlightTrack = null;
                }
                trackHighlightChanged = true;
                invalidateProperties();
            }
            if (param1 == "labelStyleName" || _loc_2)
            {
                labelStyleChanged = true;
                invalidateProperties();
            }
            if (param1 == "trackMargin" || _loc_2)
            {
                invalidateSize();
            }
            if (param1 == "trackSkin" || _loc_2)
            {
                if (track)
                {
                    innerSlider.removeChild(DisplayObject(track));
                    track = null;
                    createBackgroundTrack();
                }
            }
            invalidateDisplayList();
            return;
        }// end function

        public function set sliderDataTipClass(param1:Class) : void
        {
            _sliderDataTipClass = param1;
            invalidateProperties();
            return;
        }// end function

        function onThumbMove(param1:Object) : void
        {
            var _loc_2:* = getValueFromX(param1.xPosition);
            if (showDataTip)
            {
                dataTip.text = _dataTipFormatFunction != null ? (_dataTipFormatFunction(_loc_2)) : (dataFormatter.formatPrecision(String(_loc_2), getStyle("dataTipPrecision")));
                dataTip.setActualSize(dataTip.getExplicitOrMeasuredWidth(), dataTip.getExplicitOrMeasuredHeight());
                positionDataTip(param1);
            }
            if (liveDragging)
            {
                interactionClickTarget = SliderEventClickTarget.THUMB;
                setValueAt(_loc_2, param1.thumbIndex);
            }
            var _loc_3:* = new SliderEvent(SliderEvent.THUMB_DRAG);
            _loc_3.thumbIndex = param1.thumbIndex;
            dispatchEvent(_loc_3);
            return;
        }// end function

        private function layoutLabels() : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Object = null;
            var _loc_7:int = 0;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_1:* = labelObjects ? (labelObjects.numChildren) : (0);
            if (_loc_1 > 0)
            {
                _loc_3 = track.width / (_loc_1 - 1);
                _loc_2 = Math.max((_direction == SliderDirection.HORIZONTAL ? (unscaledWidth) : (unscaledHeight)) - track.width, SliderThumb(thumbs.getChildAt(0)).getExplicitOrMeasuredWidth());
                _loc_5 = track.x;
                _loc_7 = 0;
                while (_loc_7 < _loc_1)
                {
                    
                    _loc_6 = labelObjects.getChildAt(_loc_7);
                    labelObjects.getChildAt(_loc_7).setActualSize(_loc_6.getExplicitOrMeasuredWidth(), _loc_6.getExplicitOrMeasuredHeight());
                    _loc_8 = track.y - _loc_6.height + getStyle("labelOffset");
                    if (_direction == SliderDirection.HORIZONTAL)
                    {
                        _loc_4 = _loc_6.getExplicitOrMeasuredWidth() / 2;
                        if (_loc_7 == 0)
                        {
                            _loc_4 = Math.min(_loc_4, _loc_2 / (_loc_1 > Number(1) ? (Number(2)) : (Number(1))));
                        }
                        else if (_loc_7 == (_loc_1 - 1))
                        {
                            _loc_4 = Math.max(_loc_4, _loc_6.getExplicitOrMeasuredWidth() - _loc_2 / 2);
                        }
                        _loc_6.move(_loc_5 - _loc_4, _loc_8);
                    }
                    else
                    {
                        _loc_9 = getStyle("labelOffset");
                        _loc_4 = _loc_6.getExplicitOrMeasuredHeight() / 2;
                        if (_loc_7 == 0)
                        {
                            _loc_4 = Math.max(_loc_4, _loc_6.getExplicitOrMeasuredHeight() - _loc_2 / (_loc_1 > Number(1) ? (Number(2)) : (Number(1))));
                        }
                        else if (_loc_7 == (_loc_1 - 1))
                        {
                            _loc_4 = Math.min(_loc_4, _loc_2 / 2);
                        }
                        _loc_6.move(_loc_5 + _loc_4, track.y + _loc_9 + (_loc_9 > 0 ? (0) : (-_loc_6.getExplicitOrMeasuredWidth())));
                    }
                    _loc_5 = _loc_5 + _loc_3;
                    _loc_7++;
                }
            }
            return;
        }// end function

        public function get thumbCount() : int
        {
            return _thumbCount;
        }// end function

        private function getComponentBounds() : Object
        {
            var _loc_3:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_8:SliderLabel = null;
            var _loc_9:Number = NaN;
            var _loc_10:int = 0;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_1:* = direction == SliderDirection.HORIZONTAL;
            var _loc_2:* = labelObjects ? (labelObjects.numChildren) : (0);
            var _loc_4:Number = 0;
            var _loc_6:Number = 0;
            var _loc_7:* = track.height;
            if (_loc_2 > 0)
            {
                _loc_8 = SliderLabel(labelObjects.getChildAt(0));
                if (_loc_1)
                {
                    _loc_4 = _loc_8.getExplicitOrMeasuredHeight();
                }
                else
                {
                    _loc_10 = 0;
                    while (_loc_10 < _loc_2)
                    {
                        
                        _loc_8 = SliderLabel(labelObjects.getChildAt(_loc_10));
                        _loc_4 = Math.max(_loc_4, _loc_8.getExplicitOrMeasuredWidth());
                        _loc_10++;
                    }
                }
                _loc_9 = getStyle("labelOffset");
                _loc_3 = getStyle("labelOffset") - (_loc_9 > 0 ? (0) : (_loc_4));
                _loc_6 = Math.min(_loc_6, _loc_3);
                _loc_7 = Math.max(_loc_7, _loc_9 + (_loc_9 > 0 ? (_loc_4) : (0)));
            }
            if (ticks)
            {
                _loc_11 = getStyle("tickLength");
                _loc_12 = getStyle("tickOffset");
                _loc_6 = Math.min(_loc_6, _loc_12 - _loc_11);
                _loc_7 = Math.max(_loc_7, _loc_12);
            }
            if (thumbs.numChildren > 0)
            {
                _loc_5 = (track.height - SliderThumb(thumbs.getChildAt(0)).getExplicitOrMeasuredHeight()) / 2 + getStyle("thumbOffset");
                _loc_6 = Math.min(_loc_6, _loc_5);
                _loc_7 = Math.max(_loc_7, _loc_5 + SliderThumb(thumbs.getChildAt(0)).getExplicitOrMeasuredHeight());
            }
            return {lower:_loc_7, upper:_loc_6};
        }// end function

        function onThumbRelease(param1:Object) : void
        {
            interactionClickTarget = SliderEventClickTarget.THUMB;
            destroyDataTip();
            setValueFromPos(param1.thumbIndex);
            var _loc_2:* = new SliderEvent(SliderEvent.THUMB_RELEASE);
            _loc_2.thumbIndex = param1.thumbIndex;
            dispatchEvent(_loc_2);
            return;
        }// end function

        public function get dataTipFormatFunction() : Function
        {
            return _dataTipFormatFunction;
        }// end function

        public function set value(param1:Number) : void
        {
            setValueAt(param1, 0, true);
            valuesChanged = true;
            minimumSet = true;
            invalidateProperties();
            invalidateDisplayList();
            dispatchEvent(new FlexEvent(FlexEvent.VALUE_COMMIT));
            return;
        }// end function

        function updateThumbValue(param1:int) : void
        {
            setValueFromPos(param1);
            return;
        }// end function

        private function track_mouseDownHandler(event:MouseEvent) : void
        {
            var _loc_2:Point = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:int = 0;
            var _loc_7:int = 0;
            var _loc_8:SliderThumb = null;
            var _loc_9:Number = NaN;
            var _loc_10:Tween = null;
            var _loc_11:Function = null;
            var _loc_12:Number = NaN;
            if (event.target != trackHitArea && event.target != ticks)
            {
                return;
            }
            if (enabled && allowTrackClick)
            {
                interactionClickTarget = SliderEventClickTarget.TRACK;
                keyInteraction = false;
                _loc_2 = new Point(event.localX, event.localY);
                _loc_3 = _loc_2.x;
                _loc_4 = 0;
                _loc_5 = 10000000;
                _loc_6 = _thumbCount;
                _loc_7 = 0;
                while (_loc_7 < _loc_6)
                {
                    
                    _loc_12 = Math.abs(SliderThumb(thumbs.getChildAt(_loc_7)).xPosition - _loc_3);
                    if (_loc_12 < _loc_5)
                    {
                        _loc_4 = _loc_7;
                        _loc_5 = _loc_12;
                    }
                    _loc_7++;
                }
                _loc_8 = SliderThumb(thumbs.getChildAt(_loc_4));
                if (!isNaN(_snapInterval) && _snapInterval != 0)
                {
                    _loc_3 = getXFromValue(getValueFromX(_loc_3));
                }
                _loc_9 = getStyle("slideDuration");
                _loc_10 = new Tween(_loc_8, _loc_8.xPosition, _loc_3, _loc_9);
                _loc_11 = getStyle("slideEasingFunction") as Function;
                if (_loc_11 != null)
                {
                    _loc_10.easingFunction = _loc_11;
                }
                drawTrackHighlight();
            }
            return;
        }// end function

        public function get sliderDataTipClass() : Class
        {
            return _sliderDataTipClass;
        }// end function

        private function createTicks() : void
        {
            if (!ticks)
            {
                ticks = new UIComponent();
                innerSlider.addChild(ticks);
            }
            return;
        }// end function

        function getValueFromX(param1:Number) : Number
        {
            var _loc_2:* = (param1 - track.x) * (maximum - minimum) / track.width + minimum;
            if (_loc_2 - minimum <= 0.002)
            {
                _loc_2 = minimum;
            }
            else if (maximum - _loc_2 <= 0.002)
            {
                _loc_2 = maximum;
            }
            else if (!isNaN(_snapInterval) && _snapInterval != 0)
            {
                _loc_2 = Math.round((_loc_2 - minimum) / _snapInterval) * _snapInterval + minimum;
            }
            return _loc_2;
        }// end function

        protected function thumb_focusInHandler(event:FocusEvent) : void
        {
            dispatchEvent(event);
            return;
        }// end function

        protected function setValueAt(param1:Number, param2:int, param3:Boolean = false) : void
        {
            var _loc_5:Number = NaN;
            var _loc_6:SliderEvent = null;
            var _loc_4:* = _values[param2];
            if (snapIntervalPrecision != -1)
            {
                _loc_5 = Math.pow(10, snapIntervalPrecision);
                param1 = Math.round(param1 * _loc_5) / _loc_5;
            }
            _values[param2] = param1;
            if (!param3)
            {
                _loc_6 = new SliderEvent(SliderEvent.CHANGE);
                _loc_6.value = param1;
                _loc_6.thumbIndex = param2;
                _loc_6.clickTarget = interactionClickTarget;
                if (keyInteraction)
                {
                    _loc_6.triggerEvent = new KeyboardEvent(KeyboardEvent.KEY_DOWN);
                    keyInteraction = false;
                }
                else
                {
                    _loc_6.triggerEvent = new MouseEvent(MouseEvent.CLICK);
                }
                if (!isNaN(_loc_4) && Math.abs(_loc_4 - param1) > 0.002)
                {
                    dispatchEvent(_loc_6);
                }
            }
            invalidateDisplayList();
            return;
        }// end function

        public function set labels(param1:Array) : void
        {
            _labels = param1;
            labelsChanged = true;
            invalidateProperties();
            invalidateSize();
            invalidateDisplayList();
            return;
        }// end function

        public function get labels() : Array
        {
            return _labels;
        }// end function

        private static function loadResources() : void
        {
            resourceDecimalSeparatorFrom = sharedResources.getString("decimalSeparatorFrom");
            resourceThousandsSeparatorFrom = sharedResources.getString("thousandsSeparatorFrom");
            resourceDecimalSeparatorTo = sharedResources.getString("decimalSeparatorTo");
            return;
        }// end function

        loadResources();
    }
}
