package com.brightPoint.data
{
    import com.brightPoint.evaluator.*;
    import flash.events.*;
    import flash.utils.*;
    import mx.charts.chartClasses.*;
    import mx.controls.*;
    import mx.controls.dataGridClasses.*;
    import mx.core.*;
    import mx.events.*;
    import mx.utils.*;

    public class DataSet extends Object implements IEventDispatcher
    {
        private var _dataRows:Array;
        private var _headerNameHash:Object;
        private var _headerRow:Array;
        private var _dataColumns:Array;
        private var _expParser:Evaluator;
        private var _currentFilterRow:int;
        private var _csvRawData:String;
        private var _rowCount:int;
        private var _queryCache:Object;
        private var _bindingEventDispatcher:EventDispatcher;
        private var _colCount:int;
        private var _firstRowIsHeader:Boolean = true;
        private var _2000670089nullValues:String = "NA, null";

        public function DataSet(param1:Object = null)
        {
            _queryCache = new Object();
            _bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
            if (param1 is Array)
            {
                this.processArraySource(param1 as Array, true);
            }
            else if (param1 is String)
            {
                this.processCsvSource(param1 as String, true);
            }
            return;
        }// end function

        public function willTrigger(param1:String) : Boolean
        {
            return _bindingEventDispatcher.willTrigger(param1);
        }// end function

        public function get nullValues() : String
        {
            return this._2000670089nullValues;
        }// end function

        public function get header() : Array
        {
            return _headerRow;
        }// end function

        public function processCsvSource(param1:String, param2:Boolean = true, param3:Boolean = true) : void
        {
            createTableFromCsv(param1, param2);
            return;
        }// end function

        public function setDataGrid(param1:DataGrid) : DataGrid
        {
            var _loc_2:DataGridColumn = null;
            var _loc_3:* = new Array();
            var _loc_4:int = 0;
            while (_loc_4 < _colCount)
            {
                
                _loc_2 = new DataGridColumn();
                _loc_2.dataField = String(_loc_4);
                _loc_2.headerText = _headerRow[_loc_4];
                _loc_3.push(_loc_2);
                _loc_4++;
            }
            param1.itemRenderer = new ClassFactory(DataCellRenderer);
            param1.columns = _loc_3;
            param1.dataProvider = _dataRows;
            return param1;
        }// end function

        public function get source() : Array
        {
            return _dataRows;
        }// end function

        public function sort(param1:Array, param2:Object) : void
        {
            var _loc_3:* = new Array();
            var _loc_4:* = new Array();
            var _loc_5:int = 0;
            while (_loc_5 < param1.length)
            {
                
                _loc_3.push(_headerNameHash[param1[_loc_5]].toString());
                if (!(param2 is Array))
                {
                    _loc_4.push(param2);
                }
                else
                {
                    _loc_4 = Array(param2);
                }
                _loc_5++;
            }
            this._dataRows = this.source.sortOn(_loc_3, _loc_4);
            return;
        }// end function

        public function set nullValues(param1:String) : void
        {
            var _loc_2:* = this._2000670089nullValues;
            if (_loc_2 !== param1)
            {
                this._2000670089nullValues = param1;
                this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nullValues", _loc_2, param1));
            }
            return;
        }// end function

        public function createDataGrid() : DataGrid
        {
            var _loc_2:DataGridColumn = null;
            var _loc_1:* = new DataGrid();
            var _loc_3:* = new Array();
            var _loc_4:int = 0;
            while (_loc_4 < _colCount)
            {
                
                _loc_2 = new DataGridColumn();
                _loc_2.dataField = String(_loc_4);
                _loc_2.headerText = _headerRow[_loc_4];
                _loc_3.push(_loc_2);
                _loc_4++;
            }
            _loc_1.percentHeight = 100;
            _loc_1.percentWidth = 100;
            _loc_1.resizableColumns = true;
            _loc_1.itemRenderer = new ClassFactory(DataCellRenderer);
            _loc_1.columns = _loc_3;
            _loc_1.dataProvider = _dataRows;
            return _loc_1;
        }// end function

        public function getMax(param1:String, param2:int = 0) : Number
        {
            var _loc_3:Number = NaN;
            var _loc_5:Array = null;
            var _loc_6:int = 0;
            var _loc_4:* = int(_headerNameHash[param1]);
            for each (_loc_5 in this.source)
            {
                
                _loc_6 = _loc_4;
                while (_loc_6 <= _loc_4 + param2)
                {
                    
                    if (isNaN(_loc_3))
                    {
                        _loc_3 = Number(_loc_5[_loc_6]);
                    }
                    if (Number(_loc_5[_loc_6]) > _loc_3)
                    {
                        _loc_3 = Number(_loc_5[_loc_6]);
                    }
                    _loc_6++;
                }
            }
            return _loc_3;
        }// end function

        private function expressionLookup(param1:String)
        {
            var _loc_2:Object = null;
            if (param1.indexOf("@col") > -1)
            {
                return _dataRows[_currentFilterRow][Number(param1.substr(4))];
            }
            _loc_2 = _dataRows[_currentFilterRow][_headerNameHash[param1]];
            if (isNaN(Number(_loc_2)))
            {
                if (nullValues.indexOf(String(_loc_2)) > -1)
                {
                    return 0;
                }
                return _loc_2;
            }
            else
            {
                return Number(_loc_2);
            }
        }// end function

        public function clearCache() : void
        {
            _queryCache = new Object();
            return;
        }// end function

        private function createTableFromArray(param1:Array, param2:Array = null) : void
        {
            _headerNameHash = new Object();
            _headerRow = new Array();
            var _loc_3:int = 0;
            if (param2 == null)
            {
                param2 = param1[0];
                _loc_3 = 1;
            }
            var _loc_4:int = 0;
            while (_loc_4 < param2.length)
            {
                
                if (_loc_3 == 1)
                {
                    _headerNameHash["@col" + _loc_4] = _loc_4;
                    _headerRow.push("@col" + _loc_4);
                }
                else
                {
                    if (!isNaN(Number(param2[_loc_4])))
                    {
                        param2[_loc_4] = "[" + param2[_loc_4] + "]";
                    }
                    _headerNameHash[param2[_loc_4]] = _loc_4;
                    _headerRow.push(param2[_loc_4]);
                }
                _loc_4++;
            }
            _colCount = _loc_4;
            param1 = param1.splice(_loc_3);
            _rowCount = param1.length;
            _dataRows = param1;
            createColumns();
            return;
        }// end function

        public function getMin(param1:String, param2:int = 0) : Number
        {
            var _loc_3:Number = NaN;
            var _loc_5:Array = null;
            var _loc_6:int = 0;
            var _loc_4:* = int(_headerNameHash[param1]);
            for each (_loc_5 in this.source)
            {
                
                _loc_6 = _loc_4;
                while (_loc_6 <= _loc_4 + param2)
                {
                    
                    if (isNaN(_loc_3))
                    {
                        _loc_3 = Number(_loc_5[_loc_6]);
                    }
                    if (Number(_loc_5[_loc_6]) < _loc_3)
                    {
                        _loc_3 = Number(_loc_5[_loc_6]);
                    }
                    _loc_6++;
                }
            }
            return _loc_3;
        }// end function

        public function get csvSource() : String
        {
            return _csvRawData;
        }// end function

        public function getValue(param1:int, param2:String) : Object
        {
            return this.source[param1][_headerNameHash[param2]];
        }// end function

        public function dispatchEvent(event:Event) : Boolean
        {
            return _bindingEventDispatcher.dispatchEvent(event);
        }// end function

        private function createColumns() : void
        {
            var _loc_2:int = 0;
            _dataColumns = new Array();
            var _loc_1:int = 0;
            while (_loc_1 < _headerRow.length)
            {
                
                _dataColumns[_loc_1] = new Array();
                _loc_2 = 0;
                while (_loc_2 < _dataRows.length)
                {
                    
                    _dataColumns[_loc_1].push(_dataRows[_loc_2][_loc_1]);
                    _loc_2++;
                }
                _loc_1++;
            }
            return;
        }// end function

        public function getUniqueValues(param1:String, param2:Boolean = false) : Array
        {
            var _loc_6:String = null;
            var _loc_7:Object = null;
            var _loc_3:* = new Object();
            var _loc_4:* = new Array();
            var _loc_5:int = 0;
            while (_loc_5 < _dataRows.length)
            {
                
                _loc_6 = String(_dataRows[_loc_5][_headerNameHash[param1]]);
                if (!param2)
                {
                    _loc_6 = _loc_6.toUpperCase();
                }
                if (_loc_3[_loc_6] == null)
                {
                    _loc_3[_loc_6] = 1;
                    _loc_7 = new Object();
                    _loc_7.name = _dataRows[_loc_5][_headerNameHash[param1]];
                    _loc_4.push(_loc_7);
                }
                else
                {
                    var _loc_8:* = _loc_3;
                    var _loc_9:* = _loc_6;
                    var _loc_10:* = _loc_3[_loc_6] + 1;
                    _loc_8[_loc_9] = _loc_10;
                }
                _loc_5++;
            }
            _loc_5 = 0;
            while (_loc_5 < _loc_4.length)
            {
                
                _loc_6 = _loc_4[_loc_5].name;
                if (!param2)
                {
                    _loc_6 = _loc_6.toUpperCase();
                }
                _loc_4[_loc_5].count = _loc_3[_loc_6];
                _loc_5++;
            }
            return _loc_4;
        }// end function

        public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
        {
            _bindingEventDispatcher.removeEventListener(param1, param2, param3);
            return;
        }// end function

        public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
        {
            _bindingEventDispatcher.addEventListener(param1, param2, param3, param4, param5);
            return;
        }// end function

        public function createSeriesSet(param1:int, param2:int, param3:Class, param4:String, param5:Array = null, param6:Array = null) : Array
        {
            var _loc_9:Series = null;
            var _loc_10:int = 0;
            var _loc_7:* = new Array();
            var _loc_8:* = param1;
            while (_loc_8 <= param2)
            {
                
                _loc_9 = new param3;
                _loc_9[param4] = _loc_8;
                if (param6)
                {
                    _loc_10 = 0;
                    while (_loc_10 < param6.length)
                    {
                        
                        _loc_9[String(param6[_loc_10].name)] = param6[_loc_10].value;
                        _loc_10++;
                    }
                }
                if (param5)
                {
                    _loc_10 = 0;
                    while (_loc_10 < param5.length)
                    {
                        
                        if (param5[_loc_10].value is Function)
                        {
                            _loc_9.setStyle(param5[_loc_10].name, param5[_loc_10].value.call(this));
                        }
                        else
                        {
                            _loc_9.setStyle(param5[_loc_10].name, param5[_loc_10].value);
                        }
                        _loc_10++;
                    }
                }
                _loc_9.displayName = header[_loc_8];
                _loc_7.push(_loc_9);
                _loc_8++;
            }
            return _loc_7;
        }// end function

        public function get dataColumns() : Array
        {
            return _dataColumns;
        }// end function

        public function get rowCount() : int
        {
            return _rowCount;
        }// end function

        public function processArraySource(param1:Array, param2:Boolean) : void
        {
            if (param2)
            {
                createTableFromArray(param1.slice(1, param1.length), param1.slice(0, 1)[0]);
            }
            else
            {
                createTableFromArray(param1);
            }
            return;
        }// end function

        private function createTableFromCsv(param1:String, param2:Boolean = true, param3:Boolean = true) : void
        {
            var _loc_14:String = null;
            var _loc_15:RegExp = null;
            var _loc_16:Array = null;
            var _loc_17:int = 0;
            var _loc_18:String = null;
            var _loc_19:RegExp = null;
            var _loc_4:* = getTimer();
            var _loc_5:* = param1;
            var _loc_6:String = "";
            var _loc_7:* = /"[^"]*"/g;
            var _loc_8:* = _loc_5.match(_loc_7);
            var _loc_9:int = 0;
            while (_loc_9 < _loc_8.length)
            {
                
                _loc_14 = _loc_8[_loc_9];
                _loc_15 = /,/g;
                _loc_14 = _loc_14.replace(_loc_15, "&comma;");
                _loc_5 = _loc_5.replace(_loc_8[_loc_9], _loc_14);
                _loc_9++;
            }
            var _loc_10:* = _loc_5.split("\n");
            if (_loc_5.split("\n").length == 1)
            {
                _loc_10 = _loc_5.split("\r\r");
            }
            if (_loc_10.length == 1)
            {
                _loc_10 = _loc_5.split("\r");
            }
            _headerNameHash = new Object();
            _headerRow = new Array();
            var _loc_11:* = _loc_10[0].split(",");
            var _loc_12:int = 0;
            while (_loc_12 < _loc_11.length)
            {
                
                if (param2)
                {
                    if (!isNaN(Number(_loc_11[_loc_12])))
                    {
                        _loc_11[_loc_12] = "[" + _loc_11[_loc_12] + "]";
                    }
                    _loc_11[_loc_12] = StringUtil.trim(_loc_11[_loc_12]);
                    _headerNameHash[_loc_11[_loc_12]] = _loc_12;
                    _headerRow.push(_loc_11[_loc_12]);
                }
                else
                {
                    _headerNameHash["@col" + _loc_12] = _loc_12;
                    _headerRow.push("@col" + _loc_12);
                }
                _loc_12++;
            }
            _colCount = _loc_12;
            var _loc_13:* = param2 ? (1) : (0);
            _dataRows = new Array();
            _loc_12 = _loc_13;
            while (_loc_12 < _loc_10.length)
            {
                
                _loc_16 = _loc_10[_loc_12].split(",");
                if (param3)
                {
                    _loc_17 = 0;
                    while (_loc_17 < _loc_16.length)
                    {
                        
                        _loc_18 = _loc_16[_loc_17];
                        _loc_19 = /\&comma;/g;
                        _loc_18 = _loc_18.replace(_loc_19, ",");
                        if (_loc_18.charAt(0) == "\"")
                        {
                            _loc_18 = _loc_18.substr(1);
                        }
                        if (_loc_18.charAt((_loc_18.length - 1)) == "\"")
                        {
                            _loc_18 = _loc_18.substr(0, (_loc_18.length - 1));
                        }
                        _loc_19 = /\""/g;
                        _loc_18 = _loc_18.replace(_loc_19, "\"");
                        var _loc_20:String = " ";
                        _loc_18 = " ";
                        if (_loc_20)
                        {
                            _loc_18 = "";
                        }
                        _loc_17++;
                    }
                    _loc_6 = _loc_6 + (_loc_18 + ",");
                }
                if (_loc_10[_loc_12].length > _loc_16.length + 2)
                {
                    _loc_6 = _loc_6.substr(0, (_loc_6.length - 1)) + "\n";
                    if (_loc_16.length == _colCount)
                    {
                        _dataRows.push(_loc_16);
                    }
                }
                _loc_12++;
            }
            _rowCount = _loc_12;
            _loc_6 = _loc_10[0] + "\n" + _loc_6.substr(0, _loc_6.length - 3);
            _csvRawData = _loc_6;
            createColumns();
            return;
        }// end function

        public function get colCount() : int
        {
            return _colCount;
        }// end function

        public function hasEventListener(param1:String) : Boolean
        {
            return _bindingEventDispatcher.hasEventListener(param1);
        }// end function

        public function select(param1:String, param2:Boolean = false, param3:String = null, param4:Boolean = false) : DataSet
        {
            var _loc_5:int = 0;
            var _loc_18:Boolean = false;
            var _loc_19:Array = null;
            var _loc_20:int = 0;
            var _loc_21:String = null;
            _loc_5 = getTimer();
            if (param3 == null)
            {
                param3 = param1 + "_" + param2;
            }
            if (_queryCache[param3] != null && !param4)
            {
                return _queryCache[param3];
            }
            var _loc_6:* = new Array();
            var _loc_7:* = new Array();
            _loc_5 = getTimer();
            if (param1.indexOf("WHERE") < 0)
            {
                param1 = param1 + " WHERE 1=1";
            }
            var _loc_8:* = /(?i)SELECT\b(?-i)(.*?)((?i)WHERE(?-i)|$)\b(.*?)$/;
            var _loc_9:* = /(?i)SELECT\b(?-i)(.*?)((?i)WHERE(?-i)|$)\b(.*?)$/.exec(param1);
            if (/(?i)SELECT\b(?-i)(.*?)((?i)WHERE(?-i)|$)\b(.*?)$/.exec(param1) == null)
            {
                throw new Error("Invalid query Syntax");
            }
            var _loc_10:* = _loc_9[1];
            var _loc_11:* = _loc_9[3];
            if (_loc_9[3].length != 0)
            {
                _expParser = new Evaluator(_loc_11, expressionLookup);
            }
            else
            {
                _expParser = null;
            }
            var _loc_12:* = _loc_10;
            var _loc_13:* = _loc_10.split(",").length;
            var _loc_14:int = 0;
            while (_loc_14 < _dataRows.length)
            {
                
                _currentFilterRow = _loc_14;
                _loc_18 = _expParser == null ? (true) : (_expParser.evaluate());
                if (_loc_18)
                {
                    if (_loc_12.indexOf("*") > -1)
                    {
                        if (_loc_7.length == 0)
                        {
                            _loc_7 = _headerRow;
                        }
                        _loc_6.push(_dataRows[_loc_14]);
                    }
                    else
                    {
                        _loc_19 = new Array();
                        _loc_20 = 0;
                        while (_loc_20 < _colCount)
                        {
                            
                            _loc_21 = String(_headerRow[_loc_20]).replace("[", "");
                            _loc_21 = _loc_21.replace("]", "");
                            if (_loc_12.match(_loc_21) != null && _headerRow[_loc_20] != "")
                            {
                                if (_loc_7.length < _loc_13)
                                {
                                    _loc_7.push(_headerRow[_loc_20]);
                                }
                                _loc_19.push(_dataRows[_loc_14][_loc_20]);
                            }
                            _loc_20++;
                        }
                        _loc_6.push(_loc_19);
                    }
                }
                _loc_14++;
            }
            var _loc_15:* = new Array();
            var _loc_16:* = new Array();
            if (param2)
            {
                _loc_14 = 0;
                while (_loc_14 < _loc_7.length)
                {
                    
                    _loc_19 = new Array();
                    _loc_20 = 0;
                    while (_loc_20 < _loc_6.length)
                    {
                        
                        if (_loc_20 == 0)
                        {
                            _loc_19.push(_loc_7[_loc_14]);
                        }
                        _loc_19.push(_loc_6[_loc_20][_loc_14]);
                        _loc_20++;
                    }
                    if (_loc_14 > 0)
                    {
                        _loc_15.push(_loc_19);
                    }
                    else
                    {
                        _loc_16 = _loc_19;
                    }
                    _loc_14++;
                }
                _loc_7 = _loc_16;
                _loc_6 = _loc_15;
            }
            var _loc_17:* = new DataSet();
            new DataSet().createTableFromArray(_loc_6, _loc_7);
            trace("DataSetCollection: elapsed time for selecting data rows =" + (getTimer() - _loc_5).toString());
            _queryCache[param3] = _loc_17;
            return _loc_17;
        }// end function

    }
}
