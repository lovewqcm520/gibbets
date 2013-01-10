package Box2D.Dynamics
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.Contacts.*;
    import Box2D.Dynamics.Controllers.*;
    import Box2D.Dynamics.Joints.*;

    public class b2Body extends Object
    {
        var m_xf:b2Transform;
        var m_controllerCount:int;
        var m_contactList:b2ContactEdge;
        var m_invI:Number;
        var m_fixtureCount:int;
        var m_torque:Number;
        var m_angularVelocity:Number;
        var m_flags:uint;
        var m_linearVelocity:b2Vec2;
        var m_world:b2World;
        var m_inertiaScale:Number;
        var m_controllerList:b2ControllerEdge;
        var m_fixtureList:b2Fixture;
        var m_mass:Number;
        var m_next:b2Body;
        var m_force:b2Vec2;
        var m_sweep:b2Sweep;
        private var m_userData:Object;
        var m_invMass:Number;
        var m_prev:b2Body;
        var m_linearDamping:Number;
        var m_type:int;
        var m_angularDamping:Number;
        var m_islandIndex:int;
        var m_jointList:b2JointEdge;
        var m_sleepTime:Number;
        var m_I:Number;
        static var e_fixedRotationFlag:uint = 16;
        public static var b2_kinematicBody:uint = 1;
        static var e_bulletFlag:uint = 8;
        static var e_activeFlag:uint = 32;
        static var e_allowSleepFlag:uint = 4;
        static var e_awakeFlag:uint = 2;
        public static var b2_dynamicBody:uint = 2;
        static var e_islandFlag:uint = 1;
        private static var s_xf1:b2Transform = new b2Transform();
        public static var b2_staticBody:uint = 0;

        public function b2Body(param1:b2BodyDef, param2:b2World)
        {
            m_xf = new b2Transform();
            m_sweep = new b2Sweep();
            m_linearVelocity = new b2Vec2();
            m_force = new b2Vec2();
            m_flags = 0;
            if (param1.bullet)
            {
                m_flags = m_flags | e_bulletFlag;
            }
            if (param1.fixedRotation)
            {
                m_flags = m_flags | e_fixedRotationFlag;
            }
            if (param1.allowSleep)
            {
                m_flags = m_flags | e_allowSleepFlag;
            }
            if (param1.awake)
            {
                m_flags = m_flags | e_awakeFlag;
            }
            if (param1.active)
            {
                m_flags = m_flags | e_activeFlag;
            }
            m_world = param2;
            m_xf.position.SetV(param1.position);
            m_xf.R.Set(param1.angle);
            m_sweep.localCenter.SetZero();
            m_sweep.t0 = 1;
            var _loc_5:* = param1.angle;
            m_sweep.a = param1.angle;
            m_sweep.a0 = _loc_5;
            var _loc_3:* = m_xf.R;
            var _loc_4:* = m_sweep.localCenter;
            m_sweep.c.x = _loc_3.col1.x * _loc_4.x + _loc_3.col2.x * _loc_4.y;
            m_sweep.c.y = _loc_3.col1.y * _loc_4.x + _loc_3.col2.y * _loc_4.y;
            m_sweep.c.x = m_sweep.c.x + m_xf.position.x;
            m_sweep.c.y = m_sweep.c.y + m_xf.position.y;
            m_sweep.c0.SetV(m_sweep.c);
            m_jointList = null;
            m_controllerList = null;
            m_contactList = null;
            m_controllerCount = 0;
            m_prev = null;
            m_next = null;
            m_linearVelocity.SetV(param1.linearVelocity);
            m_angularVelocity = param1.angularVelocity;
            m_linearDamping = param1.linearDamping;
            m_angularDamping = param1.angularDamping;
            m_force.Set(0, 0);
            m_torque = 0;
            m_sleepTime = 0;
            m_type = param1.type;
            if (m_type == b2_dynamicBody)
            {
                m_mass = 1;
                m_invMass = 1;
            }
            else
            {
                m_mass = 0;
                m_invMass = 0;
            }
            m_I = 0;
            m_invI = 0;
            m_inertiaScale = param1.inertiaScale;
            m_userData = param1.userData;
            m_fixtureList = null;
            m_fixtureCount = 0;
            return;
        }// end function

        public function SetLinearVelocity(param1:b2Vec2) : void
        {
            if (m_type == b2_staticBody)
            {
                return;
            }
            m_linearVelocity.SetV(param1);
            return;
        }// end function

        public function ResetMassData() : void
        {
            var _loc_4:b2MassData = null;
            m_mass = 0;
            m_invMass = 0;
            m_I = 0;
            m_invI = 0;
            m_sweep.localCenter.SetZero();
            if (m_type == b2_staticBody || m_type == b2_kinematicBody)
            {
                return;
            }
            var _loc_1:* = b2Vec2.Make(0, 0);
            var _loc_2:* = m_fixtureList;
            while (_loc_2)
            {
                
                if (_loc_2.m_density == 0)
                {
                }
                else
                {
                    _loc_4 = _loc_2.GetMassData();
                    m_mass = m_mass + _loc_4.mass;
                    _loc_1.x = _loc_1.x + _loc_4.center.x * _loc_4.mass;
                    _loc_1.y = _loc_1.y + _loc_4.center.y * _loc_4.mass;
                    m_I = m_I + _loc_4.I;
                }
                _loc_2 = _loc_2.m_next;
            }
            if (m_mass > 0)
            {
                m_invMass = 1 / m_mass;
                _loc_1.x = _loc_1.x * m_invMass;
                _loc_1.y = _loc_1.y * m_invMass;
            }
            else
            {
                m_mass = 1;
                m_invMass = 1;
            }
            if (m_I > 0 && (m_flags & e_fixedRotationFlag) == 0)
            {
                m_I = m_I - m_mass * (_loc_1.x * _loc_1.x + _loc_1.y * _loc_1.y);
                m_I = m_I * m_inertiaScale;
                b2Settings.b2Assert(m_I > 0);
                m_invI = 1 / m_I;
            }
            else
            {
                m_I = 0;
                m_invI = 0;
            }
            var _loc_3:* = m_sweep.c.Copy();
            m_sweep.localCenter.SetV(_loc_1);
            m_sweep.c0.SetV(b2Math.MulX(m_xf, m_sweep.localCenter));
            m_sweep.c.SetV(m_sweep.c0);
            m_linearVelocity.x = m_linearVelocity.x + m_angularVelocity * (-(m_sweep.c.y - _loc_3.y));
            m_linearVelocity.y = m_linearVelocity.y + m_angularVelocity * (m_sweep.c.x - _loc_3.x);
            return;
        }// end function

        public function GetMassData(param1:b2MassData) : void
        {
            param1.mass = m_mass;
            param1.I = m_I;
            param1.center.SetV(m_sweep.localCenter);
            return;
        }// end function

        public function Merge(param1:b2Body) : void
        {
            var _loc_2:b2Fixture = null;
            var _loc_3:b2Body = null;
            var _loc_4:b2Body = null;
            var _loc_11:b2Fixture = null;
            _loc_2 = param1.m_fixtureList;
            while (_loc_2)
            {
                
                _loc_11 = _loc_2.m_next;
                var _loc_12:* = param1;
                var _loc_13:* = param1.m_fixtureCount - 1;
                _loc_12.m_fixtureCount = _loc_13;
                _loc_2.m_next = m_fixtureList;
                m_fixtureList = _loc_2;
                var _loc_13:* = m_fixtureCount + 1;
                m_fixtureCount = _loc_13;
                _loc_2.m_body = _loc_4;
                _loc_2 = _loc_11;
            }
            _loc_3.m_fixtureCount = 0;
            _loc_3 = this;
            _loc_4 = param1;
            var _loc_5:* = _loc_3.GetWorldCenter();
            var _loc_6:* = _loc_4.GetWorldCenter();
            var _loc_7:* = _loc_3.GetLinearVelocity().Copy();
            var _loc_8:* = _loc_4.GetLinearVelocity().Copy();
            var _loc_9:* = _loc_3.GetAngularVelocity();
            var _loc_10:* = _loc_4.GetAngularVelocity();
            _loc_3.ResetMassData();
            SynchronizeFixtures();
            return;
        }// end function

        function SynchronizeTransform() : void
        {
            m_xf.R.Set(m_sweep.a);
            var _loc_1:* = m_xf.R;
            var _loc_2:* = m_sweep.localCenter;
            m_xf.position.x = m_sweep.c.x - (_loc_1.col1.x * _loc_2.x + _loc_1.col2.x * _loc_2.y);
            m_xf.position.y = m_sweep.c.y - (_loc_1.col1.y * _loc_2.x + _loc_1.col2.y * _loc_2.y);
            return;
        }// end function

        public function SetMassData(param1:b2MassData) : void
        {
            b2Settings.b2Assert(m_world.IsLocked() == false);
            if (m_world.IsLocked() == true)
            {
                return;
            }
            if (m_type != b2_dynamicBody)
            {
                return;
            }
            m_invMass = 0;
            m_I = 0;
            m_invI = 0;
            m_mass = param1.mass;
            if (m_mass <= 0)
            {
                m_mass = 1;
            }
            m_invMass = 1 / m_mass;
            if (param1.I > 0 && (m_flags & e_fixedRotationFlag) == 0)
            {
                m_I = param1.I - m_mass * (param1.center.x * param1.center.x + param1.center.y * param1.center.y);
                m_invI = 1 / m_I;
            }
            var _loc_2:* = m_sweep.c.Copy();
            m_sweep.localCenter.SetV(param1.center);
            m_sweep.c0.SetV(b2Math.MulX(m_xf, m_sweep.localCenter));
            m_sweep.c.SetV(m_sweep.c0);
            m_linearVelocity.x = m_linearVelocity.x + m_angularVelocity * (-(m_sweep.c.y - _loc_2.y));
            m_linearVelocity.y = m_linearVelocity.y + m_angularVelocity * (m_sweep.c.x - _loc_2.x);
            return;
        }// end function

        public function GetDefinition() : b2BodyDef
        {
            var _loc_1:* = new b2BodyDef();
            _loc_1.type = GetType();
            _loc_1.allowSleep = (m_flags & e_allowSleepFlag) == e_allowSleepFlag;
            _loc_1.angle = GetAngle();
            _loc_1.angularDamping = m_angularDamping;
            _loc_1.angularVelocity = m_angularVelocity;
            _loc_1.fixedRotation = (m_flags & e_fixedRotationFlag) == e_fixedRotationFlag;
            _loc_1.bullet = (m_flags & e_bulletFlag) == e_bulletFlag;
            _loc_1.awake = (m_flags & e_awakeFlag) == e_awakeFlag;
            _loc_1.linearDamping = m_linearDamping;
            _loc_1.linearVelocity.SetV(GetLinearVelocity());
            _loc_1.position = GetPosition();
            _loc_1.userData = GetUserData();
            return _loc_1;
        }// end function

        public function GetControllerList() : b2ControllerEdge
        {
            return m_controllerList;
        }// end function

        public function GetFixtureList() : b2Fixture
        {
            return m_fixtureList;
        }// end function

        public function SetAngularVelocity(param1:Number) : void
        {
            if (m_type == b2_staticBody)
            {
                return;
            }
            m_angularVelocity = param1;
            return;
        }// end function

        public function GetAngle() : Number
        {
            return m_sweep.a;
        }// end function

        public function GetLinearVelocityFromLocalPoint(param1:b2Vec2) : b2Vec2
        {
            var _loc_2:* = m_xf.R;
            var _loc_3:* = new b2Vec2(_loc_2.col1.x * param1.x + _loc_2.col2.x * param1.y, _loc_2.col1.y * param1.x + _loc_2.col2.y * param1.y);
            _loc_3.x = _loc_3.x + m_xf.position.x;
            _loc_3.y = _loc_3.y + m_xf.position.y;
            return new b2Vec2(m_linearVelocity.x - m_angularVelocity * (_loc_3.y - m_sweep.c.y), m_linearVelocity.y + m_angularVelocity * (_loc_3.x - m_sweep.c.x));
        }// end function

        public function GetNext() : b2Body
        {
            return m_next;
        }// end function

        public function GetMass() : Number
        {
            return m_mass;
        }// end function

        public function ApplyForce(param1:b2Vec2, param2:b2Vec2) : void
        {
            if (m_type != b2_dynamicBody)
            {
                return;
            }
            if (IsAwake() == false)
            {
                SetAwake(true);
            }
            m_force.x = m_force.x + param1.x;
            m_force.y = m_force.y + param1.y;
            m_torque = m_torque + ((param2.x - m_sweep.c.x) * param1.y - (param2.y - m_sweep.c.y) * param1.x);
            return;
        }// end function

        public function CreateFixture(param1:b2FixtureDef) : b2Fixture
        {
            var _loc_3:IBroadPhase = null;
            if (m_world.IsLocked() == true)
            {
                return null;
            }
            var _loc_2:* = new b2Fixture();
            _loc_2.Create(this, m_xf, param1);
            if (m_flags & e_activeFlag)
            {
                _loc_3 = m_world.m_contactManager.m_broadPhase;
                _loc_2.CreateProxy(_loc_3, m_xf);
            }
            _loc_2.m_next = m_fixtureList;
            m_fixtureList = _loc_2;
            var _loc_5:* = m_fixtureCount + 1;
            m_fixtureCount = _loc_5;
            _loc_2.m_body = this;
            if (_loc_2.m_density > 0)
            {
                ResetMassData();
            }
            m_world.m_flags = m_world.m_flags | b2World.e_newFixture;
            return _loc_2;
        }// end function

        public function SetTransform(param1:b2Transform) : void
        {
            SetPositionAndAngle(param1.position, param1.GetAngle());
            return;
        }// end function

        public function IsAwake() : Boolean
        {
            return (m_flags & e_awakeFlag) == e_awakeFlag;
        }// end function

        public function GetWorldVector(param1:b2Vec2) : b2Vec2
        {
            return b2Math.MulMV(m_xf.R, param1);
        }// end function

        function Advance(param1:Number) : void
        {
            m_sweep.Advance(param1);
            m_sweep.c.SetV(m_sweep.c0);
            m_sweep.a = m_sweep.a0;
            SynchronizeTransform();
            return;
        }// end function

        public function SetAwake(param1:Boolean) : void
        {
            if (param1)
            {
                m_flags = m_flags | e_awakeFlag;
                m_sleepTime = 0;
            }
            else
            {
                m_flags = m_flags & ~e_awakeFlag;
                m_sleepTime = 0;
                m_linearVelocity.SetZero();
                m_angularVelocity = 0;
                m_force.SetZero();
                m_torque = 0;
            }
            return;
        }// end function

        public function GetUserData()
        {
            return m_userData;
        }// end function

        public function GetWorldCenter() : b2Vec2
        {
            return m_sweep.c;
        }// end function

        public function SetUserData(param1) : void
        {
            m_userData = param1;
            return;
        }// end function

        public function GetLocalVector(param1:b2Vec2) : b2Vec2
        {
            return b2Math.MulTMV(m_xf.R, param1);
        }// end function

        public function GetPosition() : b2Vec2
        {
            return m_xf.position;
        }// end function

        public function GetLinearVelocityFromWorldPoint(param1:b2Vec2) : b2Vec2
        {
            return new b2Vec2(m_linearVelocity.x - m_angularVelocity * (param1.y - m_sweep.c.y), m_linearVelocity.y + m_angularVelocity * (param1.x - m_sweep.c.x));
        }// end function

        public function CreateFixture2(param1:b2Shape, param2:Number = 0) : b2Fixture
        {
            var _loc_3:* = new b2FixtureDef();
            _loc_3.shape = param1;
            _loc_3.density = param2;
            return CreateFixture(_loc_3);
        }// end function

        public function GetLinearDamping() : Number
        {
            return m_linearDamping;
        }// end function

        public function GetLocalCenter() : b2Vec2
        {
            return m_sweep.localCenter;
        }// end function

        public function SetPosition(param1:b2Vec2) : void
        {
            SetPositionAndAngle(param1, GetAngle());
            return;
        }// end function

        private function connectEdges(param1:b2EdgeShape, param2:b2EdgeShape, param3:Number) : Number
        {
            var _loc_4:* = Math.atan2(param2.GetDirectionVector().y, param2.GetDirectionVector().x);
            var _loc_5:* = Math.tan((_loc_4 - param3) * 0.5);
            var _loc_6:* = b2Math.MulFV(_loc_5, param2.GetDirectionVector());
            _loc_6 = b2Math.SubtractVV(_loc_6, param2.GetNormalVector());
            _loc_6 = b2Math.MulFV(b2Settings.b2_toiSlop, _loc_6);
            _loc_6 = b2Math.AddVV(_loc_6, param2.GetVertex1());
            var _loc_7:* = b2Math.AddVV(param1.GetDirectionVector(), param2.GetDirectionVector());
            b2Math.AddVV(param1.GetDirectionVector(), param2.GetDirectionVector()).Normalize();
            var _loc_8:* = b2Math.Dot(param1.GetDirectionVector(), param2.GetNormalVector()) > 0;
            param1.SetNextEdge(param2, _loc_6, _loc_7, _loc_8);
            param2.SetPrevEdge(param1, _loc_6, _loc_7, _loc_8);
            return _loc_4;
        }// end function

        public function GetType() : uint
        {
            return m_type;
        }// end function

        public function GetAngularDamping() : Number
        {
            return m_angularDamping;
        }// end function

        public function SetType(param1:uint) : void
        {
            if (m_type == param1)
            {
                return;
            }
            m_type = param1;
            ResetMassData();
            if (m_type == b2_staticBody)
            {
                m_linearVelocity.SetZero();
                m_angularVelocity = 0;
            }
            SetAwake(true);
            m_force.SetZero();
            m_torque = 0;
            var _loc_2:* = m_contactList;
            while (_loc_2)
            {
                
                _loc_2.contact.FlagForFiltering();
                _loc_2 = _loc_2.next;
            }
            return;
        }// end function

        public function SetAngularDamping(param1:Number) : void
        {
            m_angularDamping = param1;
            return;
        }// end function

        public function GetInertia() : Number
        {
            return m_I;
        }// end function

        public function SetAngle(param1:Number) : void
        {
            SetPositionAndAngle(GetPosition(), param1);
            return;
        }// end function

        public function GetJointList() : b2JointEdge
        {
            return m_jointList;
        }// end function

        public function GetLocalPoint(param1:b2Vec2) : b2Vec2
        {
            return b2Math.MulXT(m_xf, param1);
        }// end function

        public function ApplyImpulse(param1:b2Vec2, param2:b2Vec2) : void
        {
            if (m_type != b2_dynamicBody)
            {
                return;
            }
            if (IsAwake() == false)
            {
                SetAwake(true);
            }
            m_linearVelocity.x = m_linearVelocity.x + m_invMass * param1.x;
            m_linearVelocity.y = m_linearVelocity.y + m_invMass * param1.y;
            m_angularVelocity = m_angularVelocity + m_invI * ((param2.x - m_sweep.c.x) * param1.y - (param2.y - m_sweep.c.y) * param1.x);
            return;
        }// end function

        public function GetContactList() : b2ContactEdge
        {
            return m_contactList;
        }// end function

        public function GetAngularVelocity() : Number
        {
            return m_angularVelocity;
        }// end function

        public function DestroyFixture(param1:b2Fixture) : void
        {
            var _loc_6:b2Contact = null;
            var _loc_7:b2Fixture = null;
            var _loc_8:b2Fixture = null;
            var _loc_9:IBroadPhase = null;
            if (m_world.IsLocked() == true)
            {
                return;
            }
            var _loc_2:* = m_fixtureList;
            var _loc_3:b2Fixture = null;
            var _loc_4:Boolean = false;
            while (_loc_2 != null)
            {
                
                if (_loc_2 == param1)
                {
                    if (_loc_3)
                    {
                        _loc_3.m_next = param1.m_next;
                    }
                    else
                    {
                        m_fixtureList = param1.m_next;
                    }
                    _loc_4 = true;
                    break;
                }
                _loc_3 = _loc_2;
                _loc_2 = _loc_2.m_next;
            }
            var _loc_5:* = m_contactList;
            while (_loc_5)
            {
                
                _loc_6 = _loc_5.contact;
                _loc_5 = _loc_5.next;
                _loc_7 = _loc_6.GetFixtureA();
                _loc_8 = _loc_6.GetFixtureB();
                if (param1 == _loc_7 || param1 == _loc_8)
                {
                    m_world.m_contactManager.Destroy(_loc_6);
                }
            }
            if (m_flags & e_activeFlag)
            {
                _loc_9 = m_world.m_contactManager.m_broadPhase;
                param1.DestroyProxy(_loc_9);
            }
            param1.Destroy();
            param1.m_body = null;
            param1.m_next = null;
            var _loc_11:* = m_fixtureCount - 1;
            m_fixtureCount = _loc_11;
            ResetMassData();
            return;
        }// end function

        public function IsSleepingAllowed() : Boolean
        {
            return (m_flags & e_allowSleepFlag) == e_allowSleepFlag;
        }// end function

        public function GetTransform() : b2Transform
        {
            return m_xf;
        }// end function

        function SynchronizeFixtures() : void
        {
            var _loc_4:b2Fixture = null;
            var _loc_1:* = s_xf1;
            _loc_1.R.Set(m_sweep.a0);
            var _loc_2:* = _loc_1.R;
            var _loc_3:* = m_sweep.localCenter;
            _loc_1.position.x = m_sweep.c0.x - (_loc_2.col1.x * _loc_3.x + _loc_2.col2.x * _loc_3.y);
            _loc_1.position.y = m_sweep.c0.y - (_loc_2.col1.y * _loc_3.x + _loc_2.col2.y * _loc_3.y);
            var _loc_5:* = m_world.m_contactManager.m_broadPhase;
            _loc_4 = m_fixtureList;
            while (_loc_4)
            {
                
                _loc_4.Synchronize(_loc_5, _loc_1, m_xf);
                _loc_4 = _loc_4.m_next;
            }
            return;
        }// end function

        public function SetSleepingAllowed(param1:Boolean) : void
        {
            if (param1)
            {
                m_flags = m_flags | e_allowSleepFlag;
            }
            else
            {
                m_flags = m_flags & ~e_allowSleepFlag;
                SetAwake(true);
            }
            return;
        }// end function

        public function SetBullet(param1:Boolean) : void
        {
            if (param1)
            {
                m_flags = m_flags | e_bulletFlag;
            }
            else
            {
                m_flags = m_flags & ~e_bulletFlag;
            }
            return;
        }// end function

        public function SetPositionAndAngle(param1:b2Vec2, param2:Number) : void
        {
            var _loc_3:b2Fixture = null;
            if (m_world.IsLocked() == true)
            {
                return;
            }
            m_xf.R.Set(param2);
            m_xf.position.SetV(param1);
            var _loc_4:* = m_xf.R;
            var _loc_5:* = m_sweep.localCenter;
            m_sweep.c.x = _loc_4.col1.x * _loc_5.x + _loc_4.col2.x * _loc_5.y;
            m_sweep.c.y = _loc_4.col1.y * _loc_5.x + _loc_4.col2.y * _loc_5.y;
            m_sweep.c.x = m_sweep.c.x + m_xf.position.x;
            m_sweep.c.y = m_sweep.c.y + m_xf.position.y;
            m_sweep.c0.SetV(m_sweep.c);
            var _loc_7:* = param2;
            m_sweep.a = param2;
            m_sweep.a0 = _loc_7;
            var _loc_6:* = m_world.m_contactManager.m_broadPhase;
            _loc_3 = m_fixtureList;
            while (_loc_3)
            {
                
                _loc_3.Synchronize(_loc_6, m_xf, m_xf);
                _loc_3 = _loc_3.m_next;
            }
            m_world.m_contactManager.FindNewContacts();
            return;
        }// end function

        public function IsFixedRotation() : Boolean
        {
            return (m_flags & e_fixedRotationFlag) == e_fixedRotationFlag;
        }// end function

        public function SetActive(param1:Boolean) : void
        {
            var _loc_2:IBroadPhase = null;
            var _loc_3:b2Fixture = null;
            var _loc_4:b2ContactEdge = null;
            var _loc_5:b2ContactEdge = null;
            if (param1 == IsActive())
            {
                return;
            }
            if (param1)
            {
                m_flags = m_flags | e_activeFlag;
                _loc_2 = m_world.m_contactManager.m_broadPhase;
                _loc_3 = m_fixtureList;
                while (_loc_3)
                {
                    
                    _loc_3.CreateProxy(_loc_2, m_xf);
                    _loc_3 = _loc_3.m_next;
                }
            }
            else
            {
                m_flags = m_flags & ~e_activeFlag;
                _loc_2 = m_world.m_contactManager.m_broadPhase;
                _loc_3 = m_fixtureList;
                while (_loc_3)
                {
                    
                    _loc_3.DestroyProxy(_loc_2);
                    _loc_3 = _loc_3.m_next;
                }
                _loc_4 = m_contactList;
                while (_loc_4)
                {
                    
                    _loc_5 = _loc_4;
                    _loc_4 = _loc_4.next;
                    m_world.m_contactManager.Destroy(_loc_5.contact);
                }
                m_contactList = null;
            }
            return;
        }// end function

        public function IsActive() : Boolean
        {
            return (m_flags & e_activeFlag) == e_activeFlag;
        }// end function

        function ShouldCollide(param1:b2Body) : Boolean
        {
            if (m_type != b2_dynamicBody && param1.m_type != b2_dynamicBody)
            {
                return false;
            }
            var _loc_2:* = m_jointList;
            while (_loc_2)
            {
                
                if (_loc_2.other == param1)
                {
                    if (_loc_2.joint.m_collideConnected == false)
                    {
                        return false;
                    }
                }
                _loc_2 = _loc_2.next;
            }
            return true;
        }// end function

        public function IsBullet() : Boolean
        {
            return (m_flags & e_bulletFlag) == e_bulletFlag;
        }// end function

        public function GetWorldPoint(param1:b2Vec2) : b2Vec2
        {
            var _loc_2:* = m_xf.R;
            var _loc_3:* = new b2Vec2(_loc_2.col1.x * param1.x + _loc_2.col2.x * param1.y, _loc_2.col1.y * param1.x + _loc_2.col2.y * param1.y);
            _loc_3.x = _loc_3.x + m_xf.position.x;
            _loc_3.y = _loc_3.y + m_xf.position.y;
            return _loc_3;
        }// end function

        public function SetFixedRotation(param1:Boolean) : void
        {
            if (param1)
            {
                m_flags = m_flags | e_fixedRotationFlag;
            }
            else
            {
                m_flags = m_flags & ~e_fixedRotationFlag;
            }
            ResetMassData();
            return;
        }// end function

        public function GetLinearVelocity() : b2Vec2
        {
            return m_linearVelocity;
        }// end function

        public function Split(param1:Function) : b2Body
        {
            var _loc_7:b2Fixture = null;
            var _loc_13:b2Fixture = null;
            var _loc_2:* = GetLinearVelocity().Copy();
            var _loc_3:* = GetAngularVelocity();
            var _loc_4:* = GetWorldCenter();
            var _loc_5:b2Body = this;
            var _loc_6:* = m_world.CreateBody(GetDefinition());
            var _loc_8:* = _loc_5.m_fixtureList;
            while (_loc_8)
            {
                
                if (this.param1(_loc_8))
                {
                    _loc_13 = _loc_8.m_next;
                    if (_loc_7)
                    {
                        _loc_7.m_next = _loc_13;
                    }
                    else
                    {
                        _loc_5.m_fixtureList = _loc_13;
                    }
                    var _loc_14:* = _loc_5;
                    var _loc_15:* = _loc_5.m_fixtureCount - 1;
                    _loc_14.m_fixtureCount = _loc_15;
                    _loc_8.m_next = _loc_6.m_fixtureList;
                    _loc_6.m_fixtureList = _loc_8;
                    var _loc_14:* = _loc_6;
                    var _loc_15:* = _loc_6.m_fixtureCount + 1;
                    _loc_14.m_fixtureCount = _loc_15;
                    _loc_8.m_body = _loc_6;
                    _loc_8 = _loc_13;
                    continue;
                }
                _loc_7 = _loc_8;
                _loc_8 = _loc_8.m_next;
            }
            _loc_5.ResetMassData();
            _loc_6.ResetMassData();
            var _loc_9:* = _loc_5.GetWorldCenter();
            var _loc_10:* = _loc_6.GetWorldCenter();
            var _loc_11:* = b2Math.AddVV(_loc_2, b2Math.CrossFV(_loc_3, b2Math.SubtractVV(_loc_9, _loc_4)));
            var _loc_12:* = b2Math.AddVV(_loc_2, b2Math.CrossFV(_loc_3, b2Math.SubtractVV(_loc_10, _loc_4)));
            _loc_5.SetLinearVelocity(_loc_11);
            _loc_6.SetLinearVelocity(_loc_12);
            _loc_5.SetAngularVelocity(_loc_3);
            _loc_6.SetAngularVelocity(_loc_3);
            _loc_5.SynchronizeFixtures();
            _loc_6.SynchronizeFixtures();
            return _loc_6;
        }// end function

        public function SetLinearDamping(param1:Number) : void
        {
            m_linearDamping = param1;
            return;
        }// end function

        public function GetWorld() : b2World
        {
            return m_world;
        }// end function

        public function ApplyTorque(param1:Number) : void
        {
            if (m_type != b2_dynamicBody)
            {
                return;
            }
            if (IsAwake() == false)
            {
                SetAwake(true);
            }
            m_torque = m_torque + param1;
            return;
        }// end function

    }
}
