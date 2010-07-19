package com.brightPoint.ui
{
    import flash.display.*;
    import flash.events.*;
    import mx.events.*;
    import mx.preloaders.*;

    public class Preloader extends DownloadProgressBar
    {
        private var clip:MovieClip;
        private var FlashPreloaderSymbol:Class;

        public function Preloader()
        {
            FlashPreloaderSymbol = Preloader_FlashPreloaderSymbol;
            clip = new FlashPreloaderSymbol();
            addChild(clip);
            clip.gotoAndStop("start");
            return;
        }// end function

        private function centerPreloader() : void
        {
            x = stageWidth / 2 - clip.width / 2;
            y = stageHeight / 2 - clip.height / 2;
            return;
        }// end function

        private function onSWFDownloadComplete(event:Event) : void
        {
            clip.preloader.gotoAndStop(100);
            clip.preloader.amount_txt.text = "100%";
            return;
        }// end function

        private function onFlexInitComplete(event:FlexEvent) : void
        {
            clip.addFrameScript(21, onDoneAnimating);
            clip.gotoAndPlay("fade out");
            return;
        }// end function

        private function onFlexInitProgress(event:FlexEvent) : void
        {
            if (!clip.preloader)
            {
                return;
            }
            clip.preloader.gotoAndStop(100);
            clip.preloader.amount_txt.text = "Initializing...";
            return;
        }// end function

        private function onSWFDownloadProgress(event:ProgressEvent) : void
        {
            var _loc_2:* = event.bytesTotal;
            var _loc_3:* = event.bytesLoaded;
            var _loc_4:* = Math.round(_loc_3 / _loc_2 * 100);
            clip.preloader.gotoAndStop(_loc_4);
            clip.preloader.amount_txt.text = String(_loc_4) + "%";
            return;
        }// end function

        override public function set preloader(param1:Sprite) : void
        {
            param1.addEventListener(ProgressEvent.PROGRESS, onSWFDownloadProgress);
            param1.addEventListener(Event.COMPLETE, onSWFDownloadComplete);
            param1.addEventListener(FlexEvent.INIT_PROGRESS, onFlexInitProgress);
            param1.addEventListener(FlexEvent.INIT_COMPLETE, onFlexInitComplete);
            centerPreloader();
            return;
        }// end function

        private function onDoneAnimating() : void
        {
            clip.stop();
            dispatchEvent(new Event(Event.COMPLETE));
            return;
        }// end function

    }
}
