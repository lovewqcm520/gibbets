package Box2D.Collision.Shapes
{
    import Box2D.Collision.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2EdgeShape extends b2Shape
    {
        var m_normal:b2Vec2;
        var m_cornerConvex1:Boolean;
        var m_cornerConvex2:Boolean;
        var m_cornerDir1:b2Vec2;
        var m_v1:b2Vec2;
        var m_v2:b2Vec2;
        private var s_supportVec:b2Vec2;
        var m_coreV1:b2Vec2;
        var m_coreV2:b2Vec2;
        var m_cornerDir2:b2Vec2;
        var m_nextEdge:b2EdgeShape;
        var m_direction:b2Vec2;
        var m_prevEdge:b2EdgeShape;
        var m_length:Number;

        public function b2EdgeShape(param1:b2Vec2, param2:b2Vec2)
        {
            s_supportVec = new b2Vec2();
            m_v1 = new b2Vec2();
            m_v2 = new b2Vec2();
            m_coreV1 = new b2Vec2();
            m_coreV2 = new b2Vec2();
            m_normal = new b2Vec2();
            m_direction = new b2Vec2();
            m_cornerDir1 = new b2Vec2();
            m_cornerDir2 = new b2Vec2();
            m_type = e_edgeShape;
            m_prevEdge = null;
            m_nextEdge = null;
            m_v1 = param1;
            m_v2 = param2;
            m_direction.Set(m_v2.x - m_v1.x, m_v2.y - m_v1.y);
            m_length = m_direction.Normalize();
            m_normal.Set(m_direction.y, -m_direction.x);
            m_coreV1.Set((-b2Settings.b2_toiSlop) * (m_normal.x - m_direction.x) + m_v1.x, (-b2Settings.b2_toiSlop) * (m_normal.y - m_direction.y) + m_v1.y);
            m_coreV2.Set((-b2Settings.b2_toiSlop) * (m_normal.x + m_direction.x) + m_v2.x, (-b2Settings.b2_toiSlop) * (m_normal.y + m_direction.y) + m_v2.y);
            m_cornerDir1 = m_normal;
            m_cornerDir2.Set(-m_normal.x, -m_normal.y);
            return;
        }// end function

        override public function ComputeSubmergedArea(param1:b2Vec2, param2:Number, param3:b2Transform, param4:b2Vec2) : Number
        {
            var _loc_5:* = new b2Vec2(param1.x * param2, param1.y * param2);
            var _loc_6:* = b2Math.MulX(param3, m_v1);
            var _loc_7:* = b2Math.MulX(param3, m_v2);
            var _loc_8:* = b2Math.Dot(param1, _loc_6) - param2;
            var _loc_9:* = b2Math.Dot(param1, _loc_7) - param2;
            if (_loc_8 > 0)
            {
                if (_loc_9 > 0)
                {
                    return 0;
                }
                _loc_6.x = (-_loc_9) / (_loc_8 - _loc_9) * _loc_6.x + _loc_8 / (_loc_8 - _loc_9) * _loc_7.x;
                _loc_6.y = (-_loc_9) / (_loc_8 - _loc_9) * _loc_6.y + _loc_8 / (_loc_8 - _loc_9) * _loc_7.y;
            }
            else if (_loc_9 > 0)
            {
                _loc_7.x = (-_loc_9) / (_loc_8 - _loc_9) * _loc_6.x + _loc_8 / (_loc_8 - _loc_9) * _loc_7.x;
                _loc_7.y = (-_loc_9) / (_loc_8 - _loc_9) * _loc_6.y + _loc_8 / (_loc_8 - _loc_9) * _loc_7.y;
            }
            param4.x = (_loc_5.x + _loc_6.x + _loc_7.x) / 3;
            param4.y = (_loc_5.y + _loc_6.y + _loc_7.y) / 3;
            return 0.5 * ((_loc_6.x - _loc_5.x) * (_loc_7.y - _loc_5.y) - (_loc_6.y - _loc_5.y) * (_loc_7.x - _loc_5.x));
        }// end function

        override public function ComputeAABB(param1:b2AABB, param2:b2Transform) : void
        {
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_3:* = param2.R;
            _loc_4 = param2.position.x + (_loc_3.col1.x * m_v1.x + _loc_3.col2.x * m_v1.y);
            _loc_5 = param2.position.y + (_loc_3.col1.y * m_v1.x + _loc_3.col2.y * m_v1.y);
            _loc_6 = param2.position.x + (_loc_3.col1.x * m_v2.x + _loc_3.col2.x * m_v2.y);
            _loc_7 = param2.position.y + (_loc_3.col1.y * m_v2.x + _loc_3.col2.y * m_v2.y);
            if (_loc_4 < _loc_6)
            {
                param1.lowerBound.x = _loc_4;
                param1.upperBound.x = _loc_6;
            }
            else
            {
                param1.lowerBound.x = _loc_6;
                param1.upperBound.x = _loc_4;
            }
            if (_loc_5 < _loc_7)
            {
                param1.lowerBound.y = _loc_5;
                param1.upperBound.y = _loc_7;
            }
            else
            {
                param1.lowerBound.y = _loc_7;
                param1.upperBound.y = _loc_5;
            }
            return;
        }// end function

        public function GetCorner1Vector() : b2Vec2
        {
            return m_cornerDir1;
        }// end function

        public function GetCorner2Vector() : b2Vec2
        {
            return m_cornerDir2;
        }// end function

        public function GetDirectionVector() : b2Vec2
        {
            return m_direction;
        }// end function

        public function GetCoreVertex1() : b2Vec2
        {
            return m_coreV1;
        }// end function

        public function GetCoreVertex2() : b2Vec2
        {
            return m_coreV2;
        }// end function

        public function GetFirstVertex(param1:b2Transform) : b2Vec2
        {
            var _loc_2:* = param1.R;
            return new b2Vec2(param1.position.x + (_loc_2.col1.x * m_coreV1.x + _loc_2.col2.x * m_coreV1.y), param1.position.y + (_loc_2.col1.y * m_coreV1.x + _loc_2.col2.y * m_coreV1.y));
        }// end function

        public function GetNormalVector() : b2Vec2
        {
            return m_normal;
        }// end function

        public function GetNextEdge() : b2EdgeShape
        {
            return m_nextEdge;
        }// end function

        override public function RayCast(param1:b2RayCastOutput, param2:b2RayCastInput, param3:b2Transform) : Boolean
        {
            var _loc_4:b2Mat22 = null;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_5:* = param2.p2.x - param2.p1.x;
            var _loc_6:* = param2.p2.y - param2.p1.y;
            _loc_4 = param3.R;
            var _loc_7:* = param3.position.x + (_loc_4.col1.x * m_v1.x + _loc_4.col2.x * m_v1.y);
            var _loc_8:* = param3.position.y + (_loc_4.col1.y * m_v1.x + _loc_4.col2.y * m_v1.y);
            var _loc_9:* = param3.position.y + (_loc_4.col1.y * m_v2.x + _loc_4.col2.y * m_v2.y) - _loc_8;
            var _loc_10:* = -(param3.position.x + (_loc_4.col1.x * m_v2.x + _loc_4.col2.x * m_v2.y) - _loc_7);
            var _loc_11:* = 100 * Number.MIN_VALUE;
            var _loc_12:* = -(_loc_5 * _loc_9 + _loc_6 * _loc_10);
            if (-(_loc_5 * _loc_9 + _loc_6 * _loc_10) > _loc_11)
            {
                _loc_13 = param2.p1.x - _loc_7;
                _loc_14 = param2.p1.y - _loc_8;
                _loc_15 = _loc_13 * _loc_9 + _loc_14 * _loc_10;
                if (_loc_15 >= 0 && _loc_15 <= param2.maxFraction * _loc_12)
                {
                    _loc_16 = (-_loc_5) * _loc_14 + _loc_6 * _loc_13;
                    if ((-_loc_11) * _loc_12 <= _loc_16 && _loc_16 <= _loc_12 * (1 + _loc_11))
                    {
                        _loc_15 = _loc_15 / _loc_12;
                        param1.fraction = _loc_15;
                        _loc_17 = Math.sqrt(_loc_9 * _loc_9 + _loc_10 * _loc_10);
                        param1.normal.x = _loc_9 / _loc_17;
                        param1.normal.y = _loc_10 / _loc_17;
                        return true;
                    }
                }
            }
            return false;
        }// end function

        override public function ComputeMass(param1:b2MassData, param2:Number) : void
        {
            param1.mass = 0;
            param1.center.SetV(m_v1);
            param1.I = 0;
            return;
        }// end function

        public function Corner1IsConvex() : Boolean
        {
            return m_cornerConvex1;
        }// end function

        public function Corner2IsConvex() : Boolean
        {
            return m_cornerConvex2;
        }// end function

        public function Support(param1:b2Transform, param2:Number, param3:Number) : b2Vec2
        {
            var _loc_4:* = param1.R;
            var _loc_5:* = param1.position.x + (_loc_4.col1.x * m_coreV1.x + _loc_4.col2.x * m_coreV1.y);
            var _loc_6:* = param1.position.y + (_loc_4.col1.y * m_coreV1.x + _loc_4.col2.y * m_coreV1.y);
            var _loc_7:* = param1.position.x + (_loc_4.col1.x * m_coreV2.x + _loc_4.col2.x * m_coreV2.y);
            var _loc_8:* = param1.position.y + (_loc_4.col1.y * m_coreV2.x + _loc_4.col2.y * m_coreV2.y);
            if (_loc_5 * param2 + _loc_6 * param3 > _loc_7 * param2 + _loc_8 * param3)
            {
                s_supportVec.x = _loc_5;
                s_supportVec.y = _loc_6;
            }
            else
            {
                s_supportVec.x = _loc_7;
                s_supportVec.y = _loc_8;
            }
            return s_supportVec;
        }// end function

        function SetNextEdge(param1:b2EdgeShape, param2:b2Vec2, param3:b2Vec2, param4:Boolean) : void
        {
            m_nextEdge = param1;
            m_coreV2 = param2;
            m_cornerDir2 = param3;
            m_cornerConvex2 = param4;
            return;
        }// end function

        public function GetPrevEdge() : b2EdgeShape
        {
            return m_prevEdge;
        }// end function

        public function GetVertex1() : b2Vec2
        {
            return m_v1;
        }// end function

        public function GetVertex2() : b2Vec2
        {
            return m_v2;
        }// end function

        function SetPrevEdge(param1:b2EdgeShape, param2:b2Vec2, param3:b2Vec2, param4:Boolean) : void
        {
            m_prevEdge = param1;
            m_coreV1 = param2;
            m_cornerDir1 = param3;
            m_cornerConvex1 = param4;
            return;
        }// end function

        public function GetLength() : Number
        {
            return m_length;
        }// end function

        override public function TestPoint(param1:b2Transform, param2:b2Vec2) : Boolean
        {
            return false;
        }// end function

    }
}
