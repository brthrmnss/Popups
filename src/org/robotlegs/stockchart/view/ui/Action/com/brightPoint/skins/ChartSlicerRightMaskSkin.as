package com.brightPoint.skins
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.geometry.*;
    import com.degrafa.paint.*;
    import com.degrafa.skins.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;

    public class ChartSlicerRightMaskSkin extends GraphicBorderSkin implements IBindingClient
    {
        private var _806584572myStroke:LinearGradientStroke;
        private var _1060100688myRect:RoundedRectangle;
        var _watchers:Array;
        private var _1781198574lightStroke:SolidStroke;
        private var _1060537637myComp:GeometryComposition;
        var _bindingsByDestination:Object;
        private var _1740615193darkFill:LinearGradientFill;
        var _bindingsBeginWithWord:Object;
        public var _ChartSlicerRightMaskSkin_RoundedRectangle1:RoundedRectangle;
        private var _119w:Number;
        var _bindings:Array;
        private var _1420394384emptyFill:SolidFill;
        private var _104h:Number;
        private var _1923522226darkStroke:SolidStroke;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public function ChartSlicerRightMaskSkin()
        {
            var target:ChartSlicerRightMaskSkin;
            var watcherSetupUtilClass:Object;
            _bindings = [];
            _watchers = [];
            _bindingsByDestination = {};
            _bindingsBeginWithWord = {};
            this.strokes = [_ChartSlicerRightMaskSkin_LinearGradientStroke1_i(), _ChartSlicerRightMaskSkin_SolidStroke1_i(), _ChartSlicerRightMaskSkin_SolidStroke2_i()];
            this.fills = [_ChartSlicerRightMaskSkin_LinearGradientFill1_i(), _ChartSlicerRightMaskSkin_SolidFill1_i()];
            this.geometry = [_ChartSlicerRightMaskSkin_GeometryComposition1_i()];
            var bindings:* = _ChartSlicerRightMaskSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_brightPoint_skins_ChartSlicerRightMaskSkinWatcherSetupUtil");
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

        private function _ChartSlicerRightMaskSkin_RoundedRectangle2_i() : RoundedRectangle
        {
            var _loc_1:* = new RoundedRectangle();
            myRect = _loc_1;
            _loc_1.x = -10;
            _loc_1.cornerRadius = 0;
            BindingManager.executeBindings(this, "myRect", myRect);
            _loc_1.initialized(this, "myRect");
            return _loc_1;
        }// end function

        private function get w() : Number
        {
            return this._119w;
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

        public function get myStroke() : LinearGradientStroke
        {
            return this._806584572myStroke;
        }// end function

        private function _ChartSlicerRightMaskSkin_LinearGradientStroke1_i() : LinearGradientStroke
        {
            var _loc_1:* = new LinearGradientStroke();
            myStroke = _loc_1;
            _loc_1.weight = 1;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_ChartSlicerRightMaskSkin_GradientStop1_c(), _ChartSlicerRightMaskSkin_GradientStop2_c()];
            _loc_1.initialized(this, "myStroke");
            return _loc_1;
        }// end function

        public function get darkFill() : LinearGradientFill
        {
            return this._1740615193darkFill;
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

        private function _ChartSlicerRightMaskSkin_GradientStop1_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 0;
            _loc_1.alpha = 0.4;
            _loc_1.ratio = 0;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get myRect() : RoundedRectangle
        {
            return this._1060100688myRect;
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

        private function _ChartSlicerRightMaskSkin_GradientStop5_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 0;
            _loc_1.ratio = 1;
            _loc_1.alpha = 0.4;
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

        private function _ChartSlicerRightMaskSkin_SolidStroke2_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            lightStroke = _loc_1;
            _loc_1.color = 16777215;
            _loc_1.alpha = 0.2;
            _loc_1.weight = 2;
            _loc_1.initialized(this, "lightStroke");
            return _loc_1;
        }// end function

        private function _ChartSlicerRightMaskSkin_GradientStop3_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0;
            _loc_1.alpha = 0.1;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function _ChartSlicerRightMaskSkin_GeometryComposition1_i() : GeometryComposition
        {
            var _loc_1:* = new GeometryComposition();
            myComp = _loc_1;
            _loc_1.geometry = [_ChartSlicerRightMaskSkin_RoundedRectangle1_i(), _ChartSlicerRightMaskSkin_RoundedRectangle2_i()];
            _loc_1.initialized(this, "myComp");
            return _loc_1;
        }// end function

        private function _ChartSlicerRightMaskSkin_RoundedRectangle1_i() : RoundedRectangle
        {
            var _loc_1:* = new RoundedRectangle();
            _ChartSlicerRightMaskSkin_RoundedRectangle1 = _loc_1;
            _loc_1.x = -9;
            _loc_1.y = 1;
            _loc_1.cornerRadius = 0;
            BindingManager.executeBindings(this, "_ChartSlicerRightMaskSkin_RoundedRectangle1", _ChartSlicerRightMaskSkin_RoundedRectangle1);
            _loc_1.initialized(this, "_ChartSlicerRightMaskSkin_RoundedRectangle1");
            return _loc_1;
        }// end function

        private function _ChartSlicerRightMaskSkin_SolidFill1_i() : SolidFill
        {
            var _loc_1:* = new SolidFill();
            emptyFill = _loc_1;
            _loc_1.alpha = 1;
            _loc_1.initialized(this, "emptyFill");
            return _loc_1;
        }// end function

        public function get darkStroke() : SolidStroke
        {
            return this._1923522226darkStroke;
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

        public function get myComp() : GeometryComposition
        {
            return this._1060537637myComp;
        }// end function

        private function _ChartSlicerRightMaskSkin_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
            binding = new Binding(this, function () : Number
            {
                return w - 2;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerRightMaskSkin_RoundedRectangle1.width = param1;
                return;
            }// end function
            , "_ChartSlicerRightMaskSkin_RoundedRectangle1.width");
            result[0] = binding;
            binding = new Binding(this, function () : Number
            {
                return h - 2;
            }// end function
            , function (param1:Number) : void
            {
                _ChartSlicerRightMaskSkin_RoundedRectangle1.height = param1;
                return;
            }// end function
            , "_ChartSlicerRightMaskSkin_RoundedRectangle1.height");
            result[1] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return lightStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                _ChartSlicerRightMaskSkin_RoundedRectangle1.stroke = param1;
                return;
            }// end function
            , "_ChartSlicerRightMaskSkin_RoundedRectangle1.stroke");
            result[2] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return darkStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                myRect.stroke = param1;
                return;
            }// end function
            , "myRect.stroke");
            result[3] = binding;
            binding = new Binding(this, function () : IGraphicsFill
            {
                return darkFill;
            }// end function
            , function (param1:IGraphicsFill) : void
            {
                myRect.fill = param1;
                return;
            }// end function
            , "myRect.fill");
            result[4] = binding;
            binding = new Binding(this, function () : Number
            {
                return w;
            }// end function
            , function (param1:Number) : void
            {
                myRect.width = param1;
                return;
            }// end function
            , "myRect.width");
            result[5] = binding;
            binding = new Binding(this, function () : Number
            {
                return h;
            }// end function
            , function (param1:Number) : void
            {
                myRect.height = param1;
                return;
            }// end function
            , "myRect.height");
            result[6] = binding;
            return result;
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

        public function set myRect(param1:RoundedRectangle) : void
        {
            var _loc_2:* = this._1060100688myRect;
            if (_loc_2 !== param1)
            {
                this._1060100688myRect = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "myRect", _loc_2, param1));
            }
            return;
        }// end function

        private function _ChartSlicerRightMaskSkin_LinearGradientFill1_i() : LinearGradientFill
        {
            var _loc_1:* = new LinearGradientFill();
            darkFill = _loc_1;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_ChartSlicerRightMaskSkin_GradientStop3_c(), _ChartSlicerRightMaskSkin_GradientStop4_c(), _ChartSlicerRightMaskSkin_GradientStop5_c()];
            _loc_1.initialized(this, "darkFill");
            return _loc_1;
        }// end function

        private function _ChartSlicerRightMaskSkin_GradientStop2_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.alpha = 0.4;
            _loc_1.ratio = 1;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get emptyFill() : SolidFill
        {
            return this._1420394384emptyFill;
        }// end function

        private function _ChartSlicerRightMaskSkin_SolidStroke1_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            darkStroke = _loc_1;
            _loc_1.color = 0;
            _loc_1.alpha = 0.3;
            _loc_1.initialized(this, "darkStroke");
            return _loc_1;
        }// end function

        private function _ChartSlicerRightMaskSkin_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = w - 2;
            _loc_1 = h - 2;
            _loc_1 = lightStroke;
            _loc_1 = darkStroke;
            _loc_1 = darkFill;
            _loc_1 = w;
            _loc_1 = h;
            return;
        }// end function

        private function _ChartSlicerRightMaskSkin_GradientStop4_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 0;
            _loc_1.ratio = 0.55;
            _loc_1.alpha = 0.2;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        public function get lightStroke() : SolidStroke
        {
            return this._1781198574lightStroke;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            w = this.width + 10;
            h = this.height;
            this.graphics.clear();
            myComp.draw(this.graphics, null);
            return;
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

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
        {
            ChartSlicerRightMaskSkin._watcherSetupUtil = param1;
            return;
        }// end function

    }
}
