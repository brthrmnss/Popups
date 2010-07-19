package com.degrafa.paint
{
    import com.degrafa.core.*;
    import com.degrafa.core.utils.*;
    import com.degrafa.geometry.command.*;
    import com.degrafa.paint.palette.*;
    import flash.display.*;
    import flash.geom.*;
    import mx.events.*;

    public class SolidStroke extends DegrafaObject implements IGraphicsStroke
    {
        private var _lastArgs:Array;
        private var _lastRect:Rectangle;
        protected var _scaleMode:String;
        private var _paletteEntry:PaletteEntry;
        private var _weight:Number;
        private var _caps:String;
        private var _joints:String;
        private var _miterLimit:Number;
        protected var _degrafaScaling:int;
        protected var _colorFunction:Function;
        protected var _alpha:Number;
        protected var _color:Object;
        private var _pixelHinting:Boolean = false;
        private var _lastContext:Graphics;

        public function SolidStroke(param1:Object = null, param2:Number = NaN, param3:Number = NaN)
        {
            _lastArgs = [];
            this.color = param1;
            this.alpha = param2;
            this.weight = param3;
            return;
        }// end function

        public function get reApplyFunction() : Function
        {
            var copy:Array;
            var last:Graphics;
            copy = _lastArgs.concat();
            last = _lastContext;
            if (!_lastContext)
            {
                return function (param1:Graphics = null, param2:Array = null) : void
            {
                return;
            }// end function
            ;
            }
            return function (param1:Graphics = null, param2:Array = null) : void
            {
                var _loc_3:* = param2 ? (param2) : (copy);
                if (param1)
                {
                    param1.lineStyle.apply(param1, _loc_3);
                }
                else
                {
                    last.lineStyle.apply(last, _loc_3);
                }
                return;
            }// end function
            ;
        }// end function

        private function onPaletteEntryChange(event:PropertyChangeEvent) : void
        {
            if (event.property == "value" && event.kind == "update")
            {
                color = event.source;
            }
            return;
        }// end function

        public function get scaleMode() : String
        {
            if (!_scaleMode)
            {
                return "normal";
            }
            return _scaleMode;
        }// end function

        public function get lastRectangle() : Rectangle
        {
            return _lastRect.clone();
        }// end function

        public function get lastArgs() : Array
        {
            return _lastArgs;
        }// end function

        public function get pixelHinting() : Boolean
        {
            return _pixelHinting;
        }// end function

        public function set scaleMode(param1:String) : void
        {
            var _loc_2:String = null;
            if (_scaleMode != param1)
            {
                _loc_2 = _scaleMode;
                _scaleMode = param1;
                initChange("scaleMode", _loc_2, _scaleMode, this);
            }
            return;
        }// end function

        public function set pixelHinting(param1:Boolean) : void
        {
            var _loc_2:Boolean = false;
            if (_pixelHinting != param1)
            {
                _loc_2 = _pixelHinting;
                _pixelHinting = param1;
                initChange("pixelHinting", _loc_2, _pixelHinting, this);
            }
            return;
        }// end function

        public function get joints() : String
        {
            if (!_joints)
            {
                return "round";
            }
            return _joints;
        }// end function

        public function get miterLimit() : Number
        {
            if (!_miterLimit)
            {
                return 3;
            }
            return _miterLimit;
        }// end function

        public function get degrafaScaling() : Boolean
        {
            return _degrafaScaling < 1;
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

        public function set caps(param1:String) : void
        {
            var _loc_2:String = null;
            if (_caps != param1)
            {
                _loc_2 = _caps;
                _caps = param1;
                initChange("caps", _loc_2, _caps, this);
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

        public function set derive(param1:SolidStroke) : void
        {
            if (isNaN(_alpha))
            {
                _alpha = param1.alpha;
            }
            if (!_caps)
            {
                _caps = param1.caps;
            }
            if (!_color)
            {
                _color = uint(param1.color);
            }
            if (!_joints)
            {
                _joints = param1.joints;
            }
            if (!_miterLimit)
            {
                _miterLimit = param1.miterLimit;
            }
            if (!_pixelHinting)
            {
                _pixelHinting = param1.pixelHinting;
            }
            if (!_scaleMode)
            {
                _scaleMode = param1.scaleMode;
            }
            if (!_weight)
            {
                _weight = param1.weight;
            }
            if (!_degrafaScaling)
            {
                _degrafaScaling = param1.degrafaScaling ? (1) : (-1);
            }
            return;
        }// end function

        public function set joints(param1:String) : void
        {
            var _loc_2:String = null;
            if (_joints != param1)
            {
                _loc_2 = _joints;
                _joints = param1;
                initChange("joints", _loc_2, _joints, this);
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

        public function get caps() : String
        {
            if (!_caps)
            {
                return "round";
            }
            return _caps;
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

        public function set miterLimit(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_miterLimit != param1)
            {
                _loc_2 = _miterLimit;
                _miterLimit = param1;
                initChange("miterLimit", _loc_2, _miterLimit, this);
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

        public function set degrafaScaling(param1:Boolean) : void
        {
            if (_degrafaScaling > 0 != param1)
            {
                _degrafaScaling = param1 ? (1) : (-1);
                initChange("degrafaScaling", !param1, param1, this);
            }
            return;
        }// end function

        public function set weight(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (_weight != param1)
            {
                _loc_2 = _weight;
                _weight = param1;
                initChange("weight", _loc_2, _weight, this);
            }
            return;
        }// end function

        public function get weight() : Number
        {
            if (!_weight)
            {
                return 1;
            }
            return _weight;
        }// end function

        public function apply(param1:Graphics, param2:Rectangle) : void
        {
            var _loc_6:Matrix = null;
            var _loc_7:Number = NaN;
            if (isNaN(_alpha))
            {
                _alpha = 1;
            }
            if (!_caps)
            {
                _caps = "round";
            }
            if (!_joints)
            {
                _joints = "round";
            }
            if (!_miterLimit)
            {
                _miterLimit = 3;
            }
            if (!_scaleMode)
            {
                _scaleMode = "normal";
            }
            if (isNaN(_weight))
            {
                _weight = 1;
            }
            var _loc_3:* = this.weight;
            if (_degrafaScaling > 0 && scaleMode != "none")
            {
                _loc_6 = CommandStack.transMatrix;
                if (_loc_6)
                {
                    switch(_scaleMode)
                    {
                        case "normal":
                        {
                            _loc_7 = Math.sqrt(Math.abs(_loc_6.a * _loc_6.d - _loc_6.b * _loc_6.c));
                            break;
                        }
                        case "vertical":
                        {
                            _loc_7 = _loc_6.b + _loc_6.d;
                            break;
                        }
                        case "horizontal":
                        {
                            _loc_7 = _loc_6.a + _loc_6.c;
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    _loc_3 = _loc_3 * _loc_7;
                }
            }
            var _loc_4:* = CommandStack.currentAlpha;
            var _loc_5:* = this.alpha;
            if (_loc_4 != 1)
            {
                _loc_5 = _loc_5 * _loc_4;
            }
            if (caps == "round" && joints == "round" && miterLimit == 3)
            {
                param1.lineStyle(_loc_3, color as uint, _loc_5, pixelHinting, scaleMode);
                _lastArgs.length = 0;
                _lastArgs[0] = _loc_3;
                _lastArgs[1] = color as uint;
                _lastArgs[2] = _loc_5;
                _lastArgs[3] = pixelHinting;
                _lastArgs[4] = scaleMode;
                _lastContext = param1;
                _lastRect = param2;
            }
            else
            {
                param1.lineStyle(_loc_3, color as uint, _loc_5, pixelHinting, scaleMode, caps, joints, miterLimit);
                _lastArgs.length = 0;
                _lastArgs[0] = _loc_3;
                _lastArgs[1] = color as uint;
                _lastArgs[2] = _loc_5;
                _lastArgs[3] = pixelHinting;
                _lastArgs[4] = scaleMode;
                _lastArgs[5] = caps;
                _lastArgs[6] = joints;
                _lastArgs[7] = miterLimit;
                _lastContext = param1;
                _lastRect = param2;
            }
            return;
        }// end function

    }
}
