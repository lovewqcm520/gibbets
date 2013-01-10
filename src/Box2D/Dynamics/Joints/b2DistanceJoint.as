package Box2D.Dynamics.Joints
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2DistanceJoint extends b2Joint
    {
        private var m_localAnchor1:b2Vec2;
        private var m_localAnchor2:b2Vec2;
        private var m_length:Number;
        private var m_mass:Number;
        private var m_bias:Number;
        private var m_gamma:Number;
        private var m_u:b2Vec2;
        private var m_impulse:Number;
        private var m_dampingRatio:Number;
        private var m_frequencyHz:Number;

        public function b2DistanceJoint(param1:b2DistanceJointDef)
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            m_localAnchor1 = new b2Vec2();
            m_localAnchor2 = new b2Vec2();
            m_u = new b2Vec2();
            super(param1);
            m_localAnchor1.SetV(param1.localAnchorA);
            m_localAnchor2.SetV(param1.localAnchorB);
            m_length = param1.length;
            m_frequencyHz = param1.frequencyHz;
            m_dampingRatio = param1.dampingRatio;
            m_impulse = 0;
            m_gamma = 0;
            m_bias = 0;
            return;
        }// end function

        public function SetFrequency(param1:Number) : void
        {
            m_frequencyHz = param1;
            return;
        }// end function

        public function GetFrequency() : Number
        {
            return m_frequencyHz;
        }// end function

        public function SetLength(param1:Number) : void
        {
            m_length = param1;
            return;
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:b2Body = null;
            var _loc_5:b2Body = null;
            var _loc_7:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            _loc_4 = m_bodyA;
            _loc_5 = m_bodyB;
            _loc_2 = _loc_4.m_xf.R;
            var _loc_6:* = m_localAnchor1.x - _loc_4.m_sweep.localCenter.x;
            _loc_7 = m_localAnchor1.y - _loc_4.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_6 + _loc_2.col2.x * _loc_7;
            _loc_7 = _loc_2.col1.y * _loc_6 + _loc_2.col2.y * _loc_7;
            _loc_6 = _loc_3;
            _loc_2 = _loc_5.m_xf.R;
            var _loc_8:* = m_localAnchor2.x - _loc_5.m_sweep.localCenter.x;
            _loc_9 = m_localAnchor2.y - _loc_5.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_8 + _loc_2.col2.x * _loc_9;
            _loc_9 = _loc_2.col1.y * _loc_8 + _loc_2.col2.y * _loc_9;
            _loc_8 = _loc_3;
            m_u.x = _loc_5.m_sweep.c.x + _loc_8 - _loc_4.m_sweep.c.x - _loc_6;
            m_u.y = _loc_5.m_sweep.c.y + _loc_9 - _loc_4.m_sweep.c.y - _loc_7;
            var _loc_10:* = Math.sqrt(m_u.x * m_u.x + m_u.y * m_u.y);
            if (Math.sqrt(m_u.x * m_u.x + m_u.y * m_u.y) > b2Settings.b2_linearSlop)
            {
                m_u.Multiply(1 / _loc_10);
            }
            else
            {
                m_u.SetZero();
            }
            var _loc_11:* = _loc_6 * m_u.y - _loc_7 * m_u.x;
            var _loc_12:* = _loc_8 * m_u.y - _loc_9 * m_u.x;
            var _loc_13:* = _loc_4.m_invMass + _loc_4.m_invI * _loc_11 * _loc_11 + _loc_5.m_invMass + _loc_5.m_invI * _loc_12 * _loc_12;
            m_mass = _loc_13 != 0 ? (1 / _loc_13) : (0);
            if (m_frequencyHz > 0)
            {
                _loc_14 = _loc_10 - m_length;
                _loc_15 = 2 * Math.PI * m_frequencyHz;
                _loc_16 = 2 * m_mass * m_dampingRatio * _loc_15;
                _loc_17 = m_mass * _loc_15 * _loc_15;
                m_gamma = param1.dt * (_loc_16 + param1.dt * _loc_17);
                m_gamma = m_gamma != 0 ? (1 / m_gamma) : (0);
                m_bias = _loc_14 * param1.dt * _loc_17 * m_gamma;
                m_mass = _loc_13 + m_gamma;
                m_mass = m_mass != 0 ? (1 / m_mass) : (0);
            }
            if (param1.warmStarting)
            {
                m_impulse = m_impulse * param1.dtRatio;
                _loc_18 = m_impulse * m_u.x;
                _loc_19 = m_impulse * m_u.y;
                _loc_4.m_linearVelocity.x = _loc_4.m_linearVelocity.x - _loc_4.m_invMass * _loc_18;
                _loc_4.m_linearVelocity.y = _loc_4.m_linearVelocity.y - _loc_4.m_invMass * _loc_19;
                _loc_4.m_angularVelocity = _loc_4.m_angularVelocity - _loc_4.m_invI * (_loc_6 * _loc_19 - _loc_7 * _loc_18);
                _loc_5.m_linearVelocity.x = _loc_5.m_linearVelocity.x + _loc_5.m_invMass * _loc_18;
                _loc_5.m_linearVelocity.y = _loc_5.m_linearVelocity.y + _loc_5.m_invMass * _loc_19;
                _loc_5.m_angularVelocity = _loc_5.m_angularVelocity + _loc_5.m_invI * (_loc_8 * _loc_19 - _loc_9 * _loc_18);
            }
            else
            {
                m_impulse = 0;
            }
            return;
        }// end function

        public function SetDampingRatio(param1:Number) : void
        {
            m_dampingRatio = param1;
            return;
        }// end function

        public function GetLength() : Number
        {
            return m_length;
        }// end function

        override public function GetAnchorA() : b2Vec2
        {
            return m_bodyA.GetWorldPoint(m_localAnchor1);
        }// end function

        override public function GetAnchorB() : b2Vec2
        {
            return m_bodyB.GetWorldPoint(m_localAnchor2);
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            return 0;
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * m_impulse * m_u.x, param1 * m_impulse * m_u.y);
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            var _loc_2:b2Mat22 = null;
            if (m_frequencyHz > 0)
            {
                return true;
            }
            var _loc_3:* = m_bodyA;
            var _loc_4:* = m_bodyB;
            _loc_2 = _loc_3.m_xf.R;
            var _loc_5:* = m_localAnchor1.x - _loc_3.m_sweep.localCenter.x;
            var _loc_6:* = m_localAnchor1.y - _loc_3.m_sweep.localCenter.y;
            var _loc_7:* = _loc_2.col1.x * _loc_5 + _loc_2.col2.x * _loc_6;
            _loc_6 = _loc_2.col1.y * _loc_5 + _loc_2.col2.y * _loc_6;
            _loc_5 = _loc_7;
            _loc_2 = _loc_4.m_xf.R;
            var _loc_8:* = m_localAnchor2.x - _loc_4.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchor2.y - _loc_4.m_sweep.localCenter.y;
            _loc_7 = _loc_2.col1.x * _loc_8 + _loc_2.col2.x * _loc_9;
            _loc_9 = _loc_2.col1.y * _loc_8 + _loc_2.col2.y * _loc_9;
            _loc_8 = _loc_7;
            var _loc_10:* = _loc_4.m_sweep.c.x + _loc_8 - _loc_3.m_sweep.c.x - _loc_5;
            var _loc_11:* = _loc_4.m_sweep.c.y + _loc_9 - _loc_3.m_sweep.c.y - _loc_6;
            var _loc_12:* = Math.sqrt(_loc_10 * _loc_10 + _loc_11 * _loc_11);
            _loc_10 = _loc_10 / _loc_12;
            _loc_11 = _loc_11 / _loc_12;
            var _loc_13:* = _loc_12 - m_length;
            _loc_13 = b2Math.Clamp(_loc_13, -b2Settings.b2_maxLinearCorrection, b2Settings.b2_maxLinearCorrection);
            var _loc_14:* = (-m_mass) * _loc_13;
            m_u.Set(_loc_10, _loc_11);
            var _loc_15:* = _loc_14 * m_u.x;
            var _loc_16:* = _loc_14 * m_u.y;
            _loc_3.m_sweep.c.x = _loc_3.m_sweep.c.x - _loc_3.m_invMass * _loc_15;
            _loc_3.m_sweep.c.y = _loc_3.m_sweep.c.y - _loc_3.m_invMass * _loc_16;
            _loc_3.m_sweep.a = _loc_3.m_sweep.a - _loc_3.m_invI * (_loc_5 * _loc_16 - _loc_6 * _loc_15);
            _loc_4.m_sweep.c.x = _loc_4.m_sweep.c.x + _loc_4.m_invMass * _loc_15;
            _loc_4.m_sweep.c.y = _loc_4.m_sweep.c.y + _loc_4.m_invMass * _loc_16;
            _loc_4.m_sweep.a = _loc_4.m_sweep.a + _loc_4.m_invI * (_loc_8 * _loc_16 - _loc_9 * _loc_15);
            _loc_3.SynchronizeTransform();
            _loc_4.SynchronizeTransform();
            return b2Math.Abs(_loc_13) < b2Settings.b2_linearSlop;
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:* = m_bodyA;
            var _loc_4:* = m_bodyB;
            _loc_2 = _loc_3.m_xf.R;
            var _loc_5:* = m_localAnchor1.x - _loc_3.m_sweep.localCenter.x;
            var _loc_6:* = m_localAnchor1.y - _loc_3.m_sweep.localCenter.y;
            var _loc_7:* = _loc_2.col1.x * _loc_5 + _loc_2.col2.x * _loc_6;
            _loc_6 = _loc_2.col1.y * _loc_5 + _loc_2.col2.y * _loc_6;
            _loc_5 = _loc_7;
            _loc_2 = _loc_4.m_xf.R;
            var _loc_8:* = m_localAnchor2.x - _loc_4.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchor2.y - _loc_4.m_sweep.localCenter.y;
            _loc_7 = _loc_2.col1.x * _loc_8 + _loc_2.col2.x * _loc_9;
            _loc_9 = _loc_2.col1.y * _loc_8 + _loc_2.col2.y * _loc_9;
            _loc_8 = _loc_7;
            var _loc_10:* = _loc_3.m_linearVelocity.x + (-_loc_3.m_angularVelocity) * _loc_6;
            var _loc_11:* = _loc_3.m_linearVelocity.y + _loc_3.m_angularVelocity * _loc_5;
            var _loc_12:* = _loc_4.m_linearVelocity.x + (-_loc_4.m_angularVelocity) * _loc_9;
            var _loc_13:* = _loc_4.m_linearVelocity.y + _loc_4.m_angularVelocity * _loc_8;
            var _loc_14:* = m_u.x * (_loc_12 - _loc_10) + m_u.y * (_loc_13 - _loc_11);
            var _loc_15:* = (-m_mass) * (_loc_14 + m_bias + m_gamma * m_impulse);
            m_impulse = m_impulse + _loc_15;
            var _loc_16:* = _loc_15 * m_u.x;
            var _loc_17:* = _loc_15 * m_u.y;
            _loc_3.m_linearVelocity.x = _loc_3.m_linearVelocity.x - _loc_3.m_invMass * _loc_16;
            _loc_3.m_linearVelocity.y = _loc_3.m_linearVelocity.y - _loc_3.m_invMass * _loc_17;
            _loc_3.m_angularVelocity = _loc_3.m_angularVelocity - _loc_3.m_invI * (_loc_5 * _loc_17 - _loc_6 * _loc_16);
            _loc_4.m_linearVelocity.x = _loc_4.m_linearVelocity.x + _loc_4.m_invMass * _loc_16;
            _loc_4.m_linearVelocity.y = _loc_4.m_linearVelocity.y + _loc_4.m_invMass * _loc_17;
            _loc_4.m_angularVelocity = _loc_4.m_angularVelocity + _loc_4.m_invI * (_loc_8 * _loc_17 - _loc_9 * _loc_16);
            return;
        }// end function

        public function GetDampingRatio() : Number
        {
            return m_dampingRatio;
        }// end function

    }
}
