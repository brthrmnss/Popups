package com.degrafa.core.collections
{
    import com.degrafa.core.*;

    public class FillCollection extends DegrafaCollection
    {

        public function FillCollection(param1:Array = null, param2:Boolean = false)
        {
            super(IGraphicsFill, param1, param2);
            return;
        }// end function

        public function addItem(param1:IGraphicsFill) : IGraphicsFill
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:IGraphicsFill, param2:Number) : IGraphicsFill
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:IGraphicsFill) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : IGraphicsFill
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : IGraphicsFill
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:IGraphicsFill, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:IGraphicsFill) : IGraphicsFill
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:FillCollection) : FillCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
