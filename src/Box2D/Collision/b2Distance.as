package Box2D.Collision
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2Distance extends Object
    {
        private static var b2_gjkIters:int;
        private static var b2_gjkMaxIters:int;
        private static var s_saveB:Array = new Array(3);
        private static var s_simplex:b2Simplex = new b2Simplex();
        private static var b2_gjkCalls:int;
        private static var s_saveA:Array = new Array(3);

        public function b2Distance()
        {
            return;
        }// end function

        public static function Distance(param1:b2DistanceOutput, param2:b2SimplexCache, param3:b2DistanceInput) : void
        {
            var _loc_17:int = 0;
            var _loc_18:b2Vec2 = null;
            var _loc_20:b2Vec2 = null;
            var _loc_21:b2SimplexVertex = null;
            var _loc_22:Boolean = false;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_25:b2Vec2 = null;
            var _loc_27:* = b2_gjkCalls + 1;
            b2_gjkCalls = _loc_27;
            var _loc_4:* = param3.proxyA;
            var _loc_5:* = param3.proxyB;
            var _loc_6:* = param3.transformA;
            var _loc_7:* = param3.transformB;
            var _loc_8:* = s_simplex;
            s_simplex.ReadCache(param2, _loc_4, _loc_6, _loc_5, _loc_7);
            var _loc_9:* = _loc_8.m_vertices;
            var _loc_10:int = 20;
            var _loc_11:* = s_saveA;
            var _loc_12:* = s_saveB;
            var _loc_13:int = 0;
            var _loc_14:* = _loc_8.GetClosestPoint();
            var _loc_15:* = _loc_8.GetClosestPoint().LengthSquared();
            var _loc_16:* = _loc_8.GetClosestPoint().LengthSquared();
            var _loc_19:int = 0;
            while (_loc_19 < _loc_10)
            {
                
                _loc_13 = _loc_8.m_count;
                _loc_17 = 0;
                while (_loc_17 < _loc_13)
                {
                    
                    _loc_11[_loc_17] = _loc_9[_loc_17].indexA;
                    _loc_12[_loc_17] = _loc_9[_loc_17].indexB;
                    _loc_17++;
                }
                switch(_loc_8.m_count)
                {
                    case 1:
                    {
                        break;
                    }
                    case 2:
                    {
                        _loc_8.Solve2();
                        break;
                    }
                    case 3:
                    {
                        _loc_8.Solve3();
                        break;
                    }
                    default:
                    {
                        b2Settings.b2Assert(false);
                        break;
                    }
                }
                if (_loc_8.m_count == 3)
                {
                    break;
                }
                _loc_18 = _loc_8.GetClosestPoint();
                _loc_16 = _loc_18.LengthSquared();
                if (_loc_16 > _loc_15)
                {
                }
                _loc_15 = _loc_16;
                _loc_20 = _loc_8.GetSearchDirection();
                if (_loc_20.LengthSquared() < Number.MIN_VALUE * Number.MIN_VALUE)
                {
                    break;
                }
                _loc_21 = _loc_9[_loc_8.m_count];
                _loc_21.indexA = _loc_4.GetSupport(b2Math.MulTMV(_loc_6.R, _loc_20.GetNegative()));
                _loc_21.wA = b2Math.MulX(_loc_6, _loc_4.GetVertex(_loc_21.indexA));
                _loc_21.indexB = _loc_5.GetSupport(b2Math.MulTMV(_loc_7.R, _loc_20));
                _loc_21.wB = b2Math.MulX(_loc_7, _loc_5.GetVertex(_loc_21.indexB));
                _loc_21.w = b2Math.SubtractVV(_loc_21.wB, _loc_21.wA);
                _loc_19++;
                var _loc_27:* = b2_gjkIters + 1;
                b2_gjkIters = _loc_27;
                _loc_22 = false;
                _loc_17 = 0;
                while (_loc_17 < _loc_13)
                {
                    
                    if (_loc_21.indexA == _loc_11[_loc_17] && _loc_21.indexB == _loc_12[_loc_17])
                    {
                        _loc_22 = true;
                        break;
                    }
                    _loc_17++;
                }
                if (_loc_22)
                {
                    break;
                }
                var _loc_26:* = _loc_8;
                var _loc_27:* = _loc_8.m_count + 1;
                _loc_26.m_count = _loc_27;
            }
            b2_gjkMaxIters = b2Math.Max(b2_gjkMaxIters, _loc_19);
            _loc_8.GetWitnessPoints(param1.pointA, param1.pointB);
            param1.distance = b2Math.SubtractVV(param1.pointA, param1.pointB).Length();
            param1.iterations = _loc_19;
            _loc_8.WriteCache(param2);
            if (param3.useRadii)
            {
                _loc_23 = _loc_4.m_radius;
                _loc_24 = _loc_5.m_radius;
                if (param1.distance > _loc_23 + _loc_24 && param1.distance > Number.MIN_VALUE)
                {
                    param1.distance = param1.distance - (_loc_23 + _loc_24);
                    _loc_25 = b2Math.SubtractVV(param1.pointB, param1.pointA);
                    _loc_25.Normalize();
                    param1.pointA.x = param1.pointA.x + _loc_23 * _loc_25.x;
                    param1.pointA.y = param1.pointA.y + _loc_23 * _loc_25.y;
                    param1.pointB.x = param1.pointB.x - _loc_24 * _loc_25.x;
                    param1.pointB.y = param1.pointB.y - _loc_24 * _loc_25.y;
                }
                else
                {
                    _loc_18 = new b2Vec2();
                    _loc_18.x = 0.5 * (param1.pointA.x + param1.pointB.x);
                    _loc_18.y = 0.5 * (param1.pointA.y + param1.pointB.y);
                    var _loc_26:* = _loc_18.x;
                    param1.pointB.x = _loc_18.x;
                    param1.pointA.x = _loc_26;
                    var _loc_26:* = _loc_18.y;
                    param1.pointB.y = _loc_18.y;
                    param1.pointA.y = _loc_26;
                    param1.distance = 0;
                }
            }
            return;
        }// end function

    }
}
