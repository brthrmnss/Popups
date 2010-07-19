package com.degrafa.decorators
{
    import com.degrafa.geometry.command.*;

    public interface IDecorator
    {

        public function IDecorator();

        function initialize(param1:CommandStack) : void;

        function end(param1:CommandStack) : void;

    }
}
