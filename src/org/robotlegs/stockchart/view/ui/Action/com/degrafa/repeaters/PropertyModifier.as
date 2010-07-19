package com.degrafa.repeaters
{
    import com.degrafa.core.*;
    import com.degrafa.core.collections.*;
    import com.degrafa.geometry.*;
    import flash.geom.*;

    public class PropertyModifier extends DegrafaObject implements IRepeaterModifier
    {
        private var _targetProperties:Array;
        private var _targetObjects:Array;
        private var _targets:Array;
        private var _sourceObject:Object;
        private var _iteration:Number = 0;
        private var _modifyInProgress:Boolean = false;
        private var _originalValues:Array;
        private var _property:String;
        private var _modifier:Object;
        private var _modifierOperator:String = "add";
        public static var MODIFIER_NONE:String = "none";
        public static var MODIFIER_MULTIPLY:String = "multiply";
        public static var MODIFIER_ADD:String = "add";
        public static var MODIFIER_SUBTRACT:String = "subtract";
        public static var MODIFIER_DIVIDE:String = "divide";

        public function PropertyModifier()
        {
            return;
        }// end function

        public function get targets() : Array
        {
            return _targets;
        }// end function

        public function set targets(param1:Array) : void
        {
            _targets = param1;
            return;
        }// end function

        private function setTargetProperty(param1:Object) : void
        {
            var _loc_3:Object = null;
            var _loc_4:String = null;
            var _loc_5:Array = null;
            var _loc_6:int = 0;
            _targetObjects = new Array();
            _targetProperties = new Array();
            _originalValues = new Array();
            if (_targets == null)
            {
                _targets = new Array();
            }
            if (param1 is GeometryCollection)
            {
                if (_targets.length == 0)
                {
                    _targets.push(Geometry(GeometryCollection(param1).items[0]));
                }
            }
            else
            {
                _targets.push(param1);
            }
            var _loc_2:int = 0;
            while (_loc_2 < _targets.length)
            {
                
                _loc_3 = _targets[_loc_2];
                if (_loc_3 is Geometry)
                {
                    if (Geometry(_loc_3).parent && Geometry(_loc_3).parent != this.parent)
                    {
                    }
                    Geometry(_loc_3).suppressEventProcessing = true;
                }
                else if (_loc_3 == null)
                {
                }
                if (_property.indexOf(".") < 0)
                {
                    if (_property.indexOf("[") < 0)
                    {
                        _loc_4 = _property;
                    }
                    else
                    {
                        _loc_4 = _property.substring((_property.indexOf("[") + 1), _property.indexOf("]"));
                        _loc_3 = _loc_3[_property.substr(0, _property.indexOf("["))];
                    }
                }
                else
                {
                    _loc_5 = _property.split(/[\.\[]/);
                    _loc_6 = 0;
                    while (_loc_6 < (_loc_5.length - 1))
                    {
                        
                        if (_loc_5[_loc_6].indexOf("]") != -1)
                        {
                            _loc_5[_loc_6] = _loc_5[_loc_6].substr(0, _loc_5[_loc_6].indexOf("]"));
                        }
                        _loc_3 = _loc_3[_loc_5[_loc_6]];
                        _loc_6++;
                    }
                    if (_loc_5[_loc_6].indexOf("]") != -1)
                    {
                        _loc_5[_loc_6] = _loc_5[_loc_6].substr(0, _loc_5[_loc_6].indexOf("]"));
                    }
                    _loc_4 = _loc_5[_loc_6];
                }
                _targetObjects.push(_loc_3);
                _targetProperties.push(_loc_4);
                _originalValues.push(_loc_3[_loc_4]);
                _loc_2++;
            }
            return;
        }// end function

        public function apply() : void
        {
            var _loc_1:Object = null;
            var _loc_3:int = 0;
            var _loc_2:* = new Rectangle();
            if (_modifier is Array)
            {
                _loc_1 = modifier[_iteration % modifier.length];
            }
            else if (_modifier is Function)
            {
                _loc_1 = _modifier(_iteration, _targetObjects[_loc_3][_targetProperties[_loc_3]]);
            }
            else
            {
                _loc_1 = Number(_modifier);
            }
            if (_modifier != null)
            {
                _loc_3 = 0;
                while (_loc_3 < _targetObjects.length)
                {
                    
                    if (_modifierOperator == PropertyModifier.MODIFIER_ADD && _iteration > 0)
                    {
                        _targetObjects[_loc_3][_targetProperties[_loc_3]] = _targetObjects[_loc_3][_targetProperties[_loc_3]] + Number(_loc_1);
                    }
                    else if (_modifierOperator == PropertyModifier.MODIFIER_SUBTRACT && _iteration > 0)
                    {
                        _targetObjects[_loc_3][_targetProperties[_loc_3]] = _targetObjects[_loc_3][_targetProperties[_loc_3]] - Number(_loc_1);
                    }
                    else if (_modifierOperator == PropertyModifier.MODIFIER_MULTIPLY && _iteration > 0)
                    {
                        _targetObjects[_loc_3][_targetProperties[_loc_3]] = _targetObjects[_loc_3][_targetProperties[_loc_3]] * Number(_loc_1);
                    }
                    else if (_modifierOperator == PropertyModifier.MODIFIER_DIVIDE && _iteration > 0)
                    {
                        _targetObjects[_loc_3][_targetProperties[_loc_3]] = _targetObjects[_loc_3][_targetProperties[_loc_3]] / Number(_loc_1);
                    }
                    else if (_modifierOperator != PropertyModifier.MODIFIER_ADD && _modifierOperator != PropertyModifier.MODIFIER_SUBTRACT && _modifierOperator != PropertyModifier.MODIFIER_MULTIPLY && _modifierOperator != PropertyModifier.MODIFIER_DIVIDE)
                    {
                        _targetObjects[_loc_3][_targetProperties[_loc_3]] = _loc_1;
                    }
                    _loc_3++;
                }
            }
            var _loc_5:* = _iteration + 1;
            _iteration = _loc_5;
            return;
        }// end function

        public function beginModify(param1:Object) : void
        {
            if (_modifyInProgress)
            {
                return;
            }
            _sourceObject = param1;
            setTargetProperty(_sourceObject);
            _iteration = 0;
            _modifyInProgress = true;
            this.suppressEventProcessing = true;
            return;
        }// end function

        public function get property() : String
        {
            return _property;
        }// end function

        public function get modifier() : Object
        {
            return _modifier;
        }// end function

        public function get modifierOperator() : String
        {
            return _modifierOperator;
        }// end function

        public function end() : void
        {
            var _loc_1:uint = 0;
            if (!_modifyInProgress)
            {
                return;
            }
            _loc_1 = 0;
            while (_loc_1 < _targetObjects.length)
            {
                
                _targetObjects[_loc_1][_targetProperties[_loc_1]] = _originalValues[_loc_1];
                _loc_1 = _loc_1 + 1;
            }
            _loc_1 = 0;
            while (_loc_1 < targets.length)
            {
                
                if (targets[_loc_1] is Geometry)
                {
                    Geometry(targets[_loc_1]).suppressEventProcessing = false;
                }
                _loc_1 = _loc_1 + 1;
            }
            _iteration = 0;
            _modifyInProgress = false;
            this.suppressEventProcessing = false;
            return;
        }// end function

        public function set property(param1:String) : void
        {
            _property = param1;
            return;
        }// end function

        public function set modifier(param1:Object) : void
        {
            var _loc_2:* = _modifier;
            _modifier = param1;
            initChange("modifier", _loc_2, _modifier, this);
            return;
        }// end function

        public function get iteration() : Number
        {
            return _iteration;
        }// end function

        public function set modifierOperator(param1:String) : void
        {
            _modifierOperator = param1;
            return;
        }// end function

    }
}
