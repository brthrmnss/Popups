package com.brightPoint.skins
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.geometry.*;
    import com.degrafa.paint.*;
    import com.degrafa.skins.*;
    import flash.utils.*;
    import flexlib.controls.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;

    public class ChartSlicerThumbSkin extends GraphicBorderSkin implements IBindingClient
    {
        private var _2135232903sliderStroke:LinearGradientStroke;
        public var _ChartSlicerThumbSkin_Line1:Line;
        public var _ChartSlicerThumbSkin_Line2:Line;
        public var _ChartSlicerThumbSkin_Line3:Line;
        public var _ChartSlicerThumbSkin_Line4:Line;
        public var _ChartSlicerThumbSkin_Line5:Line;
        public var _ChartSlicerThumbSkin_Line6:Line;
        private var _1539931223highlightFill:LinearGradientFill;
        var _watchers:Array;
        public var _ChartSlicerThumbSkin_RegularRectangle1:RegularRectangle;
        private var _1060537637myComp:GeometryComposition;
        private var _1781198574lightStroke:SolidStroke;
        private var _94851343count:Number = 0;
        var _bindingsByDestination:Object;
        var _bindingsBeginWithWord:Object;
        private var _2013602898thumbStroke:SolidStroke;
        private var _1427077073backgroundFill:SolidFill;
        private var _119w:Number;
        private var _1056473912thumbLightStroke:SolidStroke;
        var _bindings:Array;
        private var _1420394384emptyFill:SolidFill;
        private var _104h:Number;
        private var _1923522226darkStroke:SolidStroke;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public function ChartSlicerThumbSkin()
        {
            var target:ChartSlicerThumbSkin;
            var watcherSetupUtilClass:Object;
            _bindings = [];
            _watchers = [];
            _bindingsByDestination = {};
            _bindingsBeginWithWord = {};
            this.strokes = [_ChartSlicerThumbSkin_SolidStroke1_i(), _ChartSlicerThumbSkin_SolidStroke2_i(), _ChartSlicerThumbSkin_SolidStroke3_i(), _ChartSlicerThumbSkin_SolidStroke4_i(), _ChartSlicerThumbSkin_LinearGradientStroke1_i()];
            this.fills = [_ChartSlicerThumbSkin_SolidFill1_i(), _ChartSlicerThumbSkin_LinearGradientFill1_i(), _ChartSlicerThumbSkin_SolidFill2_i()];
            this.geometry = [_ChartSlicerThumbSkin_GeometryComposition1_i()];
            var bindings:* = _ChartSlicerThumbSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_brightPoint_skins_ChartSlicerThumbSkinWatcherSetupUtil");
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

        private function _ChartSlicerThumbSkin_Line5_i() : Line
        {
            var _loc_1:* = new Line();
            _ChartSlicerThumbSkin_Line5 = _loc_1;
            _loc_1.y = -4;
            _loc_1.y1 = 2;
            BindingManager.executeBindings(this, "_ChartSlicerThumbSkin_Line5", _ChartSlicerThumbSkin_Line5);
            _loc_1.initialized(this, "_ChartSlicerThumbSkin_Line5");
            return _loc_1;
        }// end function

        public function set sliderStroke(param1:LinearGradientStroke) : void
        {
            var _loc_2:* = this._2135232903sliderStroke;
            if (_loc_2 !== param1)
            {
                this._2135232903sliderStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sliderStroke", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerThumbSkin_SolidStroke1_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            thumbLightStroke = _loc_1;
            _loc_1.weight = 1;
            _loc_1.color = 13421772;
            _loc_1.alpha = 0.7;
            _loc_1.initialized(this, "thumbLightStroke");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_SolidStroke3_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            darkStroke = _loc_1;
            _loc_1.color = 0;
            _loc_1.alpha = 0.3;
            _loc_1.initialized(this, "darkStroke");
            return _loc_1;
        }// end function

        private function get w() : Number
        {
            return this._119w;
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

        private function get h() : Number
        {
            return this._104h;
        }// end function

        private function _ChartSlicerThumbSkin_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
            binding = new Binding(this, function () : Number
            {
                return w;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_RegularRectangle1.width = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_RegularRectangle1.width");
            result[0] = binding;
            binding = new Binding(this, function () : IGraphicsFill
            {
                return highlightFill;
            }// end function
            , function (param1:IGraphicsFill) : void
            {
                _ChartSlicerThumbSkin_RegularRectangle1.fill = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_RegularRectangle1.fill");
            result[1] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return sliderStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerThumbSkin_RegularRectangle1.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_RegularRectangle1.stroke");
            result[2] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 - 3;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line1.x = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line1.x");
            result[3] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 - 3;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line1.x1 = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line1.x1");
            result[4] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return thumbLightStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerThumbSkin_Line1.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line1.stroke");
            result[5] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line2.x = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line2.x");
            result[6] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line2.x1 = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line2.x1");
            result[7] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return thumbLightStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerThumbSkin_Line2.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line2.stroke");
            result[8] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 + 3;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line3.x = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line3.x");
            result[9] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 + 3;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line3.x1 = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line3.x1");
            result[10] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return thumbLightStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerThumbSkin_Line3.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line3.stroke");
            result[11] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 - 2;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line4.x = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line4.x");
            result[12] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 - 2;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line4.x1 = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line4.x1");
            result[13] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return thumbStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerThumbSkin_Line4.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line4.stroke");
            result[14] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 + 1;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line5.x = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line5.x");
            result[15] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 + 1;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line5.x1 = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line5.x1");
            result[16] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return thumbStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerThumbSkin_Line5.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line5.stroke");
            result[17] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 + 4;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line6.x = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line6.x");
            result[18] = binding;
            binding = new Binding(this, function () : Number
            {
                return w / 2 + 4;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerThumbSkin_Line6.x1 = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line6.x1");
            result[19] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return thumbStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerThumbSkin_Line6.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerThumbSkin_Line6.stroke");
            result[20] = binding;
            return result;
        }// end function

        private function _ChartSlicerThumbSkin_Line3_i() : Line
        {
            var _loc_1:* = new Line();
            _ChartSlicerThumbSkin_Line3 = _loc_1;
            _loc_1.y = -4;
            _loc_1.y1 = 2;
            BindingManager.executeBindings(this, "_ChartSlicerThumbSkin_Line3", _ChartSlicerThumbSkin_Line3);
            _loc_1.initialized(this, "_ChartSlicerThumbSkin_Line3");
            return _loc_1;
        }// end function

        private function get count() : Number
        {
            return this._94851343count;
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

        private function _ChartSlicerThumbSkin_LinearGradientFill1_i() : LinearGradientFill
        {
            var _loc_1:* = new LinearGradientFill();
            highlightFill = _loc_1;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_ChartSlicerThumbSkin_GradientStop3_c(), _ChartSlicerThumbSkin_GradientStop4_c(), _ChartSlicerThumbSkin_GradientStop5_c(), _ChartSlicerThumbSkin_GradientStop6_c()];
            _loc_1.initialized(this, "highlightFill");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_GradientStop4_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0.4;
            _loc_1.alpha = 0.6;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = w;
            _loc_1 = highlightFill;
            _loc_1 = sliderStroke;
            _loc_1 = w / 2 - 3;
            _loc_1 = w / 2 - 3;
            _loc_1 = thumbLightStroke;
            _loc_1 = w / 2;
            _loc_1 = w / 2;
            _loc_1 = thumbLightStroke;
            _loc_1 = w / 2 + 3;
            _loc_1 = w / 2 + 3;
            _loc_1 = thumbLightStroke;
            _loc_1 = w / 2 - 2;
            _loc_1 = w / 2 - 2;
            _loc_1 = thumbStroke;
            _loc_1 = w / 2 + 1;
            _loc_1 = w / 2 + 1;
            _loc_1 = thumbStroke;
            _loc_1 = w / 2 + 4;
            _loc_1 = w / 2 + 4;
            _loc_1 = thumbStroke;
            return;
        }// end function

        private function _ChartSlicerThumbSkin_GradientStop6_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 1;
            _loc_1.alpha = 0.3;
            _loc_1.initialized(this, null);
            return _loc_1;
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

        public function set backgroundFill(param1:SolidFill) : void
        {
            var _loc_2:* = this._1427077073backgroundFill;
            if (_loc_2 !== param1)
            {
                this._1427077073backgroundFill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundFill", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerThumbSkin_GradientStop2_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 15658734;
            _loc_1.ratio = 1;
            _loc_1.initialized(this, null);
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

        public function get thumbLightStroke() : SolidStroke
        {
            return this._1056473912thumbLightStroke;
        }// end function

        private function _ChartSlicerThumbSkin_SolidFill2_i() : SolidFill
        {
            var _loc_1:* = new SolidFill();
            emptyFill = _loc_1;
            _loc_1.alpha = 1;
            _loc_1.initialized(this, "emptyFill");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_Line2_i() : Line
        {
            var _loc_1:* = new Line();
            _ChartSlicerThumbSkin_Line2 = _loc_1;
            _loc_1.y = -4;
            _loc_1.y1 = 2;
            BindingManager.executeBindings(this, "_ChartSlicerThumbSkin_Line2", _ChartSlicerThumbSkin_Line2);
            _loc_1.initialized(this, "_ChartSlicerThumbSkin_Line2");
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

        private function _ChartSlicerThumbSkin_Line4_i() : Line
        {
            var _loc_1:* = new Line();
            _ChartSlicerThumbSkin_Line4 = _loc_1;
            _loc_1.y = -4;
            _loc_1.y1 = 2;
            BindingManager.executeBindings(this, "_ChartSlicerThumbSkin_Line4", _ChartSlicerThumbSkin_Line4);
            _loc_1.initialized(this, "_ChartSlicerThumbSkin_Line4");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_Line6_i() : Line
        {
            var _loc_1:* = new Line();
            _ChartSlicerThumbSkin_Line6 = _loc_1;
            _loc_1.y = -4;
            _loc_1.y1 = 2;
            BindingManager.executeBindings(this, "_ChartSlicerThumbSkin_Line6", _ChartSlicerThumbSkin_Line6);
            _loc_1.initialized(this, "_ChartSlicerThumbSkin_Line6");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_LinearGradientStroke1_i() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            sliderStroke = _loc_1;
            _loc_1.weight = 1;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_ChartSlicerThumbSkin_GradientStop1_c(), _ChartSlicerThumbSkin_GradientStop2_c()];
            _loc_1.initialized(this, "sliderStroke");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_SolidStroke2_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            thumbStroke = _loc_1;
            _loc_1.weight = 1;
            _loc_1.color = 5592405;
            _loc_1.alpha = 0.5;
            _loc_1.initialized(this, "thumbStroke");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_SolidStroke4_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            lightStroke = _loc_1;
            _loc_1.color = 16777215;
            _loc_1.alpha = 0.2;
            _loc_1.weight = 2;
            _loc_1.initialized(this, "lightStroke");
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_GeometryComposition1_i() : GeometryComposition
        {
            var _loc_1:* = new GeometryComposition();
            myComp = _loc_1;
            _loc_1.geometry = [_ChartSlicerThumbSkin_RegularRectangle1_i(), _ChartSlicerThumbSkin_Line1_i(), _ChartSlicerThumbSkin_Line2_i(), _ChartSlicerThumbSkin_Line3_i(), _ChartSlicerThumbSkin_Line4_i(), _ChartSlicerThumbSkin_Line5_i(), _ChartSlicerThumbSkin_Line6_i()];
            _loc_1.initialized(this, "myComp");
            return _loc_1;
        }// end function

        public function get backgroundFill() : SolidFill
        {
            return this._1427077073backgroundFill;
        }// end function

        public function get darkStroke() : SolidStroke
        {
            return this._1923522226darkStroke;
        }// end function

        public function get highlightFill() : LinearGradientFill
        {
            return this._1539931223highlightFill;
        }// end function

        private function _ChartSlicerThumbSkin_GradientStop1_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 12303291;
            _loc_1.ratio = 0;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerThumbSkin_GradientStop3_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0;
            _loc_1.alpha = 0.3;
            _loc_1.initialized(this, null);
            return _loc_1;
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

        private function _ChartSlicerThumbSkin_SolidFill1_i() : SolidFill
        {
            var _loc_1:* = new SolidFill();
            backgroundFill = _loc_1;
            _loc_1.color = 3355443;
            _loc_1.alpha = 1;
            _loc_1.initialized(this, "backgroundFill");
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

        public function get myComp() : GeometryComposition
        {
            return this._1060537637myComp;
        }// end function

        private function _ChartSlicerThumbSkin_GradientStop5_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0.4;
            _loc_1.alpha = 0.4;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get thumbStroke() : SolidStroke
        {
            return this._2013602898thumbStroke;
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

        private function _ChartSlicerThumbSkin_RegularRectangle1_i() : RegularRectangle
        {
            var _loc_1:* = new RegularRectangle();
            _ChartSlicerThumbSkin_RegularRectangle1 = _loc_1;
            _loc_1.y = -6;
            _loc_1.height = 10;
            BindingManager.executeBindings(this, "_ChartSlicerThumbSkin_RegularRectangle1", _ChartSlicerThumbSkin_RegularRectangle1);
            _loc_1.initialized(this, "_ChartSlicerThumbSkin_RegularRectangle1");
            return _loc_1;
        }// end function

        public function get emptyFill() : SolidFill
        {
            return this._1420394384emptyFill;
        }// end function

        public function set thumbStroke(param1:SolidStroke) : void
        {
            var _loc_2:* = this._2013602898thumbStroke;
            if (_loc_2 !== param1)
            {
                this._2013602898thumbStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumbStroke", _loc_2, param1));
            }
            return;
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
            w = this.width - 2;
            h = this.height;
            this.graphics.clear();
            myComp.draw(this.graphics, null);
            return;
        }// end function

        public function get sliderStroke() : LinearGradientStroke
        {
            return this._2135232903sliderStroke;
        }// end function

        private function _ChartSlicerThumbSkin_Line1_i() : Line
        {
            var _loc_1:* = new Line();
            _ChartSlicerThumbSkin_Line1 = _loc_1;
            _loc_1.y = -4;
            _loc_1.y1 = 2;
            BindingManager.executeBindings(this, "_ChartSlicerThumbSkin_Line1", _ChartSlicerThumbSkin_Line1);
            _loc_1.initialized(this, "_ChartSlicerThumbSkin_Line1");
            return _loc_1;
        }// end function

        public function get lightStroke() : SolidStroke
        {
            return this._1781198574lightStroke;
        }// end function

        public function set thumbLightStroke(param1:SolidStroke) : void
        {
            var _loc_2:* = this._1056473912thumbLightStroke;
            if (_loc_2 !== param1)
            {
                this._1056473912thumbLightStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "thumbLightStroke", _loc_2, param1));
            }
            return;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
        {
            ChartSlicerThumbSkin._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
