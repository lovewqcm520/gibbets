package Box2D.Dynamics.Joints
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2RevoluteJoint extends b2Joint
    {
        private var m_mass:b2Mat33;
        private var m_impulse:b2Vec3;
        private var m_enableLimit:Boolean;
        private var m_limitState:int;
        private var m_motorMass:Number;
        private var reduced:b2Vec2;
        var m_localAnchor1:b2Vec2;
        var m_localAnchor2:b2Vec2;
        private var K1:b2Mat22;
        private var K2:b2Mat22;
        private var K3:b2Mat22;
        private var K:b2Mat22;
        private var m_motorImpulse:Number;
        private var impulse2:b2Vec2;
        private var impulse3:b2Vec3;
        private var m_enableMotor:Boolean;
        private var m_referenceAngle:Number;
        private var m_upperAngle:Number;
        private var m_motorSpeed:Number;
        private var m_lowerAngle:Number;
        private var m_maxMotorTorque:Number;
        private static var tImpulse:b2Vec2 = new b2Vec2();

        public function b2RevoluteJoint(param1:b2RevoluteJointDef)
        {
            K = new b2Mat22();
            K1 = new b2Mat22();
            K2 = new b2Mat22();
            K3 = new b2Mat22();
            impulse3 = new b2Vec3();
            impulse2 = new b2Vec2();
            reduced = new b2Vec2();
            m_localAnchor1 = new b2Vec2();
            m_localAnchor2 = new b2Vec2();
            m_impulse = new b2Vec3();
            m_mass = new b2Mat33();
            super(param1);
            m_localAnchor1.SetV(param1.localAnchorA);
            m_localAnchor2.SetV(param1.localAnchorB);
            m_referenceAngle = param1.referenceAngle;
            m_impulse.SetZero();
            m_motorImpulse = 0;
            m_lowerAngle = param1.lowerAngle;
            m_upperAngle = param1.upperAngle;
            m_maxMotorTorque = param1.maxMotorTorque;
            m_motorSpeed = param1.motorSpeed;
            m_enableLimit = param1.enableLimit;
            m_enableMotor = param1.enableMotor;
            m_limitState = e_inactiveLimit;
            return;
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_4:b2Mat22 = null;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_25:Number = NaN;
            var _loc_26:Number = NaN;
            var _loc_27:Number = NaN;
            var _loc_2:* = m_bodyA;
            var _loc_3:* = m_bodyB;
            var _loc_11:* = _loc_2.m_linearVelocity;
            var _loc_12:* = _loc_2.m_angularVelocity;
            var _loc_13:* = _loc_3.m_linearVelocity;
            var _loc_14:* = _loc_3.m_angularVelocity;
            var _loc_15:* = _loc_2.m_invMass;
            var _loc_16:* = _loc_3.m_invMass;
            var _loc_17:* = _loc_2.m_invI;
            var _loc_18:* = _loc_3.m_invI;
            if (m_enableMotor && m_limitState != e_equalLimits)
            {
                _loc_19 = _loc_14 - _loc_12 - m_motorSpeed;
                _loc_20 = m_motorMass * (-_loc_19);
                _loc_21 = m_motorImpulse;
                _loc_22 = param1.dt * m_maxMotorTorque;
                m_motorImpulse = b2Math.Clamp(m_motorImpulse + _loc_20, -_loc_22, _loc_22);
                _loc_20 = m_motorImpulse - _loc_21;
                _loc_12 = _loc_12 - _loc_17 * _loc_20;
                _loc_14 = _loc_14 + _loc_18 * _loc_20;
            }
            if (m_enableLimit && m_limitState != e_inactiveLimit)
            {
                _loc_4 = _loc_2.m_xf.R;
                _loc_7 = m_localAnchor1.x - _loc_2.m_sweep.localCenter.x;
                _loc_8 = m_localAnchor1.y - _loc_2.m_sweep.localCenter.y;
                _loc_5 = _loc_4.col1.x * _loc_7 + _loc_4.col2.x * _loc_8;
                _loc_8 = _loc_4.col1.y * _loc_7 + _loc_4.col2.y * _loc_8;
                _loc_7 = _loc_5;
                _loc_4 = _loc_3.m_xf.R;
                _loc_9 = m_localAnchor2.x - _loc_3.m_sweep.localCenter.x;
                _loc_10 = m_localAnchor2.y - _loc_3.m_sweep.localCenter.y;
                _loc_5 = _loc_4.col1.x * _loc_9 + _loc_4.col2.x * _loc_10;
                _loc_10 = _loc_4.col1.y * _loc_9 + _loc_4.col2.y * _loc_10;
                _loc_9 = _loc_5;
                _loc_23 = _loc_13.x + (-_loc_14) * _loc_10 - _loc_11.x - (-_loc_12) * _loc_8;
                _loc_24 = _loc_13.y + _loc_14 * _loc_9 - _loc_11.y - _loc_12 * _loc_7;
                _loc_25 = _loc_14 - _loc_12;
                m_mass.Solve33(impulse3, -_loc_23, -_loc_24, -_loc_25);
                if (m_limitState == e_equalLimits)
                {
                    m_impulse.Add(impulse3);
                }
                else if (m_limitState == e_atLowerLimit)
                {
                    _loc_6 = m_impulse.z + impulse3.z;
                    if (_loc_6 < 0)
                    {
                        m_mass.Solve22(reduced, -_loc_23, -_loc_24);
                        impulse3.x = reduced.x;
                        impulse3.y = reduced.y;
                        impulse3.z = -m_impulse.z;
                        m_impulse.x = m_impulse.x + reduced.x;
                        m_impulse.y = m_impulse.y + reduced.y;
                        m_impulse.z = 0;
                    }
                }
                else if (m_limitState == e_atUpperLimit)
                {
                    _loc_6 = m_impulse.z + impulse3.z;
                    if (_loc_6 > 0)
                    {
                        m_mass.Solve22(reduced, -_loc_23, -_loc_24);
                        impulse3.x = reduced.x;
                        impulse3.y = reduced.y;
                        impulse3.z = -m_impulse.z;
                        m_impulse.x = m_impulse.x + reduced.x;
                        m_impulse.y = m_impulse.y + reduced.y;
                        m_impulse.z = 0;
                    }
                }
                _loc_11.x = _loc_11.x - _loc_15 * impulse3.x;
                _loc_11.y = _loc_11.y - _loc_15 * impulse3.y;
                _loc_12 = _loc_12 - _loc_17 * (_loc_7 * impulse3.y - _loc_8 * impulse3.x + impulse3.z);
                _loc_13.x = _loc_13.x + _loc_16 * impulse3.x;
                _loc_13.y = _loc_13.y + _loc_16 * impulse3.y;
                _loc_14 = _loc_14 + _loc_18 * (_loc_9 * impulse3.y - _loc_10 * impulse3.x + impulse3.z);
            }
            else
            {
                _loc_4 = _loc_2.m_xf.R;
                _loc_7 = m_localAnchor1.x - _loc_2.m_sweep.localCenter.x;
                _loc_8 = m_localAnchor1.y - _loc_2.m_sweep.localCenter.y;
                _loc_5 = _loc_4.col1.x * _loc_7 + _loc_4.col2.x * _loc_8;
                _loc_8 = _loc_4.col1.y * _loc_7 + _loc_4.col2.y * _loc_8;
                _loc_7 = _loc_5;
                _loc_4 = _loc_3.m_xf.R;
                _loc_9 = m_localAnchor2.x - _loc_3.m_sweep.localCenter.x;
                _loc_10 = m_localAnchor2.y - _loc_3.m_sweep.localCenter.y;
                _loc_5 = _loc_4.col1.x * _loc_9 + _loc_4.col2.x * _loc_10;
                _loc_10 = _loc_4.col1.y * _loc_9 + _loc_4.col2.y * _loc_10;
                _loc_9 = _loc_5;
                _loc_26 = _loc_13.x + (-_loc_14) * _loc_10 - _loc_11.x - (-_loc_12) * _loc_8;
                _loc_27 = _loc_13.y + _loc_14 * _loc_9 - _loc_11.y - _loc_12 * _loc_7;
                m_mass.Solve22(impulse2, -_loc_26, -_loc_27);
                m_impulse.x = m_impulse.x + impulse2.x;
                m_impulse.y = m_impulse.y + impulse2.y;
                _loc_11.x = _loc_11.x - _loc_15 * impulse2.x;
                _loc_11.y = _loc_11.y - _loc_15 * impulse2.y;
                _loc_12 = _loc_12 - _loc_17 * (_loc_7 * impulse2.y - _loc_8 * impulse2.x);
                _loc_13.x = _loc_13.x + _loc_16 * impulse2.x;
                _loc_13.y = _loc_13.y + _loc_16 * impulse2.y;
                _loc_14 = _loc_14 + _loc_18 * (_loc_9 * impulse2.y - _loc_10 * impulse2.x);
            }
            _loc_2.m_linearVelocity.SetV(_loc_11);
            _loc_2.m_angularVelocity = _loc_12;
            _loc_3.m_linearVelocity.SetV(_loc_13);
            _loc_3.m_angularVelocity = _loc_14;
            return;
        }// end function

        public function GetUpperLimit() : Number
        {
            return m_upperAngle;
        }// end function

        public function GetLowerLimit() : Number
        {
            return m_lowerAngle;
        }// end function

        public function EnableMotor(param1:Boolean) : void
        {
            m_enableMotor = param1;
            return;
        }// end function

        override public function GetAnchorB() : b2Vec2
        {
            return m_bodyB.GetWorldPoint(m_localAnchor2);
        }// end function

        override public function GetAnchorA() : b2Vec2
        {
            return m_bodyA.GetWorldPoint(m_localAnchor1);
        }// end function

        public function GetMotorSpeed() : Number
        {
            return m_motorSpeed;
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * m_impulse.x, param1 * m_impulse.y);
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:b2Mat22 = null;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_25:Number = NaN;
            var _loc_26:Number = NaN;
            var _loc_27:Number = NaN;
            var _loc_28:Number = NaN;
            var _loc_29:Number = NaN;
            var _loc_30:Number = NaN;
            var _loc_31:Number = NaN;
            var _loc_5:* = m_bodyA;
            var _loc_6:* = m_bodyB;
            var _loc_7:Number = 0;
            var _loc_8:Number = 0;
            if (m_enableLimit && m_limitState != e_inactiveLimit)
            {
                _loc_25 = _loc_6.m_sweep.a - _loc_5.m_sweep.a - m_referenceAngle;
                _loc_26 = 0;
                if (m_limitState == e_equalLimits)
                {
                    _loc_3 = b2Math.Clamp(_loc_25 - m_lowerAngle, -b2Settings.b2_maxAngularCorrection, b2Settings.b2_maxAngularCorrection);
                    _loc_26 = (-m_motorMass) * _loc_3;
                    _loc_7 = b2Math.Abs(_loc_3);
                }
                else if (m_limitState == e_atLowerLimit)
                {
                    _loc_3 = _loc_25 - m_lowerAngle;
                    _loc_7 = -_loc_3;
                    _loc_3 = b2Math.Clamp(_loc_3 + b2Settings.b2_angularSlop, -b2Settings.b2_maxAngularCorrection, 0);
                    _loc_26 = (-m_motorMass) * _loc_3;
                }
                else if (m_limitState == e_atUpperLimit)
                {
                    _loc_3 = _loc_25 - m_upperAngle;
                    _loc_7 = _loc_3;
                    _loc_3 = b2Math.Clamp(_loc_3 - b2Settings.b2_angularSlop, 0, b2Settings.b2_maxAngularCorrection);
                    _loc_26 = (-m_motorMass) * _loc_3;
                }
                _loc_5.m_sweep.a = _loc_5.m_sweep.a - _loc_5.m_invI * _loc_26;
                _loc_6.m_sweep.a = _loc_6.m_sweep.a + _loc_6.m_invI * _loc_26;
                _loc_5.SynchronizeTransform();
                _loc_6.SynchronizeTransform();
            }
            _loc_4 = _loc_5.m_xf.R;
            var _loc_12:* = m_localAnchor1.x - _loc_5.m_sweep.localCenter.x;
            var _loc_13:* = m_localAnchor1.y - _loc_5.m_sweep.localCenter.y;
            _loc_9 = _loc_4.col1.x * _loc_12 + _loc_4.col2.x * _loc_13;
            _loc_13 = _loc_4.col1.y * _loc_12 + _loc_4.col2.y * _loc_13;
            _loc_12 = _loc_9;
            _loc_4 = _loc_6.m_xf.R;
            var _loc_14:* = m_localAnchor2.x - _loc_6.m_sweep.localCenter.x;
            var _loc_15:* = m_localAnchor2.y - _loc_6.m_sweep.localCenter.y;
            _loc_9 = _loc_4.col1.x * _loc_14 + _loc_4.col2.x * _loc_15;
            _loc_15 = _loc_4.col1.y * _loc_14 + _loc_4.col2.y * _loc_15;
            _loc_14 = _loc_9;
            var _loc_16:* = _loc_6.m_sweep.c.x + _loc_14 - _loc_5.m_sweep.c.x - _loc_12;
            var _loc_17:* = _loc_6.m_sweep.c.y + _loc_15 - _loc_5.m_sweep.c.y - _loc_13;
            var _loc_18:* = _loc_16 * _loc_16 + _loc_17 * _loc_17;
            var _loc_19:* = Math.sqrt(_loc_18);
            _loc_8 = Math.sqrt(_loc_18);
            var _loc_20:* = _loc_5.m_invMass;
            var _loc_21:* = _loc_6.m_invMass;
            var _loc_22:* = _loc_5.m_invI;
            var _loc_23:* = _loc_6.m_invI;
            var _loc_24:* = 10 * b2Settings.b2_linearSlop;
            if (_loc_18 > _loc_24 * _loc_24)
            {
                _loc_27 = _loc_16 / _loc_19;
                _loc_28 = _loc_17 / _loc_19;
                _loc_29 = _loc_20 + _loc_21;
                _loc_30 = 1 / _loc_29;
                _loc_10 = _loc_30 * (-_loc_16);
                _loc_11 = _loc_30 * (-_loc_17);
                _loc_31 = 0.5;
                _loc_5.m_sweep.c.x = _loc_5.m_sweep.c.x - _loc_31 * _loc_20 * _loc_10;
                _loc_5.m_sweep.c.y = _loc_5.m_sweep.c.y - _loc_31 * _loc_20 * _loc_11;
                _loc_6.m_sweep.c.x = _loc_6.m_sweep.c.x + _loc_31 * _loc_21 * _loc_10;
                _loc_6.m_sweep.c.y = _loc_6.m_sweep.c.y + _loc_31 * _loc_21 * _loc_11;
                _loc_16 = _loc_6.m_sweep.c.x + _loc_14 - _loc_5.m_sweep.c.x - _loc_12;
                _loc_17 = _loc_6.m_sweep.c.y + _loc_15 - _loc_5.m_sweep.c.y - _loc_13;
            }
            K1.col1.x = _loc_20 + _loc_21;
            K1.col2.x = 0;
            K1.col1.y = 0;
            K1.col2.y = _loc_20 + _loc_21;
            K2.col1.x = _loc_22 * _loc_13 * _loc_13;
            K2.col2.x = (-_loc_22) * _loc_12 * _loc_13;
            K2.col1.y = (-_loc_22) * _loc_12 * _loc_13;
            K2.col2.y = _loc_22 * _loc_12 * _loc_12;
            K3.col1.x = _loc_23 * _loc_15 * _loc_15;
            K3.col2.x = (-_loc_23) * _loc_14 * _loc_15;
            K3.col1.y = (-_loc_23) * _loc_14 * _loc_15;
            K3.col2.y = _loc_23 * _loc_14 * _loc_14;
            K.SetM(K1);
            K.AddM(K2);
            K.AddM(K3);
            K.Solve(tImpulse, -_loc_16, -_loc_17);
            _loc_10 = tImpulse.x;
            _loc_11 = tImpulse.y;
            _loc_5.m_sweep.c.x = _loc_5.m_sweep.c.x - _loc_5.m_invMass * _loc_10;
            _loc_5.m_sweep.c.y = _loc_5.m_sweep.c.y - _loc_5.m_invMass * _loc_11;
            _loc_5.m_sweep.a = _loc_5.m_sweep.a - _loc_5.m_invI * (_loc_12 * _loc_11 - _loc_13 * _loc_10);
            _loc_6.m_sweep.c.x = _loc_6.m_sweep.c.x + _loc_6.m_invMass * _loc_10;
            _loc_6.m_sweep.c.y = _loc_6.m_sweep.c.y + _loc_6.m_invMass * _loc_11;
            _loc_6.m_sweep.a = _loc_6.m_sweep.a + _loc_6.m_invI * (_loc_14 * _loc_11 - _loc_15 * _loc_10);
            _loc_5.SynchronizeTransform();
            _loc_6.SynchronizeTransform();
            return _loc_8 <= b2Settings.b2_linearSlop && _loc_7 <= b2Settings.b2_angularSlop;
        }// end function

        public function SetMotorSpeed(param1:Number) : void
        {
            m_bodyA.SetAwake(true);
            m_bodyB.SetAwake(true);
            m_motorSpeed = param1;
            return;
        }// end function

        public function SetMaxMotorTorque(param1:Number) : void
        {
            m_maxMotorTorque = param1;
            return;
        }// end function

        public function GetJointAngle() : Number
        {
            return m_bodyB.m_sweep.a - m_bodyA.m_sweep.a - m_referenceAngle;
        }// end function

        public function GetJointSpeed() : Number
        {
            return m_bodyB.m_angularVelocity - m_bodyA.m_angularVelocity;
        }// end function

        public function GetMotorTorque() : Number
        {
            return m_maxMotorTorque;
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Body = null;
            var _loc_3:b2Body = null;
            var _loc_4:b2Mat22 = null;
            var _loc_5:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            _loc_2 = m_bodyA;
            _loc_3 = m_bodyB;
            if (m_enableMotor || m_enableLimit)
            {
            }
            _loc_4 = _loc_2.m_xf.R;
            var _loc_6:* = m_localAnchor1.x - _loc_2.m_sweep.localCenter.x;
            _loc_7 = m_localAnchor1.y - _loc_2.m_sweep.localCenter.y;
            _loc_5 = _loc_4.col1.x * _loc_6 + _loc_4.col2.x * _loc_7;
            _loc_7 = _loc_4.col1.y * _loc_6 + _loc_4.col2.y * _loc_7;
            _loc_6 = _loc_5;
            _loc_4 = _loc_3.m_xf.R;
            var _loc_8:* = m_localAnchor2.x - _loc_3.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchor2.y - _loc_3.m_sweep.localCenter.y;
            _loc_5 = _loc_4.col1.x * _loc_8 + _loc_4.col2.x * _loc_9;
            _loc_9 = _loc_4.col1.y * _loc_8 + _loc_4.col2.y * _loc_9;
            _loc_8 = _loc_5;
            var _loc_10:* = _loc_2.m_invMass;
            var _loc_11:* = _loc_3.m_invMass;
            var _loc_12:* = _loc_2.m_invI;
            var _loc_13:* = _loc_3.m_invI;
            m_mass.col1.x = _loc_10 + _loc_11 + _loc_7 * _loc_7 * _loc_12 + _loc_9 * _loc_9 * _loc_13;
            m_mass.col2.x = (-_loc_7) * _loc_6 * _loc_12 - _loc_9 * _loc_8 * _loc_13;
            m_mass.col3.x = (-_loc_7) * _loc_12 - _loc_9 * _loc_13;
            m_mass.col1.y = m_mass.col2.x;
            m_mass.col2.y = _loc_10 + _loc_11 + _loc_6 * _loc_6 * _loc_12 + _loc_8 * _loc_8 * _loc_13;
            m_mass.col3.y = _loc_6 * _loc_12 + _loc_8 * _loc_13;
            m_mass.col1.z = m_mass.col3.x;
            m_mass.col2.z = m_mass.col3.y;
            m_mass.col3.z = _loc_12 + _loc_13;
            m_motorMass = 1 / (_loc_12 + _loc_13);
            if (m_enableMotor == false)
            {
                m_motorImpulse = 0;
            }
            if (m_enableLimit)
            {
                _loc_14 = _loc_3.m_sweep.a - _loc_2.m_sweep.a - m_referenceAngle;
                if (b2Math.Abs(m_upperAngle - m_lowerAngle) < 2 * b2Settings.b2_angularSlop)
                {
                    m_limitState = e_equalLimits;
                }
                else if (_loc_14 <= m_lowerAngle)
                {
                    if (m_limitState != e_atLowerLimit)
                    {
                        m_impulse.z = 0;
                    }
                    m_limitState = e_atLowerLimit;
                }
                else if (_loc_14 >= m_upperAngle)
                {
                    if (m_limitState != e_atUpperLimit)
                    {
                        m_impulse.z = 0;
                    }
                    m_limitState = e_atUpperLimit;
                }
                else
                {
                    m_limitState = e_inactiveLimit;
                    m_impulse.z = 0;
                }
            }
            else
            {
                m_limitState = e_inactiveLimit;
            }
            if (param1.warmStarting)
            {
                m_impulse.x = m_impulse.x * param1.dtRatio;
                m_impulse.y = m_impulse.y * param1.dtRatio;
                m_motorImpulse = m_motorImpulse * param1.dtRatio;
                _loc_15 = m_impulse.x;
                _loc_16 = m_impulse.y;
                _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x - _loc_10 * _loc_15;
                _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y - _loc_10 * _loc_16;
                _loc_2.m_angularVelocity = _loc_2.m_angularVelocity - _loc_12 * (_loc_6 * _loc_16 - _loc_7 * _loc_15 + m_motorImpulse + m_impulse.z);
                _loc_3.m_linearVelocity.x = _loc_3.m_linearVelocity.x + _loc_11 * _loc_15;
                _loc_3.m_linearVelocity.y = _loc_3.m_linearVelocity.y + _loc_11 * _loc_16;
                _loc_3.m_angularVelocity = _loc_3.m_angularVelocity + _loc_13 * (_loc_8 * _loc_16 - _loc_9 * _loc_15 + m_motorImpulse + m_impulse.z);
            }
            else
            {
                m_impulse.SetZero();
                m_motorImpulse = 0;
            }
            return;
        }// end function

        public function EnableLimit(param1:Boolean) : void
        {
            m_enableLimit = param1;
            return;
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            return param1 * m_impulse.z;
        }// end function

        public function IsLimitEnabled() : Boolean
        {
            return m_enableLimit;
        }// end function

        public function IsMotorEnabled() : Boolean
        {
            m_bodyA.SetAwake(true);
            m_bodyB.SetAwake(true);
            return m_enableMotor;
        }// end function

        public function SetLimits(param1:Number, param2:Number) : void
        {
            m_lowerAngle = param1;
            m_upperAngle = param2;
            return;
        }// end function

    }
}
