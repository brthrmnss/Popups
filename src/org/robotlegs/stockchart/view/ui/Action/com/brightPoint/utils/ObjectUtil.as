package com.brightPoint.utils
{
    import flash.utils.*;

    public class ObjectUtil extends Object
    {

        public function ObjectUtil()
        {
            return;
        }// end function

        public static function clone(param1:Object, param2:Class = null)
        {
            var _loc_3:* = new ByteArray();
            _loc_3.writeObject(param1);
            _loc_3.position = 0;
            if (param2)
            {
                return _loc_3.readObject() as param2;
            }
            return _loc_3.readObject();
        }// end function

    }
}
