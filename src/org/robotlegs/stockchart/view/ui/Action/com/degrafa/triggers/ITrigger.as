package com.degrafa.triggers
{
    import com.degrafa.states.*;
    import flash.events.*;

    public interface ITrigger
    {

        public function ITrigger();

        function get triggerParent() : IDegrafaStateClient;

        function set triggerParent(param1:IDegrafaStateClient) : void;

        function set source(param1:IEventDispatcher) : void;

        function get source() : IEventDispatcher;

        function get id() : String;

        function set id(param1:String) : void;

    }
}
