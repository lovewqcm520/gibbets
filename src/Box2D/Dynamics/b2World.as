package Box2D.Dynamics
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.Contacts.*;
    import Box2D.Dynamics.Controllers.*;
    import Box2D.Dynamics.Joints.*;

    public class b2World extends Object
    {
        private var m_inv_dt0:Number;
        private var m_contactSolver:b2ContactSolver;
        private var m_controllerList:b2Controller;
        var m_contactList:b2Contact;
        private var m_controllerCount:int;
        private var m_allowSleep:Boolean;
        private var m_island:b2Island;
        var m_flags:int;
        private var m_jointCount:int;
        private var m_bodyCount:int;
        private var s_stack:Array;
        private var m_destructionListener:b2DestructionListener;
        var m_groundBody:b2Body;
        var m_contactCount:int;
        private var m_debugDraw:b2DebugDraw;
        var m_bodyList:b2Body;
        private var m_jointList:b2Joint;
        private var m_gravity:b2Vec2;
        var m_contactManager:b2ContactManager;
        public static const e_newFixture:int = 1;
        private static var s_timestep:b2TimeStep = new b2TimeStep();
        public static const e_locked:int = 2;
        private static var s_queue:Array = new Array();
        private static var s_timestep2:b2TimeStep = new b2TimeStep();
        private static var s_backupA:b2Sweep = new b2Sweep();
        private static var m_continuousPhysics:Boolean;
        private static var m_warmStarting:Boolean;
        private static var s_xf:b2Transform = new b2Transform();
        private static var s_backupB:b2Sweep = new b2Sweep();
        private static var s_jointColor:b2Color = new b2Color(0.5, 0.8, 0.8);

        public function b2World(param1:b2Vec2, param2:Boolean)
        {
            s_stack = new Array();
            m_contactManager = new b2ContactManager();
            m_contactSolver = new b2ContactSolver();
            m_island = new b2Island();
            m_destructionListener = null;
            m_debugDraw = null;
            m_bodyList = null;
            m_contactList = null;
            m_jointList = null;
            m_controllerList = null;
            m_bodyCount = 0;
            m_contactCount = 0;
            m_jointCount = 0;
            m_controllerCount = 0;
            m_warmStarting = true;
            m_continuousPhysics = true;
            m_allowSleep = param2;
            m_gravity = param1;
            m_inv_dt0 = 0;
            m_contactManager.m_world = this;
            var _loc_3:* = new b2BodyDef();
            m_groundBody = CreateBody(_loc_3);
            return;
        }// end function

        function DrawJoint(param1:b2Joint) : void
        {
            var _loc_11:b2PulleyJoint = null;
            var _loc_12:b2Vec2 = null;
            var _loc_13:b2Vec2 = null;
            var _loc_2:* = param1.GetBodyA();
            var _loc_3:* = param1.GetBodyB();
            var _loc_4:* = _loc_2.m_xf;
            var _loc_5:* = _loc_3.m_xf;
            var _loc_6:* = _loc_4.position;
            var _loc_7:* = _loc_5.position;
            var _loc_8:* = param1.GetAnchorA();
            var _loc_9:* = param1.GetAnchorB();
            var _loc_10:* = s_jointColor;
            switch(param1.m_type)
            {
                case b2Joint.e_distanceJoint:
                {
                    m_debugDraw.DrawSegment(_loc_8, _loc_9, _loc_10);
                    break;
                }
                case b2Joint.e_pulleyJoint:
                {
                    _loc_11 = param1 as b2PulleyJoint;
                    _loc_12 = _loc_11.GetGroundAnchorA();
                    _loc_13 = _loc_11.GetGroundAnchorB();
                    m_debugDraw.DrawSegment(_loc_12, _loc_8, _loc_10);
                    m_debugDraw.DrawSegment(_loc_13, _loc_9, _loc_10);
                    m_debugDraw.DrawSegment(_loc_12, _loc_13, _loc_10);
                    break;
                }
                case b2Joint.e_mouseJoint:
                {
                    m_debugDraw.DrawSegment(_loc_8, _loc_9, _loc_10);
                    break;
                }
                default:
                {
                    if (_loc_2 != m_groundBody)
                    {
                        m_debugDraw.DrawSegment(_loc_6, _loc_8, _loc_10);
                    }
                    m_debugDraw.DrawSegment(_loc_8, _loc_9, _loc_10);
                    if (_loc_3 != m_groundBody)
                    {
                        m_debugDraw.DrawSegment(_loc_7, _loc_9, _loc_10);
                    }
                    break;
                }
            }
            return;
        }// end function

        public function RayCastAll(param1:b2Vec2, param2:b2Vec2) : Array
        {
            var result:Array;
            var RayCastAllWrapper:Function;
            var point1:* = param1;
            var point2:* = param2;
            RayCastAllWrapper = function (param1:b2Fixture, param2:b2Vec2, param3:b2Vec2, param4:Number) : Number
            {
                result[result.length] = param1;
                return 1;
            }// end function
            ;
            result = new Array();
            RayCast(RayCastAllWrapper, point1, point2);
            return result;
        }// end function

        public function QueryAABB(param1:Function, param2:b2AABB) : void
        {
            var broadPhase:IBroadPhase;
            var WorldQueryWrapper:Function;
            var callback:* = param1;
            var aabb:* = param2;
            WorldQueryWrapper = function (param1) : Boolean
            {
                return callback(broadPhase.GetUserData(param1));
            }// end function
            ;
            broadPhase = m_contactManager.m_broadPhase;
            broadPhase.Query(WorldQueryWrapper, aabb);
            return;
        }// end function

        public function GetJointCount() : int
        {
            return m_jointCount;
        }// end function

        public function SetDebugDraw(param1:b2DebugDraw) : void
        {
            m_debugDraw = param1;
            return;
        }// end function

        public function SetContinuousPhysics(param1:Boolean) : void
        {
            m_continuousPhysics = param1;
            return;
        }// end function

        public function GetProxyCount() : int
        {
            return m_contactManager.m_broadPhase.GetProxyCount();
        }// end function

        public function DrawDebugData() : void
        {
            var _loc_2:int = 0;
            var _loc_3:b2Body = null;
            var _loc_4:b2Fixture = null;
            var _loc_5:b2Shape = null;
            var _loc_6:b2Joint = null;
            var _loc_7:IBroadPhase = null;
            var _loc_11:b2Transform = null;
            var _loc_16:b2Controller = null;
            var _loc_17:b2Contact = null;
            var _loc_18:b2Fixture = null;
            var _loc_19:b2Fixture = null;
            var _loc_20:b2Vec2 = null;
            var _loc_21:b2Vec2 = null;
            var _loc_22:b2AABB = null;
            if (m_debugDraw == null)
            {
                return;
            }
            m_debugDraw.m_sprite.graphics.clear();
            var _loc_1:* = m_debugDraw.GetFlags();
            var _loc_8:* = new b2Vec2();
            var _loc_9:* = new b2Vec2();
            var _loc_10:* = new b2Vec2();
            var _loc_12:* = new b2AABB();
            var _loc_13:* = new b2AABB();
            var _loc_14:Array = [new b2Vec2(), new b2Vec2(), new b2Vec2(), new b2Vec2()];
            var _loc_15:* = new b2Color(0, 0, 0);
            if (_loc_1 & b2DebugDraw.e_shapeBit)
            {
                _loc_3 = m_bodyList;
                while (_loc_3)
                {
                    
                    _loc_11 = _loc_3.m_xf;
                    _loc_4 = _loc_3.GetFixtureList();
                    while (_loc_4)
                    {
                        
                        _loc_5 = _loc_4.GetShape();
                        if (_loc_3.IsActive() == false)
                        {
                            _loc_15.Set(0.5, 0.5, 0.3);
                            DrawShape(_loc_5, _loc_11, _loc_15);
                        }
                        else if (_loc_3.GetType() == b2Body.b2_staticBody)
                        {
                            _loc_15.Set(0.5, 0.9, 0.5);
                            DrawShape(_loc_5, _loc_11, _loc_15);
                        }
                        else if (_loc_3.GetType() == b2Body.b2_kinematicBody)
                        {
                            _loc_15.Set(0.5, 0.5, 0.9);
                            DrawShape(_loc_5, _loc_11, _loc_15);
                        }
                        else if (_loc_3.IsAwake() == false)
                        {
                            _loc_15.Set(0.6, 0.6, 0.6);
                            DrawShape(_loc_5, _loc_11, _loc_15);
                        }
                        else
                        {
                            _loc_15.Set(0.9, 0.7, 0.7);
                            DrawShape(_loc_5, _loc_11, _loc_15);
                        }
                        _loc_4 = _loc_4.m_next;
                    }
                    _loc_3 = _loc_3.m_next;
                }
            }
            if (_loc_1 & b2DebugDraw.e_jointBit)
            {
                _loc_6 = m_jointList;
                while (_loc_6)
                {
                    
                    DrawJoint(_loc_6);
                    _loc_6 = _loc_6.m_next;
                }
            }
            if (_loc_1 & b2DebugDraw.e_controllerBit)
            {
                _loc_16 = m_controllerList;
                while (_loc_16)
                {
                    
                    _loc_16.Draw(m_debugDraw);
                    _loc_16 = _loc_16.m_next;
                }
            }
            if (_loc_1 & b2DebugDraw.e_pairBit)
            {
                _loc_15.Set(0.3, 0.9, 0.9);
                _loc_17 = m_contactManager.m_contactList;
                while (_loc_17)
                {
                    
                    _loc_18 = _loc_17.GetFixtureA();
                    _loc_19 = _loc_17.GetFixtureB();
                    _loc_20 = _loc_18.GetAABB().GetCenter();
                    _loc_21 = _loc_19.GetAABB().GetCenter();
                    m_debugDraw.DrawSegment(_loc_20, _loc_21, _loc_15);
                    _loc_17 = _loc_17.GetNext();
                }
            }
            if (_loc_1 & b2DebugDraw.e_aabbBit)
            {
                _loc_7 = m_contactManager.m_broadPhase;
                _loc_14 = [new b2Vec2(), new b2Vec2(), new b2Vec2(), new b2Vec2()];
                _loc_3 = m_bodyList;
                while (_loc_3)
                {
                    
                    if (_loc_3.IsActive() == false)
                    {
                    }
                    else
                    {
                        _loc_4 = _loc_3.GetFixtureList();
                        while (_loc_4)
                        {
                            
                            _loc_22 = _loc_7.GetFatAABB(_loc_4.m_proxy);
                            _loc_14[0].Set(_loc_22.lowerBound.x, _loc_22.lowerBound.y);
                            _loc_14[1].Set(_loc_22.upperBound.x, _loc_22.lowerBound.y);
                            _loc_14[2].Set(_loc_22.upperBound.x, _loc_22.upperBound.y);
                            _loc_14[3].Set(_loc_22.lowerBound.x, _loc_22.upperBound.y);
                            m_debugDraw.DrawPolygon(_loc_14, 4, _loc_15);
                            _loc_4 = _loc_4.GetNext();
                        }
                    }
                    _loc_3 = _loc_3.GetNext();
                }
            }
            if (_loc_1 & b2DebugDraw.e_centerOfMassBit)
            {
                _loc_3 = m_bodyList;
                while (_loc_3)
                {
                    
                    _loc_11 = s_xf;
                    _loc_11.R = _loc_3.m_xf.R;
                    _loc_11.position = _loc_3.GetWorldCenter();
                    m_debugDraw.DrawTransform(_loc_11);
                    _loc_3 = _loc_3.m_next;
                }
            }
            return;
        }// end function

        public function DestroyBody(param1:b2Body) : void
        {
            var _loc_6:b2JointEdge = null;
            var _loc_7:b2ControllerEdge = null;
            var _loc_8:b2ContactEdge = null;
            var _loc_9:b2Fixture = null;
            if (IsLocked() == true)
            {
                return;
            }
            var _loc_2:* = param1.m_jointList;
            while (_loc_2)
            {
                
                _loc_6 = _loc_2;
                _loc_2 = _loc_2.next;
                if (m_destructionListener)
                {
                    m_destructionListener.SayGoodbyeJoint(_loc_6.joint);
                }
                DestroyJoint(_loc_6.joint);
            }
            var _loc_3:* = param1.m_controllerList;
            while (_loc_3)
            {
                
                _loc_7 = _loc_3;
                _loc_3 = _loc_3.nextController;
                _loc_7.controller.RemoveBody(param1);
            }
            var _loc_4:* = param1.m_contactList;
            while (_loc_4)
            {
                
                _loc_8 = _loc_4;
                _loc_4 = _loc_4.next;
                m_contactManager.Destroy(_loc_8.contact);
            }
            param1.m_contactList = null;
            var _loc_5:* = param1.m_fixtureList;
            while (_loc_5)
            {
                
                _loc_9 = _loc_5;
                _loc_5 = _loc_5.m_next;
                if (m_destructionListener)
                {
                    m_destructionListener.SayGoodbyeFixture(_loc_9);
                }
                _loc_9.DestroyProxy(m_contactManager.m_broadPhase);
                _loc_9.Destroy();
            }
            param1.m_fixtureList = null;
            param1.m_fixtureCount = 0;
            if (param1.m_prev)
            {
                param1.m_prev.m_next = param1.m_next;
            }
            if (param1.m_next)
            {
                param1.m_next.m_prev = param1.m_prev;
            }
            if (param1 == m_bodyList)
            {
                m_bodyList = param1.m_next;
            }
            var _loc_11:* = m_bodyCount - 1;
            m_bodyCount = _loc_11;
            return;
        }// end function

        function DrawShape(param1:b2Shape, param2:b2Transform, param3:b2Color) : void
        {
            var _loc_4:b2CircleShape = null;
            var _loc_5:b2Vec2 = null;
            var _loc_6:Number = NaN;
            var _loc_7:b2Vec2 = null;
            var _loc_8:int = 0;
            var _loc_9:b2PolygonShape = null;
            var _loc_10:int = 0;
            var _loc_11:Array = null;
            var _loc_12:Array = null;
            var _loc_13:b2EdgeShape = null;
            switch(param1.m_type)
            {
                case b2Shape.e_circleShape:
                {
                    _loc_4 = param1 as b2CircleShape;
                    _loc_5 = b2Math.MulX(param2, _loc_4.m_p);
                    _loc_6 = _loc_4.m_radius;
                    _loc_7 = param2.R.col1;
                    m_debugDraw.DrawSolidCircle(_loc_5, _loc_6, _loc_7, param3);
                    break;
                }
                case b2Shape.e_polygonShape:
                {
                    _loc_9 = param1 as b2PolygonShape;
                    _loc_10 = _loc_9.GetVertexCount();
                    _loc_11 = _loc_9.GetVertices();
                    _loc_12 = new Array(_loc_10);
                    _loc_8 = 0;
                    while (_loc_8 < _loc_10)
                    {
                        
                        _loc_12[_loc_8] = b2Math.MulX(param2, _loc_11[_loc_8]);
                        _loc_8++;
                    }
                    m_debugDraw.DrawSolidPolygon(_loc_12, _loc_10, param3);
                    break;
                }
                case b2Shape.e_edgeShape:
                {
                    _loc_13 = param1 as b2EdgeShape;
                    m_debugDraw.DrawSegment(b2Math.MulX(param2, _loc_13.GetVertex1()), b2Math.MulX(param2, _loc_13.GetVertex2()), param3);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function GetGroundBody() : b2Body
        {
            return m_groundBody;
        }// end function

        public function DestroyController(param1:b2Controller) : void
        {
            param1.Clear();
            if (param1.m_next)
            {
                param1.m_next.m_prev = param1.m_prev;
            }
            if (param1.m_prev)
            {
                param1.m_prev.m_next = param1.m_next;
            }
            if (param1 == m_controllerList)
            {
                m_controllerList = param1.m_next;
            }
            var _loc_3:* = m_controllerCount - 1;
            m_controllerCount = _loc_3;
            return;
        }// end function

        function Solve(param1:b2TimeStep) : void
        {
            var _loc_2:b2Body = null;
            var _loc_10:int = 0;
            var _loc_11:int = 0;
            var _loc_12:b2Body = null;
            var _loc_13:b2ContactEdge = null;
            var _loc_14:b2JointEdge = null;
            var _loc_3:* = m_controllerList;
            while (_loc_3)
            {
                
                _loc_3.Step(param1);
                _loc_3 = _loc_3.m_next;
            }
            var _loc_4:* = m_island;
            m_island.Initialize(m_bodyCount, m_contactCount, m_jointCount, null, m_contactManager.m_contactListener, m_contactSolver);
            _loc_2 = m_bodyList;
            while (_loc_2)
            {
                
                _loc_2.m_flags = _loc_2.m_flags & ~b2Body.e_islandFlag;
                _loc_2 = _loc_2.m_next;
            }
            var _loc_5:* = m_contactList;
            while (_loc_5)
            {
                
                _loc_5.m_flags = _loc_5.m_flags & ~b2Contact.e_islandFlag;
                _loc_5 = _loc_5.m_next;
            }
            var _loc_6:* = m_jointList;
            while (_loc_6)
            {
                
                _loc_6.m_islandFlag = false;
                _loc_6 = _loc_6.m_next;
            }
            var _loc_7:* = m_bodyCount;
            var _loc_8:* = s_stack;
            var _loc_9:* = m_bodyList;
            while (_loc_9)
            {
                
                if (_loc_9.m_flags & b2Body.e_islandFlag)
                {
                }
                else if (_loc_9.IsAwake() == false || _loc_9.IsActive() == false)
                {
                }
                else if (_loc_9.GetType() == b2Body.b2_staticBody)
                {
                }
                else
                {
                    _loc_4.Clear();
                    _loc_10 = 0;
                    _loc_8[++_loc_10] = _loc_9;
                    _loc_9.m_flags = _loc_9.m_flags | b2Body.e_islandFlag;
                    while (_loc_10 > 0)
                    {
                        
                        _loc_2 = _loc_8[--_loc_10];
                        _loc_4.AddBody(_loc_2);
                        if (_loc_2.IsAwake() == false)
                        {
                            _loc_2.SetAwake(true);
                        }
                        if (_loc_2.GetType() == b2Body.b2_staticBody)
                        {
                            continue;
                        }
                        _loc_13 = _loc_2.m_contactList;
                        while (_loc_13)
                        {
                            
                            if (_loc_13.contact.m_flags & b2Contact.e_islandFlag)
                            {
                            }
                            else if (_loc_13.contact.IsSensor() == true || _loc_13.contact.IsEnabled() == false || _loc_13.contact.IsTouching() == false)
                            {
                            }
                            else
                            {
                                _loc_4.AddContact(_loc_13.contact);
                                _loc_13.contact.m_flags = _loc_13.contact.m_flags | b2Contact.e_islandFlag;
                                _loc_12 = _loc_13.other;
                                if (_loc_12.m_flags & b2Body.e_islandFlag)
                                {
                                }
                                else
                                {
                                    _loc_10 = --_loc_10 + 1;
                                    _loc_8[--_loc_10] = _loc_12;
                                    _loc_12.m_flags = _loc_12.m_flags | b2Body.e_islandFlag;
                                }
                            }
                            _loc_13 = _loc_13.next;
                        }
                        _loc_14 = _loc_2.m_jointList;
                        while (_loc_14)
                        {
                            
                            if (_loc_14.joint.m_islandFlag == true)
                            {
                            }
                            else
                            {
                                _loc_12 = _loc_14.other;
                                if (_loc_12.IsActive() == false)
                                {
                                }
                                else
                                {
                                    _loc_4.AddJoint(_loc_14.joint);
                                    _loc_14.joint.m_islandFlag = true;
                                    if (_loc_12.m_flags & b2Body.e_islandFlag)
                                    {
                                    }
                                    else
                                    {
                                        _loc_8[++_loc_10] = _loc_12;
                                        _loc_12.m_flags = _loc_12.m_flags | b2Body.e_islandFlag;
                                    }
                                }
                            }
                            _loc_14 = _loc_14.next;
                        }
                    }
                    _loc_4.Solve(param1, m_gravity, m_allowSleep);
                    _loc_11 = 0;
                    while (_loc_11 < _loc_4.m_bodyCount)
                    {
                        
                        _loc_2 = _loc_4.m_bodies[_loc_11];
                        if (_loc_2.GetType() == b2Body.b2_staticBody)
                        {
                            _loc_2.m_flags = _loc_2.m_flags & ~b2Body.e_islandFlag;
                        }
                        _loc_11++;
                    }
                }
                _loc_9 = _loc_9.m_next;
            }
            _loc_11 = 0;
            while (_loc_11 < _loc_8.length)
            {
                
                if (!_loc_8[_loc_11])
                {
                    break;
                }
                _loc_8[_loc_11] = null;
                _loc_11++;
            }
            _loc_2 = m_bodyList;
            while (_loc_2)
            {
                
                if (_loc_2.IsAwake() == false || _loc_2.IsActive() == false)
                {
                }
                else if (_loc_2.GetType() == b2Body.b2_staticBody)
                {
                }
                else
                {
                    _loc_2.SynchronizeFixtures();
                }
                _loc_2 = _loc_2.m_next;
            }
            m_contactManager.FindNewContacts();
            return;
        }// end function

        public function SetGravity(param1:b2Vec2) : void
        {
            m_gravity = param1;
            return;
        }// end function

        public function SetContactFilter(param1:b2ContactFilter) : void
        {
            m_contactManager.m_contactFilter = param1;
            return;
        }// end function

        function SolveTOI(param1:b2TimeStep) : void
        {
            var _loc_2:b2Body = null;
            var _loc_3:b2Fixture = null;
            var _loc_4:b2Fixture = null;
            var _loc_5:b2Body = null;
            var _loc_6:b2Body = null;
            var _loc_7:b2ContactEdge = null;
            var _loc_8:b2Joint = null;
            var _loc_11:b2Contact = null;
            var _loc_12:b2Contact = null;
            var _loc_13:Number = NaN;
            var _loc_14:b2Body = null;
            var _loc_15:int = 0;
            var _loc_16:int = 0;
            var _loc_17:b2JointEdge = null;
            var _loc_18:b2TimeStep = null;
            var _loc_19:int = 0;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:b2Body = null;
            var _loc_9:* = m_island;
            m_island.Initialize(m_bodyCount, b2Settings.b2_maxTOIContactsPerIsland, b2Settings.b2_maxTOIJointsPerIsland, null, m_contactManager.m_contactListener, m_contactSolver);
            var _loc_10:* = s_queue;
            _loc_2 = m_bodyList;
            while (_loc_2)
            {
                
                _loc_2.m_flags = _loc_2.m_flags & ~b2Body.e_islandFlag;
                _loc_2.m_sweep.t0 = 0;
                _loc_2 = _loc_2.m_next;
            }
            _loc_11 = m_contactList;
            while (_loc_11)
            {
                
                _loc_11.m_flags = _loc_11.m_flags & ~(b2Contact.e_toiFlag | b2Contact.e_islandFlag);
                _loc_11 = _loc_11.m_next;
            }
            _loc_8 = m_jointList;
            while (_loc_8)
            {
                
                _loc_8.m_islandFlag = false;
                _loc_8 = _loc_8.m_next;
            }
            while (true)
            {
                
                _loc_12 = null;
                _loc_13 = 1;
                _loc_11 = m_contactList;
                while (_loc_11)
                {
                    
                    if (_loc_11.IsSensor() == true || _loc_11.IsEnabled() == false || _loc_11.IsContinuous() == false)
                    {
                    }
                    else
                    {
                        _loc_20 = 1;
                        if (_loc_11.m_flags & b2Contact.e_toiFlag)
                        {
                            _loc_20 = _loc_11.m_toi;
                        }
                        else
                        {
                            _loc_3 = _loc_11.m_fixtureA;
                            _loc_4 = _loc_11.m_fixtureB;
                            _loc_5 = _loc_3.m_body;
                            _loc_6 = _loc_4.m_body;
                            if ((_loc_5.GetType() != b2Body.b2_dynamicBody || _loc_5.IsAwake() == false) && (_loc_6.GetType() != b2Body.b2_dynamicBody || _loc_6.IsAwake() == false))
                            {
                            }
                            _loc_21 = _loc_5.m_sweep.t0;
                            if (_loc_5.m_sweep.t0 < _loc_6.m_sweep.t0)
                            {
                                _loc_21 = _loc_6.m_sweep.t0;
                                _loc_5.m_sweep.Advance(_loc_21);
                            }
                            else if (_loc_6.m_sweep.t0 < _loc_5.m_sweep.t0)
                            {
                                _loc_21 = _loc_5.m_sweep.t0;
                                _loc_6.m_sweep.Advance(_loc_21);
                            }
                            _loc_20 = _loc_11.ComputeTOI(_loc_5.m_sweep, _loc_6.m_sweep);
                            b2Settings.b2Assert(_loc_20 >= 0 && _loc_20 <= 1);
                            if (_loc_20 > 0 && _loc_20 < 1)
                            {
                                _loc_20 = (1 - _loc_20) * _loc_21 + _loc_20;
                                if (_loc_20 > 1)
                                {
                                    _loc_20 = 1;
                                }
                            }
                            _loc_11.m_toi = _loc_20;
                            _loc_11.m_flags = _loc_11.m_flags | b2Contact.e_toiFlag;
                        }
                        if (Number.MIN_VALUE < _loc_20 && _loc_20 < _loc_13)
                        {
                            _loc_12 = _loc_11;
                            _loc_13 = _loc_20;
                        }
                    }
                    _loc_11 = _loc_11.m_next;
                }
                if (_loc_12 == null || 1 - 100 * Number.MIN_VALUE < _loc_13)
                {
                    break;
                }
                _loc_3 = _loc_12.m_fixtureA;
                _loc_4 = _loc_12.m_fixtureB;
                _loc_5 = _loc_3.m_body;
                _loc_6 = _loc_4.m_body;
                s_backupA.Set(_loc_5.m_sweep);
                s_backupB.Set(_loc_6.m_sweep);
                _loc_5.Advance(_loc_13);
                _loc_6.Advance(_loc_13);
                _loc_12.Update(m_contactManager.m_contactListener);
                _loc_12.m_flags = _loc_12.m_flags & ~b2Contact.e_toiFlag;
                if (_loc_12.IsSensor() == true || _loc_12.IsEnabled() == false)
                {
                    _loc_5.m_sweep.Set(s_backupA);
                    _loc_6.m_sweep.Set(s_backupB);
                    _loc_5.SynchronizeTransform();
                    _loc_6.SynchronizeTransform();
                    continue;
                }
                if (_loc_12.IsTouching() == false)
                {
                    continue;
                }
                _loc_14 = _loc_5;
                if (_loc_14.GetType() != b2Body.b2_dynamicBody)
                {
                    _loc_14 = _loc_6;
                }
                _loc_9.Clear();
                _loc_15 = 0;
                _loc_16 = 0;
                _loc_10[_loc_15 + _loc_16++] = _loc_14;
                _loc_14.m_flags = _loc_14.m_flags | b2Body.e_islandFlag;
                while (_loc_16 > 0)
                {
                    
                    _loc_2 = _loc_10[_loc_15++];
                    _loc_16 = _loc_16 - 1;
                    _loc_9.AddBody(_loc_2);
                    if (_loc_2.IsAwake() == false)
                    {
                        _loc_2.SetAwake(true);
                    }
                    if (_loc_2.GetType() != b2Body.b2_dynamicBody)
                    {
                        continue;
                    }
                    _loc_7 = _loc_2.m_contactList;
                    while (_loc_7)
                    {
                        
                        if (_loc_9.m_contactCount == _loc_9.m_contactCapacity)
                        {
                            break;
                        }
                        if (_loc_7.contact.m_flags & b2Contact.e_islandFlag)
                        {
                        }
                        else if (_loc_7.contact.IsSensor() == true || _loc_7.contact.IsEnabled() == false || _loc_7.contact.IsTouching() == false)
                        {
                        }
                        else
                        {
                            _loc_9.AddContact(_loc_7.contact);
                            _loc_7.contact.m_flags = _loc_7.contact.m_flags | b2Contact.e_islandFlag;
                            _loc_22 = _loc_7.other;
                            if (_loc_22.m_flags & b2Body.e_islandFlag)
                            {
                            }
                            else
                            {
                                if (_loc_22.GetType() != b2Body.b2_staticBody)
                                {
                                    _loc_22.Advance(_loc_13);
                                    _loc_22.SetAwake(true);
                                }
                                _loc_10[_loc_15 + _loc_16] = _loc_22;
                                _loc_16++;
                                _loc_22.m_flags = _loc_22.m_flags | b2Body.e_islandFlag;
                            }
                        }
                        _loc_7 = _loc_7.next;
                    }
                }
                _loc_17 = _loc_2.m_jointList;
                while (_loc_17)
                {
                    
                    if (_loc_9.m_jointCount == _loc_9.m_jointCapacity)
                    {
                    }
                    else if (_loc_17.joint.m_islandFlag == true)
                    {
                    }
                    else
                    {
                        _loc_22 = _loc_17.other;
                        if (_loc_22.IsActive() == false)
                        {
                        }
                        else
                        {
                            _loc_9.AddJoint(_loc_17.joint);
                            _loc_17.joint.m_islandFlag = true;
                            if (_loc_22.m_flags & b2Body.e_islandFlag)
                            {
                            }
                            else
                            {
                                if (_loc_22.GetType() != b2Body.b2_staticBody)
                                {
                                    _loc_22.Advance(_loc_13);
                                    _loc_22.SetAwake(true);
                                }
                                _loc_10[_loc_15 + _loc_16] = _loc_22;
                                _loc_16++;
                                _loc_22.m_flags = _loc_22.m_flags | b2Body.e_islandFlag;
                            }
                        }
                    }
                    _loc_17 = _loc_17.next;
                }
                _loc_18 = s_timestep;
                _loc_18.warmStarting = false;
                _loc_18.dt = (1 - _loc_13) * param1.dt;
                _loc_18.inv_dt = 1 / _loc_18.dt;
                _loc_18.dtRatio = 0;
                _loc_18.velocityIterations = param1.velocityIterations;
                _loc_18.positionIterations = param1.positionIterations;
                _loc_9.SolveTOI(_loc_18);
                _loc_19 = 0;
                while (_loc_19 < _loc_9.m_bodyCount)
                {
                    
                    _loc_2 = _loc_9.m_bodies[_loc_19];
                    _loc_2.m_flags = _loc_2.m_flags & ~b2Body.e_islandFlag;
                    if (_loc_2.IsAwake() == false)
                    {
                    }
                    else if (_loc_2.GetType() != b2Body.b2_dynamicBody)
                    {
                    }
                    else
                    {
                        _loc_2.SynchronizeFixtures();
                        _loc_7 = _loc_2.m_contactList;
                        while (_loc_7)
                        {
                            
                            _loc_7.contact.m_flags = _loc_7.contact.m_flags & ~b2Contact.e_toiFlag;
                            _loc_7 = _loc_7.next;
                        }
                    }
                    _loc_19++;
                }
                _loc_19 = 0;
                while (_loc_19 < _loc_9.m_contactCount)
                {
                    
                    _loc_11 = _loc_9.m_contacts[_loc_19];
                    _loc_9.m_contacts[_loc_19].m_flags = _loc_11.m_flags & ~(b2Contact.e_toiFlag | b2Contact.e_islandFlag);
                    _loc_19++;
                }
                _loc_19 = 0;
                while (_loc_19 < _loc_9.m_jointCount)
                {
                    
                    _loc_8 = _loc_9.m_joints[_loc_19];
                    _loc_8.m_islandFlag = false;
                    _loc_19++;
                }
                m_contactManager.FindNewContacts();
            }
            return;
        }// end function

        public function GetJointList() : b2Joint
        {
            return m_jointList;
        }// end function

        public function GetContactCount() : int
        {
            return m_contactCount;
        }// end function

        public function GetBodyList() : b2Body
        {
            return m_bodyList;
        }// end function

        public function GetGravity() : b2Vec2
        {
            return m_gravity;
        }// end function

        public function RayCastOne(param1:b2Vec2, param2:b2Vec2) : b2Fixture
        {
            var result:b2Fixture;
            var RayCastOneWrapper:Function;
            var point1:* = param1;
            var point2:* = param2;
            RayCastOneWrapper = function (param1:b2Fixture, param2:b2Vec2, param3:b2Vec2, param4:Number) : Number
            {
                result = param1;
                return param4;
            }// end function
            ;
            RayCast(RayCastOneWrapper, point1, point2);
            return result;
        }// end function

        public function Validate() : void
        {
            m_contactManager.m_broadPhase.Validate();
            return;
        }// end function

        public function SetWarmStarting(param1:Boolean) : void
        {
            m_warmStarting = param1;
            return;
        }// end function

        public function QueryPoint(param1:Function, param2:b2Vec2) : void
        {
            var broadPhase:IBroadPhase;
            var WorldQueryWrapper:Function;
            var callback:* = param1;
            var p:* = param2;
            WorldQueryWrapper = function (param1) : Boolean
            {
                var _loc_2:* = broadPhase.GetUserData(param1) as b2Fixture;
                if (_loc_2.TestPoint(p))
                {
                    return callback(_loc_2);
                }
                return true;
            }// end function
            ;
            broadPhase = m_contactManager.m_broadPhase;
            var aabb:* = new b2AABB();
            aabb.lowerBound.Set(p.x - b2Settings.b2_linearSlop, p.y - b2Settings.b2_linearSlop);
            aabb.upperBound.Set(p.x + b2Settings.b2_linearSlop, p.y + b2Settings.b2_linearSlop);
            broadPhase.Query(WorldQueryWrapper, aabb);
            return;
        }// end function

        public function CreateJoint(param1:b2JointDef) : b2Joint
        {
            var _loc_5:b2ContactEdge = null;
            var _loc_2:* = b2Joint.Create(param1, null);
            _loc_2.m_prev = null;
            _loc_2.m_next = m_jointList;
            if (m_jointList)
            {
                m_jointList.m_prev = _loc_2;
            }
            m_jointList = _loc_2;
            var _loc_7:* = m_jointCount + 1;
            m_jointCount = _loc_7;
            _loc_2.m_edgeA.joint = _loc_2;
            _loc_2.m_edgeA.other = _loc_2.m_bodyB;
            _loc_2.m_edgeA.prev = null;
            _loc_2.m_edgeA.next = _loc_2.m_bodyA.m_jointList;
            if (_loc_2.m_bodyA.m_jointList)
            {
                _loc_2.m_bodyA.m_jointList.prev = _loc_2.m_edgeA;
            }
            _loc_2.m_bodyA.m_jointList = _loc_2.m_edgeA;
            _loc_2.m_edgeB.joint = _loc_2;
            _loc_2.m_edgeB.other = _loc_2.m_bodyA;
            _loc_2.m_edgeB.prev = null;
            _loc_2.m_edgeB.next = _loc_2.m_bodyB.m_jointList;
            if (_loc_2.m_bodyB.m_jointList)
            {
                _loc_2.m_bodyB.m_jointList.prev = _loc_2.m_edgeB;
            }
            _loc_2.m_bodyB.m_jointList = _loc_2.m_edgeB;
            var _loc_3:* = param1.bodyA;
            var _loc_4:* = param1.bodyB;
            if (param1.collideConnected == false)
            {
                _loc_5 = _loc_4.GetContactList();
                while (_loc_5)
                {
                    
                    if (_loc_5.other == _loc_3)
                    {
                        _loc_5.contact.FlagForFiltering();
                    }
                    _loc_5 = _loc_5.next;
                }
            }
            return _loc_2;
        }// end function

        public function GetContactList() : b2Contact
        {
            return m_contactList;
        }// end function

        public function DestroyJoint(param1:b2Joint) : void
        {
            var _loc_5:b2ContactEdge = null;
            var _loc_2:* = param1.m_collideConnected;
            if (param1.m_prev)
            {
                param1.m_prev.m_next = param1.m_next;
            }
            if (param1.m_next)
            {
                param1.m_next.m_prev = param1.m_prev;
            }
            if (param1 == m_jointList)
            {
                m_jointList = param1.m_next;
            }
            var _loc_3:* = param1.m_bodyA;
            var _loc_4:* = param1.m_bodyB;
            _loc_3.SetAwake(true);
            _loc_4.SetAwake(true);
            if (param1.m_edgeA.prev)
            {
                param1.m_edgeA.prev.next = param1.m_edgeA.next;
            }
            if (param1.m_edgeA.next)
            {
                param1.m_edgeA.next.prev = param1.m_edgeA.prev;
            }
            if (param1.m_edgeA == _loc_3.m_jointList)
            {
                _loc_3.m_jointList = param1.m_edgeA.next;
            }
            param1.m_edgeA.prev = null;
            param1.m_edgeA.next = null;
            if (param1.m_edgeB.prev)
            {
                param1.m_edgeB.prev.next = param1.m_edgeB.next;
            }
            if (param1.m_edgeB.next)
            {
                param1.m_edgeB.next.prev = param1.m_edgeB.prev;
            }
            if (param1.m_edgeB == _loc_4.m_jointList)
            {
                _loc_4.m_jointList = param1.m_edgeB.next;
            }
            param1.m_edgeB.prev = null;
            param1.m_edgeB.next = null;
            b2Joint.Destroy(param1, null);
            var _loc_7:* = m_jointCount - 1;
            m_jointCount = _loc_7;
            if (_loc_2 == false)
            {
                _loc_5 = _loc_4.GetContactList();
                while (_loc_5)
                {
                    
                    if (_loc_5.other == _loc_3)
                    {
                        _loc_5.contact.FlagForFiltering();
                    }
                    _loc_5 = _loc_5.next;
                }
            }
            return;
        }// end function

        public function SetContactListener(param1:b2ContactListener) : void
        {
            m_contactManager.m_contactListener = param1;
            return;
        }// end function

        public function CreateController(param1:b2Controller) : b2Controller
        {
            if (param1.m_world != this)
            {
                throw new Error("Controller can only be a member of one world");
            }
            param1.m_next = m_controllerList;
            param1.m_prev = null;
            if (m_controllerList)
            {
                m_controllerList.m_prev = param1;
            }
            m_controllerList = param1;
            var _loc_3:* = m_controllerCount + 1;
            m_controllerCount = _loc_3;
            param1.m_world = this;
            return param1;
        }// end function

        public function QueryShape(param1:Function, param2:b2Shape, param3:b2Transform = null) : void
        {
            var broadPhase:IBroadPhase;
            var WorldQueryWrapper:Function;
            var callback:* = param1;
            var shape:* = param2;
            var transform:* = param3;
            WorldQueryWrapper = function (param1) : Boolean
            {
                var _loc_2:* = broadPhase.GetUserData(param1) as b2Fixture;
                if (b2Shape.TestOverlap(shape, transform, _loc_2.GetShape(), _loc_2.GetBody().GetTransform()))
                {
                    return callback(_loc_2);
                }
                return true;
            }// end function
            ;
            if (transform == null)
            {
                transform = new b2Transform();
                transform.SetIdentity();
            }
            broadPhase = m_contactManager.m_broadPhase;
            var aabb:* = new b2AABB();
            shape.ComputeAABB(aabb, transform);
            broadPhase.Query(WorldQueryWrapper, aabb);
            return;
        }// end function

        public function CreateBody(param1:b2BodyDef) : b2Body
        {
            if (IsLocked() == true)
            {
                return null;
            }
            var _loc_2:* = new b2Body(param1, this);
            _loc_2.m_prev = null;
            _loc_2.m_next = m_bodyList;
            if (m_bodyList)
            {
                m_bodyList.m_prev = _loc_2;
            }
            m_bodyList = _loc_2;
            var _loc_4:* = m_bodyCount + 1;
            m_bodyCount = _loc_4;
            return _loc_2;
        }// end function

        public function RemoveController(param1:b2Controller) : void
        {
            if (param1.m_prev)
            {
                param1.m_prev.m_next = param1.m_next;
            }
            if (param1.m_next)
            {
                param1.m_next.m_prev = param1.m_prev;
            }
            if (m_controllerList == param1)
            {
                m_controllerList = param1.m_next;
            }
            var _loc_3:* = m_controllerCount - 1;
            m_controllerCount = _loc_3;
            return;
        }// end function

        public function SetDestructionListener(param1:b2DestructionListener) : void
        {
            m_destructionListener = param1;
            return;
        }// end function

        public function RayCast(param1:Function, param2:b2Vec2, param3:b2Vec2) : void
        {
            var broadPhase:IBroadPhase;
            var output:b2RayCastOutput;
            var RayCastWrapper:Function;
            var callback:* = param1;
            var point1:* = param2;
            var point2:* = param3;
            RayCastWrapper = function (param1:b2RayCastInput, param2) : Number
            {
                var _loc_6:Number = NaN;
                var _loc_7:b2Vec2 = null;
                var _loc_3:* = broadPhase.GetUserData(param2);
                var _loc_4:* = _loc_3 as b2Fixture;
                var _loc_5:* = (_loc_3 as b2Fixture).RayCast(output, param1);
                if ((_loc_3 as b2Fixture).RayCast(output, param1))
                {
                    _loc_6 = output.fraction;
                    _loc_7 = new b2Vec2((1 - _loc_6) * point1.x + _loc_6 * point2.x, (1 - _loc_6) * point1.y + _loc_6 * point2.y);
                    return callback(_loc_4, _loc_7, output.normal, _loc_6);
                }
                return param1.maxFraction;
            }// end function
            ;
            broadPhase = m_contactManager.m_broadPhase;
            output = new b2RayCastOutput();
            var input:* = new b2RayCastInput(point1, point2);
            broadPhase.RayCast(RayCastWrapper, input);
            return;
        }// end function

        public function Step(param1:Number, param2:int, param3:int) : void
        {
            if (m_flags & e_newFixture)
            {
                m_contactManager.FindNewContacts();
                m_flags = m_flags & ~e_newFixture;
            }
            m_flags = m_flags | e_locked;
            var _loc_4:* = s_timestep2;
            s_timestep2.dt = param1;
            _loc_4.velocityIterations = param2;
            _loc_4.positionIterations = param3;
            if (param1 > 0)
            {
                _loc_4.inv_dt = 1 / param1;
            }
            else
            {
                _loc_4.inv_dt = 0;
            }
            _loc_4.dtRatio = m_inv_dt0 * param1;
            _loc_4.warmStarting = m_warmStarting;
            m_contactManager.Collide();
            if (_loc_4.dt > 0)
            {
                Solve(_loc_4);
            }
            if (m_continuousPhysics && _loc_4.dt > 0)
            {
                SolveTOI(_loc_4);
            }
            if (_loc_4.dt > 0)
            {
                m_inv_dt0 = _loc_4.inv_dt;
            }
            m_flags = m_flags & ~e_locked;
            return;
        }// end function

        public function IsLocked() : Boolean
        {
            return (m_flags & e_locked) > 0;
        }// end function

        public function ClearForces() : void
        {
            var _loc_1:* = m_bodyList;
            while (_loc_1)
            {
                
                _loc_1.m_force.SetZero();
                _loc_1.m_torque = 0;
                _loc_1 = _loc_1.m_next;
            }
            return;
        }// end function

        public function GetBodyCount() : int
        {
            return m_bodyCount;
        }// end function

        public function SetBroadPhase(param1:IBroadPhase) : void
        {
            var _loc_4:b2Fixture = null;
            var _loc_2:* = m_contactManager.m_broadPhase;
            m_contactManager.m_broadPhase = param1;
            var _loc_3:* = m_bodyList;
            while (_loc_3)
            {
                
                _loc_4 = _loc_3.m_fixtureList;
                while (_loc_4)
                {
                    
                    _loc_4.m_proxy = param1.CreateProxy(_loc_2.GetFatAABB(_loc_4.m_proxy), _loc_4);
                    _loc_4 = _loc_4.m_next;
                }
                _loc_3 = _loc_3.m_next;
            }
            return;
        }// end function

        public function AddController(param1:b2Controller) : b2Controller
        {
            param1.m_next = m_controllerList;
            param1.m_prev = null;
            m_controllerList = param1;
            param1.m_world = this;
            var _loc_3:* = m_controllerCount + 1;
            m_controllerCount = _loc_3;
            return param1;
        }// end function

    }
}
