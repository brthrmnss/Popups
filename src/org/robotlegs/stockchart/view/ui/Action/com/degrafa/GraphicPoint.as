package com.degrafa
{
    import flash.events.*;
    import flash.geom.*;

    public class GraphicPoint extends Point implements IGraphicPoint, IEventDispatcher
    {
        private var _bindingEventDispatcher:EventDispatcher;

        public function GraphicPoint(param1:Number = 0, param2:Number = 0)
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            super(param1, param2);
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return _bindingEventDispatcher.dispatchEvent(event);
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return _bindingEventDispatcher.hasEventListener(param1);
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return _bindingEventDispatcher.willTrigger(param1);
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            _bindingEventDispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            _bindingEventDispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

    }
}
