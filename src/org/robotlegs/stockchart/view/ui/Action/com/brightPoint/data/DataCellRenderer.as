package com.brightPoint.data
{
    import mx.controls.*;
    import mx.controls.dataGridClasses.*;

    public class DataCellRenderer extends TextInput
    {

        public function DataCellRenderer()
        {
            this.percentHeight = 100;
            this.percentWidth = 100;
            setStyle("backgroundAlpha", 0);
            setStyle("borderStyle", "none");
            editable = false;
            return;
        }// end function

        override public function set data(param1:Object) : void
        {
            super.data = param1;
            if (param1 != null)
            {
                if (param1 is DataRow)
                {
                    text = param1.cells[DataGridListData(listData).dataField].data;
                }
            }
            super.invalidateDisplayList();
            return;
        }// end function

    }
}
