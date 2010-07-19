package com.degrafa.core.collections
{
    import mx.collections.*;

    public class DegrafaCursor extends Object
    {
        public var currentIndex:int;
        public var source:Array;
        static const BEFORE_FIRST_INDEX:int = -1;
        static const AFTER_LAST_INDEX:int = -2;

        public function DegrafaCursor(param1:Array)
        {
            this.source = param1;
            currentIndex = BEFORE_FIRST_INDEX;
            return;
        }// end function

        public function insert(param1) : void
        {
            var _loc_2:int = 0;
            if (afterLast || beforeFirst)
            {
                source.push(param1);
            }
            else
            {
                source.splice(currentIndex, 0, param1);
            }
            return;
        }// end function

        public function get afterLast() : Boolean
        {
            return currentIndex == AFTER_LAST_INDEX || source.length == 0;
        }// end function

        public function moveNext() : Boolean
        {
            if (afterLast)
            {
                return false;
            }
            var _loc_1:* = beforeFirst ? (0) : ((currentIndex + 1));
            if (_loc_1 >= source.length)
            {
                _loc_1 = AFTER_LAST_INDEX;
            }
            currentIndex = _loc_1;
            return !afterLast;
        }// end function

        public function moveLast() : void
        {
            currentIndex = source.length;
            return;
        }// end function

        public function movePrevious() : Boolean
        {
            if (beforeFirst)
            {
                return false;
            }
            var _loc_1:* = afterLast ? ((source.length - 1)) : ((currentIndex - 1));
            currentIndex = _loc_1;
            return !beforeFirst;
        }// end function

        public function get beforeFirst() : Boolean
        {
            return currentIndex == BEFORE_FIRST_INDEX || source.length == 0;
        }// end function

        public function get nextObject()
        {
            if (afterLast)
            {
                return null;
            }
            var _loc_1:* = beforeFirst ? (0) : ((currentIndex + 1));
            if (_loc_1 >= source.length)
            {
                return null;
            }
            return source[_loc_1];
        }// end function

        public function remove()
        {
            var _loc_1:* = source[currentIndex];
            source = source.splice(currentIndex, 1);
            return _loc_1;
        }// end function

        public function get current()
        {
            if (currentIndex > BEFORE_FIRST_INDEX)
            {
                return source[currentIndex];
            }
            return null;
        }// end function

        public function seek(param1:CursorBookmark, param2:int = 0) : void
        {
            if (source.length == 0)
            {
                currentIndex = AFTER_LAST_INDEX;
                return;
            }
            var _loc_3:* = currentIndex;
            if (param1 == CursorBookmark.FIRST)
            {
                _loc_3 = 0;
            }
            else if (param1 == CursorBookmark.LAST)
            {
                _loc_3 = source.length - 1;
            }
            _loc_3 = _loc_3 + param2;
            if (_loc_3 >= source.length)
            {
                currentIndex = AFTER_LAST_INDEX;
            }
            else if (_loc_3 < 0)
            {
                currentIndex = BEFORE_FIRST_INDEX;
            }
            else
            {
                currentIndex = _loc_3;
            }
            return;
        }// end function

        public function get previousObject()
        {
            if (beforeFirst)
            {
                return null;
            }
            var _loc_1:* = afterLast ? ((source.length - 1)) : ((currentIndex - 1));
            if (_loc_1 == BEFORE_FIRST_INDEX)
            {
                return null;
            }
            return source[_loc_1];
        }// end function

        public function moveFirst() : void
        {
            currentIndex = BEFORE_FIRST_INDEX;
            return;
        }// end function

    }
}
