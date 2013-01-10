package Box2D.Dynamics.Joints
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2PulleyJoint extends b2Joint
    {
        private var m_limitState1:int;
        private var m_limitState2:int;
        private var m_ground:b2Body;
        private var m_maxLength2:Number;
        private var m_maxLength1:Number;
        private var m_impulse:Number;
        private var m_constant:Number;
        private var m_state:int;
        private var m_ratio:Number;
        private var m_groundAnchor1:b2Vec2;
        private var m_groundAnchor2:b2Vec2;
        private var m_localAnchor1:b2Vec2;
        private var m_localAnchor2:b2Vec2;
        private var m_limitMass1:Number;
        private var m_limitMass2:Number;
        private var m_pulleyMass:Number;
        private var m_limitImpulse1:Number;
        private var m_limitImpulse2:Number;
        private var m_u1:b2Vec2;
        private var m_u2:b2Vec2;
        static const b2_minPulleyLength:Number = 2;

        public function b2PulleyJoint(param1:b2PulleyJointDef)
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            m_groundAnchor1 = new b2Vec2();
            m_groundAnchor2 = new b2Vec2();
            m_localAnchor1 = new b2Vec2();
            m_localAnchor2 = new b2Vec2();
            m_u1 = new b2Vec2();
            m_u2 = new b2Vec2();
            super(param1);
            m_ground = m_bodyA.m_world.m_groundBody;
            m_groundAnchor1.x = param1.groundAnchorA.x - m_ground.m_xf.position.x;
            m_groundAnchor1.y = param1.groundAnchorA.y - m_ground.m_xf.position.y;
            m_groundAnchor2.x = param1.groundAnchorB.x - m_ground.m_xf.position.x;
            m_groundAnchor2.y = param1.groundAnchorB.y - m_ground.m_xf.position.y;
            m_localAnchor1.SetV(param1.localAnchorA);
            m_localAnchor2.SetV(param1.localAnchorB);
            m_ratio = param1.ratio;
            m_constant = param1.lengthA + m_ratio * param1.lengthB;
            m_maxLength1 = b2Math.Min(param1.maxLengthA, m_constant - m_ratio * b2_minPulleyLength);
            m_maxLength2 = b2Math.Min(param1.maxLengthB, (m_constant - b2_minPulleyLength) / m_ratio);
            m_impulse = 0;
            m_limitImpulse1 = 0;
            m_limitImpulse2 = 0;
            return;
        }// end function

        public function GetGroundAnchorB() : b2Vec2
        {
            var _loc_1:* = m_ground.m_xf.position.Copy();
            _loc_1.Add(m_groundAnchor2);
            return _loc_1;
        }// end function

        public function GetGroundAnchorA() : b2Vec2
        {
            var _loc_1:* = m_ground.m_xf.position.Copy();
            _loc_1.Add(m_groundAnchor1);
            return _loc_1;
        }// end function

        override public function GetAnchorB() : b2Vec2
        {
            return m_bodyB.GetWorldPoint(m_localAnchor2);
        }// end function

        override public function GetAnchorA() : b2Vec2
        {
            return m_bodyA.GetWorldPoint(m_localAnchor1);
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * m_impulse * m_u2.x, param1 * m_impulse * m_u2.y);
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            var _loc_4:b2Mat22 = null;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_2:* = m_bodyA;
            var _loc_3:* = m_bodyB;
            var _loc_5:* = m_ground.m_xf.position.x + m_groundAnchor1.x;
            var _loc_6:* = m_ground.m_xf.position.y + m_groundAnchor1.y;
            var _loc_7:* = m_ground.m_xf.position.x + m_groundAnchor2.x;
            var _loc_8:* = m_ground.m_xf.position.y + m_groundAnchor2.y;
            var _loc_24:Number = 0;
            if (m_state == e_atUpperLimit)
            {
                _loc_4 = _loc_2.m_xf.R;
                _loc_9 = m_localAnchor1.x - _loc_2.m_sweep.localCenter.x;
                _loc_10 = m_localAnchor1.y - _loc_2.m_sweep.localCenter.y;
                _loc_23 = _loc_4.col1.x * _loc_9 + _loc_4.col2.x * _loc_10;
                _loc_10 = _loc_4.col1.y * _loc_9 + _loc_4.col2.y * _loc_10;
                _loc_9 = _loc_23;
                _loc_4 = _loc_3.m_xf.R;
                _loc_11 = m_localAnchor2.x - _loc_3.m_sweep.localCenter.x;
                _loc_12 = m_localAnchor2.y - _loc_3.m_sweep.localCenter.y;
                _loc_23 = _loc_4.col1.x * _loc_11 + _loc_4.col2.x * _loc_12;
                _loc_12 = _loc_4.col1.y * _loc_11 + _loc_4.col2.y * _loc_12;
                _loc_11 = _loc_23;
                _loc_13 = _loc_2.m_sweep.c.x + _loc_9;
                _loc_14 = _loc_2.m_sweep.c.y + _loc_10;
                _loc_15 = _loc_3.m_sweep.c.x + _loc_11;
                _loc_16 = _loc_3.m_sweep.c.y + _loc_12;
                m_u1.Set(_loc_13 - _loc_5, _loc_14 - _loc_6);
                m_u2.Set(_loc_15 - _loc_7, _loc_16 - _loc_8);
                _loc_17 = m_u1.Length();
                _loc_18 = m_u2.Length();
                if (_loc_17 > b2Settings.b2_linearSlop)
                {
                    m_u1.Multiply(1 / _loc_17);
                }
                else
                {
                    m_u1.SetZero();
                }
                if (_loc_18 > b2Settings.b2_linearSlop)
                {
                    m_u2.Multiply(1 / _loc_18);
                }
                else
                {
                    m_u2.SetZero();
                }
                _loc_19 = m_constant - _loc_17 - m_ratio * _loc_18;
                _loc_24 = b2Math.Max(_loc_24, -_loc_19);
                _loc_19 = b2Math.Clamp(_loc_19 + b2Settings.b2_linearSlop, -b2Settings.b2_maxLinearCorrection, 0);
                _loc_20 = (-m_pulleyMass) * _loc_19;
                _loc_13 = (-_loc_20) * m_u1.x;
                _loc_14 = (-_loc_20) * m_u1.y;
                _loc_15 = (-m_ratio) * _loc_20 * m_u2.x;
                _loc_16 = (-m_ratio) * _loc_20 * m_u2.y;
                _loc_2.m_sweep.c.x = _loc_2.m_sweep.c.x + _loc_2.m_invMass * _loc_13;
                _loc_2.m_sweep.c.y = _loc_2.m_sweep.c.y + _loc_2.m_invMass * _loc_14;
                _loc_2.m_sweep.a = _loc_2.m_sweep.a + _loc_2.m_invI * (_loc_9 * _loc_14 - _loc_10 * _loc_13);
                _loc_3.m_sweep.c.x = _loc_3.m_sweep.c.x + _loc_3.m_invMass * _loc_15;
                _loc_3.m_sweep.c.y = _loc_3.m_sweep.c.y + _loc_3.m_invMass * _loc_16;
                _loc_3.m_sweep.a = _loc_3.m_sweep.a + _loc_3.m_invI * (_loc_11 * _loc_16 - _loc_12 * _loc_15);
                _loc_2.SynchronizeTransform();
                _loc_3.SynchronizeTransform();
            }
            if (m_limitState1 == e_atUpperLimit)
            {
                _loc_4 = _loc_2.m_xf.R;
                _loc_9 = m_localAnchor1.x - _loc_2.m_sweep.localCenter.x;
                _loc_10 = m_localAnchor1.y - _loc_2.m_sweep.localCenter.y;
                _loc_23 = _loc_4.col1.x * _loc_9 + _loc_4.col2.x * _loc_10;
                _loc_10 = _loc_4.col1.y * _loc_9 + _loc_4.col2.y * _loc_10;
                _loc_9 = _loc_23;
                _loc_13 = _loc_2.m_sweep.c.x + _loc_9;
                _loc_14 = _loc_2.m_sweep.c.y + _loc_10;
                m_u1.Set(_loc_13 - _loc_5, _loc_14 - _loc_6);
                _loc_17 = m_u1.Length();
                if (_loc_17 > b2Settings.b2_linearSlop)
                {
                    m_u1.x = m_u1.x * (1 / _loc_17);
                    m_u1.y = m_u1.y * (1 / _loc_17);
                }
                else
                {
                    m_u1.SetZero();
                }
                _loc_19 = m_maxLength1 - _loc_17;
                _loc_24 = b2Math.Max(_loc_24, -_loc_19);
                _loc_19 = b2Math.Clamp(_loc_19 + b2Settings.b2_linearSlop, -b2Settings.b2_maxLinearCorrection, 0);
                _loc_20 = (-m_limitMass1) * _loc_19;
                _loc_13 = (-_loc_20) * m_u1.x;
                _loc_14 = (-_loc_20) * m_u1.y;
                _loc_2.m_sweep.c.x = _loc_2.m_sweep.c.x + _loc_2.m_invMass * _loc_13;
                _loc_2.m_sweep.c.y = _loc_2.m_sweep.c.y + _loc_2.m_invMass * _loc_14;
                _loc_2.m_sweep.a = _loc_2.m_sweep.a + _loc_2.m_invI * (_loc_9 * _loc_14 - _loc_10 * _loc_13);
                _loc_2.SynchronizeTransform();
            }
            if (m_limitState2 == e_atUpperLimit)
            {
                _loc_4 = _loc_3.m_xf.R;
                _loc_11 = m_localAnchor2.x - _loc_3.m_sweep.localCenter.x;
                _loc_12 = m_localAnchor2.y - _loc_3.m_sweep.localCenter.y;
                _loc_23 = _loc_4.col1.x * _loc_11 + _loc_4.col2.x * _loc_12;
                _loc_12 = _loc_4.col1.y * _loc_11 + _loc_4.col2.y * _loc_12;
                _loc_11 = _loc_23;
                _loc_15 = _loc_3.m_sweep.c.x + _loc_11;
                _loc_16 = _loc_3.m_sweep.c.y + _loc_12;
                m_u2.Set(_loc_15 - _loc_7, _loc_16 - _loc_8);
                _loc_18 = m_u2.Length();
                if (_loc_18 > b2Settings.b2_linearSlop)
                {
                    m_u2.x = m_u2.x * (1 / _loc_18);
                    m_u2.y = m_u2.y * (1 / _loc_18);
                }
                else
                {
                    m_u2.SetZero();
                }
                _loc_19 = m_maxLength2 - _loc_18;
                _loc_24 = b2Math.Max(_loc_24, -_loc_19);
                _loc_19 = b2Math.Clamp(_loc_19 + b2Settings.b2_linearSlop, -b2Settings.b2_maxLinearCorrection, 0);
                _loc_20 = (-m_limitMass2) * _loc_19;
                _loc_15 = (-_loc_20) * m_u2.x;
                _loc_16 = (-_loc_20) * m_u2.y;
                _loc_3.m_sweep.c.x = _loc_3.m_sweep.c.x + _loc_3.m_invMass * _loc_15;
                _loc_3.m_sweep.c.y = _loc_3.m_sweep.c.y + _loc_3.m_invMass * _loc_16;
                _loc_3.m_sweep.a = _loc_3.m_sweep.a + _loc_3.m_invI * (_loc_11 * _loc_16 - _loc_12 * _loc_15);
                _loc_3.SynchronizeTransform();
            }
            return _loc_24 < b2Settings.b2_linearSlop;
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Body = null;
            var _loc_3:b2Body = null;
            var _loc_4:b2Mat22 = null;
            var _loc_6:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_25:Number = NaN;
            var _loc_26:Number = NaN;
            _loc_2 = m_bodyA;
            _loc_3 = m_bodyB;
            _loc_4 = _loc_2.m_xf.R;
            var _loc_5:* = m_localAnchor1.x - _loc_2.m_sweep.localCenter.x;
            _loc_6 = m_localAnchor1.y - _loc_2.m_sweep.localCenter.y;
            var _loc_7:* = _loc_4.col1.x * _loc_5 + _loc_4.col2.x * _loc_6;
            _loc_6 = _loc_4.col1.y * _loc_5 + _loc_4.col2.y * _loc_6;
            _loc_5 = _loc_7;
            _loc_4 = _loc_3.m_xf.R;
            var _loc_8:* = m_localAnchor2.x - _loc_3.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchor2.y - _loc_3.m_sweep.localCenter.y;
            _loc_7 = _loc_4.col1.x * _loc_8 + _loc_4.col2.x * _loc_9;
            _loc_9 = _loc_4.col1.y * _loc_8 + _loc_4.col2.y * _loc_9;
            _loc_8 = _loc_7;
            var _loc_10:* = _loc_2.m_sweep.c.x + _loc_5;
            var _loc_11:* = _loc_2.m_sweep.c.y + _loc_6;
            var _loc_12:* = _loc_3.m_sweep.c.x + _loc_8;
            var _loc_13:* = _loc_3.m_sweep.c.y + _loc_9;
            var _loc_14:* = m_ground.m_xf.position.x + m_groundAnchor1.x;
            var _loc_15:* = m_ground.m_xf.position.y + m_groundAnchor1.y;
            var _loc_16:* = m_ground.m_xf.position.x + m_groundAnchor2.x;
            var _loc_17:* = m_ground.m_xf.position.y + m_groundAnchor2.y;
            m_u1.Set(_loc_10 - _loc_14, _loc_11 - _loc_15);
            m_u2.Set(_loc_12 - _loc_16, _loc_13 - _loc_17);
            var _loc_18:* = m_u1.Length();
            var _loc_19:* = m_u2.Length();
            if (_loc_18 > b2Settings.b2_linearSlop)
            {
                m_u1.Multiply(1 / _loc_18);
            }
            else
            {
                m_u1.SetZero();
            }
            if (_loc_19 > b2Settings.b2_linearSlop)
            {
                m_u2.Multiply(1 / _loc_19);
            }
            else
            {
                m_u2.SetZero();
            }
            var _loc_20:* = m_constant - _loc_18 - m_ratio * _loc_19;
            if (m_constant - _loc_18 - m_ratio * _loc_19 > 0)
            {
                m_state = e_inactiveLimit;
                m_impulse = 0;
            }
            else
            {
                m_state = e_atUpperLimit;
            }
            if (_loc_18 < m_maxLength1)
            {
                m_limitState1 = e_inactiveLimit;
                m_limitImpulse1 = 0;
            }
            else
            {
                m_limitState1 = e_atUpperLimit;
            }
            if (_loc_19 < m_maxLength2)
            {
                m_limitState2 = e_inactiveLimit;
                m_limitImpulse2 = 0;
            }
            else
            {
                m_limitState2 = e_atUpperLimit;
            }
            var _loc_21:* = _loc_5 * m_u1.y - _loc_6 * m_u1.x;
            var _loc_22:* = _loc_8 * m_u2.y - _loc_9 * m_u2.x;
            m_limitMass1 = _loc_2.m_invMass + _loc_2.m_invI * _loc_21 * _loc_21;
            m_limitMass2 = _loc_3.m_invMass + _loc_3.m_invI * _loc_22 * _loc_22;
            m_pulleyMass = m_limitMass1 + m_ratio * m_ratio * m_limitMass2;
            m_limitMass1 = 1 / m_limitMass1;
            m_limitMass2 = 1 / m_limitMass2;
            m_pulleyMass = 1 / m_pulleyMass;
            if (param1.warmStarting)
            {
                m_impulse = m_impulse * param1.dtRatio;
                m_limitImpulse1 = m_limitImpulse1 * param1.dtRatio;
                m_limitImpulse2 = m_limitImpulse2 * param1.dtRatio;
                _loc_23 = (-m_impulse - m_limitImpulse1) * m_u1.x;
                _loc_24 = (-m_impulse - m_limitImpulse1) * m_u1.y;
                _loc_25 = ((-m_ratio) * m_impulse - m_limitImpulse2) * m_u2.x;
                _loc_26 = ((-m_ratio) * m_impulse - m_limitImpulse2) * m_u2.y;
                _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x + _loc_2.m_invMass * _loc_23;
                _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y + _loc_2.m_invMass * _loc_24;
                _loc_2.m_angularVelocity = _loc_2.m_angularVelocity + _loc_2.m_invI * (_loc_5 * _loc_24 - _loc_6 * _loc_23);
                _loc_3.m_linearVelocity.x = _loc_3.m_linearVelocity.x + _loc_3.m_invMass * _loc_25;
                _loc_3.m_linearVelocity.y = _loc_3.m_linearVelocity.y + _loc_3.m_invMass * _loc_26;
                _loc_3.m_angularVelocity = _loc_3.m_angularVelocity + _loc_3.m_invI * (_loc_8 * _loc_26 - _loc_9 * _loc_25);
            }
            else
            {
                m_impulse = 0;
                m_limitImpulse1 = 0;
                m_limitImpulse2 = 0;
            }
            return;
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            return 0;
        }// end function

        public function GetRatio() : Number
        {
            return m_ratio;
        }// end function

        public function GetLength2() : Number
        {
            var _loc_1:* = m_bodyB.GetWorldPoint(m_localAnchor2);
            var _loc_2:* = m_ground.m_xf.position.x + m_groundAnchor2.x;
            var _loc_3:* = m_ground.m_xf.position.y + m_groundAnchor2.y;
            var _loc_4:* = _loc_1.x - _loc_2;
            var _loc_5:* = _loc_1.y - _loc_3;
            return Math.sqrt(_loc_4 * _loc_4 + _loc_5 * _loc_5);
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_4:b2Mat22 = null;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_2:* = m_bodyA;
            var _loc_3:* = m_bodyB;
            _loc_4 = _loc_2.m_xf.R;
            var _loc_5:* = m_localAnchor1.x - _loc_2.m_sweep.localCenter.x;
            var _loc_6:* = m_localAnchor1.y - _loc_2.m_sweep.localCenter.y;
            var _loc_7:* = _loc_4.col1.x * _loc_5 + _loc_4.col2.x * _loc_6;
            _loc_6 = _loc_4.col1.y * _loc_5 + _loc_4.col2.y * _loc_6;
            _loc_5 = _loc_7;
            _loc_4 = _loc_3.m_xf.R;
            var _loc_8:* = m_localAnchor2.x - _loc_3.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchor2.y - _loc_3.m_sweep.localCenter.y;
            _loc_7 = _loc_4.col1.x * _loc_8 + _loc_4.col2.x * _loc_9;
            _loc_9 = _loc_4.col1.y * _loc_8 + _loc_4.col2.y * _loc_9;
            _loc_8 = _loc_7;
            if (m_state == e_atUpperLimit)
            {
                _loc_10 = _loc_2.m_linearVelocity.x + (-_loc_2.m_angularVelocity) * _loc_6;
                _loc_11 = _loc_2.m_linearVelocity.y + _loc_2.m_angularVelocity * _loc_5;
                _loc_12 = _loc_3.m_linearVelocity.x + (-_loc_3.m_angularVelocity) * _loc_9;
                _loc_13 = _loc_3.m_linearVelocity.y + _loc_3.m_angularVelocity * _loc_8;
                _loc_18 = -(m_u1.x * _loc_10 + m_u1.y * _loc_11) - m_ratio * (m_u2.x * _loc_12 + m_u2.y * _loc_13);
                _loc_19 = m_pulleyMass * (-_loc_18);
                _loc_20 = m_impulse;
                m_impulse = b2Math.Max(0, m_impulse + _loc_19);
                _loc_19 = m_impulse - _loc_20;
                _loc_14 = (-_loc_19) * m_u1.x;
                _loc_15 = (-_loc_19) * m_u1.y;
                _loc_16 = (-m_ratio) * _loc_19 * m_u2.x;
                _loc_17 = (-m_ratio) * _loc_19 * m_u2.y;
                _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x + _loc_2.m_invMass * _loc_14;
                _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y + _loc_2.m_invMass * _loc_15;
                _loc_2.m_angularVelocity = _loc_2.m_angularVelocity + _loc_2.m_invI * (_loc_5 * _loc_15 - _loc_6 * _loc_14);
                _loc_3.m_linearVelocity.x = _loc_3.m_linearVelocity.x + _loc_3.m_invMass * _loc_16;
                _loc_3.m_linearVelocity.y = _loc_3.m_linearVelocity.y + _loc_3.m_invMass * _loc_17;
                _loc_3.m_angularVelocity = _loc_3.m_angularVelocity + _loc_3.m_invI * (_loc_8 * _loc_17 - _loc_9 * _loc_16);
            }
            if (m_limitState1 == e_atUpperLimit)
            {
                _loc_10 = _loc_2.m_linearVelocity.x + (-_loc_2.m_angularVelocity) * _loc_6;
                _loc_11 = _loc_2.m_linearVelocity.y + _loc_2.m_angularVelocity * _loc_5;
                _loc_18 = -(m_u1.x * _loc_10 + m_u1.y * _loc_11);
                _loc_19 = (-m_limitMass1) * _loc_18;
                _loc_20 = m_limitImpulse1;
                m_limitImpulse1 = b2Math.Max(0, m_limitImpulse1 + _loc_19);
                _loc_19 = m_limitImpulse1 - _loc_20;
                _loc_14 = (-_loc_19) * m_u1.x;
                _loc_15 = (-_loc_19) * m_u1.y;
                _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x + _loc_2.m_invMass * _loc_14;
                _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y + _loc_2.m_invMass * _loc_15;
                _loc_2.m_angularVelocity = _loc_2.m_angularVelocity + _loc_2.m_invI * (_loc_5 * _loc_15 - _loc_6 * _loc_14);
            }
            if (m_limitState2 == e_atUpperLimit)
            {
                _loc_12 = _loc_3.m_linearVelocity.x + (-_loc_3.m_angularVelocity) * _loc_9;
                _loc_13 = _loc_3.m_linearVelocity.y + _loc_3.m_angularVelocity * _loc_8;
                _loc_18 = -(m_u2.x * _loc_12 + m_u2.y * _loc_13);
                _loc_19 = (-m_limitMass2) * _loc_18;
                _loc_20 = m_limitImpulse2;
                m_limitImpulse2 = b2Math.Max(0, m_limitImpulse2 + _loc_19);
                _loc_19 = m_limitImpulse2 - _loc_20;
                _loc_16 = (-_loc_19) * m_u2.x;
                _loc_17 = (-_loc_19) * m_u2.y;
                _loc_3.m_linearVelocity.x = _loc_3.m_linearVelocity.x + _loc_3.m_invMass * _loc_16;
                _loc_3.m_linearVelocity.y = _loc_3.m_linearVelocity.y + _loc_3.m_invMass * _loc_17;
                _loc_3.m_angularVelocity = _loc_3.m_angularVelocity + _loc_3.m_invI * (_loc_8 * _loc_17 - _loc_9 * _loc_16);
            }
            return;
        }// end function

        public function GetLength1() : Number
        {
            var _loc_1:* = m_bodyA.GetWorldPoint(m_localAnchor1);
            var _loc_2:* = m_ground.m_xf.position.x + m_groundAnchor1.x;
            var _loc_3:* = m_ground.m_xf.position.y + m_groundAnchor1.y;
            var _loc_4:* = _loc_1.x - _loc_2;
            var _loc_5:* = _loc_1.y - _loc_3;
            return Math.sqrt(_loc_4 * _loc_4 + _loc_5 * _loc_5);
        }// end function

    }
}
