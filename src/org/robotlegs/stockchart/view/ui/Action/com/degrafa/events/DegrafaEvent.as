package com.degrafa.events
{
    import flash.events.*;

    public class DegrafaEvent extends Event
    {
        public static const PRE_RENDER:String = "preRender";
        public static const RENDER:String = "render";

        public function DegrafaEvent(param1:String, param2:Boolean = false, param3:Boolean = false) : void
        {
            super(param1, param2, param3);
            return;
        }// end function

    }
}
