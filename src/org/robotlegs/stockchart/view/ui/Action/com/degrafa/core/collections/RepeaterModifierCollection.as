package com.degrafa.core.collections
{
    import com.degrafa.repeaters.*;

    public class RepeaterModifierCollection extends DegrafaCollection
    {

        public function RepeaterModifierCollection(param1:Array = null, param2:Boolean = false)
        {
            super(IRepeaterModifier, param1, param2);
            return;
        }// end function

        public function addItem(param1:IRepeaterModifier) : IRepeaterModifier
        {
            return super._addItem(param1);
        }// end function

        public function addItemAt(param1:IRepeaterModifier, param2:Number) : IRepeaterModifier
        {
            return super._addItemAt(param1, param2);
        }// end function

        public function getItemIndex(param1:IRepeaterModifier) : int
        {
            return super._getItemIndex(param1);
        }// end function

        public function removeItemAt(param1:Number) : IRepeaterModifier
        {
            return super._removeItemAt(param1);
        }// end function

        public function getItemAt(param1:Number) : IRepeaterModifier
        {
            return super._getItemAt(param1);
        }// end function

        public function setItemIndex(param1:IRepeaterModifier, param2:Number) : Boolean
        {
            return super._setItemIndex(param1, param2);
        }// end function

        public function removeItem(param1:IRepeaterModifier) : IRepeaterModifier
        {
            return super._removeItem(param1);
        }// end function

        public function addItems(param1:RepeaterModifierCollection) : RepeaterModifierCollection
        {
            super.concat(param1.items);
            return this;
        }// end function

    }
}
