package flexlib.controls.sliderClasses
{
    import flash.events.*;
    import flash.geom.*;
    import flash.ui.*;
    import flexlib.baseClasses.*;
    import mx.controls.*;
    import mx.controls.sliderClasses.*;

    public class SliderThumb extends Button
    {
        private var xOffset:Number;
        var thumbIndex:int;

        public function SliderThumb()
        {
            stickyHighlighting = true;
            return;
        }// end function

        public function get xPosition() : Number
        {
            return $x + width / 2;
        }// end function

        public function set xPosition(param1:Number) : void
        {
            $x = param1 - width / 2;
            SliderBase(owner).drawTrackHighlight();
            return;
        }// end function

        override protected function mouseDownHandler(event:MouseEvent) : void
        {
            super.mouseDownHandler(event);
            if (enabled)
            {
                xOffset = event.localX;
                systemManager.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler, true);
                stage.addEventListener(MouseEvent.MOUSE_MOVE, stage_mouseMoveHandler);
                SliderBase(owner).onThumbPress(this);
            }
            return;
        }// end function

        private function stage_mouseMoveHandler(event:MouseEvent) : void
        {
            if (event.target != stage)
            {
                return;
            }
            mouseMoveHandler(event);
            return;
        }// end function

        function onTweenEnd(param1:Number) : void
        {
            moveXPos(param1);
            return;
        }// end function

        private function updateValue() : void
        {
            SliderBase(owner).updateThumbValue(thumbIndex);
            return;
        }// end function

        private function calculateXPos(param1:Number, param2:Boolean = false) : Number
        {
            var _loc_3:* = SliderBase(owner).getXBounds(thumbIndex);
            var _loc_4:* = Math.min(Math.max(param1, _loc_3.min), _loc_3.max);
            if (!param2)
            {
                _loc_4 = SliderBase(owner).getSnapValue(_loc_4, this);
            }
            return _loc_4;
        }// end function

        private function mouseMoveHandler(event:MouseEvent) : void
        {
            var _loc_2:Point = null;
            if (enabled)
            {
                _loc_2 = new Point(event.stageX, event.stageY);
                _loc_2 = SliderBase(owner).innerSlider.globalToLocal(_loc_2);
                moveXPos(_loc_2.x - xOffset + width / 2, false, true);
                SliderBase(owner).onThumbMove(this);
            }
            return;
        }// end function

        private function moveXPos(param1:Number, param2:Boolean = false, param3:Boolean = false) : Number
        {
            var _loc_4:* = calculateXPos(param1, param2);
            xPosition = _loc_4;
            if (!param3)
            {
                updateValue();
            }
            return _loc_4;
        }// end function

        override function buttonReleased() : void
        {
            super.buttonReleased();
            if (enabled)
            {
                systemManager.removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler, true);
                stage.removeEventListener(MouseEvent.MOUSE_MOVE, stage_mouseMoveHandler);
                SliderBase(owner).onThumbRelease(this);
            }
            return;
        }// end function

        override public function set x(param1:Number) : void
        {
            var _loc_2:* = moveXPos(param1);
            updateValue();
            super.x = _loc_2;
            return;
        }// end function

        override public function drawFocus(param1:Boolean) : void
        {
            phase = param1 ? (ButtonPhase.DOWN) : (ButtonPhase.UP);
            return;
        }// end function

        function onTweenUpdate(param1:Number) : void
        {
            moveXPos(param1, true, true);
            return;
        }// end function

        override protected function keyDownHandler(event:KeyboardEvent) : void
        {
            var _loc_6:Number = NaN;
            var _loc_2:* = SliderBase(owner).thumbCount > 1;
            var _loc_3:* = xPosition;
            var _loc_4:* = SliderBase(owner).snapInterval > 0 ? (SliderBase(owner).getSnapIntervalWidth()) : (1);
            var _loc_5:* = SliderBase(owner).direction == SliderDirection.HORIZONTAL;
            if (event.keyCode == Keyboard.DOWN && !_loc_5 || event.keyCode == Keyboard.LEFT && _loc_5)
            {
                _loc_6 = _loc_3 - _loc_4;
            }
            else if (event.keyCode == Keyboard.UP && !_loc_5 || event.keyCode == Keyboard.RIGHT && _loc_5)
            {
                _loc_6 = _loc_3 + _loc_4;
            }
            else if (event.keyCode == Keyboard.PAGE_DOWN && !_loc_5 || event.keyCode == Keyboard.HOME && _loc_5)
            {
                _loc_6 = SliderBase(owner).getXFromValue(SliderBase(owner).minimum);
            }
            else if (event.keyCode == Keyboard.PAGE_UP && !_loc_5 || event.keyCode == Keyboard.END && _loc_5)
            {
                _loc_6 = SliderBase(owner).getXFromValue(SliderBase(owner).maximum);
            }
            if (!isNaN(_loc_6))
            {
                event.stopPropagation();
                SliderBase(owner).keyInteraction = true;
                moveXPos(_loc_6);
            }
            return;
        }// end function

        override protected function measure() : void
        {
            super.measure();
            measuredWidth = 12;
            measuredHeight = 12;
            return;
        }// end function

    }
}
