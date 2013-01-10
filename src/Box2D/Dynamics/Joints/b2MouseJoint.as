package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2MouseJoint extends b2Joint
    {
        private var K2:b2Mat22;
        private var K1:b2Mat22;
        private var m_beta:Number;
        private var K:b2Mat22;
        private var m_target:b2Vec2;
        private var m_gamma:Number;
        private var m_mass:b2Mat22;
        private var m_impulse:b2Vec2;
        private var m_localAnchor:b2Vec2;
        private var m_C:b2Vec2;
        private var m_maxForce:Number;
        private var m_dampingRatio:Number;
        private var m_frequencyHz:Number;

        public function b2MouseJoint(param1:b2MouseJointDef)
        {
            var _loc_2:Number = NaN;
            var _loc_4:b2Mat22 = null;
            K = new b2Mat22();
            K1 = new b2Mat22();
            K2 = new b2Mat22();
            m_localAnchor = new b2Vec2();
            m_target = new b2Vec2();
            m_impulse = new b2Vec2();
            m_mass = new b2Mat22();
            m_C = new b2Vec2();
            super(param1);
            m_target.SetV(param1.target);
            _loc_2 = m_target.x - m_bodyB.m_xf.position.x;
            var _loc_3:* = m_target.y - m_bodyB.m_xf.position.y;
            _loc_4 = m_bodyB.m_xf.R;
            m_localAnchor.x = _loc_2 * _loc_4.col1.x + _loc_3 * _loc_4.col1.y;
            m_localAnchor.y = _loc_2 * _loc_4.col2.x + _loc_3 * _loc_4.col2.y;
            m_maxForce = param1.maxForce;
            m_impulse.SetZero();
            m_frequencyHz = param1.frequencyHz;
            m_dampingRatio = param1.dampingRatio;
            m_beta = 0;
            m_gamma = 0;
            return;
        }// end function

        public function SetFrequency(param1:Number) : void
        {
            m_frequencyHz = param1;
            return;
        }// end function

        public function SetTarget(param1:b2Vec2) : void
        {
            if (m_bodyB.IsAwake() == false)
            {
                m_bodyB.SetAwake(true);
            }
            m_target = param1;
            return;
        }// end function

        public function GetFrequency() : Number
        {
            return m_frequencyHz;
        }// end function

        public function SetMaxForce(param1:Number) : void
        {
            m_maxForce = param1;
            return;
        }// end function

        public function SetDampingRatio(param1:Number) : void
        {
            m_dampingRatio = param1;
            return;
        }// end function

        override function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_7:b2Mat22 = null;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_2:* = m_bodyB;
            var _loc_3:* = _loc_2.GetMass();
            var _loc_4:* = 2 * Math.PI * m_frequencyHz;
            var _loc_5:* = 2 * _loc_3 * m_dampingRatio * _loc_4;
            var _loc_6:* = _loc_3 * _loc_4 * _loc_4;
            m_gamma = param1.dt * (_loc_5 + param1.dt * _loc_6);
            m_gamma = m_gamma != 0 ? (1 / m_gamma) : (0);
            m_beta = param1.dt * _loc_6 * m_gamma;
            _loc_7 = _loc_2.m_xf.R;
            var _loc_8:* = m_localAnchor.x - _loc_2.m_sweep.localCenter.x;
            var _loc_9:* = m_localAnchor.y - _loc_2.m_sweep.localCenter.y;
            var _loc_10:* = _loc_7.col1.x * _loc_8 + _loc_7.col2.x * _loc_9;
            _loc_9 = _loc_7.col1.y * _loc_8 + _loc_7.col2.y * _loc_9;
            _loc_8 = _loc_10;
            _loc_11 = _loc_2.m_invMass;
            _loc_12 = _loc_2.m_invI;
            K1.col1.x = _loc_11;
            K1.col2.x = 0;
            K1.col1.y = 0;
            K1.col2.y = _loc_11;
            K2.col1.x = _loc_12 * _loc_9 * _loc_9;
            K2.col2.x = (-_loc_12) * _loc_8 * _loc_9;
            K2.col1.y = (-_loc_12) * _loc_8 * _loc_9;
            K2.col2.y = _loc_12 * _loc_8 * _loc_8;
            K.SetM(K1);
            K.AddM(K2);
            K.col1.x = K.col1.x + m_gamma;
            K.col2.y = K.col2.y + m_gamma;
            K.GetInverse(m_mass);
            m_C.x = _loc_2.m_sweep.c.x + _loc_8 - m_target.x;
            m_C.y = _loc_2.m_sweep.c.y + _loc_9 - m_target.y;
            _loc_2.m_angularVelocity = _loc_2.m_angularVelocity * 0.98;
            m_impulse.x = m_impulse.x * param1.dtRatio;
            m_impulse.y = m_impulse.y * param1.dtRatio;
            _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x + _loc_11 * m_impulse.x;
            _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y + _loc_11 * m_impulse.y;
            _loc_2.m_angularVelocity = _loc_2.m_angularVelocity + _loc_12 * (_loc_8 * m_impulse.y - _loc_9 * m_impulse.x);
            return;
        }// end function

        override public function GetAnchorB() : b2Vec2
        {
            return m_bodyB.GetWorldPoint(m_localAnchor);
        }// end function

        override public function GetAnchorA() : b2Vec2
        {
            return m_target;
        }// end function

        public function GetTarget() : b2Vec2
        {
            return m_target;
        }// end function

        override public function GetReactionTorque(param1:Number) : Number
        {
            return 0;
        }// end function

        override public function GetReactionForce(param1:Number) : b2Vec2
        {
            return new b2Vec2(param1 * m_impulse.x, param1 * m_impulse.y);
        }// end function

        override function SolvePositionConstraints(param1:Number) : Boolean
        {
            return true;
        }// end function

        override function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_3:b2Mat22 = null;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_2:* = m_bodyB;
            _loc_3 = _loc_2.m_xf.R;
            var _loc_6:* = m_localAnchor.x - _loc_2.m_sweep.localCenter.x;
            var _loc_7:* = m_localAnchor.y - _loc_2.m_sweep.localCenter.y;
            _loc_4 = _loc_3.col1.x * _loc_6 + _loc_3.col2.x * _loc_7;
            _loc_7 = _loc_3.col1.y * _loc_6 + _loc_3.col2.y * _loc_7;
            _loc_6 = _loc_4;
            var _loc_8:* = _loc_2.m_linearVelocity.x + (-_loc_2.m_angularVelocity) * _loc_7;
            var _loc_9:* = _loc_2.m_linearVelocity.y + _loc_2.m_angularVelocity * _loc_6;
            _loc_3 = m_mass;
            _loc_4 = _loc_8 + m_beta * m_C.x + m_gamma * m_impulse.x;
            _loc_5 = _loc_9 + m_beta * m_C.y + m_gamma * m_impulse.y;
            var _loc_10:* = -(_loc_3.col1.x * _loc_4 + _loc_3.col2.x * _loc_5);
            var _loc_11:* = -(_loc_3.col1.y * _loc_4 + _loc_3.col2.y * _loc_5);
            var _loc_12:* = m_impulse.x;
            var _loc_13:* = m_impulse.y;
            m_impulse.x = m_impulse.x + _loc_10;
            m_impulse.y = m_impulse.y + _loc_11;
            var _loc_14:* = param1.dt * m_maxForce;
            if (m_impulse.LengthSquared() > _loc_14 * _loc_14)
            {
                m_impulse.Multiply(_loc_14 / m_impulse.Length());
            }
            _loc_10 = m_impulse.x - _loc_12;
            _loc_11 = m_impulse.y - _loc_13;
            _loc_2.m_linearVelocity.x = _loc_2.m_linearVelocity.x + _loc_2.m_invMass * _loc_10;
            _loc_2.m_linearVelocity.y = _loc_2.m_linearVelocity.y + _loc_2.m_invMass * _loc_11;
            _loc_2.m_angularVelocity = _loc_2.m_angularVelocity + _loc_2.m_invI * (_loc_6 * _loc_11 - _loc_7 * _loc_10);
            return;
        }// end function

        public function GetMaxForce() : Number
        {
            return m_maxForce;
        }// end function

        public function GetDampingRatio() : Number
        {
            return m_dampingRatio;
        }// end function

    }
}
