package Box2D.Dynamics.Joints
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2GearJoint extends b2Joint
    {
        private var m_ground2:b2Body;
        private var m_groundAnchor1:b2Vec2;
        private var m_groundAnchor2:b2Vec2;
        private var m_localAnchor1:b2Vec2;
        private var m_localAnchor2:b2Vec2;
        private var m_ratio:Number;
        private var m_mass:Number;
        private var m_impulse:Number;
        private var m_prismatic2:b2PrismaticJoint;
        private var m_ground1:b2Body;
        private var m_revolute1:b2RevoluteJoint;
        private var m_revolute2:b2RevoluteJoint;
        private var m_prismatic1:b2PrismaticJoint;
        private var m_constant:Number;
        private var m_J:b2Jacobian;

        public function b2GearJoint(param1:b2GearJointDef)
        {
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            m_groundAnchor1 = new b2Vec2();
            m_groundAnchor2 = new b2Vec2();
            m_localAnchor1 = new b2Vec2();
            m_localAnchor2 = new b2Vec2();
            m_J = new b2Jacobian();
            super(param1);
            var _loc_2:* = param1.joint1.m_type;
            var _loc_3:* = param1.joint2.m_type;
            m_revolute1 = null;
            m_prismatic1 = null;
            m_revolute2 = null;
            m_prismatic2 = null;
            m_ground1 = param1.joint1.GetBodyA();
            m_bodyA = param1.joint1.GetBodyB();
            if (_loc_2 == b2Joint.e_revoluteJoint)
            {
                m_revolute1 = param1.joint1 as b2RevoluteJoint;
                m_groundAnchor1.SetV(m_revolute1.m_localAnchor1);
                m_localAnchor1.SetV(m_revolute1.m_localAnchor2);
                _loc_4 = m_revolute1.GetJointAngle();
            }
            else
            {
                m_prismatic1 = param1.joint1 as b2PrismaticJoint;
                m_groundAnchor1.SetV(m_prismatic1.m_localAnchor1);
                m_localAnchor1.SetV(m_prismatic1.m_localAnchor2);
                _loc_4 = m_prismatic1.GetJointTranslation();
            }
            m_ground2 = param1.joint2.GetBodyA();
            m_bodyB = param1.joint2.GetBodyB();
            if (_loc_3 == b2Joint.e_revoluteJoint)
            {
                m_revolute2 = param1.joint2 as b2RevoluteJoint;
                m_groundAnchor2.SetV(m_revolute2.m_localAnchor1);
                m_localAnchor2.SetV(m_revolute2.m_localAnchor2);
                _loc_5 = m_revolute2.GetJointAngle();
            }
            else
            {
                m_prismatic2 = param1.joint2 as b2PrismaticJoint;
                m_groundAnchor2.SetV(m_prismatic2.m_localAnchor1);
                m_localAnchor2.SetV(m_prismatic2.m_localAnchor2);
                _loc_5 = m_prismatic2.GetJointTranslation();
            }
            m_ratio = param1.ratio;
            m_constant = _loc_4 + m_ratio * _loc_5;
            m_impulse = 0;
            return;
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_4:b2Body = null;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:b2Mat22 = null;
            var _loc_11:b2Vec2 = null;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_2:* = m_ground1;
            var _loc_3:* = m_ground2;
            _loc_4 = m_bodyA;
            var _loc_5:* = m_bodyB;
            var _loc_14:Number = 0;
            m_J.SetZero();
            if (m_revolute1)
            {
                m_J.angularA = -1;
                _loc_14 = _loc_14 + _loc_4.m_invI;
            }
            else
            {
                _loc_10 = _loc_2.m_xf.R;
                _loc_11 = m_prismatic1.m_localXAxis1;
                _loc_6 = _loc_10.col1.x * _loc_11.x + _loc_10.col2.x * _loc_11.y;
                _loc_7 = _loc_10.col1.y * _loc_11.x + _loc_10.col2.y * _loc_11.y;
                _loc_10 = _loc_4.m_xf.R;
                _loc_8 = m_localAnchor1.x - _loc_4.m_sweep.localCenter.x;
                _loc_9 = m_localAnchor1.y - _loc_4.m_sweep.localCenter.y;
                _loc_13 = _loc_10.col1.x * _loc_8 + _loc_10.col2.x * _loc_9;
                _loc_9 = _loc_10.col1.y * _loc_8 + _loc_10.col2.y * _loc_9;
                _loc_8 = _loc_13;
                _loc_12 = _loc_8 * _loc_7 - _loc_9 * _loc_6;
                m_J.linearA.Set(-_loc_6, -_loc_7);
                m_J.angularA = -_loc_12;
                _loc_14 = _loc_14 + (_loc_4.m_invMass + _loc_4.m_invI * _loc_12 * _loc_12);
            }
            if (m_revolute2)
            {
                m_J.angularB = -m_ratio;
                _loc_14 = _loc_14 + m_ratio * m_ratio * _loc_5.m_invI;
            }
            else
            {
                _loc_10 = _loc_3.m_xf.R;
                _loc_11 = m_prismatic2.m_localXAxis1;
                _loc_6 = _loc_10.col1.x * _loc_11.x + _loc_10.col2.x * _loc_11.y;
                _loc_7 = _loc_10.col1.y * _loc_11.x + _loc_10.col2.y * _loc_11.y;
                _loc_10 = _loc_5.m_xf.R;
                _loc_8 = m_localAnchor2.x - _loc_5.m_sweep.localCenter.x;
                _loc_9 = m_localAnchor2.y - _loc_5.m_sweep.localCenter.y;
                _loc_13 = _loc_10.col1.x * _loc_8 + _loc_10.col2.x * _loc_9;
                _loc_9 = _loc_10.col1.y * _loc_8 + _loc_10.col2.y * _loc_9;
                _loc_8 = _loc_13;
                _loc_12 = _loc_8 * _loc_7 - _loc_9 * _loc_6;
                m_J.linearB.Set((-m_ratio) * _loc_6, (-m_ratio) * _loc_7);
                m_J.angularB = (-m_ratio) * _loc_12;
                _loc_14 = _loc_14 + m_ratio * m_ratio * (_loc_5.m_invMass + _loc_5.m_invI * _loc_12 * _loc_12);
            }
            m_mass = _loc_14 > 0 ? (1 / _loc_14) : (0);
            if (param1.warmStarting)
            {
                _loc_4.m_linearVelocity.x = _loc_4.m_linearVelocity.x + _loc_4.m_invMass * m_impulse * m_J.linearA.x;
                _loc_4.m_linearVelocity.y = _loc_4.m_linearVelocity.y + _loc_4.m_invMass * m_impulse * m_J.linearA.y;
                _loc_4.m_angularVelocity = _loc_4.m_angularVelocity + _loc_4.m_invI * m_impulse * m_J.angularA;
                _loc_5.m_linearVelocity.x = _loc_5.m_linearVelocity.x + _loc_5.m_invMass * m_impulse * m_J.linearB.x;
                _loc_5.m_linearVelocity.y = _loc_5.m_linearVelocity.y + _loc_5.m_invMass * m_impulse * m_J.linearB.y;
                _loc_5.m_angularVelocity = _loc_5.m_angularVelocity + _loc_5.m_invI * m_impulse * m_J.angularB;
            }
            else
            {
                m_impulse = 0;
            }
            return;
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:* = m_bodyA;
            var _loc_3:* = m_bodyB;
            var _loc_4:* = m_J.Compute(_loc_2.m_linearVelocity, _loc_2.m_angularVelocity, _loc_3.m_linearVelocity, _loc_3.m_angularVelocity);
            var _loc_5:* = (-m_mass) * _loc_4;
            m_impulse = m_impulse + _loc_5;
            _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x + _loc_2.m_invMass * _loc_5 * m_J.linearA.x;
            _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y + _loc_2.m_invMass * _loc_5 * m_J.linearA.y;
            _loc_2.m_angularVelocity = _loc_2.m_angularVelocity + _loc_2.m_invI * _loc_5 * m_J.angularA;
            _loc_3.m_linearVelocity.x = _loc_3.m_linearVelocity.x + _loc_3.m_invMass * _loc_5 * m_J.linearB.x;
            _loc_3.m_linearVelocity.y = _loc_3.m_linearVelocity.y + _loc_3.m_invMass * _loc_5 * m_J.linearB.y;
            _loc_3.m_angularVelocity = _loc_3.m_angularVelocity + _loc_3.m_invI * _loc_5 * m_J.angularB;
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

        public function SetRatio(param1:Number) : void
        {
            m_ratio = param1;
            return;
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * m_impulse * m_J.linearB.x, param1 * m_impulse * m_J.linearB.y);
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_2:Number = 0;
            var _loc_3:* = m_bodyA;
            var _loc_4:* = m_bodyB;
            if (m_revolute1)
            {
                _loc_5 = m_revolute1.GetJointAngle();
            }
            else
            {
                _loc_5 = m_prismatic1.GetJointTranslation();
            }
            if (m_revolute2)
            {
                _loc_6 = m_revolute2.GetJointAngle();
            }
            else
            {
                _loc_6 = m_prismatic2.GetJointTranslation();
            }
            var _loc_7:* = m_constant - (_loc_5 + m_ratio * _loc_6);
            var _loc_8:* = (-m_mass) * _loc_7;
            _loc_3.m_sweep.c.x = _loc_3.m_sweep.c.x + _loc_3.m_invMass * _loc_8 * m_J.linearA.x;
            _loc_3.m_sweep.c.y = _loc_3.m_sweep.c.y + _loc_3.m_invMass * _loc_8 * m_J.linearA.y;
            _loc_3.m_sweep.a = _loc_3.m_sweep.a + _loc_3.m_invI * _loc_8 * m_J.angularA;
            _loc_4.m_sweep.c.x = _loc_4.m_sweep.c.x + _loc_4.m_invMass * _loc_8 * m_J.linearB.x;
            _loc_4.m_sweep.c.y = _loc_4.m_sweep.c.y + _loc_4.m_invMass * _loc_8 * m_J.linearB.y;
            _loc_4.m_sweep.a = _loc_4.m_sweep.a + _loc_4.m_invI * _loc_8 * m_J.angularB;
            _loc_3.SynchronizeTransform();
            _loc_4.SynchronizeTransform();
            return _loc_2 < b2Settings.b2_linearSlop;
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            var _loc_2:* = m_bodyB.m_xf.R;
            var _loc_3:* = m_localAnchor1.x - m_bodyB.m_sweep.localCenter.x;
            var _loc_4:* = m_localAnchor1.y - m_bodyB.m_sweep.localCenter.y;
            var _loc_5:* = _loc_2.col1.x * _loc_3 + _loc_2.col2.x * _loc_4;
            _loc_4 = _loc_2.col1.y * _loc_3 + _loc_2.col2.y * _loc_4;
            _loc_3 = _loc_5;
            var _loc_6:* = m_impulse * m_J.linearB.x;
            var _loc_7:* = m_impulse * m_J.linearB.y;
            return param1 * (m_impulse * m_J.angularB - _loc_3 * _loc_7 + _loc_4 * _loc_6);
        }// end function

        public function GetRatio() : Number
        {
            return m_ratio;
        }// end function

    }
}
