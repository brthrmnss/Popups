package com.brightPoint.microCharts
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.geometry.*;
    import com.degrafa.paint.*;
    import com.degrafa.repeaters.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;

    public class MicroColumnChart extends BaseMicroChart implements IBindingClient
    {
        private var _1486857267myGroup:GeometryGroup;
        public var _MicroColumnChart_GradientStop1:GradientStop;
        public var _MicroColumnChart_GradientStop2:GradientStop;
        public var _MicroColumnChart_GradientStop3:GradientStop;
        private var _1269441502myColumn:RegularRectangle;
        public var _MicroColumnChart_GradientStop4:GradientStop;
        private var _1785203534ghostFill:LinearGradientFill;
        private var _24069460myRepeater:GeometryRepeater;
        private var _1060454065myFill:SolidFill;
        var _watchers:Array;
        private var _1506122329ghostStroke:LinearGradientStroke;
        public var _MicroColumnChart_PropertyModifier1:PropertyModifier;
        public var _MicroColumnChart_PropertyModifier2:PropertyModifier;
        public var _MicroColumnChart_PropertyModifier3:PropertyModifier;
        var _bindingsBeginWithWord:Object;
        var _bindingsByDestination:Object;
        var _bindings:Array;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public function MicroColumnChart()
        {
            _bindings = [];
            _watchers = [];
            _bindingsByDestination = {};
            _bindingsBeginWithWord = {};
            this.graphicsData = [_MicroColumnChart_GeometryGroup1_i()];
            return;
        }// end function

        private function _MicroColumnChart_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
            binding = new Binding(this, function () : Number
            {
                return this.width;
            }// end function
            , function (param1:Number) : void
            {
                myGroup.width = param1;
                return;
            }// end function
            , "myGroup.width");
            result[0] = binding;
            binding = new Binding(this, function () : int
            {
                return count;
            }// end function
            , function (param1:int) : void
            {
                myRepeater.count = param1;
                return;
            }// end function
            , "myRepeater.count");
            result[1] = binding;
            binding = new Binding(this, function () : Object
            {
                return calcXmodifier;
            }// end function
            , function (param1:Object) : void
            {
                _MicroColumnChart_PropertyModifier1.modifier = param1;
                return;
            }// end function
            , "_MicroColumnChart_PropertyModifier1.modifier");
            result[2] = binding;
            binding = new Binding(this, function () : Object
            {
                return calcHeight;
            }// end function
            , function (param1:Object) : void
            {
                _MicroColumnChart_PropertyModifier2.modifier = param1;
                return;
            }// end function
            , "_MicroColumnChart_PropertyModifier2.modifier");
            result[3] = binding;
            binding = new Binding(this, function () : Object
            {
                return calcY;
            }// end function
            , function (param1:Object) : void
            {
                _MicroColumnChart_PropertyModifier3.modifier = param1;
                return;
            }// end function
            , "_MicroColumnChart_PropertyModifier3.modifier");
            result[4] = binding;
            binding = new Binding(this, function () : IGraphicsFill
            {
                return myFill;
            }// end function
            , function (param1:IGraphicsFill) : void
            {
                myColumn.fill = param1;
                return;
            }// end function
            , "myColumn.fill");
            result[5] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                myFill.color = param1;
                return;
            }// end function
            , "myFill.color");
            result[6] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                _MicroColumnChart_GradientStop1.color = param1;
                return;
            }// end function
            , "_MicroColumnChart_GradientStop1.color");
            result[7] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                _MicroColumnChart_GradientStop2.color = param1;
                return;
            }// end function
            , "_MicroColumnChart_GradientStop2.color");
            result[8] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                _MicroColumnChart_GradientStop3.color = param1;
                return;
            }// end function
            , "_MicroColumnChart_GradientStop3.color");
            result[9] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                _MicroColumnChart_GradientStop4.color = param1;
                return;
            }// end function
            , "_MicroColumnChart_GradientStop4.color");
            result[10] = binding;
            return result;
        }// end function

        override public function initialize() : void
        {
            var target:MicroColumnChart;
            var watcherSetupUtilClass:Object;
            var bindings:* = _MicroColumnChart_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_brightPoint_microCharts_MicroColumnChartWatcherSetupUtil");
                var _loc_2:* = watcherSetupUtilClass;
                _loc_2.watcherSetupUtilClass["init"](null);
            }
            _watcherSetupUtil.setup(this, function (param1:String)
            {
                return target[param1];
            }// end function
            , bindings, watchers);
            var i:uint;
            while (i < bindings.length)
            {
                
                Binding(bindings[i]).execute();
                i = (i + 1);
            }
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            super.initialize();
            return;
        }// end function

        private function _MicroColumnChart_LinearGradientStroke1_i() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            ghostStroke = _loc_1;
            _loc_1.angle = 45;
            _loc_1.weight = 1;
            _loc_1.pixelHinting = true;
            _loc_1.gradientStops = [_MicroColumnChart_GradientStop3_i(), _MicroColumnChart_GradientStop4_i()];
            _loc_1.initialized(this, "ghostStroke");
            return _loc_1;
        }// end function

        private function _MicroColumnChart_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = this.width;
            _loc_1 = count;
            _loc_1 = calcXmodifier;
            _loc_1 = calcHeight;
            _loc_1 = calcY;
            _loc_1 = myFill;
            _loc_1 = colorTheme;
            _loc_1 = colorTheme;
            _loc_1 = colorTheme;
            _loc_1 = colorTheme;
            _loc_1 = colorTheme;
            return;
        }// end function

        public function get myColumn() : RegularRectangle
        {
            return this._1269441502myColumn;
        }// end function

        private function calcY(param1:Number, param2:Object) : Number
        {
            if (!chartData)
            {
                return 0;
            }
            return this.height - this.height * (Number(chartData[param1]) / _max);
        }// end function

        private function _MicroColumnChart_LinearGradientFill1_i() : LinearGradientFill
        {
            var _loc_1:* = new LinearGradientFill();
            ghostFill = _loc_1;
            _loc_1.angle = 45;
            _loc_1.gradientStops = [_MicroColumnChart_GradientStop1_i(), _MicroColumnChart_GradientStop2_i()];
            _loc_1.initialized(this, "ghostFill");
            return _loc_1;
        }// end function

        public function set myRepeater(param1:GeometryRepeater) : void
        {
            var _loc_2:* = this._24069460myRepeater;
            if (_loc_2 !== param1)
            {
                this._24069460myRepeater = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myRepeater", _loc_2, param1));
            }
            return;
        }// end function

        private function _MicroColumnChart_GeometryGroup1_i() : GeometryGroup
        {
            var _loc_1:* = new GeometryGroup();
            myGroup = _loc_1;
            _loc_1.geometry = [_MicroColumnChart_GeometryRepeater1_i()];
            _loc_1.fills = [_MicroColumnChart_SolidFill1_i(), _MicroColumnChart_LinearGradientFill1_i()];
            _loc_1.strokes = [_MicroColumnChart_LinearGradientStroke1_i()];
            BindingManager.executeBindings(this, "myGroup", myGroup);
            _loc_1.initialized(this, "myGroup");
            return _loc_1;
        }// end function

        private function _MicroColumnChart_RegularRectangle1_i() : RegularRectangle
        {
            var _loc_1:* = new RegularRectangle();
            myColumn = _loc_1;
            _loc_1.x = 0;
            BindingManager.executeBindings(this, "myColumn", myColumn);
            _loc_1.initialized(this, "myColumn");
            return _loc_1;
        }// end function

        private function _MicroColumnChart_GradientStop1_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroColumnChart_GradientStop1 = _loc_1;
            _loc_1.alpha = 0.8;
            _loc_1.ratio = 0;
            BindingManager.executeBindings(this, "_MicroColumnChart_GradientStop1", _MicroColumnChart_GradientStop1);
            _loc_1.initialized(this, "_MicroColumnChart_GradientStop1");
            return _loc_1;
        }// end function

        public function get ghostStroke() : LinearGradientStroke
        {
            return this._1506122329ghostStroke;
        }// end function

        private function _MicroColumnChart_GradientStop3_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroColumnChart_GradientStop3 = _loc_1;
            _loc_1.alpha = 0.9;
            _loc_1.ratio = 0;
            BindingManager.executeBindings(this, "_MicroColumnChart_GradientStop3", _MicroColumnChart_GradientStop3);
            _loc_1.initialized(this, "_MicroColumnChart_GradientStop3");
            return _loc_1;
        }// end function

        public function get ghostFill() : LinearGradientFill
        {
            return this._1785203534ghostFill;
        }// end function

        private function _MicroColumnChart_PropertyModifier2_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _MicroColumnChart_PropertyModifier2 = _loc_1;
            _loc_1.property = "height";
            _loc_1.modifierOperator = "none";
            BindingManager.executeBindings(this, "_MicroColumnChart_PropertyModifier2", _MicroColumnChart_PropertyModifier2);
            _loc_1.initialized(this, "_MicroColumnChart_PropertyModifier2");
            return _loc_1;
        }// end function

        public function set myFill(param1:SolidFill) : void
        {
            var _loc_2:* = this._1060454065myFill;
            if (_loc_2 !== param1)
            {
                this._1060454065myFill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myFill", _loc_2, param1));
            }
            return;
        }// end function

        public function get myGroup() : GeometryGroup
        {
            return this._1486857267myGroup;
        }// end function

        override public function draw() : void
        {
            if (getStyle("useGhostFill") == true)
            {
                myColumn.fill = ghostFill;
                myColumn.stroke = ghostStroke;
            }
            else
            {
                myColumn.fill = myFill;
                myColumn.stroke = null;
            }
            if (_colorFill)
            {
                myColumn.fill = _colorFill;
            }
            if (_colorStroke)
            {
                myColumn.stroke = _colorStroke;
            }
            super.draw();
            myColumn.width = this.width / count - this.width * 0.02;
            myGroup.draw(this.graphics, null);
            return;
        }// end function

        public function set ghostStroke(param1:LinearGradientStroke) : void
        {
            var _loc_2:* = this._1506122329ghostStroke;
            if (_loc_2 !== param1)
            {
                this._1506122329ghostStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ghostStroke", _loc_2, param1));
            }
            return;
        }// end function

        public function get myFill() : SolidFill
        {
            return this._1060454065myFill;
        }// end function

        public function set myColumn(param1:RegularRectangle) : void
        {
            var _loc_2:* = this._1269441502myColumn;
            if (_loc_2 !== param1)
            {
                this._1269441502myColumn = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myColumn", _loc_2, param1));
            }
            return;
        }// end function

        public function get myRepeater() : GeometryRepeater
        {
            return this._24069460myRepeater;
        }// end function

        private function calcHeight(param1:Number, param2:Object) : Number
        {
            if (!chartData)
            {
                return 0;
            }
            return this.height * (Number(chartData[param1]) / _max);
        }// end function

        public function set ghostFill(param1:LinearGradientFill) : void
        {
            var _loc_2:* = this._1785203534ghostFill;
            if (_loc_2 !== param1)
            {
                this._1785203534ghostFill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "ghostFill", _loc_2, param1));
            }
            return;
        }// end function

        private function _MicroColumnChart_GeometryRepeater1_i() : GeometryRepeater
        {
            var _loc_1:* = new GeometryRepeater();
            myRepeater = _loc_1;
            _loc_1.modifiers = [_MicroColumnChart_PropertyModifier1_i(), _MicroColumnChart_PropertyModifier2_i(), _MicroColumnChart_PropertyModifier3_i()];
            _loc_1.geometry = [_MicroColumnChart_RegularRectangle1_i()];
            BindingManager.executeBindings(this, "myRepeater", myRepeater);
            _loc_1.initialized(this, "myRepeater");
            return _loc_1;
        }// end function

        public function set myGroup(param1:GeometryGroup) : void
        {
            var _loc_2:* = this._1486857267myGroup;
            if (_loc_2 !== param1)
            {
                this._1486857267myGroup = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myGroup", _loc_2, param1));
            }
            return;
        }// end function

        private function _MicroColumnChart_SolidFill1_i() : SolidFill
        {
            var _loc_1:* = new SolidFill();
            myFill = _loc_1;
            BindingManager.executeBindings(this, "myFill", myFill);
            _loc_1.initialized(this, "myFill");
            return _loc_1;
        }// end function

        private function _MicroColumnChart_GradientStop2_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroColumnChart_GradientStop2 = _loc_1;
            _loc_1.alpha = 0.3;
            _loc_1.ratio = 1;
            BindingManager.executeBindings(this, "_MicroColumnChart_GradientStop2", _MicroColumnChart_GradientStop2);
            _loc_1.initialized(this, "_MicroColumnChart_GradientStop2");
            return _loc_1;
        }// end function

        private function _MicroColumnChart_GradientStop4_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroColumnChart_GradientStop4 = _loc_1;
            _loc_1.alpha = 0.6;
            _loc_1.ratio = 1;
            BindingManager.executeBindings(this, "_MicroColumnChart_GradientStop4", _MicroColumnChart_GradientStop4);
            _loc_1.initialized(this, "_MicroColumnChart_GradientStop4");
            return _loc_1;
        }// end function

        private function _MicroColumnChart_PropertyModifier1_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _MicroColumnChart_PropertyModifier1 = _loc_1;
            _loc_1.property = "x";
            BindingManager.executeBindings(this, "_MicroColumnChart_PropertyModifier1", _MicroColumnChart_PropertyModifier1);
            _loc_1.initialized(this, "_MicroColumnChart_PropertyModifier1");
            return _loc_1;
        }// end function

        private function _MicroColumnChart_PropertyModifier3_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _MicroColumnChart_PropertyModifier3 = _loc_1;
            _loc_1.property = "y";
            _loc_1.modifierOperator = "none";
            BindingManager.executeBindings(this, "_MicroColumnChart_PropertyModifier3", _MicroColumnChart_PropertyModifier3);
            _loc_1.initialized(this, "_MicroColumnChart_PropertyModifier3");
            return _loc_1;
        }// end function

        private function calcXmodifier(param1:Number, param2:Object) : Number
        {
            var _loc_3:Number = 0;
            if (myColumn.stroke)
            {
                _loc_3 = myColumn.stroke.weight;
            }
            return this.width / count + this.width * 0.02 / count + _loc_3 * 2;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
        {
            _watcherSetupUtil = param1;
            return;
        }// end function

    }
}
