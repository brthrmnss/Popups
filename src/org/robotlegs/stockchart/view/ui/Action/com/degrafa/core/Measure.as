package com.degrafa.core
{
    import flash.system.*;

    public class Measure extends Object
    {
        public var unit:String;
        public var chSize:Number = -1;
        public var emSize:Number = -1;
        public var value:Number;
        public var exSize:Number = -1;
        public static const POINTS:String = "points";
        public static const CH:String = "ch";
        public static const DEGREES:String = "degrees";
        public static const EM:String = "em";
        public static const RATIO:String = "ratio";
        public static const PERCENT:String = "percent";
        public static const PIXELS:String = "pixels";
        public static const CENTIMETERS:String = "centimeters";
        public static const EX:String = "ex";
        public static const INCHES:String = "inches";
        public static const PICAS:String = "picas";
        public static const MILLIMETERS:String = "millimeters";

        public function Measure(param1:Number = 0, param2:String = "pixels") : void
        {
            this.value = param1;
            this.unit = param2;
            return;
        }// end function

        public function relativeTo(param1:Number, param2:Object = null) : Number
        {
            switch(unit)
            {
                case Measure.PIXELS:
                {
                    return value;
                }
                case Measure.PERCENT:
                {
                    return param1 * (value / 100);
                }
                case Measure.RATIO:
                {
                    return param1 * value;
                }
                case Measure.POINTS:
                {
                    return value / 72 * Capabilities.screenDPI;
                }
                case Measure.INCHES:
                {
                    return value * Capabilities.screenDPI;
                }
                case Measure.CENTIMETERS:
                {
                    return value / 2.54 * Capabilities.screenDPI;
                }
                case Measure.MILLIMETERS:
                {
                    return value / 25.4 * Capabilities.screenDPI;
                }
                case Measure.PICAS:
                {
                    return value / 6 * Capabilities.screenDPI;
                }
                case Measure.EM:
                {
                    updateFontSizes();
                    return value * emSize;
                }
                case Measure.EX:
                {
                    updateFontSizes();
                    return value * exSize;
                }
                case Measure.CH:
                {
                    updateFontSizes();
                    return value * chSize;
                }
                default:
                {
                    return value;
                    break;
                }
            }
        }// end function

        public function valueOf() : Number
        {
            return relativeTo(100);
        }// end function

        private function updateFontSizes() : void
        {
            if (emSize < 0)
            {
                emSize = 12 / 72 * Capabilities.screenDPI;
            }
            if (exSize < 0)
            {
                exSize = 6 / 72 * Capabilities.screenDPI;
            }
            if (chSize < 0)
            {
                chSize = 12 / 72 * Capabilities.screenDPI;
            }
            return;
        }// end function

        public function toString() : String
        {
            return value.toString() + unit;
        }// end function

    }
}
