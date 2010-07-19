package com.degrafa.states
{

    public interface IOverride
    {

        public function IOverride();

        function initialize() : void;

        function remove(param1:IDegrafaStateClient) : void;

        function apply(param1:IDegrafaStateClient) : void;

    }
}
