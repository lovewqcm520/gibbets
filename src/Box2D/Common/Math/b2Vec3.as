package Box2D.Common.Math
{

    public class b2Vec3 extends Object
    {
        public var x:Number;
        public var y:Number;
        public var z:Number;

        public function b2Vec3(param1:Number = 0, param2:Number = 0, param3:Number = 0)
        {
            this.x = param1;
            this.y = param2;
            this.z = param3;
            return;
        }// end function

        public function NegativeSelf() : void
        {
            x = -x;
            y = -y;
            z = -z;
            return;
        }// end function

        public function Set(param1:Number, param2:Number, param3:Number) : void
        {
            this.x = param1;
            this.y = param2;
            this.z = param3;
            return;
        }// end function

        public function Multiply(param1:Number) : void
        {
            x = x * param1;
            y = y * param1;
            z = z * param1;
            return;
        }// end function

        public function Add(param1:b2Vec3) : void
        {
            x = x + param1.x;
            y = y + param1.y;
            z = z + param1.z;
            return;
        }// end function

        public function SetZero() : void
        {
            var _loc_1:Number = 0;
            z = 0;
            var _loc_1:* = _loc_1;
            y = _loc_1;
            x = _loc_1;
            return;
        }// end function

        public function GetNegative() : b2Vec3
        {
            return new b2Vec3(-x, -y, -z);
        }// end function

        public function SetV(param1:b2Vec3) : void
        {
            x = param1.x;
            y = param1.y;
            z = param1.z;
            return;
        }// end function

        public function Copy() : b2Vec3
        {
            return new b2Vec3(x, y, z);
        }// end function

        public function Subtract(param1:b2Vec3) : void
        {
            x = x - param1.x;
            y = y - param1.y;
            z = z - param1.z;
            return;
        }// end function

    }
}
