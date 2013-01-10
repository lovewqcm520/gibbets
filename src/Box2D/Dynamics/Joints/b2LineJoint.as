package Box2D.Dynamics.Joints
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2LineJoint extends b2Joint
    {
        private var m_a1:Number;
        private var m_a2:Number;
        private var m_perp:b2Vec2;
        private var m_lowerTranslation:Number;
        var m_localXAxis1:b2Vec2;
        private var m_impulse:b2Vec2;
        private var m_enableLimit:Boolean;
        private var m_maxMotorForce:Number;
        private var m_localYAxis1:b2Vec2;
        private var m_s2:Number;
        private var m_axis:b2Vec2;
        private var m_motorMass:Number;
        private var m_s1:Number;
        private var m_upperTranslation:Number;
        var m_localAnchor1:b2Vec2;
        var m_localAnchor2:b2Vec2;
        private var m_limitState:int;
        private var m_motorImpulse:Number;
        private var m_motorSpeed:Number;
        private var m_enableMotor:Boolean;
        private var m_K:b2Mat22;

        public function b2LineJoint(param1:b2LineJointDef)
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            m_localAnchor1 = new b2Vec2();
            m_localAnchor2 = new b2Vec2();
            m_localXAxis1 = new b2Vec2();
            m_localYAxis1 = new b2Vec2();
            m_axis = new b2Vec2();
            m_perp = new b2Vec2();
            m_K = new b2Mat22();
            m_impulse = new b2Vec2();
            super(param1);
            m_localAnchor1.SetV(param1.localAnchorA);
            m_localAnchor2.SetV(param1.localAnchorB);
            m_localXAxis1.SetV(param1.localAxisA);
            m_localYAxis1.x = -m_localXAxis1.y;
            m_localYAxis1.y = m_localXAxis1.x;
            m_impulse.SetZero();
            m_motorMass = 0;
            m_motorImpulse = 0;
            m_lowerTranslation = param1.lowerTranslation;
            m_upperTranslation = param1.upperTranslation;
            m_maxMotorForce = param1.maxMotorForce;
            m_motorSpeed = param1.motorSpeed;
            m_enableLimit = param1.enableLimit;
            m_enableMotor = param1.enableMotor;
            m_limitState = e_inactiveLimit;
            m_axis.SetZero();
            m_perp.SetZero();
            return;
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:b2Vec2 = null;
            var _loc_19:b2Vec2 = null;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_2:* = m_bodyA;
            var _loc_3:* = m_bodyB;
            var _loc_4:* = _loc_2.m_linearVelocity;
            var _loc_5:* = _loc_2.m_angularVelocity;
            var _loc_6:* = _loc_3.m_linearVelocity;
            var _loc_7:* = _loc_3.m_angularVelocity;
            if (m_enableMotor && m_limitState != e_equalLimits)
            {
                _loc_13 = m_axis.x * (_loc_6.x - _loc_4.x) + m_axis.y * (_loc_6.y - _loc_4.y) + m_a2 * _loc_7 - m_a1 * _loc_5;
                _loc_14 = m_motorMass * (m_motorSpeed - _loc_13);
                _loc_15 = m_motorImpulse;
                _loc_16 = param1.dt * m_maxMotorForce;
                m_motorImpulse = b2Math.Clamp(m_motorImpulse + _loc_14, -_loc_16, _loc_16);
                _loc_14 = m_motorImpulse - _loc_15;
                _loc_8 = _loc_14 * m_axis.x;
                _loc_9 = _loc_14 * m_axis.y;
                _loc_10 = _loc_14 * m_a1;
                _loc_11 = _loc_14 * m_a2;
                _loc_4.x = _loc_4.x - m_invMassA * _loc_8;
                _loc_4.y = _loc_4.y - m_invMassA * _loc_9;
                _loc_5 = _loc_5 - m_invIA * _loc_10;
                _loc_6.x = _loc_6.x + m_invMassB * _loc_8;
                _loc_6.y = _loc_6.y + m_invMassB * _loc_9;
                _loc_7 = _loc_7 + m_invIB * _loc_11;
            }
            var _loc_12:* = m_perp.x * (_loc_6.x - _loc_4.x) + m_perp.y * (_loc_6.y - _loc_4.y) + m_s2 * _loc_7 - m_s1 * _loc_5;
            if (m_enableLimit && m_limitState != e_inactiveLimit)
            {
                _loc_17 = m_axis.x * (_loc_6.x - _loc_4.x) + m_axis.y * (_loc_6.y - _loc_4.y) + m_a2 * _loc_7 - m_a1 * _loc_5;
                _loc_18 = m_impulse.Copy();
                _loc_19 = m_K.Solve(new b2Vec2(), -_loc_12, -_loc_17);
                m_impulse.Add(_loc_19);
                if (m_limitState == e_atLowerLimit)
                {
                    m_impulse.y = b2Math.Max(m_impulse.y, 0);
                }
                else if (m_limitState == e_atUpperLimit)
                {
                    m_impulse.y = b2Math.Min(m_impulse.y, 0);
                }
                _loc_20 = -_loc_12 - (m_impulse.y - _loc_18.y) * m_K.col2.x;
                if (m_K.col1.x != 0)
                {
                    _loc_21 = _loc_20 / m_K.col1.x + _loc_18.x;
                }
                else
                {
                    _loc_21 = _loc_18.x;
                }
                m_impulse.x = _loc_21;
                _loc_19.x = m_impulse.x - _loc_18.x;
                _loc_19.y = m_impulse.y - _loc_18.y;
                _loc_8 = _loc_19.x * m_perp.x + _loc_19.y * m_axis.x;
                _loc_9 = _loc_19.x * m_perp.y + _loc_19.y * m_axis.y;
                _loc_10 = _loc_19.x * m_s1 + _loc_19.y * m_a1;
                _loc_11 = _loc_19.x * m_s2 + _loc_19.y * m_a2;
                _loc_4.x = _loc_4.x - m_invMassA * _loc_8;
                _loc_4.y = _loc_4.y - m_invMassA * _loc_9;
                _loc_5 = _loc_5 - m_invIA * _loc_10;
                _loc_6.x = _loc_6.x + m_invMassB * _loc_8;
                _loc_6.y = _loc_6.y + m_invMassB * _loc_9;
                _loc_7 = _loc_7 + m_invIB * _loc_11;
            }
            else
            {
                if (m_K.col1.x != 0)
                {
                    _loc_22 = (-_loc_12) / m_K.col1.x;
                }
                else
                {
                    _loc_22 = 0;
                }
                m_impulse.x = m_impulse.x + _loc_22;
                _loc_8 = _loc_22 * m_perp.x;
                _loc_9 = _loc_22 * m_perp.y;
                _loc_10 = _loc_22 * m_s1;
                _loc_11 = _loc_22 * m_s2;
                _loc_4.x = _loc_4.x - m_invMassA * _loc_8;
                _loc_4.y = _loc_4.y - m_invMassA * _loc_9;
                _loc_5 = _loc_5 - m_invIA * _loc_10;
                _loc_6.x = _loc_6.x + m_invMassB * _loc_8;
                _loc_6.y = _loc_6.y + m_invMassB * _loc_9;
                _loc_7 = _loc_7 + m_invIB * _loc_11;
            }
            _loc_2.m_linearVelocity.SetV(_loc_4);
            _loc_2.m_angularVelocity = _loc_5;
            _loc_3.m_linearVelocity.SetV(_loc_6);
            _loc_3.m_angularVelocity = _loc_7;
            return;
        }// end function

        public function GetUpperLimit() : Number
        {
            return m_upperTranslation;
        }// end function

        public function GetLowerLimit() : Number
        {
            return m_lowerTranslation;
        }// end function

        public function EnableMotor(param1:Boolean) : void
        {
            m_bodyA.SetAwake(true);
            m_bodyB.SetAwake(true);
            m_enableMotor = param1;
            return;
        }// end function

        override public function GetAnchorA() : b2Vec2
        {
            return m_bodyA.GetWorldPoint(m_localAnchor1);
        }// end function

        override public function GetAnchorB() : b2Vec2
        {
            return m_bodyB.GetWorldPoint(m_localAnchor2);
        }// end function

        public function GetJointTranslation() : Number
        {
            var _loc_3:b2Mat22 = null;
            var _loc_1:* = m_bodyA;
            var _loc_2:* = m_bodyB;
            var _loc_4:* = _loc_1.GetWorldPoint(m_localAnchor1);
            var _loc_5:* = _loc_2.GetWorldPoint(m_localAnchor2);
            var _loc_6:* = _loc_2.GetWorldPoint(m_localAnchor2).x - _loc_4.x;
            var _loc_7:* = _loc_5.y - _loc_4.y;
            var _loc_8:* = _loc_1.GetWorldVector(m_localXAxis1);
            var _loc_9:* = _loc_1.GetWorldVector(m_localXAxis1).x * _loc_6 + _loc_8.y * _loc_7;
            return _loc_1.GetWorldVector(m_localXAxis1).x * _loc_6 + _loc_8.y * _loc_7;
        }// end function

        public function GetMotorSpeed() : Number
        {
            return m_motorSpeed;
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * (m_impulse.x * m_perp.x + (m_motorImpulse + m_impulse.y) * m_axis.x), param1 * (m_impulse.x * m_perp.y + (m_motorImpulse + m_impulse.y) * m_axis.y));
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_10:b2Mat22 = null;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_34:Number = NaN;
            var _loc_35:Number = NaN;
            var _loc_36:Number = NaN;
            var _loc_4:* = m_bodyA;
            var _loc_5:* = m_bodyB;
            var _loc_6:* = _loc_4.m_sweep.c;
            var _loc_7:* = _loc_4.m_sweep.a;
            var _loc_8:* = _loc_5.m_sweep.c;
            var _loc_9:* = _loc_5.m_sweep.a;
            var _loc_16:Number = 0;
            var _loc_17:Number = 0;
            var _loc_18:Boolean = false;
            var _loc_19:Number = 0;
            var _loc_20:* = b2Mat22.FromAngle(_loc_7);
            var _loc_21:* = b2Mat22.FromAngle(_loc_9);
            _loc_10 = _loc_20;
            var _loc_22:* = m_localAnchor1.x - m_localCenterA.x;
            var _loc_23:* = m_localAnchor1.y - m_localCenterA.y;
            _loc_11 = _loc_10.col1.x * _loc_22 + _loc_10.col2.x * _loc_23;
            _loc_23 = _loc_10.col1.y * _loc_22 + _loc_10.col2.y * _loc_23;
            _loc_22 = _loc_11;
            _loc_10 = _loc_21;
            var _loc_24:* = m_localAnchor2.x - m_localCenterB.x;
            var _loc_25:* = m_localAnchor2.y - m_localCenterB.y;
            _loc_11 = _loc_10.col1.x * _loc_24 + _loc_10.col2.x * _loc_25;
            _loc_25 = _loc_10.col1.y * _loc_24 + _loc_10.col2.y * _loc_25;
            _loc_24 = _loc_11;
            var _loc_26:* = _loc_8.x + _loc_24 - _loc_6.x - _loc_22;
            var _loc_27:* = _loc_8.y + _loc_25 - _loc_6.y - _loc_23;
            if (m_enableLimit)
            {
                m_axis = b2Math.MulMV(_loc_20, m_localXAxis1);
                m_a1 = (_loc_26 + _loc_22) * m_axis.y - (_loc_27 + _loc_23) * m_axis.x;
                m_a2 = _loc_24 * m_axis.y - _loc_25 * m_axis.x;
                _loc_34 = m_axis.x * _loc_26 + m_axis.y * _loc_27;
                if (b2Math.Abs(m_upperTranslation - m_lowerTranslation) < 2 * b2Settings.b2_linearSlop)
                {
                    _loc_19 = b2Math.Clamp(_loc_34, -b2Settings.b2_maxLinearCorrection, b2Settings.b2_maxLinearCorrection);
                    _loc_16 = b2Math.Abs(_loc_34);
                    _loc_18 = true;
                }
                else if (_loc_34 <= m_lowerTranslation)
                {
                    _loc_19 = b2Math.Clamp(_loc_34 - m_lowerTranslation + b2Settings.b2_linearSlop, -b2Settings.b2_maxLinearCorrection, 0);
                    _loc_16 = m_lowerTranslation - _loc_34;
                    _loc_18 = true;
                }
                else if (_loc_34 >= m_upperTranslation)
                {
                    _loc_19 = b2Math.Clamp(_loc_34 - m_upperTranslation + b2Settings.b2_linearSlop, 0, b2Settings.b2_maxLinearCorrection);
                    _loc_16 = _loc_34 - m_upperTranslation;
                    _loc_18 = true;
                }
            }
            m_perp = b2Math.MulMV(_loc_20, m_localYAxis1);
            m_s1 = (_loc_26 + _loc_22) * m_perp.y - (_loc_27 + _loc_23) * m_perp.x;
            m_s2 = _loc_24 * m_perp.y - _loc_25 * m_perp.x;
            var _loc_28:* = new b2Vec2();
            var _loc_29:* = m_perp.x * _loc_26 + m_perp.y * _loc_27;
            _loc_16 = b2Math.Max(_loc_16, b2Math.Abs(_loc_29));
            _loc_17 = 0;
            if (_loc_18)
            {
                _loc_12 = m_invMassA;
                _loc_13 = m_invMassB;
                _loc_14 = m_invIA;
                _loc_15 = m_invIB;
                m_K.col1.x = _loc_12 + _loc_13 + _loc_14 * m_s1 * m_s1 + _loc_15 * m_s2 * m_s2;
                m_K.col1.y = _loc_14 * m_s1 * m_a1 + _loc_15 * m_s2 * m_a2;
                m_K.col2.x = m_K.col1.y;
                m_K.col2.y = _loc_12 + _loc_13 + _loc_14 * m_a1 * m_a1 + _loc_15 * m_a2 * m_a2;
                m_K.Solve(_loc_28, -_loc_29, -_loc_19);
            }
            else
            {
                _loc_12 = m_invMassA;
                _loc_13 = m_invMassB;
                _loc_14 = m_invIA;
                _loc_15 = m_invIB;
                _loc_35 = _loc_12 + _loc_13 + _loc_14 * m_s1 * m_s1 + _loc_15 * m_s2 * m_s2;
                if (_loc_35 != 0)
                {
                    _loc_36 = (-_loc_29) / _loc_35;
                }
                else
                {
                    _loc_36 = 0;
                }
                _loc_28.x = _loc_36;
                _loc_28.y = 0;
            }
            var _loc_30:* = _loc_28.x * m_perp.x + _loc_28.y * m_axis.x;
            var _loc_31:* = _loc_28.x * m_perp.y + _loc_28.y * m_axis.y;
            var _loc_32:* = _loc_28.x * m_s1 + _loc_28.y * m_a1;
            var _loc_33:* = _loc_28.x * m_s2 + _loc_28.y * m_a2;
            _loc_6.x = _loc_6.x - m_invMassA * _loc_30;
            _loc_6.y = _loc_6.y - m_invMassA * _loc_31;
            _loc_7 = _loc_7 - m_invIA * _loc_32;
            _loc_8.x = _loc_8.x + m_invMassB * _loc_30;
            _loc_8.y = _loc_8.y + m_invMassB * _loc_31;
            _loc_9 = _loc_9 + m_invIB * _loc_33;
            _loc_4.m_sweep.a = _loc_7;
            _loc_5.m_sweep.a = _loc_9;
            _loc_4.SynchronizeTransform();
            _loc_5.SynchronizeTransform();
            return _loc_16 <= b2Settings.b2_linearSlop && _loc_17 <= b2Settings.b2_angularSlop;
        }// end function

        public function SetMotorSpeed(param1:Number) : void
        {
            m_bodyA.SetAwake(true);
            m_bodyB.SetAwake(true);
            m_motorSpeed = param1;
            return;
        }// end function

        public function GetJointSpeed() : Number
        {
            var _loc_3:b2Mat22 = null;
            var _loc_1:* = m_bodyA;
            var _loc_2:* = m_bodyB;
            _loc_3 = _loc_1.m_xf.R;
            var _loc_4:* = m_localAnchor1.x - _loc_1.m_sweep.localCenter.x;
            var _loc_5:* = m_localAnchor1.y - _loc_1.m_sweep.localCenter.y;
            var _loc_6:* = _loc_3.col1.x * _loc_4 + _loc_3.col2.x * _loc_5;
            _loc_5 = _loc_3.col1.y * _loc_4 + _loc_3.col2.y * _loc_5;
            _loc_4 = _loc_6;
            _loc_3 = _loc_2.m_xf.R;
            var _loc_7:* = m_localAnchor2.x - _loc_2.m_sweep.localCenter.x;
            var _loc_8:* = m_localAnchor2.y - _loc_2.m_sweep.localCenter.y;
            _loc_6 = _loc_3.col1.x * _loc_7 + _loc_3.col2.x * _loc_8;
            _loc_8 = _loc_3.col1.y * _loc_7 + _loc_3.col2.y * _loc_8;
            _loc_7 = _loc_6;
            var _loc_9:* = _loc_1.m_sweep.c.x + _loc_4;
            var _loc_10:* = _loc_1.m_sweep.c.y + _loc_5;
            var _loc_11:* = _loc_2.m_sweep.c.x + _loc_7;
            var _loc_12:* = _loc_2.m_sweep.c.y + _loc_8;
            var _loc_13:* = _loc_11 - _loc_9;
            var _loc_14:* = _loc_12 - _loc_10;
            var _loc_15:* = _loc_1.GetWorldVector(m_localXAxis1);
            var _loc_16:* = _loc_1.m_linearVelocity;
            var _loc_17:* = _loc_2.m_linearVelocity;
            var _loc_18:* = _loc_1.m_angularVelocity;
            var _loc_19:* = _loc_2.m_angularVelocity;
            var _loc_20:* = _loc_13 * ((-_loc_18) * _loc_15.y) + _loc_14 * (_loc_18 * _loc_15.x) + (_loc_15.x * (_loc_17.x + (-_loc_19) * _loc_8 - _loc_16.x - (-_loc_18) * _loc_5) + _loc_15.y * (_loc_17.y + _loc_19 * _loc_7 - _loc_16.y - _loc_18 * _loc_4));
            return _loc_13 * ((-_loc_18) * _loc_15.y) + _loc_14 * (_loc_18 * _loc_15.x) + (_loc_15.x * (_loc_17.x + (-_loc_19) * _loc_8 - _loc_16.x - (-_loc_18) * _loc_5) + _loc_15.y * (_loc_17.y + _loc_19 * _loc_7 - _loc_16.y - _loc_18 * _loc_4));
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_4:b2Mat22 = null;
            var _loc_5:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_2:* = m_bodyA;
            var _loc_3:* = m_bodyB;
            m_localCenterA.SetV(_loc_2.GetLocalCenter());
            m_localCenterB.SetV(_loc_3.GetLocalCenter());
            var _loc_6:* = _loc_2.GetTransform();
            var _loc_7:* = _loc_3.GetTransform();
            _loc_4 = _loc_2.m_xf.R;
            var _loc_8:* = m_localAnchor1.x - m_localCenterA.x;
            var _loc_9:* = m_localAnchor1.y - m_localCenterA.y;
            _loc_5 = _loc_4.col1.x * _loc_8 + _loc_4.col2.x * _loc_9;
            _loc_9 = _loc_4.col1.y * _loc_8 + _loc_4.col2.y * _loc_9;
            _loc_8 = _loc_5;
            _loc_4 = _loc_3.m_xf.R;
            var _loc_10:* = m_localAnchor2.x - m_localCenterB.x;
            var _loc_11:* = m_localAnchor2.y - m_localCenterB.y;
            _loc_5 = _loc_4.col1.x * _loc_10 + _loc_4.col2.x * _loc_11;
            _loc_11 = _loc_4.col1.y * _loc_10 + _loc_4.col2.y * _loc_11;
            _loc_10 = _loc_5;
            var _loc_12:* = _loc_3.m_sweep.c.x + _loc_10 - _loc_2.m_sweep.c.x - _loc_8;
            var _loc_13:* = _loc_3.m_sweep.c.y + _loc_11 - _loc_2.m_sweep.c.y - _loc_9;
            m_invMassA = _loc_2.m_invMass;
            m_invMassB = _loc_3.m_invMass;
            m_invIA = _loc_2.m_invI;
            m_invIB = _loc_3.m_invI;
            m_axis.SetV(b2Math.MulMV(_loc_6.R, m_localXAxis1));
            m_a1 = (_loc_12 + _loc_8) * m_axis.y - (_loc_13 + _loc_9) * m_axis.x;
            m_a2 = _loc_10 * m_axis.y - _loc_11 * m_axis.x;
            m_motorMass = m_invMassA + m_invMassB + m_invIA * m_a1 * m_a1 + m_invIB * m_a2 * m_a2;
            m_motorMass = m_motorMass > Number.MIN_VALUE ? (1 / m_motorMass) : (0);
            m_perp.SetV(b2Math.MulMV(_loc_6.R, m_localYAxis1));
            m_s1 = (_loc_12 + _loc_8) * m_perp.y - (_loc_13 + _loc_9) * m_perp.x;
            m_s2 = _loc_10 * m_perp.y - _loc_11 * m_perp.x;
            var _loc_14:* = m_invMassA;
            var _loc_15:* = m_invMassB;
            var _loc_16:* = m_invIA;
            var _loc_17:* = m_invIB;
            m_K.col1.x = _loc_14 + _loc_15 + _loc_16 * m_s1 * m_s1 + _loc_17 * m_s2 * m_s2;
            m_K.col1.y = _loc_16 * m_s1 * m_a1 + _loc_17 * m_s2 * m_a2;
            m_K.col2.x = m_K.col1.y;
            m_K.col2.y = _loc_14 + _loc_15 + _loc_16 * m_a1 * m_a1 + _loc_17 * m_a2 * m_a2;
            if (m_enableLimit)
            {
                _loc_18 = m_axis.x * _loc_12 + m_axis.y * _loc_13;
                if (b2Math.Abs(m_upperTranslation - m_lowerTranslation) < 2 * b2Settings.b2_linearSlop)
                {
                    m_limitState = e_equalLimits;
                }
                else if (_loc_18 <= m_lowerTranslation)
                {
                    if (m_limitState != e_atLowerLimit)
                    {
                        m_limitState = e_atLowerLimit;
                        m_impulse.y = 0;
                    }
                }
                else if (_loc_18 >= m_upperTranslation)
                {
                    if (m_limitState != e_atUpperLimit)
                    {
                        m_limitState = e_atUpperLimit;
                        m_impulse.y = 0;
                    }
                }
                else
                {
                    m_limitState = e_inactiveLimit;
                    m_impulse.y = 0;
                }
            }
            else
            {
                m_limitState = e_inactiveLimit;
            }
            if (m_enableMotor == false)
            {
                m_motorImpulse = 0;
            }
            if (param1.warmStarting)
            {
                m_impulse.x = m_impulse.x * param1.dtRatio;
                m_impulse.y = m_impulse.y * param1.dtRatio;
                m_motorImpulse = m_motorImpulse * param1.dtRatio;
                _loc_19 = m_impulse.x * m_perp.x + (m_motorImpulse + m_impulse.y) * m_axis.x;
                _loc_20 = m_impulse.x * m_perp.y + (m_motorImpulse + m_impulse.y) * m_axis.y;
                _loc_21 = m_impulse.x * m_s1 + (m_motorImpulse + m_impulse.y) * m_a1;
                _loc_22 = m_impulse.x * m_s2 + (m_motorImpulse + m_impulse.y) * m_a2;
                _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x - m_invMassA * _loc_19;
                _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y - m_invMassA * _loc_20;
                _loc_2.m_angularVelocity = _loc_2.m_angularVelocity - m_invIA * _loc_21;
                _loc_3.m_linearVelocity.x = _loc_3.m_linearVelocity.x + m_invMassB * _loc_19;
                _loc_3.m_linearVelocity.y = _loc_3.m_linearVelocity.y + m_invMassB * _loc_20;
                _loc_3.m_angularVelocity = _loc_3.m_angularVelocity + m_invIB * _loc_22;
            }
            else
            {
                m_impulse.SetZero();
                m_motorImpulse = 0;
            }
            return;
        }// end function

        public function GetMotorForce() : Number
        {
            return m_motorImpulse;
        }// end function

        public function SetMaxMotorForce(param1:Number) : void
        {
            m_bodyA.SetAwake(true);
            m_bodyB.SetAwake(true);
            m_maxMotorForce = param1;
            return;
        }// end function

        public function EnableLimit(param1:Boolean) : void
        {
            m_bodyA.SetAwake(true);
            m_bodyB.SetAwake(true);
            m_enableLimit = param1;
            return;
        }// end function

        public function GetMaxMotorForce() : Number
        {
            return m_maxMotorForce;
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            return param1 * m_impulse.y;
        }// end function

        public function IsLimitEnabled() : Boolean
        {
            return m_enableLimit;
        }// end function

        public function IsMotorEnabled() : Boolean
        {
            return m_enableMotor;
        }// end function

        public function SetLimits(param1:Number, param2:Number) : void
        {
            m_bodyA.SetAwake(true);
            m_bodyB.SetAwake(true);
            m_lowerTranslation = param1;
            m_upperTranslation = param2;
            return;
        }// end function

    }
}
