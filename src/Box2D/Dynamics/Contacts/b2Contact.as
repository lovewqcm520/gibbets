package Box2D.Dynamics.Contacts
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2Contact extends Object
    {
        var m_prev:b2Contact;
        var m_next:b2Contact;
        var m_oldManifold:b2Manifold;
        var m_manifold:b2Manifold;
        var m_fixtureB:b2Fixture;
        var m_fixtureA:b2Fixture;
        var m_nodeA:b2ContactEdge;
        var m_flags:uint;
        var m_toi:Number;
        var m_nodeB:b2ContactEdge;
        static var e_sensorFlag:uint = 1;
        private static var s_input:b2TOIInput = new b2TOIInput();
        static var e_touchingFlag:uint = 16;
        static var e_enabledFlag:uint = 32;
        static var e_continuousFlag:uint = 2;
        static var e_toiFlag:uint = 8;
        static var e_islandFlag:uint = 4;
        static var e_filterFlag:uint = 64;

        public function b2Contact()
        {
            m_nodeA = new b2ContactEdge();
            m_nodeB = new b2ContactEdge();
            m_manifold = new b2Manifold();
            m_oldManifold = new b2Manifold();
            return;
        }// end function

        public function IsContinuous() : Boolean
        {
            return (m_flags & e_continuousFlag) == e_continuousFlag;
        }// end function

        public function GetNext() : b2Contact
        {
            return m_next;
        }// end function

        public function FlagForFiltering() : void
        {
            m_flags = m_flags | e_filterFlag;
            return;
        }// end function

        public function IsEnabled() : Boolean
        {
            return (m_flags & e_enabledFlag) == e_enabledFlag;
        }// end function

        public function SetSensor(param1:Boolean) : void
        {
            if (param1)
            {
                m_flags = m_flags | e_sensorFlag;
            }
            else
            {
                m_flags = m_flags & ~e_sensorFlag;
            }
            return;
        }// end function

        public function SetEnabled(param1:Boolean) : void
        {
            if (param1)
            {
                m_flags = m_flags | e_enabledFlag;
            }
            else
            {
                m_flags = m_flags & ~e_enabledFlag;
            }
            return;
        }// end function

        public function IsSensor() : Boolean
        {
            return (m_flags & e_sensorFlag) == e_sensorFlag;
        }// end function

        public function GetManifold() : b2Manifold
        {
            return m_manifold;
        }// end function

        function Update(param1:b2ContactListener) : void
        {
            var _loc_8:b2Shape = null;
            var _loc_9:b2Shape = null;
            var _loc_10:b2Transform = null;
            var _loc_11:b2Transform = null;
            var _loc_12:int = 0;
            var _loc_13:b2ManifoldPoint = null;
            var _loc_14:b2ContactID = null;
            var _loc_15:int = 0;
            var _loc_16:b2ManifoldPoint = null;
            var _loc_2:* = m_oldManifold;
            m_oldManifold = m_manifold;
            m_manifold = _loc_2;
            m_flags = m_flags | e_enabledFlag;
            var _loc_3:Boolean = false;
            var _loc_4:* = (m_flags & e_touchingFlag) == e_touchingFlag;
            var _loc_5:* = m_fixtureA.m_body;
            var _loc_6:* = m_fixtureB.m_body;
            var _loc_7:* = m_fixtureA.m_aabb.TestOverlap(m_fixtureB.m_aabb);
            if (m_flags & e_sensorFlag)
            {
                if (_loc_7)
                {
                    _loc_8 = m_fixtureA.GetShape();
                    _loc_9 = m_fixtureB.GetShape();
                    _loc_10 = _loc_5.GetTransform();
                    _loc_11 = _loc_6.GetTransform();
                    _loc_3 = b2Shape.TestOverlap(_loc_8, _loc_10, _loc_9, _loc_11);
                }
                m_manifold.m_pointCount = 0;
            }
            else
            {
                if (_loc_5.GetType() != b2Body.b2_dynamicBody || _loc_5.IsBullet() || _loc_6.GetType() != b2Body.b2_dynamicBody || _loc_6.IsBullet())
                {
                    m_flags = m_flags | e_continuousFlag;
                }
                else
                {
                    m_flags = m_flags & ~e_continuousFlag;
                }
                if (_loc_7)
                {
                    Evaluate();
                    _loc_3 = m_manifold.m_pointCount > 0;
                    _loc_12 = 0;
                    while (_loc_12 < m_manifold.m_pointCount)
                    {
                        
                        _loc_13 = m_manifold.m_points[_loc_12];
                        _loc_13.m_normalImpulse = 0;
                        _loc_13.m_tangentImpulse = 0;
                        _loc_14 = _loc_13.m_id;
                        _loc_15 = 0;
                        while (_loc_15 < m_oldManifold.m_pointCount)
                        {
                            
                            _loc_16 = m_oldManifold.m_points[_loc_15];
                            if (_loc_16.m_id.key == _loc_14.key)
                            {
                                _loc_13.m_normalImpulse = _loc_16.m_normalImpulse;
                                _loc_13.m_tangentImpulse = _loc_16.m_tangentImpulse;
                                break;
                            }
                            _loc_15++;
                        }
                        _loc_12++;
                    }
                }
                else
                {
                    m_manifold.m_pointCount = 0;
                }
                if (_loc_3 != _loc_4)
                {
                    _loc_5.SetAwake(true);
                    _loc_6.SetAwake(true);
                }
            }
            if (_loc_3)
            {
                m_flags = m_flags | e_touchingFlag;
            }
            else
            {
                m_flags = m_flags & ~e_touchingFlag;
            }
            if (_loc_4 == false && _loc_3 == true)
            {
                param1.BeginContact(this);
            }
            if (_loc_4 == true && _loc_3 == false)
            {
                param1.EndContact(this);
            }
            if ((m_flags & e_sensorFlag) == 0)
            {
                param1.PreSolve(this, m_oldManifold);
            }
            return;
        }// end function

        public function GetWorldManifold(param1:b2WorldManifold) : void
        {
            var _loc_2:* = m_fixtureA.GetBody();
            var _loc_3:* = m_fixtureB.GetBody();
            var _loc_4:* = m_fixtureA.GetShape();
            var _loc_5:* = m_fixtureB.GetShape();
            param1.Initialize(m_manifold, _loc_2.GetTransform(), _loc_4.m_radius, _loc_3.GetTransform(), _loc_5.m_radius);
            return;
        }// end function

        public function IsTouching() : Boolean
        {
            return (m_flags & e_touchingFlag) == e_touchingFlag;
        }// end function

        public function GetFixtureA() : b2Fixture
        {
            return m_fixtureA;
        }// end function

        public function GetFixtureB() : b2Fixture
        {
            return m_fixtureB;
        }// end function

        function Reset(param1:b2Fixture = null, param2:b2Fixture = null) : void
        {
            m_flags = e_enabledFlag;
            if (!param1 || !param2)
            {
                m_fixtureA = null;
                m_fixtureB = null;
                return;
            }
            if (param1.IsSensor() || param2.IsSensor())
            {
                m_flags = m_flags | e_sensorFlag;
            }
            var _loc_3:* = param1.GetBody();
            var _loc_4:* = param2.GetBody();
            if (_loc_3.GetType() != b2Body.b2_dynamicBody || _loc_3.IsBullet() || _loc_4.GetType() != b2Body.b2_dynamicBody || _loc_4.IsBullet())
            {
                m_flags = m_flags | e_continuousFlag;
            }
            m_fixtureA = param1;
            m_fixtureB = param2;
            m_manifold.m_pointCount = 0;
            m_prev = null;
            m_next = null;
            m_nodeA.contact = null;
            m_nodeA.prev = null;
            m_nodeA.next = null;
            m_nodeA.other = null;
            m_nodeB.contact = null;
            m_nodeB.prev = null;
            m_nodeB.next = null;
            m_nodeB.other = null;
            return;
        }// end function

        function ComputeTOI(param1:b2Sweep, param2:b2Sweep) : Number
        {
            s_input.proxyA.Set(m_fixtureA.GetShape());
            s_input.proxyB.Set(m_fixtureB.GetShape());
            s_input.sweepA = param1;
            s_input.sweepB = param2;
            s_input.tolerance = b2Settings.b2_linearSlop;
            return b2TimeOfImpact.TimeOfImpact(s_input);
        }// end function

        function Evaluate() : void
        {
            return;
        }// end function

    }
}
