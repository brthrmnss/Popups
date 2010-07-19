package com.degrafa.core.collections
{
    import com.degrafa.core.*;
    import flash.utils.*;
    import mx.events.*;

    public class DegrafaCollection extends DegrafaObject
    {
        private var _items:Array;
        protected var _cursor:DegrafaCursor;
        private var _enableTypeChecking:Boolean = true;
        private var type:Class;

        public function DegrafaCollection(param1:Class, param2:Array = null, param3:Boolean = false, param4:Boolean = true)
        {
            _items = [];
            this.type = param1;
            _enableTypeChecking = param4;
            suppressEventProcessing = param3;
            if (param2)
            {
                items = param2;
            }
            return;
        }// end function

        public function get items() : Array
        {
            return _items;
        }// end function

        public function get cursor() : DegrafaCursor
        {
            if (!_cursor)
            {
                _cursor = new DegrafaCursor(items);
            }
            return _cursor;
        }// end function

        public function reverse() : Array
        {
            var _loc_1:* = _items;
            items = items.reverse();
            initChange("items", _loc_1, _items, this);
            return items;
        }// end function

        private function checkValidTypes(param1:Array) : void
        {
            var _loc_2:Object = null;
            if (_enableTypeChecking)
            {
                for each (_loc_2 in param1)
                {
                    
                    if (!_loc_2 is type)
                    {
                        throw new TypeError(getQualifiedClassName(_loc_2) + " is not a valid " + getQualifiedClassName(type));
                    }
                }
            }
            return;
        }// end function

        public function set items(param1:Array) : void
        {
            var _loc_2:Array = null;
            checkValidTypes(param1);
            if (param1 != _items)
            {
                if (enableEvents && hasEventManager)
                {
                    removeListeners();
                }
                _loc_2 = _items;
                _items = param1;
                if (enableEvents && hasEventManager)
                {
                    initChange("items", _loc_2, _items, this);
                }
            }
            addListeners();
            return;
        }// end function

        public function indexOf(param1, param2:int = 0) : int
        {
            return items.indexOf(param1, param2);
        }// end function

        public function unshift(... args) : uint
        {
            checkValidTypes(args);
            args = _items;
            var _loc_3:int = 0;
            var _loc_4:* = args.length;
            while (_loc_3 < _loc_4)
            {
                
                addListener(args[_loc_3]);
                items.unshift(args[_loc_3]);
                _loc_3++;
            }
            initChange("items", args, _items, this);
            return items.length;
        }// end function

        public function pop()
        {
            removeListener(items[(items.length - 1)]);
            var _loc_1:* = _items;
            var _loc_2:* = items.pop();
            initChange("items", _loc_1, _items, this);
            return _loc_2;
        }// end function

        public function slice(param1:int = 0, param2:int = 16777215) : Array
        {
            return items.slice(param1, param2);
        }// end function

        public function lastIndexOf(param1, param2:int = 2147483647) : int
        {
            return items.lastIndexOf(param1, param2);
        }// end function

        public function concat(... args) : Array
        {
            args = _items;
            checkValidTypes(args);
            var _loc_3:int = 0;
            var _loc_4:* = args.length;
            while (_loc_3 < _loc_4)
            {
                
                addListener(args[_loc_3]);
                _loc_3++;
            }
            _items = items.concat(args);
            initChange("items", args, _items, this);
            return _items;
        }// end function

        protected function _addItem(param1)
        {
            addListener(param1);
            concat(param1);
            return param1;
        }// end function

        protected function _removeItem(param1)
        {
            var _loc_2:* = indexOf(param1, 0);
            _removeItemAt(_loc_2);
            return null;
        }// end function

        public function get enableTypeChecking() : Boolean
        {
            return _enableTypeChecking;
        }// end function

        public function removeListener(param1) : void
        {
            if (param1 is IDegrafaObject)
            {
                IDegrafaObject(param1).parent = null;
                IDegrafaObject(param1).removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
            }
            return;
        }// end function

        public function push(... args) : uint
        {
            args = _items;
            checkValidTypes(args);
            var _loc_3:int = 0;
            var _loc_4:* = args.length;
            while (_loc_3 < _loc_4)
            {
                
                addListener(args[_loc_3]);
                items.push(args[_loc_3]);
                _loc_3++;
            }
            initChange("items", args, _items, this);
            return items.length;
        }// end function

        public function removeListeners() : void
        {
            var _loc_1:Object = null;
            for each (_loc_1 in items)
            {
                
                if (_loc_1 is IDegrafaObject)
                {
                    IDegrafaObject(_loc_1).parent = null;
                    IDegrafaObject(_loc_1).removeEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                }
            }
            return;
        }// end function

        protected function _setItemIndex(param1, param2:Number) : Boolean
        {
            var _loc_3:* = items.splice(items.indexOf(param1), 1);
            items.splice(param2, 0, _loc_3[0]);
            return true;
        }// end function

        protected function _getItemAt(param1:Number)
        {
            return items[param1];
        }// end function

        public function addListeners() : void
        {
            var _loc_1:Object = null;
            if (enableEvents)
            {
                for each (_loc_1 in items)
                {
                    
                    if (_loc_1 is IDegrafaObject)
                    {
                        IDegrafaObject(_loc_1).parent = this.parent;
                        if (IDegrafaObject(_loc_1).enableEvents)
                        {
                            IDegrafaObject(_loc_1).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                        }
                    }
                }
            }
            return;
        }// end function

        public function every(param1:Function, param2 = null) : Boolean
        {
            return items.every(param1, param2);
        }// end function

        public function map(param1:Function, param2 = null) : Array
        {
            return items.map(param1, param2);
        }// end function

        public function shift()
        {
            removeListener(items[0]);
            var _loc_1:* = _items;
            var _loc_2:* = items.shift();
            initChange("items", _loc_1, _items, this);
            return _loc_2;
        }// end function

        public function propertyChangeHandler(event:PropertyChangeEvent) : void
        {
            if (!suppressEventProcessing)
            {
                dispatchEvent(event);
            }
            return;
        }// end function

        protected function _getItemIndex(param1) : int
        {
            return indexOf(param1, 0);
        }// end function

        protected function _removeItemAt(param1:Number)
        {
            removeListener(items[param1]);
            return splice(param1, 1)[1];
        }// end function

        public function forEach(param1:Function, param2 = null) : void
        {
            items.forEach(param1, param2);
            return;
        }// end function

        public function sort(... args) : Array
        {
            return items.sort(args);
        }// end function

        public function set enableTypeChecking(param1:Boolean) : void
        {
            _enableTypeChecking = param1;
            return;
        }// end function

        protected function _addItemAt(param1:Object, param2:Number)
        {
            addListener(param1);
            splice(param2, 0, param1);
            return param1;
        }// end function

        public function join(param1) : String
        {
            return items.join(param1);
        }// end function

        public function addListener(param1) : void
        {
            if (param1 is IDegrafaObject)
            {
                IDegrafaObject(param1).parent = this.parent;
                if (enableEvents)
                {
                    if (IDegrafaObject(param1).enableEvents)
                    {
                        IDegrafaObject(param1).addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, propertyChangeHandler);
                    }
                }
            }
            return;
        }// end function

        public function filter(param1:Function, param2 = null) : Array
        {
            return items.filter(param1, param2);
        }// end function

        public function some(param1:Function, param2 = null) : Boolean
        {
            return items.some(param1, param2);
        }// end function

        public function splice(param1:int, param2:uint, ... args) : Array
        {
            var _loc_7:Array = null;
            checkValidTypes(args);
            args = 0;
            var _loc_5:* = args.length;
            while (args < _loc_5)
            {
                
                addListener(args[args]);
                args++;
            }
            var _loc_6:* = _items;
            if (args.length == 1)
            {
                _loc_7 = _items.splice(param1, param2, args[0]);
            }
            else if (args.length > 1)
            {
                _loc_7 = _items.splice(param1, param2, args);
            }
            else
            {
                _loc_7 = _items.splice(param1, param2);
            }
            if (_loc_7)
            {
                _loc_5 = _loc_7.length;
                args = 0;
                while (args < _loc_5)
                {
                    
                    removeListener(_loc_7[args]);
                    args++;
                }
            }
            initChange("items", _loc_6, _items, this);
            return _loc_7;
        }// end function

        public function sortOn(param1:Object, param2:Object = null) : Array
        {
            return items.sortOn(param1, param2);
        }// end function

    }
}
