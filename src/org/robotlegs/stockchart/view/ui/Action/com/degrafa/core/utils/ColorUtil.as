package com.degrafa.core.utils
{
    import com.degrafa.paint.palette.*;

    public class ColorUtil extends Object
    {

        public function ColorUtil()
        {
            return;
        }// end function

        private static function resolveColorFromString(param1:String, param2:uint = 0) : uint
        {
            if (param1.search(",") == 3)
            {
                if (param1.search("%") != -1)
                {
                    return resolveColorFromRGBPercent(param1 as String);
                }
                return resolveColorFromRGB(param1 as String);
            }
            else if (param1.search(",") == 4)
            {
                return resolveColorFromCMYK(param1 as String);
            }
            var _loc_3:uint = 0;
            if (String(param1).charAt(0) == "#" || String(param1).substr(0, 2) == "0x")
            {
                param1 = param1.replace("#", "");
                if (param1.length == 3)
                {
                    _loc_3 = parseColorNotation(param1);
                }
                else
                {
                    _loc_3 = parseInt(param1, 16);
                }
            }
            else
            {
                _loc_3 = parseInt(String(param1), 10);
            }
            if (isNaN(_loc_3) || _loc_3 == 0)
            {
                _loc_3 = resolveColorFromKey(param1 as String, param2);
            }
            return _loc_3;
        }// end function

        public static function hexToRgb(param1:Number) : Object
        {
            var _loc_2:* = param1 >> 16;
            var _loc_3:* = param1 - (_loc_2 << 16);
            var _loc_4:* = _loc_3 >> 8;
            var _loc_5:* = _loc_3 - (_loc_4 << 8);
            return {red:_loc_2, green:_loc_4, blue:_loc_5};
        }// end function

        public static function resolveColor(param1:Object, param2:uint = 0) : uint
        {
            if (param1 is uint)
            {
                if (param1.toString(16).length == 3)
                {
                    return parseColorNotation(param1.toString(16));
                }
                return param1 as uint;
            }
            else
            {
                if (param1 is String)
                {
                    return resolveColorFromString(param1 as String, param2);
                }
                if (param1 is PaletteEntry)
                {
                    return resolveColor(PaletteEntry(param1).value, param2);
                }
                return 0;
            }
        }// end function

        public static function resolveColorFromRGBPercent(param1:String) : uint
        {
            var _loc_2:* = param1.replace(/%/g, "").split(",");
            return uint(int(Math.round(_loc_2[0] / 100 * 255)) << 16 | int(Math.round(_loc_2[1] / 100 * 255)) << 8 | int(Math.round(_loc_2[2] / 100 * 255)));
        }// end function

        public static function parseColorNotation(param1:String) : uint
        {
            param1 = param1.replace("#", "");
            param1 = "0x" + param1.charAt(0) + param1.charAt(0) + param1.charAt(1) + param1.charAt(1) + param1.charAt(2) + param1.charAt(2);
            return uint(param1);
        }// end function

        public static function resolveColorFromRGB(param1:String) : Number
        {
            var _loc_2:* = param1.split(",");
            return uint(int(_loc_2[0]) << 16 | int(_loc_2[1]) << 8 | int(_loc_2[2]));
        }// end function

        public static function resolveColorFromCMYK(param1:String) : uint
        {
            var _loc_2:* = param1.split(",");
            var _loc_3:* = 255 * _loc_2[0] / 100;
            var _loc_4:* = 255 * _loc_2[1] / 100;
            var _loc_5:* = 255 * _loc_2[2] / 100;
            var _loc_6:* = 255 * _loc_2[3] / 100;
            var _loc_7:* = int(decColorToHex(Math.round((255 - _loc_3) * (255 - _loc_6) / 255)));
            var _loc_8:* = int(decColorToHex(Math.round((255 - _loc_4) * (255 - _loc_6) / 255)));
            var _loc_9:* = int(decColorToHex(Math.round((255 - _loc_5) * (255 - _loc_6) / 255)));
            return resolveColorFromRGB(_loc_7 + "," + _loc_8 + "," + _loc_9);
        }// end function

        public static function resolveColorFromKey(param1:String, param2:uint = 0) : uint
        {
            var _loc_3:* = param1.toUpperCase();
            if (ColorKeys[_loc_3] != null)
            {
                return uint(ColorKeys[_loc_3]);
            }
            return param2;
        }// end function

        public static function decColorToHex(param1:uint, param2:String = "0x") : String
        {
            var _loc_3:* = ("00000" + param1.toString(16).toUpperCase()).substr(-6);
            return param2 + _loc_3;
        }// end function

    }
}
