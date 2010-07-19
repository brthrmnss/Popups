package com.degrafa.paint
{
    import com.degrafa.core.*;
    import com.degrafa.core.utils.*;
    import com.degrafa.paint.palette.*;
    import mx.events.*;

    public class GradientStop extends DegrafaObject
    {
        private var _color:Object;
        protected var _colorFunction:Function;
        private var _paletteEntry:PaletteEntry;
        private var _ratio:Measure;
        private var _alpha:Number = 1;

        public function GradientStop(param1:Object = 0, param2:Number = 1, param3:Number = -1, param4:String = "ratio")
        {
            _ratio = new Measure(-1, Measure.RATIO);
            this.color = param1;
            _alpha = param2;
            _ratio.value = param3;
            _ratio.unit = param4;
            return;
        }// end function

        public function set ratioUnit(param1:String) : void
        {
            var _loc_2:String = null;
            if (_ratio.unit != param1)
            {
                _loc_2 = _ratio.unit;
                _ratio.unit = param1;
                initChange("ratio", _loc_2, _ratio.unit, this);
            }
            return;
        }// end function

        public function get color() : Object
        {
            if (colorFunction != null)
            {
                return ColorUtil.resolveColor(colorFunction());
            }
            if (!_color)
            {
                return 0;
            }
            return _color;
        }// end function

        public function get alpha() : Number
        {
            return _alpha;
        }// end function

        public function set color(param1:Object) : void
        {
            var _loc_2:uint = 0;
            if (param1 is PaletteEntry)
            {
                paletteEntry = param1 as PaletteEntry;
            }
            else
            {
                paletteEntry = null;
            }
            param1 = ColorUtil.resolveColor(param1);
            if (_color != param1)
            {
                _loc_2 = _color as uint;
                _color = param1 as uint;
                initChange("color", _loc_2, _color, this);
            }
            return;
        }// end function

        private function onPaletteEntryChange(event:PropertyChangeEvent) : void
        {
            if (event.property == "value" && event.kind == "update")
            {
                color = event.source;
            }
            return;
        }// end function

        private function set paletteEntry(param1:PaletteEntry) : void
        {
            if (param1)
            {
                if (_paletteEntry !== param1)
                {
                    if (_paletteEntry)
                    {
                        if (_paletteEntry.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
                        {
                            _paletteEntry.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onPaletteEntryChange);
                        }
                    }
                    _paletteEntry = param1;
                    if (_paletteEntry.enableEvents)
                    {
                        _paletteEntry.addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onPaletteEntryChange);
                    }
                }
            }
            else if (_paletteEntry)
            {
                if (_paletteEntry.hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE))
                {
                    _paletteEntry.removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onPaletteEntryChange);
                }
                _paletteEntry = null;
            }
            return;
        }// end function

        public function set ratio(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_ratio.value != param1)
            {
                _loc_2 = _ratio.value;
                _ratio.value = param1;
                initChange("ratio", _loc_2, _ratio.value, this);
            }
            return;
        }// end function

        public function get ratioUnit() : String
        {
            return _ratio.unit;
        }// end function

        public function get ratio() : Number
        {
            return _ratio.value;
        }// end function

        public function get measure() : Measure
        {
            return _ratio;
        }// end function

        public function get colorFunction() : Function
        {
            return _colorFunction;
        }// end function

        public function set alpha(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_alpha != param1)
            {
                _loc_2 = _alpha;
                _alpha = param1;
                initChange("alpha", _loc_2, _alpha, this);
            }
            return;
        }// end function

        public function set colorFunction(param1:Function) : void
        {
            var _loc_2:Function = null;
            if (_colorFunction != param1)
            {
                _loc_2 = _colorFunction as Function;
                _colorFunction = param1 as Function;
                initChange("colorFunction", _loc_2, _colorFunction, this);
            }
            return;
        }// end function

    }
}
