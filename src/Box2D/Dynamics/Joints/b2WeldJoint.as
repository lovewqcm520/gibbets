package Box2D.Dynamics.Joints
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2WeldJoint extends b2Joint
    {
        private var m_impulse:b2Vec3;
        private var m_referenceAngle:Number;
        private var m_localAnchorA:b2Vec2;
        private var m_localAnchorB:b2Vec2;
        private var m_mass:b2Mat33;

        public function b2WeldJoint(param1:b2WeldJointDef)
        {
            m_localAnchorA = new b2Vec2();
            m_localAnchorB = new b2Vec2();
            m_impulse = new b2Vec3();
            m_mass = new b2Mat33();
            super(param1);
            m_localAnchorA.SetV(param1.localAnchorA);
            m_localAnchorB.SetV(param1.localAnchorB);
            m_referenceAngle = param1.referenceAngle;
            m_impulse.SetZero();
            m_mass = new b2Mat33();
            return;
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:* = m_bodyA;
            var _loc_5:* = m_bodyB;
            var _loc_6:* = _loc_4.m_linearVelocity;
            var _loc_7:* = _loc_4.m_angularVelocity;
            var _loc_8:* = _loc_5.m_linearVelocity;
            var _loc_9:* = _loc_5.m_angularVelocity;
            var _loc_10:* = _loc_4.m_invMass;
            var _loc_11:* = _loc_5.m_invMass;
            var _loc_12:* = _loc_4.m_invI;
            var _loc_13:* = _loc_5.m_invI;
            _loc_2 = _loc_4.m_xf.R;
            var _loc_14:* = m_localAnchorA.x - _loc_4.m_sweep.localCenter.x;
            var _loc_15:* = m_localAnchorA.y - _loc_4.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_14 + _loc_2.col2.x * _loc_15;
            _loc_15 = _loc_2.col1.y * _loc_14 + _loc_2.col2.y * _loc_15;
            _loc_14 = _loc_3;
            _loc_2 = _loc_5.m_xf.R;
            var _loc_16:* = m_localAnchorB.x - _loc_5.m_sweep.localCenter.x;
            var _loc_17:* = m_localAnchorB.y - _loc_5.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_16 + _loc_2.col2.x * _loc_17;
            _loc_17 = _loc_2.col1.y * _loc_16 + _loc_2.col2.y * _loc_17;
            _loc_16 = _loc_3;
            var _loc_18:* = _loc_8.x - _loc_9 * _loc_17 - _loc_6.x + _loc_7 * _loc_15;
            var _loc_19:* = _loc_8.y + _loc_9 * _loc_16 - _loc_6.y - _loc_7 * _loc_14;
            var _loc_20:* = _loc_9 - _loc_7;
            var _loc_21:* = new b2Vec3();
            m_mass.Solve33(_loc_21, -_loc_18, -_loc_19, -_loc_20);
            m_impulse.Add(_loc_21);
            _loc_6.x = _loc_6.x - _loc_10 * _loc_21.x;
            _loc_6.y = _loc_6.y - _loc_10 * _loc_21.y;
            _loc_7 = _loc_7 - _loc_12 * (_loc_14 * _loc_21.y - _loc_15 * _loc_21.x + _loc_21.z);
            _loc_8.x = _loc_8.x + _loc_11 * _loc_21.x;
            _loc_8.y = _loc_8.y + _loc_11 * _loc_21.y;
            _loc_9 = _loc_9 + _loc_13 * (_loc_16 * _loc_21.y - _loc_17 * _loc_21.x + _loc_21.z);
            _loc_4.m_angularVelocity = _loc_7;
            _loc_5.m_angularVelocity = _loc_9;
            return;
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            return param1 * m_impulse.z;
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * m_impulse.x, param1 * m_impulse.y);
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:* = m_bodyA;
            var _loc_5:* = m_bodyB;
            _loc_2 = _loc_4.m_xf.R;
            var _loc_6:* = m_localAnchorA.x - _loc_4.m_sweep.localCenter.x;
            var _loc_7:* = m_localAnchorA.y - _loc_4.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_6 + _loc_2.col2.x * _loc_7;
            _loc_7 = _loc_2.col1.y * _loc_6 + _loc_2.col2.y * _loc_7;
            _loc_6 = _loc_3;
            _loc_2 = _loc_5.m_xf.R;
            var _loc_8:* = m_localAnchorB.x - _loc_5.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchorB.y - _loc_5.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_8 + _loc_2.col2.x * _loc_9;
            _loc_9 = _loc_2.col1.y * _loc_8 + _loc_2.col2.y * _loc_9;
            _loc_8 = _loc_3;
            var _loc_10:* = _loc_4.m_invMass;
            var _loc_11:* = _loc_5.m_invMass;
            var _loc_12:* = _loc_4.m_invI;
            var _loc_13:* = _loc_5.m_invI;
            var _loc_14:* = _loc_5.m_sweep.c.x + _loc_8 - _loc_4.m_sweep.c.x - _loc_6;
            var _loc_15:* = _loc_5.m_sweep.c.y + _loc_9 - _loc_4.m_sweep.c.y - _loc_7;
            var _loc_16:* = _loc_5.m_sweep.a - _loc_4.m_sweep.a - m_referenceAngle;
            var _loc_17:* = 10 * b2Settings.b2_linearSlop;
            var _loc_18:* = Math.sqrt(_loc_14 * _loc_14 + _loc_15 * _loc_15);
            var _loc_19:* = b2Math.Abs(_loc_16);
            if (_loc_18 > _loc_17)
            {
                _loc_12 = _loc_12 * 1;
                _loc_13 = _loc_13 * 1;
            }
            m_mass.col1.x = _loc_10 + _loc_11 + _loc_7 * _loc_7 * _loc_12 + _loc_9 * _loc_9 * _loc_13;
            m_mass.col2.x = (-_loc_7) * _loc_6 * _loc_12 - _loc_9 * _loc_8 * _loc_13;
            m_mass.col3.x = (-_loc_7) * _loc_12 - _loc_9 * _loc_13;
            m_mass.col1.y = m_mass.col2.x;
            m_mass.col2.y = _loc_10 + _loc_11 + _loc_6 * _loc_6 * _loc_12 + _loc_8 * _loc_8 * _loc_13;
            m_mass.col3.y = _loc_6 * _loc_12 + _loc_8 * _loc_13;
            m_mass.col1.z = m_mass.col3.x;
            m_mass.col2.z = m_mass.col3.y;
            m_mass.col3.z = _loc_12 + _loc_13;
            var _loc_20:* = new b2Vec3();
            m_mass.Solve33(_loc_20, -_loc_14, -_loc_15, -_loc_16);
            _loc_4.m_sweep.c.x = _loc_4.m_sweep.c.x - _loc_10 * _loc_20.x;
            _loc_4.m_sweep.c.y = _loc_4.m_sweep.c.y - _loc_10 * _loc_20.y;
            _loc_4.m_sweep.a = _loc_4.m_sweep.a - _loc_12 * (_loc_6 * _loc_20.y - _loc_7 * _loc_20.x + _loc_20.z);
            _loc_5.m_sweep.c.x = _loc_5.m_sweep.c.x + _loc_11 * _loc_20.x;
            _loc_5.m_sweep.c.y = _loc_5.m_sweep.c.y + _loc_11 * _loc_20.y;
            _loc_5.m_sweep.a = _loc_5.m_sweep.a + _loc_13 * (_loc_8 * _loc_20.y - _loc_9 * _loc_20.x + _loc_20.z);
            _loc_4.SynchronizeTransform();
            _loc_5.SynchronizeTransform();
            return _loc_18 <= b2Settings.b2_linearSlop && _loc_19 <= b2Settings.b2_angularSlop;
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:b2Body = null;
            var _loc_5:b2Body = null;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            _loc_4 = m_bodyA;
            _loc_5 = m_bodyB;
            _loc_2 = _loc_4.m_xf.R;
            _loc_6 = m_localAnchorA.x - _loc_4.m_sweep.localCenter.x;
            _loc_7 = m_localAnchorA.y - _loc_4.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_6 + _loc_2.col2.x * _loc_7;
            _loc_7 = _loc_2.col1.y * _loc_6 + _loc_2.col2.y * _loc_7;
            _loc_6 = _loc_3;
            _loc_2 = _loc_5.m_xf.R;
            _loc_8 = m_localAnchorB.x - _loc_5.m_sweep.localCenter.x;
            _loc_9 = m_localAnchorB.y - _loc_5.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_8 + _loc_2.col2.x * _loc_9;
            _loc_9 = _loc_2.col1.y * _loc_8 + _loc_2.col2.y * _loc_9;
            _loc_8 = _loc_3;
            _loc_10 = _loc_4.m_invMass;
            _loc_11 = _loc_5.m_invMass;
            _loc_12 = _loc_4.m_invI;
            _loc_13 = _loc_5.m_invI;
            m_mass.col1.x = _loc_10 + _loc_11 + _loc_7 * _loc_7 * _loc_12 + _loc_9 * _loc_9 * _loc_13;
            m_mass.col2.x = (-_loc_7) * _loc_6 * _loc_12 - _loc_9 * _loc_8 * _loc_13;
            m_mass.col3.x = (-_loc_7) * _loc_12 - _loc_9 * _loc_13;
            m_mass.col1.y = m_mass.col2.x;
            m_mass.col2.y = _loc_10 + _loc_11 + _loc_6 * _loc_6 * _loc_12 + _loc_8 * _loc_8 * _loc_13;
            m_mass.col3.y = _loc_6 * _loc_12 + _loc_8 * _loc_13;
            m_mass.col1.z = m_mass.col3.x;
            m_mass.col2.z = m_mass.col3.y;
            m_mass.col3.z = _loc_12 + _loc_13;
            if (param1.warmStarting)
            {
                m_impulse.x = m_impulse.x * param1.dtRatio;
                m_impulse.y = m_impulse.y * param1.dtRatio;
                m_impulse.z = m_impulse.z * param1.dtRatio;
                _loc_4.m_linearVelocity.x = _loc_4.m_linearVelocity.x - _loc_10 * m_impulse.x;
                _loc_4.m_linearVelocity.y = _loc_4.m_linearVelocity.y - _loc_10 * m_impulse.y;
                _loc_4.m_angularVelocity = _loc_4.m_angularVelocity - _loc_12 * (_loc_6 * m_impulse.y - _loc_7 * m_impulse.x + m_impulse.z);
                _loc_5.m_linearVelocity.x = _loc_5.m_linearVelocity.x + _loc_11 * m_impulse.x;
                _loc_5.m_linearVelocity.y = _loc_5.m_linearVelocity.y + _loc_11 * m_impulse.y;
                _loc_5.m_angularVelocity = _loc_5.m_angularVelocity + _loc_13 * (_loc_8 * m_impulse.y - _loc_9 * m_impulse.x + m_impulse.z);
            }
            else
            {
                m_impulse.SetZero();
            }
            return;
        }// end function

        override public function GetAnchorA() : b2Vec2
        {
            return m_bodyA.GetWorldPoint(m_localAnchorA);
        }// end function

        override public function GetAnchorB() : b2Vec2
        {
            return m_bodyB.GetWorldPoint(m_localAnchorB);
        }// end function

    }
}
