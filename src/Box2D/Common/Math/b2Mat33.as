package Box2D.Common.Math
{

    public class b2Mat33 extends Object
    {
        public var col1:b2Vec3;
        public var col2:b2Vec3;
        public var col3:b2Vec3;

        public function b2Mat33(param1:b2Vec3 = null, param2:b2Vec3 = null, param3:b2Vec3 = null)
        {
            col1 = new b2Vec3();
            col2 = new b2Vec3();
            col3 = new b2Vec3();
            if (!param1 && !param2 && !param3)
            {
                col1.SetZero();
                col2.SetZero();
                col3.SetZero();
            }
            else
            {
                col1.SetV(param1);
                col2.SetV(param2);
                col3.SetV(param3);
            }
            return;
        }// end function

        public function SetIdentity() : void
        {
            col1.x = 1;
            col2.x = 0;
            col3.x = 0;
            col1.y = 0;
            col2.y = 1;
            col3.y = 0;
            col1.z = 0;
            col2.z = 0;
            col3.z = 1;
            return;
        }// end function

        public function Solve22(param1:b2Vec2, param2:Number, param3:Number) : b2Vec2
        {
            var _loc_4:Number = NaN;
            var _loc_6:Number = NaN;
            _loc_4 = col1.x;
            var _loc_5:* = col2.x;
            _loc_6 = col1.y;
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

        public function SetZero() : void
        {
            col1.x = 0;
            col2.x = 0;
            col3.x = 0;
            col1.y = 0;
            col2.y = 0;
            col3.y = 0;
            col1.z = 0;
            col2.z = 0;
            col3.z = 0;
            return;
        }// end function

        public function SetM(param1:b2Mat33) : void
        {
            col1.SetV(param1.col1);
            col2.SetV(param1.col2);
            col3.SetV(param1.col3);
            return;
        }// end function

        public function AddM(param1:b2Mat33) : void
        {
            col1.x = col1.x + param1.col1.x;
            col1.y = col1.y + param1.col1.y;
            col1.z = col1.z + param1.col1.z;
            col2.x = col2.x + param1.col2.x;
            col2.y = col2.y + param1.col2.y;
            col2.z = col2.z + param1.col2.z;
            col3.x = col3.x + param1.col3.x;
            col3.y = col3.y + param1.col3.y;
            col3.z = col3.z + param1.col3.z;
            return;
        }// end function

        public function SetVVV(param1:b2Vec3, param2:b2Vec3, param3:b2Vec3) : void
        {
            col1.SetV(param1);
            col2.SetV(param2);
            col3.SetV(param3);
            return;
        }// end function

        public function Copy() : b2Mat33
        {
            return new b2Mat33(col1, col2, col3);
        }// end function

        public function Solve33(param1:b2Vec3, param2:Number, param3:Number, param4:Number) : b2Vec3
        {
            var _loc_5:* = col1.x;
            var _loc_6:* = col1.y;
            var _loc_7:* = col1.z;
            var _loc_8:* = col2.x;
            var _loc_9:* = col2.y;
            var _loc_10:* = col2.z;
            var _loc_11:* = col3.x;
            var _loc_12:* = col3.y;
            var _loc_13:* = col3.z;
            var _loc_14:* = _loc_5 * (_loc_9 * _loc_13 - _loc_10 * _loc_12) + _loc_6 * (_loc_10 * _loc_11 - _loc_8 * _loc_13) + _loc_7 * (_loc_8 * _loc_12 - _loc_9 * _loc_11);
            if (_loc_5 * (_loc_9 * _loc_13 - _loc_10 * _loc_12) + _loc_6 * (_loc_10 * _loc_11 - _loc_8 * _loc_13) + _loc_7 * (_loc_8 * _loc_12 - _loc_9 * _loc_11) != 0)
            {
                _loc_14 = 1 / _loc_14;
            }
            param1.x = _loc_14 * (param2 * (_loc_9 * _loc_13 - _loc_10 * _loc_12) + param3 * (_loc_10 * _loc_11 - _loc_8 * _loc_13) + param4 * (_loc_8 * _loc_12 - _loc_9 * _loc_11));
            param1.y = _loc_14 * (_loc_5 * (param3 * _loc_13 - param4 * _loc_12) + _loc_6 * (param4 * _loc_11 - param2 * _loc_13) + _loc_7 * (param2 * _loc_12 - param3 * _loc_11));
            param1.z = _loc_14 * (_loc_5 * (_loc_9 * param4 - _loc_10 * param3) + _loc_6 * (_loc_10 * param2 - _loc_8 * param4) + _loc_7 * (_loc_8 * param3 - _loc_9 * param2));
            return param1;
        }// end function

    }
}
