package com.brightPoint.data
{
    import flash.events.*;
    import mx.events.*;

    public class DataCell extends Object implements IEventDispatcher
    {
        private var _98688col:int;
        private var _113114row:int;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _3076010data:Object;

        public function DataCell(param1:int = -1, param2:int = -1, param3:Object = null) : void
        {
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            this.col = param1;
            this.row = param2;
            this.data = param3;
            return;
        }// end function

        public function get col() : int
        {
            return this._98688col;
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return _bindingEventDispatcher.willTrigger(param1);
        }// end function

        public function set col(param1:int) : void
        {
            var _loc_2:* = this._98688col;
            if (_loc_2 !== param1)
            {
                this._98688col = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "col", _loc_2, param1));
            }
            return;
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            _bindingEventDispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return _bindingEventDispatcher.dispatchEvent(event);
        }// end function

        public function set data(param1:Object) : void
        {
            var _loc_2:* = this._3076010data;
            if (_loc_2 !== param1)
            {
                this._3076010data = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "data", _loc_2, param1));
            }
            return;
        }// end function

        public function set row(param1:int) : void
        {
            var _loc_2:* = this._113114row;
            if (_loc_2 !== param1)
            {
                this._113114row = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "row", _loc_2, param1));
            }
            return;
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            _bindingEventDispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function clone() : DataCell
        {
            var _loc_1:* = new DataCell();
            _loc_1.col = this.col;
            _loc_1.row = this.row;
            _loc_1.data = this.data;
            return _loc_1;
        }// end function

        public function get row() : int
        {
            return this._113114row;
        }// end function

        public function get data() : Object
        {
            return this._3076010data;
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return _bindingEventDispatcher.hasEventListener(param1);
        }// end function

    }
}
