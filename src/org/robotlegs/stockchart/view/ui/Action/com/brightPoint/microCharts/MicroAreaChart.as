package com.brightPoint.microCharts
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.geometry.*;
    import com.degrafa.paint.*;
    import com.degrafa.repeaters.*;
    import flash.geom.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;
    import mx.utils.*;

    public class MicroAreaChart extends BaseMicroChart implements IBindingClient
    {
        private var _1486857267myGroup:GeometryGroup;
        private var _806584572myStroke:SolidStroke;
        private var _1060454065myFill:SolidFill;
        private var _1785203534ghostFill:LinearGradientFill;
        private var _24069460myRepeater:GeometryRepeater;
        private var _1060594599myArea:Polygon;
        private var _1060275264myLine:Polyline;
        public var _MicroAreaChart_GradientStop2:GradientStop;
        public var _MicroAreaChart_GradientStop3:GradientStop;
        public var _MicroAreaChart_GradientStop4:GradientStop;
        private var _1506122329ghostStroke:LinearGradientStroke;
        public var _MicroAreaChart_GradientStop1:GradientStop;
        var _watchers:Array;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        var _bindings:Array;
        public var _MicroAreaChart_PropertyModifier1:PropertyModifier;
        public var _MicroAreaChart_PropertyModifier2:PropertyModifier;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public function MicroAreaChart()
        {
            _bindings = [];
            _watchers = [];
            _bindingsByDestination = {};
            _bindingsBeginWithWord = {};
            this.graphicsData = [_MicroAreaChart_GeometryGroup1_i()];
            return;
        }// end function

        public function set myLine(param1:Polyline) : void
        {
            var _loc_2:* = this._1060275264myLine;
            if (_loc_2 !== param1)
            {
                this._1060275264myLine = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myLine", _loc_2, param1));
            }
            return;
        }// end function

        public function set myStroke(param1:SolidStroke) : void
        {
            var _loc_2:* = this._806584572myStroke;
            if (_loc_2 !== param1)
            {
                this._806584572myStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStroke", _loc_2, param1));
            }
            return;
        }// end function

        public function get myStroke() : SolidStroke
        {
            return this._806584572myStroke;
        }// end function

        override public function initialize() : void
        {
            var target:MicroAreaChart;
            var watcherSetupUtilClass:Object;
            var bindings:* = _MicroAreaChart_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_brightPoint_microCharts_MicroAreaChartWatcherSetupUtil");
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

        private function _MicroAreaChart_GradientStop3_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroAreaChart_GradientStop3 = _loc_1;
            _loc_1.alpha = 0.9;
            _loc_1.ratio = 0;
            BindingManager.executeBindings(this, "_MicroAreaChart_GradientStop3", _MicroAreaChart_GradientStop3);
            _loc_1.initialized(this, "_MicroAreaChart_GradientStop3");
            return _loc_1;
        }// end function

        private function _MicroAreaChart_PropertyModifier2_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _MicroAreaChart_PropertyModifier2 = _loc_1;
            _loc_1.property = "points";
            _loc_1.modifierOperator = "none";
            BindingManager.executeBindings(this, "_MicroAreaChart_PropertyModifier2", _MicroAreaChart_PropertyModifier2);
            _loc_1.initialized(this, "_MicroAreaChart_PropertyModifier2");
            return _loc_1;
        }// end function

        private function _MicroAreaChart_GradientStop1_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroAreaChart_GradientStop1 = _loc_1;
            _loc_1.alpha = 0.8;
            _loc_1.ratio = 0;
            BindingManager.executeBindings(this, "_MicroAreaChart_GradientStop1", _MicroAreaChart_GradientStop1);
            _loc_1.initialized(this, "_MicroAreaChart_GradientStop1");
            return _loc_1;
        }// end function

        private function calcPoints(param1:Number, param2:Object) : Array
        {
            if (!chartData)
            {
                return [0];
            }
            var _loc_3:* = this.width / (count - 1) * param1;
            var _loc_4:* = chartData[param1];
            var _loc_5:* = _max - _min;
            if (param1 == 0)
            {
                return [new Point(0, this.height), new Point(0, this.height - this.height * (_loc_4 / _loc_5))];
            }
            if (param1 == (chartData.length - 1))
            {
                param2.push(new Point(_loc_3, this.height - this.height * (_loc_4 / _loc_5)), new Point(_loc_3, this.height), new Point(0, this.height));
                return param2 as Array;
            }
            param2.push(new Point(_loc_3, this.height - this.height * (_loc_4 / _loc_5)));
            return param2 as Array;
        }// end function

        private function calcLinePoints(param1:Number, param2:Object) : Array
        {
            if (!chartData)
            {
                return [0];
            }
            var _loc_3:* = this.width / (count - 1) * param1;
            var _loc_4:* = chartData[param1];
            var _loc_5:* = _max - _min;
            if (param1 == 0)
            {
                return [new Point(0, this.height - this.height * (_loc_4 / _loc_5))];
            }
            if (param1 == (chartData.length - 1))
            {
                param2.push(new Point(_loc_3, this.height - this.height * (_loc_4 / _loc_5)));
                return param2 as Array;
            }
            param2.push(new Point(_loc_3, this.height - this.height * (_loc_4 / _loc_5)));
            return param2 as Array;
        }// end function

        public function get ghostFill() : LinearGradientFill
        {
            return this._1785203534ghostFill;
        }// end function

        public function get ghostStroke() : LinearGradientStroke
        {
            return this._1506122329ghostStroke;
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

        private function _MicroAreaChart_SolidFill1_i() : SolidFill
        {
            var _loc_1:* = new SolidFill();
            myFill = _loc_1;
            BindingManager.executeBindings(this, "myFill", myFill);
            _loc_1.initialized(this, "myFill");
            return _loc_1;
        }// end function

        public function set myArea(param1:Polygon) : void
        {
            var _loc_2:* = this._1060594599myArea;
            if (_loc_2 !== param1)
            {
                this._1060594599myArea = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myArea", _loc_2, param1));
            }
            return;
        }// end function

        private function _MicroAreaChart_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
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
            result[0] = binding;
            binding = new Binding(this, function () : Object
            {
                return calcPoints;
            }// end function
            , function (param1:Object) : void
            {
                _MicroAreaChart_PropertyModifier1.modifier = param1;
                return;
            }// end function
            , "_MicroAreaChart_PropertyModifier1.modifier");
            result[1] = binding;
            binding = new Binding(this, function () : Array
            {
                return [myLine];
            }// end function
            , function (param1:Array) : void
            {
                _MicroAreaChart_PropertyModifier2.targets = param1;
                return;
            }// end function
            , "_MicroAreaChart_PropertyModifier2.targets");
            result[2] = binding;
            binding = new Binding(this, function () : Object
            {
                return calcLinePoints;
            }// end function
            , function (param1:Object) : void
            {
                _MicroAreaChart_PropertyModifier2.modifier = param1;
                return;
            }// end function
            , "_MicroAreaChart_PropertyModifier2.modifier");
            result[3] = binding;
            binding = new Binding(this, function () : IGraphicsFill
            {
                return myFill;
            }// end function
            , function (param1:IGraphicsFill) : void
            {
                myArea.fill = param1;
                return;
            }// end function
            , "myArea.fill");
            result[4] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return myStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                myLine.stroke = param1;
                return;
            }// end function
            , "myLine.stroke");
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
                _MicroAreaChart_GradientStop1.color = param1;
                return;
            }// end function
            , "_MicroAreaChart_GradientStop1.color");
            result[7] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                _MicroAreaChart_GradientStop2.color = param1;
                return;
            }// end function
            , "_MicroAreaChart_GradientStop2.color");
            result[8] = binding;
            binding = new Binding(this, function () : Object
            {
                return ColorUtil.adjustBrightness(colorTheme, -100);
            }// end function
            , function (param1:Object) : void
            {
                myStroke.color = param1;
                return;
            }// end function
            , "myStroke.color");
            result[9] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                _MicroAreaChart_GradientStop3.color = param1;
                return;
            }// end function
            , "_MicroAreaChart_GradientStop3.color");
            result[10] = binding;
            binding = new Binding(this, function () : Object
            {
                return colorTheme;
            }// end function
            , function (param1:Object) : void
            {
                _MicroAreaChart_GradientStop4.color = param1;
                return;
            }// end function
            , "_MicroAreaChart_GradientStop4.color");
            result[11] = binding;
            return result;
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
                myArea.fill = ghostFill;
                myArea.stroke = ghostStroke;
                myLine.stroke = null;
            }
            else
            {
                myArea.fill = myFill;
                myArea.stroke = null;
                myLine.stroke = myStroke;
            }
            super.draw();
            myGroup.draw(this.graphics, null);
            return;
        }// end function

        public function get myLine() : Polyline
        {
            return this._1060275264myLine;
        }// end function

        private function _MicroAreaChart_SolidStroke1_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            myStroke = _loc_1;
            _loc_1.weight = 1;
            BindingManager.executeBindings(this, "myStroke", myStroke);
            _loc_1.initialized(this, "myStroke");
            return _loc_1;
        }// end function

        private function _MicroAreaChart_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = count;
            _loc_1 = calcPoints;
            _loc_1 = [myLine];
            _loc_1 = calcLinePoints;
            _loc_1 = myFill;
            _loc_1 = myStroke;
            _loc_1 = colorTheme;
            _loc_1 = colorTheme;
            _loc_1 = colorTheme;
            _loc_1 = ColorUtil.adjustBrightness(colorTheme, -100);
            _loc_1 = colorTheme;
            _loc_1 = colorTheme;
            return;
        }// end function

        private function _MicroAreaChart_GeometryRepeater1_i() : GeometryRepeater
        {
            var _loc_1:* = new GeometryRepeater();
            myRepeater = _loc_1;
            _loc_1.renderOnFinalIteration = true;
            _loc_1.modifiers = [_MicroAreaChart_PropertyModifier1_i(), _MicroAreaChart_PropertyModifier2_i()];
            _loc_1.geometry = [_MicroAreaChart_Polygon1_i(), _MicroAreaChart_Polyline1_i()];
            BindingManager.executeBindings(this, "myRepeater", myRepeater);
            _loc_1.initialized(this, "myRepeater");
            return _loc_1;
        }// end function

        public function get myFill() : SolidFill
        {
            return this._1060454065myFill;
        }// end function

        private function _MicroAreaChart_LinearGradientFill1_i() : LinearGradientFill
        {
            var _loc_1:* = new LinearGradientFill();
            ghostFill = _loc_1;
            _loc_1.angle = 45;
            _loc_1.gradientStops = [_MicroAreaChart_GradientStop1_i(), _MicroAreaChart_GradientStop2_i()];
            _loc_1.initialized(this, "ghostFill");
            return _loc_1;
        }// end function

        public function get myRepeater() : GeometryRepeater
        {
            return this._24069460myRepeater;
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

        private function _MicroAreaChart_GradientStop2_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroAreaChart_GradientStop2 = _loc_1;
            _loc_1.alpha = 0.3;
            _loc_1.ratio = 1;
            BindingManager.executeBindings(this, "_MicroAreaChart_GradientStop2", _MicroAreaChart_GradientStop2);
            _loc_1.initialized(this, "_MicroAreaChart_GradientStop2");
            return _loc_1;
        }// end function

        private function _MicroAreaChart_GradientStop4_i() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _MicroAreaChart_GradientStop4 = _loc_1;
            _loc_1.alpha = 0.6;
            _loc_1.ratio = 1;
            BindingManager.executeBindings(this, "_MicroAreaChart_GradientStop4", _MicroAreaChart_GradientStop4);
            _loc_1.initialized(this, "_MicroAreaChart_GradientStop4");
            return _loc_1;
        }// end function

        public function get myArea() : Polygon
        {
            return this._1060594599myArea;
        }// end function

        private function _MicroAreaChart_GeometryGroup1_i() : GeometryGroup
        {
            var _loc_1:* = new GeometryGroup();
            myGroup = _loc_1;
            _loc_1.geometry = [_MicroAreaChart_GeometryRepeater1_i()];
            _loc_1.fills = [_MicroAreaChart_SolidFill1_i(), _MicroAreaChart_LinearGradientFill1_i()];
            _loc_1.strokes = [_MicroAreaChart_SolidStroke1_i(), _MicroAreaChart_LinearGradientStroke1_i()];
            _loc_1.initialized(this, "myGroup");
            return _loc_1;
        }// end function

        private function _MicroAreaChart_PropertyModifier1_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _MicroAreaChart_PropertyModifier1 = _loc_1;
            _loc_1.property = "points";
            _loc_1.modifierOperator = "none";
            BindingManager.executeBindings(this, "_MicroAreaChart_PropertyModifier1", _MicroAreaChart_PropertyModifier1);
            _loc_1.initialized(this, "_MicroAreaChart_PropertyModifier1");
            return _loc_1;
        }// end function

        private function _MicroAreaChart_Polyline1_i() : Polyline
        {
            var _loc_1:* = new Polyline();
            myLine = _loc_1;
            BindingManager.executeBindings(this, "myLine", myLine);
            _loc_1.initialized(this, "myLine");
            return _loc_1;
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

        private function _MicroAreaChart_Polygon1_i() : Polygon
        {
            var _loc_1:* = new Polygon();
            myArea = _loc_1;
            BindingManager.executeBindings(this, "myArea", myArea);
            _loc_1.initialized(this, "myArea");
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

        override public function set dataProvider(param1:Array) : void
        {
            super.dataProvider = param1;
            myRepeater.count = dataProvider.length;
            return;
        }// end function

        private function calcXmodifier(param1:Number, param2:Object) : Number
        {
            return this.width / (count - 1);
        }// end function

        private function _MicroAreaChart_LinearGradientStroke1_i() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            ghostStroke = _loc_1;
            _loc_1.angle = 45;
            _loc_1.weight = 1;
            _loc_1.pixelHinting = true;
            _loc_1.gradientStops = [_MicroAreaChart_GradientStop3_i(), _MicroAreaChart_GradientStop4_i()];
            _loc_1.initialized(this, "ghostStroke");
            return _loc_1;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
        {
            MicroAreaChart._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
