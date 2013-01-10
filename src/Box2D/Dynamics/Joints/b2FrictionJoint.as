package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2FrictionJoint extends b2Joint
    {
        private var m_maxTorque:Number;
        private var m_angularImpulse:Number;
        public var m_linearMass:b2Mat22;
        private var m_localAnchorA:b2Vec2;
        private var m_localAnchorB:b2Vec2;
        public var m_angularMass:Number;
        private var m_maxForce:Number;
        private var m_linearImpulse:b2Vec2;

        public function b2FrictionJoint(param1:b2FrictionJointDef)
        {
            m_localAnchorA = new b2Vec2();
            m_localAnchorB = new b2Vec2();
            m_linearMass = new b2Mat22();
            m_linearImpulse = new b2Vec2();
            super(param1);
            m_localAnchorA.SetV(param1.localAnchorA);
            m_localAnchorB.SetV(param1.localAnchorB);
            m_linearMass.SetZero();
            m_angularMass = 0;
            m_linearImpulse.SetZero();
            m_angularImpulse = 0;
            m_maxForce = param1.maxForce;
            m_maxTorque = param1.maxTorque;
            return;
        }// end function

        public function SetMaxForce(param1:Number) : void
        {
            m_maxForce = param1;
            return;
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_4:b2Body = null;
            var _loc_5:b2Body = null;
            var _loc_6:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:b2Mat22 = null;
            var _loc_15:b2Vec2 = null;
            _loc_4 = m_bodyA;
            _loc_5 = m_bodyB;
            _loc_2 = _loc_4.m_xf.R;
            _loc_6 = m_localAnchorA.x - _loc_4.m_sweep.localCenter.x;
            var _loc_7:* = m_localAnchorA.y - _loc_4.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_6 + _loc_2.col2.x * _loc_7;
            _loc_7 = _loc_2.col1.y * _loc_6 + _loc_2.col2.y * _loc_7;
            _loc_6 = _loc_3;
            _loc_2 = _loc_5.m_xf.R;
            _loc_8 = m_localAnchorB.x - _loc_5.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchorB.y - _loc_5.m_sweep.localCenter.y;
            _loc_3 = _loc_2.col1.x * _loc_8 + _loc_2.col2.x * _loc_9;
            _loc_9 = _loc_2.col1.y * _loc_8 + _loc_2.col2.y * _loc_9;
            _loc_8 = _loc_3;
            _loc_10 = _loc_4.m_invMass;
            var _loc_11:* = _loc_5.m_invMass;
            _loc_12 = _loc_4.m_invI;
            _loc_13 = _loc_5.m_invI;
            _loc_14 = new b2Mat22();
            _loc_14.col1.x = _loc_10 + _loc_11;
            _loc_14.col2.x = 0;
            _loc_14.col1.y = 0;
            _loc_14.col2.y = _loc_10 + _loc_11;
            _loc_14.col1.x = _loc_14.col1.x + _loc_12 * _loc_7 * _loc_7;
            _loc_14.col2.x = _loc_14.col2.x + (-_loc_12) * _loc_6 * _loc_7;
            _loc_14.col1.y = _loc_14.col1.y + (-_loc_12) * _loc_6 * _loc_7;
            _loc_14.col2.y = _loc_14.col2.y + _loc_12 * _loc_6 * _loc_6;
            _loc_14.col1.x = _loc_14.col1.x + _loc_13 * _loc_9 * _loc_9;
            _loc_14.col2.x = _loc_14.col2.x + (-_loc_13) * _loc_8 * _loc_9;
            _loc_14.col1.y = _loc_14.col1.y + (-_loc_13) * _loc_8 * _loc_9;
            _loc_14.col2.y = _loc_14.col2.y + _loc_13 * _loc_8 * _loc_8;
            _loc_14.GetInverse(m_linearMass);
            m_angularMass = _loc_12 + _loc_13;
            if (m_angularMass > 0)
            {
                m_angularMass = 1 / m_angularMass;
            }
            if (param1.warmStarting)
            {
                m_linearImpulse.x = m_linearImpulse.x * param1.dtRatio;
                m_linearImpulse.y = m_linearImpulse.y * param1.dtRatio;
                m_angularImpulse = m_angularImpulse * param1.dtRatio;
                _loc_15 = m_linearImpulse;
                _loc_4.m_linearVelocity.x = _loc_4.m_linearVelocity.x - _loc_10 * _loc_15.x;
                _loc_4.m_linearVelocity.y = _loc_4.m_linearVelocity.y - _loc_10 * _loc_15.y;
                _loc_4.m_angularVelocity = _loc_4.m_angularVelocity - _loc_12 * (_loc_6 * _loc_15.y - _loc_7 * _loc_15.x + m_angularImpulse);
                _loc_5.m_linearVelocity.x = _loc_5.m_linearVelocity.x + _loc_11 * _loc_15.x;
                _loc_5.m_linearVelocity.y = _loc_5.m_linearVelocity.y + _loc_11 * _loc_15.y;
                _loc_5.m_angularVelocity = _loc_5.m_angularVelocity + _loc_13 * (_loc_8 * _loc_15.y - _loc_9 * _loc_15.x + m_angularImpulse);
            }
            else
            {
                m_linearImpulse.SetZero();
                m_angularImpulse = 0;
            }
            return;
        }// end function

        override public function GetAnchorB() : b2Vec2
        {
            return m_bodyB.GetWorldPoint(m_localAnchorB);
        }// end function

        override public function GetAnchorA() : b2Vec2
        {
            return m_bodyA.GetWorldPoint(m_localAnchorA);
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            return param1 * m_angularImpulse;
        }// end function

        public function SetMaxTorque(param1:Number) : void
        {
            m_maxTorque = param1;
            return;
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            return true;
        }// end function

        public function GetMaxTorque() : Number
        {
            return m_maxTorque;
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Mat22 = null;
            var _loc_3:Number = NaN;
            var _loc_18:Number = NaN;
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
            var _loc_19:* = _loc_9 - _loc_7;
            var _loc_20:* = (-m_angularMass) * _loc_19;
            var _loc_21:* = m_angularImpulse;
            _loc_18 = param1.dt * m_maxTorque;
            m_angularImpulse = b2Math.Clamp(m_angularImpulse + _loc_20, -_loc_18, _loc_18);
            _loc_20 = m_angularImpulse - _loc_21;
            _loc_7 = _loc_7 - _loc_12 * _loc_20;
            _loc_9 = _loc_9 + _loc_13 * _loc_20;
            var _loc_22:* = _loc_8.x - _loc_9 * _loc_17 - _loc_6.x + _loc_7 * _loc_15;
            var _loc_23:* = _loc_8.y + _loc_9 * _loc_16 - _loc_6.y - _loc_7 * _loc_14;
            var _loc_24:* = b2Math.MulMV(m_linearMass, new b2Vec2(-_loc_22, -_loc_23));
            var _loc_25:* = m_linearImpulse.Copy();
            m_linearImpulse.Add(_loc_24);
            _loc_18 = param1.dt * m_maxForce;
            if (m_linearImpulse.LengthSquared() > _loc_18 * _loc_18)
            {
                m_linearImpulse.Normalize();
                m_linearImpulse.Multiply(_loc_18);
            }
            _loc_24 = b2Math.SubtractVV(m_linearImpulse, _loc_25);
            _loc_6.x = _loc_6.x - _loc_10 * _loc_24.x;
            _loc_6.y = _loc_6.y - _loc_10 * _loc_24.y;
            _loc_7 = _loc_7 - _loc_12 * (_loc_14 * _loc_24.y - _loc_15 * _loc_24.x);
            _loc_8.x = _loc_8.x + _loc_11 * _loc_24.x;
            _loc_8.y = _loc_8.y + _loc_11 * _loc_24.y;
            _loc_9 = _loc_9 + _loc_13 * (_loc_16 * _loc_24.y - _loc_17 * _loc_24.x);
            _loc_4.m_angularVelocity = _loc_7;
            _loc_5.m_angularVelocity = _loc_9;
            return;
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * m_linearImpulse.x, param1 * m_linearImpulse.y);
        }// end function

        public function GetMaxForce() : Number
        {
            return m_maxForce;
        }// end function

    }
}
