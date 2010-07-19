package com.brightPoint.skins
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.geometry.*;
    import com.degrafa.paint.*;
    import com.degrafa.repeaters.*;
    import com.degrafa.skins.*;
    import flash.utils.*;
    import flexlib.controls.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;

    public class ChartSlicerTrackSkin extends GraphicBorderSkin implements IBindingClient
    {
        private var _806584572myStroke:LinearGradientStroke;
        private var _24069460myRepeater:GeometryRepeater;
        private var _1539931223highlightFill:LinearGradientFill;
        var _watchers:Array;
        private var _1781198574lightStroke:SolidStroke;
        private var _1060537637myComp:GeometryComposition;
        private var _94851343count:Number = 0;
        var _bindingsByDestination:Object;
        private var _1740615193darkFill:LinearGradientFill;
        var _bindingsBeginWithWord:Object;
        private var _119w:Number;
        var _bindings:Array;
        public var _ChartSlicerTrackSkin_RegularRectangle1:RegularRectangle;
        public var _ChartSlicerTrackSkin_PropertyModifier2:PropertyModifier;
        public var _ChartSlicerTrackSkin_PropertyModifier3:PropertyModifier;
        public var _ChartSlicerTrackSkin_PropertyModifier4:PropertyModifier;
        private var _1420394384emptyFill:SolidFill;
        private var _1923522226darkStroke:SolidStroke;
        private var _104h:Number;
        public var _ChartSlicerTrackSkin_PropertyModifier1:PropertyModifier;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public function ChartSlicerTrackSkin()
        {
            var target:ChartSlicerTrackSkin;
            var watcherSetupUtilClass:Object;
            _bindings = [];
            _watchers = [];
            _bindingsByDestination = {};
            _bindingsBeginWithWord = {};
            this.strokes = [_ChartSlicerTrackSkin_LinearGradientStroke1_i(), _ChartSlicerTrackSkin_SolidStroke1_i(), _ChartSlicerTrackSkin_SolidStroke2_i()];
            this.fills = [_ChartSlicerTrackSkin_LinearGradientFill1_i(), _ChartSlicerTrackSkin_LinearGradientFill2_i(), _ChartSlicerTrackSkin_SolidFill1_i()];
            this.geometry = [_ChartSlicerTrackSkin_GeometryComposition1_i(), _ChartSlicerTrackSkin_GeometryRepeater1_i()];
            var bindings:* = _ChartSlicerTrackSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_brightPoint_skins_ChartSlicerTrackSkinWatcherSetupUtil");
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
            return;
        }// end function

        private function get h() : Number
        {
            return this._104h;
        }// end function

        private function _ChartSlicerTrackSkin_SolidFill1_i() : SolidFill
        {
            var _loc_1:* = new SolidFill();
            emptyFill = _loc_1;
            _loc_1.alpha = 1;
            _loc_1.initialized(this, "emptyFill");
            return _loc_1;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_3:HSlider = null;
            if (parent && parent.parent is HSlider)
            {
                count = parent.parent["maximum"];
                if (isNaN(count))
                {
                    count = 0;
                }
            }
            w = this.width - 3;
            h = this.height;
            this.graphics.clear();
            myComp.draw(this.graphics, null);
            myRepeater.draw(this.graphics, null);
            return;
        }// end function

        public function set myStroke(param1:LinearGradientStroke) : void
        {
            var _loc_2:* = this._806584572myStroke;
            if (_loc_2 !== param1)
            {
                this._806584572myStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myStroke", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerTrackSkin_GeometryRepeater1_i() : GeometryRepeater
        {
            var _loc_1:* = new GeometryRepeater();
            myRepeater = _loc_1;
            _loc_1.modifiers = [_ChartSlicerTrackSkin_PropertyModifier1_i(), _ChartSlicerTrackSkin_PropertyModifier2_i(), _ChartSlicerTrackSkin_PropertyModifier3_i(), _ChartSlicerTrackSkin_PropertyModifier4_i()];
            _loc_1.geometry = [_ChartSlicerTrackSkin_Line1_c()];
            BindingManager.executeBindings(this, "myRepeater", myRepeater);
            _loc_1.initialized(this, "myRepeater");
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop2_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.alpha = 0.4;
            _loc_1.ratio = 1;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function get count() : Number
        {
            return this._94851343count;
        }// end function

        public function get myStroke() : LinearGradientStroke
        {
            return this._806584572myStroke;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop8_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 1;
            _loc_1.alpha = 0.2;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_LinearGradientFill2_i() : LinearGradientFill
        {
            var _loc_1:* = new LinearGradientFill();
            highlightFill = _loc_1;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_ChartSlicerTrackSkin_GradientStop6_c(), _ChartSlicerTrackSkin_GradientStop7_c(), _ChartSlicerTrackSkin_GradientStop8_c()];
            _loc_1.initialized(this, "highlightFill");
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop4_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 0;
            _loc_1.ratio = 0.5;
            _loc_1.alpha = 0.75;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop6_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0;
            _loc_1.alpha = 0.2;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_PropertyModifier3_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _ChartSlicerTrackSkin_PropertyModifier3 = _loc_1;
            _loc_1.property = "y";
            _loc_1.modifierOperator = "none";
            BindingManager.executeBindings(this, "_ChartSlicerTrackSkin_PropertyModifier3", _ChartSlicerTrackSkin_PropertyModifier3);
            _loc_1.initialized(this, "_ChartSlicerTrackSkin_PropertyModifier3");
            return _loc_1;
        }// end function

        public function set darkStroke(param1:SolidStroke) : void
        {
            var _loc_2:* = this._1923522226darkStroke;
            if (_loc_2 !== param1)
            {
                this._1923522226darkStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkStroke", _loc_2, param1));
            }
            return;
        }// end function

        private function set count(param1:Number) : void
        {
            var _loc_2:* = this._94851343count;
            if (_loc_2 !== param1)
            {
                this._94851343count = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "count", _loc_2, param1));
            }
            return;
        }// end function

        public function get lightStroke() : SolidStroke
        {
            return this._1781198574lightStroke;
        }// end function

        private function _ChartSlicerTrackSkin_PropertyModifier1_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _ChartSlicerTrackSkin_PropertyModifier1 = _loc_1;
            _loc_1.property = "x";
            BindingManager.executeBindings(this, "_ChartSlicerTrackSkin_PropertyModifier1", _ChartSlicerTrackSkin_PropertyModifier1);
            _loc_1.initialized(this, "_ChartSlicerTrackSkin_PropertyModifier1");
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_SolidStroke2_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            lightStroke = _loc_1;
            _loc_1.color = 16777215;
            _loc_1.alpha = 0.2;
            _loc_1.weight = 2;
            _loc_1.initialized(this, "lightStroke");
            return _loc_1;
        }// end function

        private function get w() : Number
        {
            return this._119w;
        }// end function

        public function get darkFill() : LinearGradientFill
        {
            return this._1740615193darkFill;
        }// end function

        public function set darkFill(param1:LinearGradientFill) : void
        {
            var _loc_2:* = this._1740615193darkFill;
            if (_loc_2 !== param1)
            {
                this._1740615193darkFill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "darkFill", _loc_2, param1));
            }
            return;
        }// end function

        public function set highlightFill(param1:LinearGradientFill) : void
        {
            var _loc_2:* = this._1539931223highlightFill;
            if (_loc_2 !== param1)
            {
                this._1539931223highlightFill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "highlightFill", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerTrackSkin_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = w;
            _loc_1 = darkFill;
            _loc_1 = lightStroke;
            _loc_1 = count;
            _loc_1 = w / count;
            _loc_1 = w / count;
            _loc_1 = [-2, 0, 0, 0];
            _loc_1 = [5, 3, 3, 3];
            return;
        }// end function

        private function _ChartSlicerTrackSkin_LinearGradientStroke1_i() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            myStroke = _loc_1;
            _loc_1.weight = 1;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_ChartSlicerTrackSkin_GradientStop1_c(), _ChartSlicerTrackSkin_GradientStop2_c()];
            _loc_1.initialized(this, "myStroke");
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_GeometryComposition1_i() : GeometryComposition
        {
            var _loc_1:* = new GeometryComposition();
            myComp = _loc_1;
            _loc_1.geometry = [_ChartSlicerTrackSkin_RegularRectangle1_i()];
            _loc_1.initialized(this, "myComp");
            return _loc_1;
        }// end function

        public function set myComp(param1:GeometryComposition) : void
        {
            var _loc_2:* = this._1060537637myComp;
            if (_loc_2 !== param1)
            {
                this._1060537637myComp = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myComp", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerTrackSkin_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
            binding = new Binding(this, function () : Number
            {
                return w;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerTrackSkin_RegularRectangle1.width = param1;
                return;
            }// end function
            , "_ChartSlicerTrackSkin_RegularRectangle1.width");
            result[0] = binding;
            binding = new Binding(this, function () : IGraphicsFill
            {
                return darkFill;
            }// end function
            , function (param1:IGraphicsFill) : void
            {
                _ChartSlicerTrackSkin_RegularRectangle1.fill = param1;
                return;
            }// end function
            , "_ChartSlicerTrackSkin_RegularRectangle1.fill");
            result[1] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return lightStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerTrackSkin_RegularRectangle1.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerTrackSkin_RegularRectangle1.stroke");
            result[2] = binding;
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
            result[3] = binding;
            binding = new Binding(this, function () : Object
            {
                return w / count;
            }// end function
            , function (param1:Object) : void
            {
                _ChartSlicerTrackSkin_PropertyModifier1.modifier = param1;
                return;
            }// end function
            , "_ChartSlicerTrackSkin_PropertyModifier1.modifier");
            result[4] = binding;
            binding = new Binding(this, function () : Object
            {
                return w / count;
            }// end function
            , function (param1:Object) : void
            {
                _ChartSlicerTrackSkin_PropertyModifier2.modifier = param1;
                return;
            }// end function
            , "_ChartSlicerTrackSkin_PropertyModifier2.modifier");
            result[5] = binding;
            binding = new Binding(this, function () : Object
            {
                return [-2, 0, 0, 0];
            }// end function
            , function (param1:Object) : void
            {
                _ChartSlicerTrackSkin_PropertyModifier3.modifier = param1;
                return;
            }// end function
            , "_ChartSlicerTrackSkin_PropertyModifier3.modifier");
            result[6] = binding;
            binding = new Binding(this, function () : Object
            {
                return [5, 3, 3, 3];
            }// end function
            , function (param1:Object) : void
            {
                _ChartSlicerTrackSkin_PropertyModifier4.modifier = param1;
                return;
            }// end function
            , "_ChartSlicerTrackSkin_PropertyModifier4.modifier");
            result[7] = binding;
            return result;
        }// end function

        private function set w(param1:Number) : void
        {
            var _loc_2:* = this._119w;
            if (_loc_2 !== param1)
            {
                this._119w = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "w", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop1_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 0;
            _loc_1.alpha = 0.4;
            _loc_1.ratio = 0;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get darkStroke() : SolidStroke
        {
            return this._1923522226darkStroke;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop3_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 0;
            _loc_1.ratio = 0;
            _loc_1.alpha = 0.3;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop5_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 0;
            _loc_1.ratio = 1;
            _loc_1.alpha = 0.3;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_RegularRectangle1_i() : RegularRectangle
        {
            var _loc_1:* = new RegularRectangle();
            _ChartSlicerTrackSkin_RegularRectangle1 = _loc_1;
            _loc_1.y = -5;
            _loc_1.height = 12;
            BindingManager.executeBindings(this, "_ChartSlicerTrackSkin_RegularRectangle1", _ChartSlicerTrackSkin_RegularRectangle1);
            _loc_1.initialized(this, "_ChartSlicerTrackSkin_RegularRectangle1");
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_GradientStop7_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0.3;
            _loc_1.alpha = 0.6;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerTrackSkin_LinearGradientFill1_i() : LinearGradientFill
        {
            var _loc_1:* = new LinearGradientFill();
            darkFill = _loc_1;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_ChartSlicerTrackSkin_GradientStop3_c(), _ChartSlicerTrackSkin_GradientStop4_c(), _ChartSlicerTrackSkin_GradientStop5_c()];
            _loc_1.initialized(this, "darkFill");
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

        public function get highlightFill() : LinearGradientFill
        {
            return this._1539931223highlightFill;
        }// end function

        private function _ChartSlicerTrackSkin_PropertyModifier2_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _ChartSlicerTrackSkin_PropertyModifier2 = _loc_1;
            _loc_1.property = "x1";
            BindingManager.executeBindings(this, "_ChartSlicerTrackSkin_PropertyModifier2", _ChartSlicerTrackSkin_PropertyModifier2);
            _loc_1.initialized(this, "_ChartSlicerTrackSkin_PropertyModifier2");
            return _loc_1;
        }// end function

        public function get myComp() : GeometryComposition
        {
            return this._1060537637myComp;
        }// end function

        private function set h(param1:Number) : void
        {
            var _loc_2:* = this._104h;
            if (_loc_2 !== param1)
            {
                this._104h = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "h", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerTrackSkin_PropertyModifier4_i() : PropertyModifier
        {
            var _loc_1:* = new PropertyModifier();
            _ChartSlicerTrackSkin_PropertyModifier4 = _loc_1;
            _loc_1.property = "y1";
            _loc_1.modifierOperator = "none";
            BindingManager.executeBindings(this, "_ChartSlicerTrackSkin_PropertyModifier4", _ChartSlicerTrackSkin_PropertyModifier4);
            _loc_1.initialized(this, "_ChartSlicerTrackSkin_PropertyModifier4");
            return _loc_1;
        }// end function

        public function set emptyFill(param1:SolidFill) : void
        {
            var _loc_2:* = this._1420394384emptyFill;
            if (_loc_2 !== param1)
            {
                this._1420394384emptyFill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "emptyFill", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerTrackSkin_SolidStroke3_c() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            _loc_1.color = 16777215;
            _loc_1.weight = 1;
            _loc_1.alpha = 0.7;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get myRepeater() : GeometryRepeater
        {
            return this._24069460myRepeater;
        }// end function

        private function _ChartSlicerTrackSkin_SolidStroke1_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            darkStroke = _loc_1;
            _loc_1.color = 0;
            _loc_1.alpha = 0.3;
            _loc_1.initialized(this, "darkStroke");
            return _loc_1;
        }// end function

        public function set lightStroke(param1:SolidStroke) : void
        {
            var _loc_2:* = this._1781198574lightStroke;
            if (_loc_2 !== param1)
            {
                this._1781198574lightStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lightStroke", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerTrackSkin_Line1_c() : Line
        {
            var _loc_1:* = new Line();
            _loc_1.y = -2;
            _loc_1.y1 = 5;
            _loc_1.x = 0;
            _loc_1.x1 = 0;
            _loc_1.stroke = _ChartSlicerTrackSkin_SolidStroke3_c();
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get emptyFill() : SolidFill
        {
            return this._1420394384emptyFill;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
        {
            ChartSlicerTrackSkin._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
