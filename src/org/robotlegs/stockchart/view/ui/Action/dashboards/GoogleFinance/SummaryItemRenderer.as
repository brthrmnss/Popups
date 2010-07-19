package dashboards.GoogleFinance
{
    import com.brightPoint.microCharts.*;
    import flash.events.*;
    import mx.containers.*;
    import mx.controls.*;
    import mx.core.*;
    import mx.events.*;
    import mx.styles.*;

    public class SummaryItemRenderer extends HBox
    {
        private var _94623710chart:MicroAreaChart;
        private var _data:Object;
        private var _1274708362field0:Label;
        private var currentBorderSkin:Class;
        private var _1361632236chart2:MicroColumnChart;
        private var overSkin:Class;
        private var _documentDescriptor_:UIComponentDescriptor;

        public function SummaryItemRenderer()
        {
            _documentDescriptor_ = new UIComponentDescriptor({type:HBox, propertiesFactory:function () : Object
            {
                return {height:25, childDescriptors:[new UIComponentDescriptor({type:Label, id:"field0", propertiesFactory:function () : Object
                {
                    return {width:150};
                }// end function
                }), new UIComponentDescriptor({type:MicroAreaChart, id:"chart", propertiesFactory:function () : Object
                {
                    return {width:60, height:15};
                }// end function
                }), new UIComponentDescriptor({type:MicroColumnChart, id:"chart2", propertiesFactory:function () : Object
                {
                    return {width:50, height:15};
                }// end function
                })]};
            }// end function
            });
            mx_internal::_document = this;
            if (!this.styleDeclaration)
            {
                this.styleDeclaration = new CSSStyleDeclaration();
            }
            this.styleDeclaration.defaultFactory = function () : void
            {
                this.paddingTop = 5;
                this.paddingLeft = 5;
                this.cornerRadius = 3;
                return;
            }// end function
            ;
            this.percentWidth = 100;
            this.height = 25;
            this.horizontalScrollPolicy = "off";
            this.verticalScrollPolicy = "off";
            this.addEventListener("mouseOver", ___SummaryItemRenderer_HBox1_mouseOver);
            this.addEventListener("mouseOut", ___SummaryItemRenderer_HBox1_mouseOut);
            return;
        }// end function

        public function get chart2() : MicroColumnChart
        {
            return this._1361632236chart2;
        }// end function

        public function ___SummaryItemRenderer_HBox1_mouseOver(event:MouseEvent) : void
        {
            onMouseOver(event);
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            _data = param1;
            if (field0 == null || param1 == null)
            {
                return;
            }
            field0.htmlText = _data[5];
            chart.dataProvider = _data.slice(6, 11);
            chart2.dataProvider = _data.slice(1, 5);
            return;
        }// end function

        override public function initialize() : void
        {
            .mx_internal::setDocumentDescriptor(_documentDescriptor_);
            super.initialize();
            return;
        }// end function

        public function ___SummaryItemRenderer_HBox1_mouseOut(event:MouseEvent) : void
        {
            onMouseOut(event);
            return;
        }// end function

        public function get chart() : MicroAreaChart
        {
            return this._94623710chart;
        }// end function

        private function onMouseOut(event:Event) : void
        {
            if (currentBorderSkin)
            {
                this.setStyle("borderSkin", currentBorderSkin);
            }
            return;
        }// end function

        override public function get data() : Object
        {
            return _data;
        }// end function

        public function set chart2(param1:MicroColumnChart) : void
        {
            var _loc_2:* = this._1361632236chart2;
            if (_loc_2 !== param1)
            {
                this._1361632236chart2 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chart2", _loc_2, param1));
            }
            return;
        }// end function

        private function onMouseOver(event:Event) : void
        {
            currentBorderSkin = this.getStyle("borderSkin");
            overSkin = this.getStyle("overSkin");
            if (overSkin && this.getStyle("borderSkin") != overSkin)
            {
                this.setStyle("borderSkin", overSkin);
            }
            return;
        }// end function

        public function set field0(param1:Label) : void
        {
            var _loc_2:* = this._1274708362field0;
            if (_loc_2 !== param1)
            {
                this._1274708362field0 = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "field0", _loc_2, param1));
            }
            return;
        }// end function

        public function set chart(param1:MicroAreaChart) : void
        {
            var _loc_2:* = this._94623710chart;
            if (_loc_2 !== param1)
            {
                this._94623710chart = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chart", _loc_2, param1));
            }
            return;
        }// end function

        public function get field0() : Label
        {
            return this._1274708362field0;
        }// end function

    }
}
