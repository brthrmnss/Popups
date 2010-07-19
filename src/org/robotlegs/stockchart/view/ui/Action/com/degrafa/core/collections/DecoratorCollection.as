package com.degrafa.core.collections
{
    import com.degrafa.decorators.*;

    public class DecoratorCollection extends DegrafaCollection
    {

        public function DecoratorCollection(param1:Array = null, param2:Boolean = false)
        {
            super(IDecorator, param1, param2);
            return;
        }// end function

        public function addItem(param1:IDecorator) : IDecorator
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:IDecorator, param2:Number) : IDecorator
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:IDecorator) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : IDecorator
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : IDecorator
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:IDecorator, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:IDecorator) : IDecorator
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:DecoratorCollection) : DecoratorCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
