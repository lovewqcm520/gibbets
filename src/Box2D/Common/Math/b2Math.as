package Box2D.Common.Math
{

    public class b2Math extends Object
    {
        public static const b2Transform_identity:b2Transform = new b2Transform(b2Vec2_zero, b2Mat22_identity);
        public static const b2Mat22_identity:b2Mat22 = b2Mat22.FromVV(new b2Vec2(1, 0), new b2Vec2(0, 1));
        public static const b2Vec2_zero:b2Vec2 = new b2Vec2(0, 0);

        public function b2Math()
        {
            return;
        }// end function

        public static function AddVV(param1:b2Vec2, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(param1.x + param2.x, param1.y + param2.y);
            return _loc_3;
        }// end function

        public static function AbsM(param1:b2Mat22) : b2Mat22
        {
            var _loc_2:* = b2Mat22.FromVV(AbsV(param1.col1), AbsV(param1.col2));
            return _loc_2;
        }// end function

        public static function SubtractVV(param1:b2Vec2, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(param1.x - param2.x, param1.y - param2.y);
            return _loc_3;
        }// end function

        public static function MulMM(param1:b2Mat22, param2:b2Mat22) : b2Mat22
        {
            var _loc_3:* = b2Mat22.FromVV(MulMV(param1, param2.col1), MulMV(param1, param2.col2));
            return _loc_3;
        }// end function

        public static function NextPowerOfTwo(param1:uint) : uint
        {
            param1 = param1 | param1 >> 1 & 2147483647;
            param1 = param1 | param1 >> 2 & 1073741823;
            param1 = param1 | param1 >> 4 & 268435455;
            param1 = param1 | param1 >> 8 & 16777215;
            param1 = param1 | param1 >> 16 & 65535;
            return (param1 + 1);
        }// end function

        public static function Max(param1:Number, param2:Number) : Number
        {
            return param1 > param2 ? (param1) : (param2);
        }// end function

        public static function MulMV(param1:b2Mat22, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(param1.col1.x * param2.x + param1.col2.x * param2.y, param1.col1.y * param2.x + param1.col2.y * param2.y);
            return _loc_3;
        }// end function

        public static function CrossVF(param1:b2Vec2, param2:Number) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(param2 * param1.y, (-param2) * param1.x);
            return _loc_3;
        }// end function

        public static function MaxV(param1:b2Vec2, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(Max(param1.x, param2.x), Max(param1.y, param2.y));
            return _loc_3;
        }// end function

        public static function AbsV(param1:b2Vec2) : b2Vec2
        {
            var _loc_2:* = new b2Vec2(Abs(param1.x), Abs(param1.y));
            return _loc_2;
        }// end function

        public static function Distance(param1:b2Vec2, param2:b2Vec2) : Number
        {
            var _loc_3:* = param1.x - param2.x;
            var _loc_4:* = param1.y - param2.y;
            return Math.sqrt(_loc_3 * _loc_3 + _loc_4 * _loc_4);
        }// end function

        public static function MulTMM(param1:b2Mat22, param2:b2Mat22) : b2Mat22
        {
            var _loc_3:* = new b2Vec2(Dot(param1.col1, param2.col1), Dot(param1.col2, param2.col1));
            var _loc_4:* = new b2Vec2(Dot(param1.col1, param2.col2), Dot(param1.col2, param2.col2));
            var _loc_5:* = b2Mat22.FromVV(_loc_3, _loc_4);
            return b2Mat22.FromVV(_loc_3, _loc_4);
        }// end function

        public static function DistanceSquared(param1:b2Vec2, param2:b2Vec2) : Number
        {
            var _loc_3:* = param1.x - param2.x;
            var _loc_4:* = param1.y - param2.y;
            return _loc_3 * _loc_3 + _loc_4 * _loc_4;
        }// end function

        public static function RandomRange(param1:Number, param2:Number) : Number
        {
            var _loc_3:* = Math.random();
            _loc_3 = (param2 - param1) * _loc_3 + param1;
            return _loc_3;
        }// end function

        public static function Clamp(param1:Number, param2:Number, param3:Number) : Number
        {
            return param1 < param2 ? (param2) : (param1 > param3 ? (param3) : (param1));
        }// end function

        public static function MulXT(param1:b2Transform, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:b2Vec2 = null;
            var _loc_4:Number = NaN;
            _loc_3 = SubtractVV(param2, param1.position);
            _loc_4 = _loc_3.x * param1.R.col1.x + _loc_3.y * param1.R.col1.y;
            _loc_3.y = _loc_3.x * param1.R.col2.x + _loc_3.y * param1.R.col2.y;
            _loc_3.x = _loc_4;
            return _loc_3;
        }// end function

        public static function AddMM(param1:b2Mat22, param2:b2Mat22) : b2Mat22
        {
            var _loc_3:* = b2Mat22.FromVV(AddVV(param1.col1, param2.col1), AddVV(param1.col2, param2.col2));
            return _loc_3;
        }// end function

        public static function Random() : Number
        {
            return Math.random() * 2 - 1;
        }// end function

        public static function MinV(param1:b2Vec2, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(Min(param1.x, param2.x), Min(param1.y, param2.y));
            return _loc_3;
        }// end function

        public static function CrossVV(param1:b2Vec2, param2:b2Vec2) : Number
        {
            return param1.x * param2.y - param1.y * param2.x;
        }// end function

        public static function MulTMV(param1:b2Mat22, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(Dot(param2, param1.col1), Dot(param2, param1.col2));
            return _loc_3;
        }// end function

        public static function Dot(param1:b2Vec2, param2:b2Vec2) : Number
        {
            return param1.x * param2.x + param1.y * param2.y;
        }// end function

        public static function Abs(param1:Number) : Number
        {
            return param1 > 0 ? (param1) : (-param1);
        }// end function

        public static function CrossFV(param1:Number, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2((-param1) * param2.y, param1 * param2.x);
            return _loc_3;
        }// end function

        public static function Min(param1:Number, param2:Number) : Number
        {
            return param1 < param2 ? (param1) : (param2);
        }// end function

        public static function ClampV(param1:b2Vec2, param2:b2Vec2, param3:b2Vec2) : b2Vec2
        {
            return MaxV(param2, MinV(param1, param3));
        }// end function

        public static function MulFV(param1:Number, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:* = new b2Vec2(param1 * param2.x, param1 * param2.y);
            return _loc_3;
        }// end function

        public static function Swap(param1:Array, param2:Array) : void
        {
            var _loc_3:* = param1[0];
            param1[0] = param2[0];
            param2[0] = _loc_3;
            return;
        }// end function

        public static function MulX(param1:b2Transform, param2:b2Vec2) : b2Vec2
        {
            var _loc_3:b2Vec2 = null;
            _loc_3 = MulMV(param1.R, param2);
            _loc_3.x = _loc_3.x + param1.position.x;
            _loc_3.y = _loc_3.y + param1.position.y;
            return _loc_3;
        }// end function

        public static function IsPowerOfTwo(param1:uint) : Boolean
        {
            var _loc_2:* = param1 > 0 && (param1 & (param1 - 1)) == 0;
            return _loc_2;
        }// end function

        public static function IsValid(param1:Number) : Boolean
        {
            return isFinite(param1);
        }// end function

    }
}
