package com.degrafa.paint.palette
{
    import com.degrafa.core.*;
    import flash.utils.*;

    public class PaletteEntry extends DegrafaObject
    {
        protected var typeName:String;
        private var _value:Object;
        private var _name:String;
        protected var type:Class;

        public function PaletteEntry(param1:String = , param2:Object = null)
        {
            this.name = param1;
            this.value = param2;
            return;
        }// end function

        public function set value(param1:Object) : void
        {
            var _loc_2:Object = null;
            if (_value != param1)
            {
                _loc_2 = _value;
                _value = param1;
                typeName = getQualifiedClassName(_value);
                typeName = typeName.replace("::", ".");
                type = Class(getDefinitionByName(typeName));
                initChange("value", _loc_2, _value, this);
            }
            return;
        }// end function

        override public function get name() : String
        {
            return _name;
        }// end function

        public function get value() : Object
        {
            return _value;
        }// end function

        public function set name(param1:String) : void
        {
            _name = param1;
            return;
        }// end function

    }
}
