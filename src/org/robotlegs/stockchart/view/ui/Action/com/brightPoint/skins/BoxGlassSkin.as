package com.brightPoint.skins
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import com.degrafa.geometry.*;
    import com.degrafa.paint.*;
    import com.degrafa.skins.*;
    import flash.filters.*;
    import flash.utils.*;
    import mx.binding.*;
    import mx.core.*;
    import mx.events.*;

    public class BoxGlassSkin extends GraphicProgrammaticSkin implements IBindingClient
    {
        private var _806584572myStroke:SolidStroke;
        private var _1539931223highlightFill:LinearGradientFill;
        var _watchers:Array;
        private var _1395787140borderStroke:Number = 0;
        private var _1287124693backgroundColor:Number = 16777215;
        private var _1060537637myComp:GeometryComposition;
        private var _722830999borderColor:Number = 0;
        private var _583595847cornerRadius:Number = 0;
        private var _1285191888backgroundAlpha:Number = 0;
        var _bindingsBeginWithWord:Object;
        var _bindingsByDestination:Object;
        private var _1427077073backgroundFill:SolidFill;
        private var _119w:Number;
        public var _BoxGlassSkin_RoundedRectangle2:RoundedRectangle;
        var _bindings:Array;
        private var _104h:Number;
        private var _8499395mainRect:RoundedRectangle;
        private static var _watcherSetupUtil:IWatcherSetupUtil;

        public function BoxGlassSkin()
        {
            var target:BoxGlassSkin;
            var watcherSetupUtilClass:Object;
            _bindings = [];
            _watchers = [];
            _bindingsByDestination = {};
            _bindingsBeginWithWord = {};
            this.fills = [_BoxGlassSkin_SolidFill1_i(), _BoxGlassSkin_LinearGradientFill1_i()];
            this.strokes = [_BoxGlassSkin_SolidStroke1_i()];
            this.geometry = [_BoxGlassSkin_GeometryComposition1_i()];
            var bindings:* = _BoxGlassSkin_bindingsSetup();
            var watchers:Array;
            target;
            if (_watcherSetupUtil == null)
            {
                watcherSetupUtilClass = getDefinitionByName("_com_brightPoint_skins_BoxGlassSkinWatcherSetupUtil");
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

        private function _BoxGlassSkin_LinearGradientFill1_i() : LinearGradientFill
        {
            var _loc_1:* = new LinearGradientFill();
            highlightFill = _loc_1;
            _loc_1.suppressEventProcessing = true;
            _loc_1.angle = 90;
            _loc_1.gradientStops = [_BoxGlassSkin_GradientStop1_c(), _BoxGlassSkin_GradientStop2_c()];
            _loc_1.initialized(this, "highlightFill");
            return _loc_1;
        }// end function

        private function _BoxGlassSkin_RoundedRectangle1_i() : RoundedRectangle
        {
            var _loc_1:* = new RoundedRectangle();
            mainRect = _loc_1;
            _loc_1.suppressEventProcessing = true;
            BindingManager.executeBindings(this, "mainRect", mainRect);
            _loc_1.initialized(this, "mainRect");
            return _loc_1;
        }// end function

        private function set cornerRadius(param1:Number) : void
        {
            var _loc_2:* = this._583595847cornerRadius;
            if (_loc_2 !== param1)
            {
                this._583595847cornerRadius = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cornerRadius", _loc_2, param1));
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

        private function _BoxGlassSkin_GeometryComposition1_i() : GeometryComposition
        {
            var _loc_1:* = new GeometryComposition();
            myComp = _loc_1;
            _loc_1.suppressEventProcessing = true;
            _loc_1.geometry = [_BoxGlassSkin_RoundedRectangle1_i(), _BoxGlassSkin_RoundedRectangle2_i()];
            _loc_1.initialized(this, "myComp");
            return _loc_1;
        }// end function

        private function get borderColor() : Number
        {
            return this._722830999borderColor;
        }// end function

        private function _BoxGlassSkin_bindingExprs() : void
        {
            var _loc_1:* = undefined;
            _loc_1 = [new BlurFilter()];
            _loc_1 = backgroundColor;
            _loc_1 = backgroundAlpha;
            _loc_1 = borderColor;
            _loc_1 = borderStroke;
            _loc_1 = cornerRadius;
            _loc_1 = w;
            _loc_1 = h;
            _loc_1 = backgroundFill;
            _loc_1 = myStroke;
            _loc_1 = w;
            _loc_1 = h / 2;
            _loc_1 = highlightFill;
            return;
        }// end function

        private function get borderStroke() : Number
        {
            return this._1395787140borderStroke;
        }// end function

        private function set borderStroke(param1:Number) : void
        {
            var _loc_2:* = this._1395787140borderStroke;
            if (_loc_2 !== param1)
            {
                this._1395787140borderStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderStroke", _loc_2, param1));
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

        private function set backgroundAlpha(param1:Number) : void
        {
            var _loc_2:* = this._1285191888backgroundAlpha;
            if (_loc_2 !== param1)
            {
                this._1285191888backgroundAlpha = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundAlpha", _loc_2, param1));
            }
            return;
        }// end function

        private function set backgroundColor(param1:Number) : void
        {
            var _loc_2:* = this._1287124693backgroundColor;
            if (_loc_2 !== param1)
            {
                this._1287124693backgroundColor = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "backgroundColor", _loc_2, param1));
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

        private function _BoxGlassSkin_GradientStop2_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 1;
            _loc_1.alpha = 0.1;
            _loc_1.suppressEventProcessing = true;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        private function set borderColor(param1:Number) : void
        {
            var _loc_2:* = this._722830999borderColor;
            if (_loc_2 !== param1)
            {
                this._722830999borderColor = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "borderColor", _loc_2, param1));
            }
            return;
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

        public function get mainRect() : RoundedRectangle
        {
            return this._8499395mainRect;
        }// end function

        private function get cornerRadius() : Number
        {
            return this._583595847cornerRadius;
        }// end function

        private function _BoxGlassSkin_RoundedRectangle2_i() : RoundedRectangle
        {
            var _loc_1:* = new RoundedRectangle();
            _BoxGlassSkin_RoundedRectangle2 = _loc_1;
            _loc_1.suppressEventProcessing = true;
            BindingManager.executeBindings(this, "_BoxGlassSkin_RoundedRectangle2", _BoxGlassSkin_RoundedRectangle2);
            _loc_1.initialized(this, "_BoxGlassSkin_RoundedRectangle2");
            return _loc_1;
        }// end function

        private function _BoxGlassSkin_SolidStroke1_i() : SolidStroke
        {
            var _loc_1:* = new SolidStroke();
            myStroke = _loc_1;
            _loc_1.suppressEventProcessing = true;
            BindingManager.executeBindings(this, "myStroke", myStroke);
            _loc_1.initialized(this, "myStroke");
            return _loc_1;
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

        private function get backgroundColor() : Number
        {
            return this._1287124693backgroundColor;
        }// end function

        public function get highlightFill() : LinearGradientFill
        {
            return this._1539931223highlightFill;
        }// end function

        public function get backgroundFill() : SolidFill
        {
            return this._1427077073backgroundFill;
        }// end function

        public function get myComp() : GeometryComposition
        {
            return this._1060537637myComp;
        }// end function

        private function _BoxGlassSkin_SolidFill1_i() : SolidFill
        {
            var _loc_1:* = new SolidFill();
            backgroundFill = _loc_1;
            _loc_1.suppressEventProcessing = true;
            BindingManager.executeBindings(this, "backgroundFill", backgroundFill);
            _loc_1.initialized(this, "backgroundFill");
            return _loc_1;
        }// end function

        private function _BoxGlassSkin_bindingsSetup() : Array
        {
            var binding:Binding;
            var result:Array;
            binding = new Binding(this, function () : Array
            {
                return [new BlurFilter()];
            }// end function
            , function (param1:Array) : void
            {
                this.filters = param1;
                return;
            }// end function
            , "this.filters");
            result[0] = binding;
            binding = new Binding(this, function () : Object
            {
                return backgroundColor;
            }// end function
            , function (param1:Object) : void
            {
                backgroundFill.color = param1;
                return;
            }// end function
            , "backgroundFill.color");
            result[1] = binding;
            binding = new Binding(this, function () : Number
            {
                return backgroundAlpha;
            }// end function
            , function (param1:Number) : void
            {
                backgroundFill.alpha = param1;
                return;
            }// end function
            , "backgroundFill.alpha");
            result[2] = binding;
            binding = new Binding(this, function () : Object
            {
                return borderColor;
            }// end function
            , function (param1:Object) : void
            {
                myStroke.color = param1;
                return;
            }// end function
            , "myStroke.color");
            result[3] = binding;
            binding = new Binding(this, function () : Number
            {
                return borderStroke;
            }// end function
            , function (param1:Number) : void
            {
                myStroke.weight = param1;
                return;
            }// end function
            , "myStroke.weight");
            result[4] = binding;
            binding = new Binding(this, function () : Number
            {
                return cornerRadius;
            }// end function
            , function (param1:Number) : void
            {
                mainRect.cornerRadius = param1;
                return;
            }// end function
            , "mainRect.cornerRadius");
            result[5] = binding;
            binding = new Binding(this, function () : Number
            {
                return w;
            }// end function
            , function (param1:Number) : void
            {
                mainRect.width = param1;
                return;
            }// end function
            , "mainRect.width");
            result[6] = binding;
            binding = new Binding(this, function () : Number
            {
                return h;
            }// end function
            , function (param1:Number) : void
            {
                mainRect.height = param1;
                return;
            }// end function
            , "mainRect.height");
            result[7] = binding;
            binding = new Binding(this, function () : IGraphicsFill
            {
                return backgroundFill;
            }// end function
            , function (param1:IGraphicsFill) : void
            {
                mainRect.fill = param1;
                return;
            }// end function
            , "mainRect.fill");
            result[8] = binding;
            binding = new Binding(this, function () : IGraphicsStroke
            {
                return myStroke;
            }// end function
            , function (param1:IGraphicsStroke) : void
            {
                mainRect.stroke = param1;
                return;
            }// end function
            , "mainRect.stroke");
            result[9] = binding;
            binding = new Binding(this, function () : Number
            {
                return w;
            }// end function
            , function (param1:Number) : void
            {
                _BoxGlassSkin_RoundedRectangle2.width = param1;
                return;
            }// end function
            , "_BoxGlassSkin_RoundedRectangle2.width");
            result[10] = binding;
            binding = new Binding(this, function () : Number
            {
                return h / 2;
            }// end function
            , function (param1:Number) : void
            {
                _BoxGlassSkin_RoundedRectangle2.height = param1;
                return;
            }// end function
            , "_BoxGlassSkin_RoundedRectangle2.height");
            result[11] = binding;
            binding = new Binding(this, function () : IGraphicsFill
            {
                return highlightFill;
            }// end function
            , function (param1:IGraphicsFill) : void
            {
                _BoxGlassSkin_RoundedRectangle2.fill = param1;
                return;
            }// end function
            , "_BoxGlassSkin_RoundedRectangle2.fill");
            result[12] = binding;
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

        private function get h() : Number
        {
            return this._104h;
        }// end function

        private function _BoxGlassSkin_GradientStop1_c() : GradientStop
        {
            var _loc_1:* = new GradientStop();
            _loc_1.color = 16777215;
            _loc_1.ratio = 0;
            _loc_1.alpha = 0.3;
            _loc_1.suppressEventProcessing = true;
            _loc_1.initialized(this, null);
            return _loc_1;
        }// end function

        override protected function updateDisplayList(param1:Number, param2:Number) : void
        {
            var _loc_3:* = UIComponent(this.parent);
            if (_loc_3)
            {
                myComp.suppressEventProcessing = true;
                borderColor = _loc_3.getStyle("borderColor");
                if (isNaN(borderColor))
                {
                    borderColor = 0;
                }
                backgroundColor = _loc_3.getStyle("backgroundColor");
                if (isNaN(backgroundColor))
                {
                    backgroundColor = 0;
                }
                cornerRadius = _loc_3.getStyle("cornerRadius");
                if (isNaN(cornerRadius))
                {
                    cornerRadius = 0;
                }
                borderStroke = _loc_3.getStyle("borderThickness");
                if (isNaN(borderStroke))
                {
                    borderStroke = 0;
                }
                backgroundAlpha = _loc_3.getStyle("backgroundAlpha");
                if (isNaN(backgroundAlpha))
                {
                    backgroundAlpha = 0;
                }
                if (_loc_3.getStyle("borderStyle") == "none" || borderStroke == 0)
                {
                    myStroke.alpha = 0;
                }
                else
                {
                    myStroke.alpha = 1;
                }
            }
            this.w = param1;
            this.h = param2;
            super.updateDisplayList(param1, param2);
            return;
        }// end function

        public function set mainRect(param1:RoundedRectangle) : void
        {
            var _loc_2:* = this._8499395mainRect;
            if (_loc_2 !== param1)
            {
                this._8499395mainRect = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainRect", _loc_2, param1));
            }
            return;
        }// end function

        private function get backgroundAlpha() : Number
        {
            return this._1285191888backgroundAlpha;
        }// end function

        private function get w() : Number
        {
            return this._119w;
        }// end function

        public static function set watcherSetupUtil(param1:IWatcherSetupUtil) : void
        {
            _watcherSetupUtil = param1;
            return;
        }// end function

    }
}
