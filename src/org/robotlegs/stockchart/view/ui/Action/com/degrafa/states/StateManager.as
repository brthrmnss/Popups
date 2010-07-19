package com.degrafa.states
{
    import mx.events.*;

    public class StateManager extends Object
    {
        private var requestedCurrentState:String;
        private var _currentState:String;
        private var stateClient:IDegrafaStateClient;
        private var _currentStateChanged:Boolean;

        public function StateManager(param1:IDegrafaStateClient)
        {
            this.stateClient = param1;
            return;
        }// end function

        public function findCommonBaseState(param1:String, param2:String) : String
        {
            var _loc_3:* = getState(param1);
            var _loc_4:* = getState(param2);
            if (!_loc_3 || !_loc_4)
            {
                return "";
            }
            if (isBaseState(_loc_3.basedOn) && isBaseState(_loc_4.basedOn))
            {
                return "";
            }
            var _loc_5:* = getBaseStates(_loc_3);
            var _loc_6:* = getBaseStates(_loc_4);
            var _loc_7:String = "";
            while (_loc_5[(_loc_5.length - 1)] == _loc_6[(_loc_6.length - 1)])
            {
                
                _loc_7 = _loc_5.pop();
                _loc_6.pop();
                if (!_loc_5.length || !_loc_6.length)
                {
                    break;
                }
            }
            if (_loc_5.length && _loc_5[(_loc_5.length - 1)] == _loc_4.name)
            {
                _loc_7 = _loc_4.name;
            }
            else if (_loc_6.length && _loc_6[(_loc_6.length - 1)] == _loc_3.name)
            {
                _loc_7 = _loc_3.name;
            }
            return _loc_7;
        }// end function

        public function initializeState(param1:String) : void
        {
            var _loc_2:* = getState(param1);
            while (_loc_2)
            {
                
                _loc_2 = getState(_loc_2.basedOn);
            }
            return;
        }// end function

        public function getBaseStates(param1:State) : Array
        {
            var _loc_2:Array = [];
            while (param1 && param1.basedOn)
            {
                
                _loc_2.push(param1.basedOn);
                param1 = getState(param1.basedOn);
            }
            return _loc_2;
        }// end function

        public function applyState(param1:String, param2:String) : void
        {
            var _loc_4:Array = null;
            var _loc_5:int = 0;
            var _loc_3:* = getState(param1);
            if (param1 == param2)
            {
                return;
            }
            if (_loc_3)
            {
                if (_loc_3.basedOn != param2)
                {
                    applyState(_loc_3.basedOn, param2);
                }
                _loc_4 = _loc_3.overrides;
                _loc_5 = 0;
                while (_loc_5 < _loc_4.length)
                {
                    
                    _loc_4[_loc_5].apply(stateClient);
                    _loc_5++;
                }
            }
            return;
        }// end function

        public function removeState(param1:String, param2:String) : void
        {
            var _loc_4:Array = null;
            var _loc_5:int = 0;
            var _loc_3:* = getState(param1);
            if (param1 == param2)
            {
                return;
            }
            if (_loc_3)
            {
                _loc_3.dispatchExitState();
                _loc_4 = _loc_3.overrides;
                _loc_5 = _loc_4.length;
                while (_loc_5)
                {
                    
                    _loc_4[(_loc_5 - 1)].remove(stateClient);
                    _loc_5 = _loc_5 - 1;
                }
                if (_loc_3.basedOn != param2)
                {
                    removeState(_loc_3.basedOn, param2);
                }
            }
            return;
        }// end function

        public function commitCurrentState() : void
        {
            var _loc_2:StateChangeEvent = null;
            var _loc_1:* = findCommonBaseState(_currentState, requestedCurrentState);
            var _loc_3:* = _currentState ? (_currentState) : ("");
            var _loc_4:* = getState(requestedCurrentState);
            initializeState(requestedCurrentState);
            _loc_2 = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGING);
            _loc_2.oldState = _loc_3;
            _loc_2.newState = requestedCurrentState ? (requestedCurrentState) : ("");
            stateClient.dispatchEvent(_loc_2);
            if (isBaseState(_currentState))
            {
                stateClient.dispatchEvent(new FlexEvent(FlexEvent.EXIT_STATE));
            }
            removeState(_currentState, _loc_1);
            _currentState = requestedCurrentState;
            if (isBaseState(currentState))
            {
                stateClient.dispatchEvent(new FlexEvent(FlexEvent.ENTER_STATE));
            }
            else
            {
                applyState(_currentState, _loc_1);
            }
            _loc_2 = new StateChangeEvent(StateChangeEvent.CURRENT_STATE_CHANGE);
            _loc_2.oldState = _loc_3;
            _loc_2.newState = _currentState ? (_currentState) : ("");
            stateClient.dispatchEvent(_loc_2);
            return;
        }// end function

        public function set currentState(param1:String) : void
        {
            setCurrentState(param1);
            return;
        }// end function

        public function isBaseState(param1:String) : Boolean
        {
            return !param1 || param1 == "";
        }// end function

        public function setCurrentState(param1:String) : void
        {
            if (param1 != currentState && !(isBaseState(param1) && isBaseState(currentState)))
            {
                requestedCurrentState = param1;
                if (stateClient.isInitialized)
                {
                    commitCurrentState();
                }
                else
                {
                    _currentStateChanged = true;
                }
            }
            return;
        }// end function

        public function getState(param1:String) : State
        {
            if (!stateClient.states || isBaseState(param1))
            {
                return null;
            }
            var _loc_2:int = 0;
            while (_loc_2 < stateClient.states.length)
            {
                
                if (stateClient.states[_loc_2].name == param1)
                {
                    return stateClient.states[_loc_2];
                }
                _loc_2++;
            }
            return null;
        }// end function

        public function get currentState() : String
        {
            return _currentStateChanged ? (requestedCurrentState) : (_currentState);
        }// end function

    }
}
