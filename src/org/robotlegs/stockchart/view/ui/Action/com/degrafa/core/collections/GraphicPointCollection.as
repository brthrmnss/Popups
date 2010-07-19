package com.degrafa.core.collections
{
    import com.degrafa.*;

    public class GraphicPointCollection extends DegrafaCollection
    {

        public function GraphicPointCollection(param1:Array = null, param2:Boolean = false)
        {
            super(IGraphicPoint, param1, param2);
            return;
        }// end function

        public function addItem(param1:IGraphicPoint) : IGraphicPoint
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:IGraphicPoint, param2:Number) : IGraphicPoint
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:IGraphicPoint) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : IGraphicPoint
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : IGraphicPoint
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:IGraphicPoint, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:IGraphicPoint) : IGraphicPoint
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:GraphicPointCollection) : GraphicPointCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
