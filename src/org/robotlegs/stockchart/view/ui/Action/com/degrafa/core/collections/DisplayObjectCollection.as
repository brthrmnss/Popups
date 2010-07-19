package com.degrafa.core.collections
{
    import flash.display.*;

    public class DisplayObjectCollection extends DegrafaCollection
    {

        public function DisplayObjectCollection(param1:Array = null, param2:Boolean = false)
        {
            super(DisplayObject, param1, param2);
            return;
        }// end function

        public function addItem(param1:DisplayObject) : DisplayObject
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:DisplayObject, param2:Number) : DisplayObject
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:DisplayObject) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : DisplayObject
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : DisplayObject
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:DisplayObject, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:DisplayObject) : DisplayObject
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:DisplayObjectCollection) : DisplayObjectCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
