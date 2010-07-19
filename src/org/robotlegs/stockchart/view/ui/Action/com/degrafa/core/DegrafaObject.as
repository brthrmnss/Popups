package com.degrafa.core
{
    import flash.events.*;
    import mx.events.*;
    import mx.utils.*;

    public class DegrafaObject extends Object implements IDegrafaObject, IMXMLObject
    {
        public var objectBindings:Array;
        private var _suppressEventProcessing:Boolean = false;
        private var _eventDispatcher:EventDispatcher;
        private var _id:String;
        private var _parent:IDegrafaObject;
        private var _isInitialized:Boolean;
        private var _enableEvents:Boolean = true;
        private var _document:Object;

        public function DegrafaObject()
        {
            return;
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return eventDispatcher.willTrigger(param1);
        }// end function

        public function set enableEvents(param1:Boolean) : void
        {
            _enableEvents = param1;
            return;
        }// end function

        public function get name() : String
        {
            return id;
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return eventDispatcher.hasEventListener(param1);
        }// end function

        public function dispatchPropertyChange(param1:Boolean = false, param2:Object = null, param3:Object = null, param4:Object = null, param5:Object = null) : Boolean
        {
            return dispatchEvent(new PropertyChangeEvent("propertyChange", param1, false, PropertyChangeEventKind.UPDATE, param2, param3, param4, param5));
        }// end function

        public function get hasEventManager() : Boolean
        {
            return _eventDispatcher ? (true) : (false);
        }// end function

        public function get id() : String
        {
            if (_id)
            {
                return _id;
            }
            _id = NameUtil.createUniqueName(this);
            return _id;
        }// end function

        public function get parent() : IDegrafaObject
        {
            return _parent;
        }// end function

        public function get document() : Object
        {
            return _document;
        }// end function

        public function set suppressEventProcessing(param1:Boolean) : void
        {
            if (_suppressEventProcessing == true && param1 == false)
            {
                _suppressEventProcessing = param1;
                initChange("suppressEventProcessing", false, true, this);
            }
            else
            {
                _suppressEventProcessing = param1;
            }
            return;
        }// end function

        public function set id(param1:String) : void
        {
            _id = param1;
            return;
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            if (_suppressEventProcessing)
            {
                event.stopImmediatePropagation();
                return false;
            }
            return eventDispatcher.dispatchEvent(event);
        }// end function

        protected function set eventDispatcher(param1:EventDispatcher) : void
        {
            _eventDispatcher = param1;
            return;
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            eventDispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            eventDispatcher.addEventListener(param1, param2, param3, param4);
            return;
        }// end function

        public function get isInitialized() : Boolean
        {
            return _isInitialized;
        }// end function

        public function set parent(param1:IDegrafaObject) : void
        {
            _parent = param1;
            return;
        }// end function

        public function get suppressEventProcessing() : Boolean
        {
            return _suppressEventProcessing;
        }// end function

        public function initChange(param1:String, param2:Object, param3:Object, param4:Object) : void
        {
            if (hasEventManager)
            {
                dispatchPropertyChange(false, param1, param2, param3, param4);
            }
            return;
        }// end function

        protected function get eventDispatcher() : EventDispatcher
        {
            if (!_eventDispatcher)
            {
                _eventDispatcher = new EventDispatcher(this);
            }
            return _eventDispatcher;
        }// end function

        public function initialized(param1:Object, param2:String) : void
        {
            if (!_id)
            {
                if (param2)
                {
                    _id = param2;
                }
                else
                {
                    _id = NameUtil.createUniqueName(this);
                }
            }
            _document = param1;
            _isInitialized = true;
            if (enableEvents && !_suppressEventProcessing)
            {
                dispatchEvent(new FlexEvent(FlexEvent.INITIALIZE));
            }
            return;
        }// end function

        public function get enableEvents() : Boolean
        {
            return _enableEvents;
        }// end function

    }
}
