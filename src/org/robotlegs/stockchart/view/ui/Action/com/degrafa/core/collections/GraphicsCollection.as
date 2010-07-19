package com.degrafa.core.collections
{
    import com.degrafa.*;

    public class GraphicsCollection extends DegrafaCollection
    {

        public function GraphicsCollection(param1:Array = null, param2:Boolean = false)
        {
            super(IGraphic, param1, param2);
            return;
        }// end function

        public function addItem(param1:IGraphic) : IGraphic
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:IGraphic, param2:Number) : IGraphic
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:IGraphic) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : IGraphic
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : IGraphic
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:IGraphic, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:IGraphic) : IGraphic
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:GraphicsCollection) : GraphicsCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
