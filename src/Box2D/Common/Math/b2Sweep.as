package Box2D.Common.Math
{

    public class b2Sweep extends Object
    {
        public var localCenter:b2Vec2;
        public var a:Number;
        public var c:b2Vec2;
        public var c0:b2Vec2;
        public var a0:Number;
        public var t0:Number;

        public function b2Sweep()
        {
            localCenter = new b2Vec2();
            c0 = new b2Vec2();
            c = new b2Vec2();
            return;
        }// end function

        public function Advance(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            if (t0 < param1 && 1 - t0 > Number.MIN_VALUE)
            {
                _loc_2 = (param1 - t0) / (1 - t0);
                c0.x = (1 - _loc_2) * c0.x + _loc_2 * c.x;
                c0.y = (1 - _loc_2) * c0.y + _loc_2 * c.y;
                a0 = (1 - _loc_2) * a0 + _loc_2 * a;
                t0 = param1;
            }
            return;
        }// end function

        public function Set(param1:b2Sweep) : void
        {
            localCenter.SetV(param1.localCenter);
            c0.SetV(param1.c0);
            c.SetV(param1.c);
            a0 = param1.a0;
            a = param1.a;
            t0 = param1.t0;
            return;
        }// end function

        public function Copy() : b2Sweep
        {
            var _loc_1:* = new b2Sweep();
            _loc_1.localCenter.SetV(localCenter);
            _loc_1.c0.SetV(c0);
            _loc_1.c.SetV(c);
            _loc_1.a0 = a0;
            _loc_1.a = a;
            _loc_1.t0 = t0;
            return _loc_1;
        }// end function

        public function GetTransform(param1:b2Transform, param2:Number) : void
        {
            param1.position.x = (1 - param2) * c0.x + param2 * c.x;
            param1.position.y = (1 - param2) * c0.y + param2 * c.y;
            var _loc_3:* = (1 - param2) * a0 + param2 * a;
            param1.R.Set(_loc_3);
            var _loc_4:* = param1.R;
            param1.position.x = param1.position.x - (_loc_4.col1.x * localCenter.x + _loc_4.col2.x * localCenter.y);
            param1.position.y = param1.position.y - (_loc_4.col1.y * localCenter.x + _loc_4.col2.y * localCenter.y);
            return;
        }// end function

    }
}
