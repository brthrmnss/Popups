package com.degrafa.core.collections
{
    import com.degrafa.paint.*;

    public class GradientStopsCollection extends DegrafaCollection
    {

        public function GradientStopsCollection(param1:Array = null, param2:Boolean = false)
        {
            super(GradientStop, param1, param2);
            return;
        }// end function

        public function addItem(param1:GradientStop) : GradientStop
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:GradientStop, param2:Number) : GradientStop
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:GradientStop) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : GradientStop
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : GradientStop
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:GradientStop, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:GradientStop) : GradientStop
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:GradientStopsCollection) : GradientStopsCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
