package com.degrafa.repeaters
{

    public interface IRepeaterModifier
    {

        public function IRepeaterModifier();

        function end() : void;

        function beginModify(param1:Object) : void;

        function get iteration() : Number;

        function apply() : void;

    }
}
