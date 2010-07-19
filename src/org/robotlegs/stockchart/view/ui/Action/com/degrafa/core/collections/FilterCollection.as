package com.degrafa.core.collections
{
    import flash.filters.*;

    public class FilterCollection extends DegrafaCollection
    {

        public function FilterCollection(param1:Array = null, param2:Boolean = false)
        {
            super(BitmapFilter, param1, param2);
            return;
        }// end function

        public function addItem(param1:BitmapFilter) : BitmapFilter
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:BitmapFilter, param2:Number) : BitmapFilter
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:BitmapFilter) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : BitmapFilter
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : BitmapFilter
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:BitmapFilter, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:BitmapFilter) : BitmapFilter
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:FilterCollection) : FilterCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
