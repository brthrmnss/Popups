package com.brightPoint.data
{
    import flash.events.*;
    import mx.events.*;

    public class DataRow extends Object implements IEventDispatcher
    {
        private var _925109428rowNum:int = 0;
        private var _cells:Array;
        private var _bindingEventDispatcher:EventDispatcher;

        public function DataRow()
        {
            _cells = new Array();
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
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

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            _bindingEventDispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function get rowNum() : int
        {
            return this._925109428rowNum;
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            _bindingEventDispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function get cells() : Array
        {
            return _cells;
        }// end function

        public function addDataCell(param1:DataCell) : void
        {
            _cells.push(param1);
            return;
        }// end function

        public function set rowNum(param1:int) : void
        {
            var _loc_2:* = this._925109428rowNum;
            if (_loc_2 !== param1)
            {
                this._925109428rowNum = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rowNum", _loc_2, param1));
            }
            return;
        }// end function

        public function clone() : DataRow
        {
            var _loc_2:DataCell = null;
            var _loc_1:* = new DataRow();
            _loc_1.rowNum = this.rowNum;
            for each (_loc_2 in _cells)
            {
                
                _loc_1.addDataCell(_loc_2.clone());
            }
            return _loc_1;
        }// end function

    }
}
