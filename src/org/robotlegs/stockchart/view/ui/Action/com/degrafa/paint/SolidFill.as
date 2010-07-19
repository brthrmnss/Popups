package com.degrafa.paint
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.core.utils.*;
    import com.degrafa.geometry.command.*;
    import com.degrafa.paint.palette.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class SolidFill extends DegrafaObject implements IGraphicsFill
    {
        private var _lastContext:Graphics;
        private var _lastArgs:Array;
        private var _lastRect:Rectangle;
        private var _paletteEntry:PaletteEntry;
        protected var _colorFunction:Function;
        protected var _alpha:Number;
        protected var _color:Object;
        private var _requester:IGeometryComposition;

        public function SolidFill(param1:Object = null, param2:Number = NaN)
        {
            _lastArgs = [];
            this.alpha = param2;
            this.color = param1;
            return;
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

        public function get restartFunction() : Function
        {
            var copy:Array;
            var last:Graphics;
            copy = _lastArgs.concat();
            last = _lastContext;
            if (!_lastContext)
            {
                return function (param1:Graphics = null) : void
            {
                if (param1)
                {
                    param1.beginFill(copy[0], copy[1]);
                }
                return;
            }// end function
            ;
            }
            return function (param1:Graphics = null) : void
            {
                if (param1)
                {
                    param1.beginFill(copy[0], copy[1]);
                }
                else
                {
                    last.beginFill(copy[0], copy[1]);
                }
                return;
            }// end function
            ;
        }// end function

        public function get lastArgs() : Array
        {
            return _lastArgs;
        }// end function

        public function set derive(param1:SolidFill) : void
        {
            if (!_color)
            {
                _color = uint(param1.color);
            }
            if (isNaN(_alpha))
            {
                _alpha = param1.alpha;
            }
            return;
        }// end function

        public function get colorFunction() : Function
        {
            return _colorFunction;
        }// end function

        public function get alpha() : Number
        {
            if (isNaN(_alpha))
            {
                return 1;
            }
            return _alpha;
        }// end function

        public function end(param1:Graphics) : void
        {
            param1.endFill();
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

        public function begin(param1:Graphics, param2:Rectangle) : void
        {
            if (isNaN(_alpha))
            {
                _alpha = 1;
            }
            var _loc_3:* = CommandStack.currentAlpha;
            var _loc_4:* = this.alpha;
            if (_loc_3 != 1)
            {
                _loc_4 = _loc_4 * _loc_3;
            }
            _lastArgs.length = 0;
            _lastArgs[0] = color as uint;
            _lastArgs[1] = _loc_4;
            _lastContext = param1;
            _lastRect = param2;
            param1.beginFill(color as uint, _loc_4);
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

        public function set requester(param1:IGeometryComposition) : void
        {
            _requester = param1;
            return;
        }// end function

        public function get lastRectangle() : Rectangle
        {
            return _lastRect.clone();
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

    }
}
