package Box2D.Collision.Shapes
{
    import Box2D.Collision.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2CircleShape extends b2Shape
    {
        var m_p:b2Vec2;

        public function b2CircleShape(param1:Number = 0)
        {
            m_p = new b2Vec2();
            m_type = e_circleShape;
            m_radius = param1;
            return;
        }// end function

        override public function ComputeSubmergedArea(param1:b2Vec2, param2:Number, param3:b2Transform, param4:b2Vec2) : Number
        {
            var _loc_9:Number = NaN;
            var _loc_5:* = b2Math.MulX(param3, m_p);
            var _loc_6:* = -(b2Math.Dot(param1, _loc_5) - param2);
            if (-(b2Math.Dot(param1, _loc_5) - param2) < -m_radius + Number.MIN_VALUE)
            {
                return 0;
            }
            if (_loc_6 > m_radius)
            {
                param4.SetV(_loc_5);
                return Math.PI * m_radius * m_radius;
            }
            var _loc_7:* = m_radius * m_radius;
            var _loc_8:* = _loc_6 * _loc_6;
            _loc_9 = _loc_7 * (Math.asin(_loc_6 / m_radius) + Math.PI / 2) + _loc_6 * Math.sqrt(_loc_7 - _loc_8);
            var _loc_10:* = -2 / 3 * Math.pow(_loc_7 - _loc_8, 1.5) / _loc_9;
            param4.x = _loc_5.x + param1.x * _loc_10;
            param4.y = _loc_5.y + param1.y * _loc_10;
            return _loc_9;
        }// end function

        override public function TestPoint(param1:b2Transform, param2:b2Vec2) : Boolean
        {
            var _loc_3:* = param1.R;
            var _loc_4:* = param1.position.x + (_loc_3.col1.x * m_p.x + _loc_3.col2.x * m_p.y);
            var _loc_5:* = param1.position.y + (_loc_3.col1.y * m_p.x + _loc_3.col2.y * m_p.y);
            _loc_4 = param2.x - _loc_4;
            _loc_5 = param2.y - _loc_5;
            return _loc_4 * _loc_4 + _loc_5 * _loc_5 <= m_radius * m_radius;
        }// end function

        public function GetRadius() : Number
        {
            return m_radius;
        }// end function

        override public function Set(param1:b2Shape) : void
        {
            var _loc_2:b2CircleShape = null;
            super.Set(param1);
            if (param1 is b2CircleShape)
            {
                _loc_2 = param1 as b2CircleShape;
                m_p.SetV(_loc_2.m_p);
            }
            return;
        }// end function

        override public function ComputeMass(param1:b2MassData, param2:Number) : void
        {
            param1.mass = param2 * b2Settings.b2_pi * m_radius * m_radius;
            param1.center.SetV(m_p);
            param1.I = param1.mass * (0.5 * m_radius * m_radius + (m_p.x * m_p.x + m_p.y * m_p.y));
            return;
        }// end function

        override public function RayCast(param1:b2RayCastOutput, param2:b2RayCastInput, param3:b2Transform) : Boolean
        {
            var _loc_8:Number = NaN;
            var _loc_4:* = param3.R;
            var _loc_5:* = param3.position.x + (_loc_4.col1.x * m_p.x + _loc_4.col2.x * m_p.y);
            var _loc_6:* = param3.position.y + (_loc_4.col1.y * m_p.x + _loc_4.col2.y * m_p.y);
            var _loc_7:* = param2.p1.x - _loc_5;
            _loc_8 = param2.p1.y - _loc_6;
            var _loc_9:* = _loc_7 * _loc_7 + _loc_8 * _loc_8 - m_radius * m_radius;
            var _loc_10:* = param2.p2.x - param2.p1.x;
            var _loc_11:* = param2.p2.y - param2.p1.y;
            var _loc_12:* = _loc_7 * _loc_10 + _loc_8 * _loc_11;
            var _loc_13:* = _loc_10 * _loc_10 + _loc_11 * _loc_11;
            var _loc_14:* = _loc_12 * _loc_12 - _loc_13 * _loc_9;
            if (_loc_12 * _loc_12 - _loc_13 * _loc_9 < 0 || _loc_13 < Number.MIN_VALUE)
            {
                return false;
            }
            var _loc_15:* = -(_loc_12 + Math.sqrt(_loc_14));
            if (_loc_15 >= 0 && _loc_15 <= param2.maxFraction * _loc_13)
            {
                _loc_15 = _loc_15 / _loc_13;
                param1.fraction = _loc_15;
                param1.normal.x = _loc_7 + _loc_15 * _loc_10;
                param1.normal.y = _loc_8 + _loc_15 * _loc_11;
                param1.normal.Normalize();
                return true;
            }
            return false;
        }// end function

        public function SetLocalPosition(param1:b2Vec2) : void
        {
            m_p.SetV(param1);
            return;
        }// end function

        public function SetRadius(param1:Number) : void
        {
            m_radius = param1;
            return;
        }// end function

        override public function Copy() : b2Shape
        {
            var _loc_1:* = new b2CircleShape();
            _loc_1.Set(this);
            return _loc_1;
        }// end function

        override public function ComputeAABB(param1:b2AABB, param2:b2Transform) : void
        {
            var _loc_3:* = param2.R;
            var _loc_4:* = param2.position.x + (_loc_3.col1.x * m_p.x + _loc_3.col2.x * m_p.y);
            var _loc_5:* = param2.position.y + (_loc_3.col1.y * m_p.x + _loc_3.col2.y * m_p.y);
            param1.lowerBound.Set(_loc_4 - m_radius, _loc_5 - m_radius);
            param1.upperBound.Set(_loc_4 + m_radius, _loc_5 + m_radius);
            return;
        }// end function

        public function GetLocalPosition() : b2Vec2
        {
            return m_p;
        }// end function

    }
}
