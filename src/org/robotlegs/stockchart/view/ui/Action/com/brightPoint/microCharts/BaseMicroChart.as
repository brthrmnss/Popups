package com.brightPoint.microCharts
{
    import com.degrafa.*;
    import com.degrafa.core.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.events.*;

    public class BaseMicroChart extends Surface
    {
        private var _1763739238_dataProvider:Array;
        protected var _360159676_colorStroke:IGraphicsStroke;
        protected var _491596295_colorFill:IGraphicsFill;
        protected var _min:Number = 0;
        private var _minValue:Number = 0;
        protected var _max:Number = 1;
        protected var chartData:Array;
        private var _1279163430colorTheme:Number = 15726331;
        protected var _dataField:String = "";
        protected var _94851343count:Number;

        public function BaseMicroChart()
        {
            this.addEventListener(ResizeEvent.RESIZE, onResize);
            return;
        }// end function

        public function draw() : void
        {
            return;
        }// end function

        protected function get _colorFill() : IGraphicsFill
        {
            return this._491596295_colorFill;
        }// end function

        protected function get _colorStroke() : IGraphicsStroke
        {
            return this._360159676_colorStroke;
        }// end function

        public function set colorTheme(param1:Number) : void
        {
            var _loc_2:* = this._1279163430colorTheme;
            if (_loc_2 !== param1)
            {
                this._1279163430colorTheme = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "colorTheme", _loc_2, param1));
            }
            return;
        }// end function

        protected function set _colorFill(param1:IGraphicsFill) : void
        {
            var _loc_2:* = this._491596295_colorFill;
            if (_loc_2 !== param1)
            {
                this._491596295_colorFill = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_colorFill", _loc_2, param1));
            }
            return;
        }// end function

        protected function get count() : Number
        {
            return this._94851343count;
        }// end function

        private function get _dataProvider() : Array
        {
            return this._1763739238_dataProvider;
        }// end function

        private function set _dataProvider(param1:Array) : void
        {
            var _loc_2:* = this._1763739238_dataProvider;
            if (_loc_2 !== param1)
            {
                this._1763739238_dataProvider = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_dataProvider", _loc_2, param1));
            }
            return;
        }// end function

        private function set _339742651dataProvider(param1:Array) : void
        {
            _dataProvider = param1;
            setMinMax();
            return;
        }// end function

        public function set dataField(param1:String) : void
        {
            _dataField = param1;
            setMinMax();
            return;
        }// end function

        protected function set count(param1:Number) : void
        {
            var _loc_2:* = this._94851343count;
            if (_loc_2 !== param1)
            {
                this._94851343count = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "count", _loc_2, param1));
            }
            return;
        }// end function

        override public function setStyle(param1:String, param2) : void
        {
            var _loc_3:Class = null;
            trace("BaseMicroChart styleProp=" + param1);
            if (param1 == "colorFill")
            {
                _loc_3 = Class(getDefinitionByName(String(param2)));
                _colorFill = new _loc_3;
            }
            super.setStyle(param1, param2);
            return;
        }// end function

        public function get dataField() : String
        {
            return _dataField;
        }// end function

        protected function setMinMax() : void
        {
            if (_dataProvider == null || _dataProvider.length == 0)
            {
                return;
            }
            _min = _minValue;
            _max = 1;
            chartData = new Array();
            var _loc_1:int = 0;
            while (_loc_1 < _dataProvider.length)
            {
                
                if (_dataField.length > 0)
                {
                    chartData.push(_dataProvider[_loc_1][_dataField]);
                }
                else
                {
                    chartData.push(_dataProvider[_loc_1]);
                }
                _min = _min < chartData[_loc_1] ? (_min) : (chartData[_loc_1]);
                _max = _max > chartData[_loc_1] ? (_max) : (chartData[_loc_1]);
                _loc_1++;
            }
            count = chartData.length.valueOf();
            draw();
            return;
        }// end function

        public function get colorTheme() : Number
        {
            return this._1279163430colorTheme;
        }// end function

        protected function set _colorStroke(param1:IGraphicsStroke) : void
        {
            var _loc_2:* = this._360159676_colorStroke;
            if (_loc_2 !== param1)
            {
                this._360159676_colorStroke = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_colorStroke", _loc_2, param1));
            }
            return;
        }// end function

        private function onResize(event:Event) : void
        {
            draw();
            return;
        }// end function

        public function get dataProvider() : Array
        {
            return _dataProvider;
        }// end function

        public function set dataProvider(param1:Array) : void
        {
            var _loc_2:* = this.dataProvider;
            if (_loc_2 !== param1)
            {
                this._339742651dataProvider = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "dataProvider", _loc_2, param1));
            }
            return;
        }// end function

        public function set minValue(param1:Number) : void
        {
            _minValue = param1;
            setMinMax();
            return;
        }// end function

    }
}
