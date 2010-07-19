package com.degrafa.states
{
    import flash.events.*;
    import mx.events.*;

    public class State extends EventDispatcher
    {
        public var overrides:Array;
        public var name:String;
        public var basedOn:String;
        private var initialized:Boolean = false;
        public var stateManager:StateManager;

        public function State()
        {
            overrides = [];
            return;
        }// end function

        public function initialize() : void
        {
            var _loc_1:int = 0;
            if (!initialized)
            {
                initialized = true;
                _loc_1 = 0;
                while (_loc_1 < overrides.length)
                {
                    
                    overrides[_loc_1].initialize();
                    _loc_1++;
                }
            }
            return;
        }// end function

        public function dispatchExitState() : void
        {
            dispatchEvent(new FlexEvent(FlexEvent.EXIT_STATE));
            return;
        }// end function

        public function dispatchEnterState() : void
        {
            dispatchEvent(new FlexEvent(FlexEvent.ENTER_STATE));
            return;
        }// end function

    }
}
