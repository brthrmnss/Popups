package com.brightPoint.fills
{
    import com.degrafa.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import mx.events.*;

    public class GeometryFill extends Object implements IFill, IEventDispatcher
    {
        public var filters:Array;
        private var _1221029593height:Number;
        public var source:GeometryComposition;
        private var _113126854width:Number;
        private var _bindingEventDispatcher:EventDispatcher;

        public function GeometryFill()
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            return;
        }// end function

        public function get width() : Number
        {
            return this._113126854width;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return _bindingEventDispatcher.dispatchEvent(event);
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            _bindingEventDispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function set width(param1:Number) : void
        {
            var _loc_2:* = this._113126854width;
            if (_loc_2 !== param1)
            {
                this._113126854width = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "width", _loc_2, param1));
            }
            return;
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            _bindingEventDispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function set height(param1:Number) : void
        {
            var _loc_2:* = this._1221029593height;
            if (_loc_2 !== param1)
            {
                this._1221029593height = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "height", _loc_2, param1));
            }
            return;
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return _bindingEventDispatcher.willTrigger(param1);
        }// end function

        public function end(param1:Graphics) : void
        {
            param1.endFill();
            return;
        }// end function

        public function get height() : Number
        {
            return this._1221029593height;
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return _bindingEventDispatcher.hasEventListener(param1);
        }// end function

        public function begin(param1:Graphics, param2:Rectangle) : void
        {
            var _loc_3:Shape = null;
            var _loc_4:BitmapData = null;
            var _loc_5:Rectangle = null;
            var _loc_6:int = 0;
            if (param2.height < 1 || param2.width < 1)
            {
                return;
            }
            if (source)
            {
                _loc_3 = new Shape();
                _loc_3.alpha = 0;
                width = Math.ceil(param2.width);
                height = Math.ceil(param2.height);
                _loc_3.width = width;
                _loc_3.height = height;
                source.width = width;
                source.height = height;
                source.draw(_loc_3.graphics, param2);
                _loc_4 = new BitmapData(width, height, true, 0);
                _loc_4.draw(_loc_3, new Matrix(), null);
                if (filters && filters.length > 0)
                {
                    _loc_5 = new Rectangle(param2.x, param2.y, width + 2, height + 2);
                    _loc_6 = 0;
                    while (_loc_6 < filters.length)
                    {
                        
                        _loc_4.applyFilter(_loc_4, _loc_5, new Point(0, 0), filters[_loc_6]);
                        _loc_6++;
                    }
                }
            }
            param1.beginBitmapFill(_loc_4);
            return;
        }// end function

    }
}
