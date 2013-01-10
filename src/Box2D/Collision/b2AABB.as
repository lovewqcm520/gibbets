package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2AABB extends Object
    {
        public var upperBound:b2Vec2;
        public var lowerBound:b2Vec2;

        public function b2AABB()
        {
            lowerBound = new b2Vec2();
            upperBound = new b2Vec2();
            return;
        }// end function

        public function Contains(param1:b2AABB) : Boolean
        {
            var _loc_2:Boolean = true;
            _loc_2 = _loc_2 && lowerBound.x <= param1.lowerBound.x;
            _loc_2 = _loc_2 && lowerBound.y <= param1.lowerBound.y;
            _loc_2 = _loc_2 && param1.upperBound.x <= upperBound.x;
            _loc_2 = _loc_2 && param1.upperBound.y <= upperBound.y;
            return _loc_2;
        }// end function

        public function RayCast(param1:b2RayCastOutput, param2:b2RayCastInput) : Boolean
        {
            var _loc_11:b2Vec2 = null;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_3:* = -Number.MAX_VALUE;
            var _loc_4:* = Number.MAX_VALUE;
            var _loc_5:* = param2.p1.x;
            var _loc_6:* = param2.p1.y;
            var _loc_7:* = param2.p2.x - param2.p1.x;
            var _loc_8:* = param2.p2.y - param2.p1.y;
            var _loc_9:* = Math.abs(_loc_7);
            var _loc_10:* = Math.abs(_loc_8);
            _loc_11 = param1.normal;
            if (_loc_9 < Number.MIN_VALUE)
            {
                if (_loc_5 < lowerBound.x || upperBound.x < _loc_5)
                {
                    return false;
                }
            }
            else
            {
                _loc_12 = 1 / _loc_7;
                _loc_13 = (lowerBound.x - _loc_5) * _loc_12;
                _loc_14 = (upperBound.x - _loc_5) * _loc_12;
                _loc_16 = -1;
                if (_loc_13 > _loc_14)
                {
                    _loc_15 = _loc_13;
                    _loc_13 = _loc_14;
                    _loc_14 = _loc_15;
                    _loc_16 = 1;
                }
                if (_loc_13 > _loc_3)
                {
                    _loc_11.x = _loc_16;
                    _loc_11.y = 0;
                    _loc_3 = _loc_13;
                }
                _loc_4 = Math.min(_loc_4, _loc_14);
                if (_loc_3 > _loc_4)
                {
                    return false;
                }
            }
            if (_loc_10 < Number.MIN_VALUE)
            {
                if (_loc_6 < lowerBound.y || upperBound.y < _loc_6)
                {
                    return false;
                }
            }
            else
            {
                _loc_12 = 1 / _loc_8;
                _loc_13 = (lowerBound.y - _loc_6) * _loc_12;
                _loc_14 = (upperBound.y - _loc_6) * _loc_12;
                _loc_16 = -1;
                if (_loc_13 > _loc_14)
                {
                    _loc_15 = _loc_13;
                    _loc_13 = _loc_14;
                    _loc_14 = _loc_15;
                    _loc_16 = 1;
                }
                if (_loc_13 > _loc_3)
                {
                    _loc_11.y = _loc_16;
                    _loc_11.x = 0;
                    _loc_3 = _loc_13;
                }
                _loc_4 = Math.min(_loc_4, _loc_14);
                if (_loc_3 > _loc_4)
                {
                    return false;
                }
            }
            param1.fraction = _loc_3;
            return true;
        }// end function

        public function GetCenter() : b2Vec2
        {
            return new b2Vec2((lowerBound.x + upperBound.x) / 2, (lowerBound.y + upperBound.y) / 2);
        }// end function

        public function IsValid() : Boolean
        {
            var _loc_1:* = upperBound.x - lowerBound.x;
            var _loc_2:* = upperBound.y - lowerBound.y;
            var _loc_3:* = _loc_1 >= 0 && _loc_2 >= 0;
            _loc_3 = _loc_3 && lowerBound.IsValid() && upperBound.IsValid();
            return _loc_3;
        }// end function

        public function TestOverlap(param1:b2AABB) : Boolean
        {
            var _loc_2:* = param1.lowerBound.x - upperBound.x;
            var _loc_3:* = param1.lowerBound.y - upperBound.y;
            var _loc_4:* = lowerBound.x - param1.upperBound.x;
            var _loc_5:* = lowerBound.y - param1.upperBound.y;
            if (_loc_2 > 0 || _loc_3 > 0)
            {
                return false;
            }
            if (_loc_4 > 0 || _loc_5 > 0)
            {
                return false;
            }
            return true;
        }// end function

        public function GetExtents() : b2Vec2
        {
            return new b2Vec2((upperBound.x - lowerBound.x) / 2, (upperBound.y - lowerBound.y) / 2);
        }// end function

        public function Combine(param1:b2AABB, param2:b2AABB) : void
        {
            lowerBound.x = Math.min(param1.lowerBound.x, param2.lowerBound.x);
            lowerBound.y = Math.min(param1.lowerBound.y, param2.lowerBound.y);
            upperBound.x = Math.max(param1.upperBound.x, param2.upperBound.x);
            upperBound.y = Math.max(param1.upperBound.y, param2.upperBound.y);
            return;
        }// end function

        public static function Combine(param1:b2AABB, param2:b2AABB) : b2AABB
        {
            var _loc_3:* = new b2AABB;
            _loc_3.Combine(param1, param2);
            return _loc_3;
        }// end function

    }
}
