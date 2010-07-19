package flexlib.controls.sliderClasses
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flexlib.baseClasses.*;
    import mx.controls.sliderClasses.*;
    import mx.core.*;
    import mx.events.*;

    public class ExtendedSlider extends SliderBase
    {
        private var dataTips:Array;
        private var draggingRegion:Boolean = false;
        public var lockRegionsWhileDragging:Boolean = false;
        protected var highlightHitArea:UIComponent;
        private var counter:Number = 0;

        public function ExtendedSlider()
        {
            return;
        }// end function

        override function onThumbMove(param1:Object) : void
        {
            var _loc_2:* = getValueFromX(param1.xPosition);
            var _loc_3:* = dataTips[param1.thumbIndex];
            if (showDataTip)
            {
                _loc_3.text = _dataTipFormatFunction != null ? (_dataTipFormatFunction(_loc_2)) : (dataFormatter.formatPrecision(String(_loc_2), getStyle("dataTipPrecision")));
                _loc_3.setActualSize(_loc_3.getExplicitOrMeasuredWidth(), _loc_3.getExplicitOrMeasuredHeight());
                positionDataTip(param1);
            }
            if (liveDragging)
            {
                interactionClickTarget = SliderEventClickTarget.THUMB;
                setValueAt(_loc_2, param1.thumbIndex);
            }
            var _loc_4:* = new SliderEvent(SliderEvent.THUMB_DRAG);
            new SliderEvent(SliderEvent.THUMB_DRAG).thumbIndex = param1.thumbIndex;
            dispatchEvent(_loc_4);
            return;
        }// end function

        override protected function createChildren() : void
        {
            super.createChildren();
            if (!highlightHitArea)
            {
                highlightHitArea = new UIComponent();
                innerSlider.addChild(highlightHitArea);
                highlightHitArea.addEventListener(MouseEvent.MOUSE_DOWN, highlight_mouseDownHandler);
            }
            dataTips = new Array();
            this.sliderThumbClass = SliderThumb;
            var _loc_1:* = getStyle("thumbSkin");
            if (_loc_1 != null)
            {
                setStyle("thumbUpSkin", _loc_1);
                setStyle("thumbDownSkin", _loc_1);
                setStyle("thumbOverSkin", _loc_1);
                setStyle("thumbDisabledSkin", _loc_1);
            }
            return;
        }// end function

        override function drawTrackHighlight() : void
        {
            var _loc_8:SliderThumb = null;
            var _loc_9:Graphics = null;
            var _loc_1:* = SliderThumb(this.getThumbAt(0));
            var _loc_2:* = _loc_1;
            var _loc_3:int = 0;
            while (_loc_3 < this.thumbCount)
            {
                
                _loc_8 = SliderThumb(this.getThumbAt(_loc_3));
                if (_loc_8.xPosition < _loc_1.xPosition)
                {
                    _loc_1 = _loc_8;
                }
                if (_loc_8.xPosition > _loc_2.xPosition)
                {
                    _loc_2 = _loc_8;
                }
                _loc_3++;
            }
            var _loc_4:* = _loc_1.xPosition;
            var _loc_5:* = _loc_2.xPosition - _loc_1.xPosition;
            var _loc_6:* = _loc_1.getExplicitOrMeasuredHeight();
            var _loc_7:* = _loc_1.getExplicitOrMeasuredHeight() - 2;
            if (highlightTrack)
            {
                highlightTrack.move(_loc_4, track.y - highlightTrack.height / 2 + 2);
                highlightTrack.setActualSize(_loc_5 > 0 ? (_loc_5) : (0), highlightTrack.height);
            }
            if (highlightHitArea)
            {
                _loc_9 = highlightHitArea.graphics;
                _loc_9.clear();
                _loc_9.beginFill(16711680, 0);
                _loc_9.drawRect(_loc_4, track.y + track.height / 2 - _loc_7 / 2, _loc_5 > 0 ? (_loc_5) : (0), _loc_7);
                _loc_9.endFill();
            }
            return;
        }// end function

        public function get dragHitArea() : UIComponent
        {
            return highlightHitArea;
        }// end function

        override protected function positionDataTip(param1:Object) : void
        {
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_2:* = dataTips[param1.thumbIndex];
            var _loc_5:* = param1.x;
            var _loc_6:* = param1.y;
            var _loc_7:* = getStyle("dataTipPlacement");
            var _loc_8:* = getStyle("dataTipOffset");
            if (_direction == SliderDirection.HORIZONTAL)
            {
                _loc_3 = _loc_5;
                _loc_4 = _loc_6;
                if (_loc_7 == "left")
                {
                    _loc_3 = _loc_3 - (_loc_8 + _loc_2.width);
                    _loc_4 = _loc_4 + (param1.height - _loc_2.height) / 2;
                }
                else if (_loc_7 == "right")
                {
                    _loc_3 = _loc_3 + (_loc_8 + param1.width);
                    _loc_4 = _loc_4 + (param1.height - _loc_2.height) / 2;
                }
                else if (_loc_7 == "top")
                {
                    _loc_4 = _loc_4 - (_loc_8 + _loc_2.height);
                    _loc_3 = _loc_3 - (_loc_2.width - param1.width) / 2;
                }
                else if (_loc_7 == "bottom")
                {
                    _loc_4 = _loc_4 + (_loc_8 + param1.height);
                    _loc_3 = _loc_3 - (_loc_2.width - param1.width) / 2;
                }
            }
            else
            {
                _loc_3 = _loc_6;
                _loc_4 = unscaledHeight - _loc_5 - (_loc_2.height + param1.width) / 2;
                if (_loc_7 == "left")
                {
                    _loc_3 = _loc_3 - (_loc_8 + _loc_2.width);
                }
                else if (_loc_7 == "right")
                {
                    _loc_3 = _loc_3 + (_loc_8 + param1.height);
                }
                else if (_loc_7 == "top")
                {
                    _loc_4 = _loc_4 - (_loc_8 + (_loc_2.height + param1.width) / 2);
                    _loc_3 = _loc_3 - (_loc_2.width - param1.height) / 2;
                }
                else if (_loc_7 == "bottom")
                {
                    _loc_4 = _loc_4 + (_loc_8 + (_loc_2.height + param1.width) / 2);
                    _loc_3 = _loc_3 - (_loc_2.width - param1.height) / 2;
                }
            }
            var _loc_9:* = new Point(_loc_3, _loc_4);
            var _loc_10:* = localToGlobal(_loc_9);
            _loc_2.x = _loc_10.x < 0 ? (0) : (_loc_10.x);
            _loc_2.y = _loc_10.y < 0 ? (0) : (_loc_10.y);
            return;
        }// end function

        override function onThumbRelease(param1:Object) : void
        {
            var _loc_5:SliderEvent = null;
            var _loc_2:* = dataTips[param1.thumbIndex];
            if (_loc_2)
            {
                systemManager.toolTipChildren.removeChild(_loc_2);
                _loc_2 = null;
                dataTips[param1.thumbIndex] = null;
            }
            var _loc_7:* = counter - 1;
            counter = _loc_7;
            interactionClickTarget = SliderEventClickTarget.THUMB;
            var _loc_3:* = SliderThumb(thumbs.getChildAt(param1.thumbIndex));
            var _loc_4:* = counter == 0;
            setValueAt(getValueFromX(_loc_3.xPosition), param1.thumbIndex, !_loc_4);
            if (_loc_4)
            {
                _loc_5 = new SliderEvent(SliderEvent.THUMB_RELEASE);
                _loc_5.thumbIndex = param1.thumbIndex;
                dispatchEvent(_loc_5);
            }
            return;
        }// end function

        private function regionDraggingStopped(event:MouseEvent) : void
        {
            draggingRegion = false;
            return;
        }// end function

        private function highlight_mouseDownHandler(event:MouseEvent) : void
        {
            var _loc_5:SliderThumb = null;
            var _loc_2:* = event.stageX;
            var _loc_3:* = event.stageY;
            draggingRegion = true;
            systemManager.addEventListener(MouseEvent.MOUSE_UP, regionDraggingStopped, false, 0, true);
            var _loc_4:int = 0;
            while (_loc_4 < thumbCount)
            {
                
                _loc_5 = SliderThumb(thumbs.getChildAt(_loc_4));
                event.localX = _loc_5.globalToLocal(new Point(_loc_2, _loc_3)).x;
                event.localY = _loc_5.globalToLocal(new Point(_loc_2, _loc_3)).y;
                _loc_5.focusEnabled = false;
                _loc_5.dispatchEvent(event);
                _loc_4++;
            }
            return;
        }// end function

        override function getXBounds(param1:int) : Object
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            if (!draggingRegion || !lockRegionsWhileDragging)
            {
                return super.getXBounds(param1);
            }
            for each (_loc_4 in values)
            {
                
                if (isNaN(_loc_2) || _loc_4 < _loc_2)
                {
                    _loc_2 = _loc_4;
                }
                if (isNaN(_loc_3) || _loc_4 > _loc_3)
                {
                    _loc_3 = _loc_4;
                }
            }
            _loc_5 = values[param1] - _loc_2 + minimum;
            _loc_6 = maximum - (_loc_3 - values[param1]);
            _loc_7 = getXFromValue(_loc_5);
            _loc_8 = getXFromValue(_loc_6);
            return {min:_loc_7, max:_loc_8};
        }// end function

        override function onThumbPress(param1:Object) : void
        {
            var _loc_3:SliderDataTip = null;
            var _loc_4:String = null;
            var _loc_5:String = null;
            var _loc_7:* = counter + 1;
            counter = _loc_7;
            if (showDataTip)
            {
                _loc_3 = dataTips[param1.thumbIndex];
                if (!_loc_3)
                {
                    _loc_3 = SliderDataTip(new sliderDataTipClass());
                    dataTips[param1.thumbIndex] = _loc_3;
                    systemManager.toolTipChildren.addChild(_loc_3);
                    _loc_5 = getStyle("dataTipStyleName");
                    if (_loc_5)
                    {
                        _loc_3.styleName = _loc_5;
                    }
                }
                if (_dataTipFormatFunction != null)
                {
                    _loc_4 = this._dataTipFormatFunction(getValueFromX(param1.xPosition));
                }
                else
                {
                    _loc_4 = dataFormatter.formatPrecision(String(getValueFromX(param1.xPosition)), getStyle("dataTipPrecision"));
                }
                _loc_3.text = _loc_4;
                _loc_3.validateNow();
                _loc_3.setActualSize(_loc_3.getExplicitOrMeasuredWidth(), _loc_3.getExplicitOrMeasuredHeight());
                positionDataTip(param1);
            }
            keyInteraction = false;
            var _loc_2:* = new SliderEvent(SliderEvent.THUMB_PRESS);
            _loc_2.thumbIndex = param1.thumbIndex;
            dispatchEvent(_loc_2);
            return;
        }// end function

    }
}
