package Utils
{
    import Box2D.Common.Math.*;
    import flash.geom.*;

    final public class Vector3 extends Object
    {
        public var z:Number;
        public var x:Number;
        public var y:Number;

        public function Vector3(param1:Number, param2:Number, param3:Number)
        {
            this.x = param1;
            this.y = param2;
            this.z = param3;
            return;
        }// end function

        final public function sub(param1:Vector3) : Vector3
        {
            return new Vector3(x - param1.x, y - param1.y, z - param1.z);
        }// end function

        final public function negate() : Vector3
        {
            return new Vector3(-x, -y, -z);
        }// end function

        final public function getAngleWith(param1:Vector3) : Number
        {
            var _loc_2:* = (x * param1.x + y * param1.y) / (length() * param1.length());
            if (_loc_2 > 1)
            {
                _loc_2 = 1;
            }
            if (_loc_2 < -1)
            {
                _loc_2 = -1;
            }
            return Math.acos(_loc_2);
        }// end function

        final public function mul(param1:Number) : Vector3
        {
            return new Vector3(x * param1, y * param1, z * param1);
        }// end function

        final public function get2DRotation() : Number
        {
            var _loc_1:* = 180 * getAngleWith(new Vector3(0, -1, 0)) / Math.PI;
            if (this.x < 0)
            {
                _loc_1 = _loc_1 * -1;
            }
            return _loc_1;
        }// end function

        final public function normalizedCopy() : Vector3
        {
            var _loc_1:* = 1 / length();
            if (_loc_1 != 0)
            {
                return new Vector3(x * _loc_1, y * _loc_1, z * _loc_1);
            }
            return zero();
        }// end function

        final public function normalize() : Vector3
        {
            var _loc_1:* = 1 / length();
            x = x * _loc_1;
            y = y * _loc_1;
            z = z * _loc_1;
            return this;
        }// end function

        final public function crossProduct(param1:Vector3) : Vector3
        {
            return new Vector3(y * param1.z - z * param1.y, z * param1.x - x * param1.z, x * param1.y - y * param1.x);
        }// end function

        public function toPoint() : Point
        {
            return new Point(x, y);
        }// end function

        final public function clone() : Vector3
        {
            return new Vector3(x, y, z);
        }// end function

        final public function add(param1:Vector3) : Vector3
        {
            return new Vector3(x + param1.x, y + param1.y, z + param1.z);
        }// end function

        final public function dotProduct(param1:Vector3) : Number
        {
            return x * param1.x + y * param1.y + z * param1.z;
        }// end function

        final public function isLengthLess(param1:Number) : Boolean
        {
            return squaredLength() < param1 * param1;
        }// end function

        final public function isEqual(param1:Vector3) : Boolean
        {
            return x == param1.x && y == param1.y && z == param1.z;
        }// end function

        final public function toString() : String
        {
            return "v: " + "x=" + x.toFixed(3) + ", " + "y=" + y.toFixed(3) + ", " + "z=" + z.toFixed(3);
        }// end function

        final public function length() : Number
        {
            return Math.sqrt(squaredLength());
        }// end function

        final public function haveNaN() : Boolean
        {
            return isNaN(z) || isNaN(y) || isNaN(z);
        }// end function

        final public function squaredLength() : Number
        {
            return x * x + y * y + z * z;
        }// end function

        final public function killNaN() : void
        {
            if (isNaN(x))
            {
                x = 0;
            }
            if (isNaN(y))
            {
                y = 0;
            }
            if (isNaN(z))
            {
                z = 0;
            }
            return;
        }// end function

        public static function fromb2Vec2(param1:b2Vec2) : Vector3
        {
            return new Vector3(param1.x, param1.y, 0);
        }// end function

        public static function getProjection(param1:Vector3, param2:Vector3) : Vector3
        {
            return param1.mul(param1.dotProduct(param2) / param1.squaredLength());
        }// end function

        public static function fromPoint(param1:Point) : Vector3
        {
            return new Vector3(param1.x, param1.y, 0);
        }// end function

        public static function zero() : Vector3
        {
            return new Vector3(0, 0, 0);
        }// end function

    }
}
