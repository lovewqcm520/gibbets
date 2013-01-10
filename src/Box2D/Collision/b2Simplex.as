package Box2D.Collision
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    class b2Simplex extends Object
    {
        public var m_v1:b2SimplexVertex;
        public var m_v2:b2SimplexVertex;
        public var m_v3:b2SimplexVertex;
        public var m_vertices:Array;
        public var m_count:int;

        function b2Simplex()
        {
            m_v1 = new b2SimplexVertex();
            m_v2 = new b2SimplexVertex();
            m_v3 = new b2SimplexVertex();
            m_vertices = new Array(3);
            m_vertices[0] = m_v1;
            m_vertices[1] = m_v2;
            m_vertices[2] = m_v3;
            return;
        }// end function

        public function GetSearchDirection() : b2Vec2
        {
            var _loc_1:b2Vec2 = null;
            var _loc_2:Number = NaN;
            switch(m_count)
            {
                case 1:
                {
                    return m_v1.w.GetNegative();
                }
                case 2:
                {
                    _loc_1 = b2Math.SubtractVV(m_v2.w, m_v1.w);
                    _loc_2 = b2Math.CrossVV(_loc_1, m_v1.w.GetNegative());
                    if (_loc_2 > 0)
                    {
                        return b2Math.CrossFV(1, _loc_1);
                    }
                    return b2Math.CrossVF(_loc_1, 1);
                }
                default:
                {
                    b2Settings.b2Assert(false);
                    return new b2Vec2();
                    break;
                }
            }
        }// end function

        public function WriteCache(param1:b2SimplexCache) : void
        {
            param1.metric = GetMetric();
            param1.count = uint(m_count);
            var _loc_2:* = m_vertices;
            var _loc_3:int = 0;
            while (_loc_3 < m_count)
            {
                
                param1.indexA[_loc_3] = uint(_loc_2[_loc_3].indexA);
                param1.indexB[_loc_3] = uint(_loc_2[_loc_3].indexB);
                _loc_3++;
            }
            return;
        }// end function

        public function GetMetric() : Number
        {
            switch(m_count)
            {
                case 0:
                {
                    b2Settings.b2Assert(false);
                    return 0;
                }
                case 1:
                {
                    return 0;
                }
                case 2:
                {
                    return b2Math.SubtractVV(m_v1.w, m_v2.w).Length();
                }
                case 3:
                {
                    return b2Math.CrossVV(b2Math.SubtractVV(m_v2.w, m_v1.w), b2Math.SubtractVV(m_v3.w, m_v1.w));
                }
                default:
                {
                    b2Settings.b2Assert(false);
                    return 0;
                    break;
                }
            }
        }// end function

        public function ReadCache(param1:b2SimplexCache, param2:b2DistanceProxy, param3:b2Transform, param4:b2DistanceProxy, param5:b2Transform) : void
        {
            var _loc_6:b2Vec2 = null;
            var _loc_7:b2Vec2 = null;
            var _loc_10:b2SimplexVertex = null;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            b2Settings.b2Assert(param1.count >= 0 && param1.count <= 3);
            m_count = param1.count;
            var _loc_8:* = m_vertices;
            var _loc_9:int = 0;
            while (_loc_9 < m_count)
            {
                
                _loc_10 = _loc_8[_loc_9];
                _loc_10.indexA = param1.indexA[_loc_9];
                _loc_10.indexB = param1.indexB[_loc_9];
                _loc_6 = param2.GetVertex(_loc_10.indexA);
                _loc_7 = param4.GetVertex(_loc_10.indexB);
                _loc_10.wA = b2Math.MulX(param3, _loc_6);
                _loc_10.wB = b2Math.MulX(param5, _loc_6);
                _loc_10.w = b2Math.SubtractVV(_loc_10.wB, _loc_10.wA);
                _loc_10.a = 0;
                _loc_9++;
            }
            if (m_count > 1)
            {
                _loc_11 = param1.metric;
                _loc_12 = GetMetric();
                if (_loc_12 < 0.5 * _loc_11 || 2 * _loc_11 < _loc_12 || _loc_12 < Number.MIN_VALUE)
                {
                    m_count = 0;
                }
            }
            if (m_count == 0)
            {
                _loc_10 = _loc_8[0];
                _loc_10.indexA = 0;
                _loc_10.indexB = 0;
                _loc_6 = param2.GetVertex(0);
                _loc_7 = param4.GetVertex(0);
                _loc_10.wA = b2Math.MulX(param3, _loc_6);
                _loc_10.wB = b2Math.MulX(param5, _loc_7);
                _loc_10.w = b2Math.SubtractVV(_loc_10.wB, _loc_10.wA);
                m_count = 1;
            }
            return;
        }// end function

        public function GetWitnessPoints(param1:b2Vec2, param2:b2Vec2) : void
        {
            switch(m_count)
            {
                case 0:
                {
                    b2Settings.b2Assert(false);
                    break;
                }
                case 1:
                {
                    param1.SetV(m_v1.wA);
                    param2.SetV(m_v1.wB);
                    break;
                }
                case 2:
                {
                    param1.x = m_v1.a * m_v1.wA.x + m_v2.a * m_v2.wA.x;
                    param1.y = m_v1.a * m_v1.wA.y + m_v2.a * m_v2.wA.y;
                    param2.x = m_v1.a * m_v1.wB.x + m_v2.a * m_v2.wB.x;
                    param2.y = m_v1.a * m_v1.wB.y + m_v2.a * m_v2.wB.y;
                    break;
                }
                case 3:
                {
                    var _loc_3:* = m_v1.a * m_v1.wA.x + m_v2.a * m_v2.wA.x + m_v3.a * m_v3.wA.x;
                    param1.x = m_v1.a * m_v1.wA.x + m_v2.a * m_v2.wA.x + m_v3.a * m_v3.wA.x;
                    param2.x = _loc_3;
                    var _loc_3:* = m_v1.a * m_v1.wA.y + m_v2.a * m_v2.wA.y + m_v3.a * m_v3.wA.y;
                    param1.y = m_v1.a * m_v1.wA.y + m_v2.a * m_v2.wA.y + m_v3.a * m_v3.wA.y;
                    param2.y = _loc_3;
                    break;
                }
                default:
                {
                    b2Settings.b2Assert(false);
                    break;
                    break;
                }
            }
            return;
        }// end function

        public function Solve2() : void
        {
            var _loc_1:* = m_v1.w;
            var _loc_2:* = m_v2.w;
            var _loc_3:* = b2Math.SubtractVV(_loc_2, _loc_1);
            var _loc_4:* = -(_loc_1.x * _loc_3.x + _loc_1.y * _loc_3.y);
            if (-(_loc_1.x * _loc_3.x + _loc_1.y * _loc_3.y) <= 0)
            {
                m_v1.a = 1;
                m_count = 1;
                return;
            }
            var _loc_5:* = _loc_2.x * _loc_3.x + _loc_2.y * _loc_3.y;
            if (_loc_2.x * _loc_3.x + _loc_2.y * _loc_3.y <= 0)
            {
                m_v2.a = 1;
                m_count = 1;
                m_v1.Set(m_v2);
                return;
            }
            var _loc_6:* = 1 / (_loc_5 + _loc_4);
            m_v1.a = _loc_5 * _loc_6;
            m_v2.a = _loc_4 * _loc_6;
            m_count = 2;
            return;
        }// end function

        public function Solve3() : void
        {
            var _loc_24:Number = NaN;
            var _loc_25:Number = NaN;
            var _loc_26:Number = NaN;
            var _loc_1:* = m_v1.w;
            var _loc_2:* = m_v2.w;
            var _loc_3:* = m_v3.w;
            var _loc_4:* = b2Math.SubtractVV(_loc_2, _loc_1);
            var _loc_5:* = b2Math.Dot(_loc_1, _loc_4);
            var _loc_6:* = b2Math.Dot(_loc_2, _loc_4);
            var _loc_7:* = b2Math.Dot(_loc_2, _loc_4);
            var _loc_8:* = -_loc_5;
            var _loc_9:* = b2Math.SubtractVV(_loc_3, _loc_1);
            var _loc_10:* = b2Math.Dot(_loc_1, _loc_9);
            var _loc_11:* = b2Math.Dot(_loc_3, _loc_9);
            var _loc_12:* = b2Math.Dot(_loc_3, _loc_9);
            var _loc_13:* = -_loc_10;
            var _loc_14:* = b2Math.SubtractVV(_loc_3, _loc_2);
            var _loc_15:* = b2Math.Dot(_loc_2, _loc_14);
            var _loc_16:* = b2Math.Dot(_loc_3, _loc_14);
            var _loc_17:* = b2Math.Dot(_loc_3, _loc_14);
            var _loc_18:* = -_loc_15;
            var _loc_19:* = b2Math.CrossVV(_loc_4, _loc_9);
            var _loc_20:* = b2Math.CrossVV(_loc_4, _loc_9) * b2Math.CrossVV(_loc_2, _loc_3);
            var _loc_21:* = _loc_19 * b2Math.CrossVV(_loc_3, _loc_1);
            var _loc_22:* = _loc_19 * b2Math.CrossVV(_loc_1, _loc_2);
            if (_loc_8 <= 0 && _loc_13 <= 0)
            {
                m_v1.a = 1;
                m_count = 1;
                return;
            }
            if (_loc_7 > 0 && _loc_8 > 0 && _loc_22 <= 0)
            {
                _loc_24 = 1 / (_loc_7 + _loc_8);
                m_v1.a = _loc_7 * _loc_24;
                m_v2.a = _loc_8 * _loc_24;
                m_count = 2;
                return;
            }
            if (_loc_12 > 0 && _loc_13 > 0 && _loc_21 <= 0)
            {
                _loc_25 = 1 / (_loc_12 + _loc_13);
                m_v1.a = _loc_12 * _loc_25;
                m_v3.a = _loc_13 * _loc_25;
                m_count = 2;
                m_v2.Set(m_v3);
                return;
            }
            if (_loc_7 <= 0 && _loc_18 <= 0)
            {
                m_v2.a = 1;
                m_count = 1;
                m_v1.Set(m_v2);
                return;
            }
            if (_loc_12 <= 0 && _loc_17 <= 0)
            {
                m_v3.a = 1;
                m_count = 1;
                m_v1.Set(m_v3);
                return;
            }
            if (_loc_17 > 0 && _loc_18 > 0 && _loc_20 <= 0)
            {
                _loc_26 = 1 / (_loc_17 + _loc_18);
                m_v2.a = _loc_17 * _loc_26;
                m_v3.a = _loc_18 * _loc_26;
                m_count = 2;
                m_v1.Set(m_v3);
                return;
            }
            var _loc_23:* = 1 / (_loc_20 + _loc_21 + _loc_22);
            m_v1.a = _loc_20 * _loc_23;
            m_v2.a = _loc_21 * _loc_23;
            m_v3.a = _loc_22 * _loc_23;
            m_count = 3;
            return;
        }// end function

        public function GetClosestPoint() : b2Vec2
        {
            switch(m_count)
            {
                case 0:
                {
                    b2Settings.b2Assert(false);
                    return new b2Vec2();
                }
                case 1:
                {
                    return m_v1.w;
                }
                case 2:
                {
                    return new b2Vec2(m_v1.a * m_v1.w.x + m_v2.a * m_v2.w.x, m_v1.a * m_v1.w.y + m_v2.a * m_v2.w.y);
                }
                default:
                {
                    b2Settings.b2Assert(false);
                    return new b2Vec2();
                    break;
                }
            }
        }// end function

    }
}
