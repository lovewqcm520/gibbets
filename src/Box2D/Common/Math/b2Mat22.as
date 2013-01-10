package Box2D.Common.Math
{

    public class b2Mat22 extends Object
    {
        public var col1:b2Vec2;
        public var col2:b2Vec2;

        public function b2Mat22()
        {
            col1 = new b2Vec2();
            col2 = new b2Vec2();
            var _loc_1:int = 1;
            col2.y = 1;
            col1.x = _loc_1;
            return;
        }// end function

        public function SetIdentity() : void
        {
            col1.x = 1;
            col2.x = 0;
            col1.y = 0;
            col2.y = 1;
            return;
        }// end function

        public function SetVV(param1:b2Vec2, param2:b2Vec2) : void
        {
            col1.SetV(param1);
            col2.SetV(param2);
            return;
        }// end function

        public function Set(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            _loc_2 = Math.cos(param1);
            var _loc_3:* = Math.sin(param1);
            col1.x = _loc_2;
            col2.x = -_loc_3;
            col1.y = _loc_3;
            col2.y = _loc_2;
            return;
        }// end function

        public function SetZero() : void
        {
            col1.x = 0;
            col2.x = 0;
            col1.y = 0;
            col2.y = 0;
            return;
        }// end function

        public function SetM(param1:b2Mat22) : void
        {
            col1.SetV(param1.col1);
            col2.SetV(param1.col2);
            return;
        }// end function

        public function AddM(param1:b2Mat22) : void
        {
            col1.x = col1.x + param1.col1.x;
            col1.y = col1.y + param1.col1.y;
            col2.x = col2.x + param1.col2.x;
            col2.y = col2.y + param1.col2.y;
            return;
        }// end function

        public function Abs() : void
        {
            col1.Abs();
            col2.Abs();
            return;
        }// end function

        public function Copy() : b2Mat22
        {
            var _loc_1:* = new b2Mat22();
            _loc_1.SetM(this);
            return _loc_1;
        }// end function

        public function GetInverse(param1:b2Mat22) : b2Mat22
        {
            var _loc_3:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_2:* = col1.x;
            _loc_3 = col2.x;
            var _loc_4:* = col1.y;
            var _loc_5:* = col2.y;
            _loc_6 = _loc_2 * _loc_5 - _loc_3 * _loc_4;
            if (_loc_6 != 0)
            {
                _loc_6 = 1 / _loc_6;
            }
            param1.col1.x = _loc_6 * _loc_5;
            param1.col2.x = (-_loc_6) * _loc_3;
            param1.col1.y = (-_loc_6) * _loc_4;
            param1.col2.y = _loc_6 * _loc_2;
            return param1;
        }// end function

        public function GetAngle() : Number
        {
            return Math.atan2(col1.y, col1.x);
        }// end function

        public function Solve(param1:b2Vec2, param2:Number, param3:Number) : b2Vec2
        {
            var _loc_4:* = col1.x;
            var _loc_5:* = col2.x;
            var _loc_6:* = col1.y;
            var _loc_7:* = col2.y;
            var _loc_8:* = _loc_4 * _loc_7 - _loc_5 * _loc_6;
            if (_loc_4 * _loc_7 - _loc_5 * _loc_6 != 0)
            {
                _loc_8 = 1 / _loc_8;
            }
            param1.x = _loc_8 * (_loc_7 * param2 - _loc_5 * param3);
            param1.y = _loc_8 * (_loc_4 * param3 - _loc_6 * param2);
            return param1;
        }// end function

        public static function FromAngle(param1:Number) : b2Mat22
        {
            var _loc_2:* = new b2Mat22;
            _loc_2.Set(param1);
            return _loc_2;
        }// end function

        public static function FromVV(param1:b2Vec2, param2:b2Vec2) : b2Mat22
        {
            var _loc_3:* = new b2Mat22;
            _loc_3.SetVV(param1, param2);
            return _loc_3;
        }// end function

    }
}
