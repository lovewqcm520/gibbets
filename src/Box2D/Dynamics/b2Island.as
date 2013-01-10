package Box2D.Dynamics
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.Contacts.*;
    import Box2D.Dynamics.Joints.*;

    public class b2Island extends Object
    {
        private var m_contactSolver:b2ContactSolver;
        private var m_listener:b2ContactListener;
        private var m_bodyCapacity:int;
        var m_bodies:Array;
        var m_bodyCount:int;
        var m_jointCapacity:int;
        var m_contactCount:int;
        var m_contacts:Array;
        var m_contactCapacity:int;
        var m_jointCount:int;
        private var m_allocator:Object;
        var m_joints:Array;
        private static var s_impulse:b2ContactImpulse = new b2ContactImpulse();

        public function b2Island()
        {
            m_bodies = new Array();
            m_contacts = new Array();
            m_joints = new Array();
            return;
        }// end function

        public function AddBody(param1:b2Body) : void
        {
            param1.m_islandIndex = m_bodyCount;
            var _loc_2:* = m_bodyCount + 1;
            m_bodies[_loc_2] = param1;
            return;
        }// end function

        public function AddJoint(param1:b2Joint) : void
        {
            var _loc_2:* = m_jointCount + 1;
            m_joints[_loc_2] = param1;
            return;
        }// end function

        public function Report(param1:Array) : void
        {
            var _loc_3:b2Contact = null;
            var _loc_4:b2ContactConstraint = null;
            var _loc_5:int = 0;
            if (m_listener == null)
            {
                return;
            }
            var _loc_2:int = 0;
            while (_loc_2 < m_contactCount)
            {
                
                _loc_3 = m_contacts[_loc_2];
                _loc_4 = param1[_loc_2];
                _loc_5 = 0;
                while (_loc_5 < _loc_4.pointCount)
                {
                    
                    s_impulse.normalImpulses[_loc_5] = _loc_4.points[_loc_5].normalImpulse;
                    s_impulse.tangentImpulses[_loc_5] = _loc_4.points[_loc_5].tangentImpulse;
                    _loc_5++;
                }
                m_listener.PostSolve(_loc_3, s_impulse);
                _loc_2++;
            }
            return;
        }// end function

        public function AddContact(param1:b2Contact) : void
        {
            var _loc_2:* = m_contactCount + 1;
            m_contacts[_loc_2] = param1;
            return;
        }// end function

        public function Solve(param1:b2TimeStep, param2:b2Vec2, param3:Boolean) : void
        {
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_6:b2Body = null;
            var _loc_7:b2Joint = null;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Boolean = false;
            var _loc_13:Boolean = false;
            var _loc_14:Boolean = false;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            _loc_4 = 0;
            while (_loc_4 < m_bodyCount)
            {
                
                _loc_6 = m_bodies[_loc_4];
                if (_loc_6.GetType() != b2Body.b2_dynamicBody)
                {
                }
                else
                {
                    _loc_6.m_linearVelocity.x = _loc_6.m_linearVelocity.x + param1.dt * (param2.x + _loc_6.m_invMass * _loc_6.m_force.x);
                    _loc_6.m_linearVelocity.y = _loc_6.m_linearVelocity.y + param1.dt * (param2.y + _loc_6.m_invMass * _loc_6.m_force.y);
                    _loc_6.m_angularVelocity = _loc_6.m_angularVelocity + param1.dt * _loc_6.m_invI * _loc_6.m_torque;
                    _loc_6.m_linearVelocity.Multiply(b2Math.Clamp(1 - param1.dt * _loc_6.m_linearDamping, 0, 1));
                    _loc_6.m_angularVelocity = _loc_6.m_angularVelocity * b2Math.Clamp(1 - param1.dt * _loc_6.m_angularDamping, 0, 1);
                }
                _loc_4++;
            }
            m_contactSolver.Initialize(param1, m_contacts, m_contactCount, m_allocator);
            var _loc_8:* = m_contactSolver;
            m_contactSolver.InitVelocityConstraints(param1);
            _loc_4 = 0;
            while (_loc_4 < m_jointCount)
            {
                
                _loc_7 = m_joints[_loc_4];
                _loc_7.InitVelocityConstraints(param1);
                _loc_4++;
            }
            _loc_4 = 0;
            while (_loc_4 < param1.velocityIterations)
            {
                
                _loc_5 = 0;
                while (_loc_5 < m_jointCount)
                {
                    
                    _loc_7 = m_joints[_loc_5];
                    _loc_7.SolveVelocityConstraints(param1);
                    _loc_5++;
                }
                _loc_8.SolveVelocityConstraints();
                _loc_4++;
            }
            _loc_4 = 0;
            while (_loc_4 < m_jointCount)
            {
                
                _loc_7 = m_joints[_loc_4];
                _loc_7.FinalizeVelocityConstraints();
                _loc_4++;
            }
            _loc_8.FinalizeVelocityConstraints();
            _loc_4 = 0;
            while (_loc_4 < m_bodyCount)
            {
                
                _loc_6 = m_bodies[_loc_4];
                if (_loc_6.GetType() == b2Body.b2_staticBody)
                {
                }
                else
                {
                    _loc_9 = param1.dt * _loc_6.m_linearVelocity.x;
                    _loc_10 = param1.dt * _loc_6.m_linearVelocity.y;
                    if (_loc_9 * _loc_9 + _loc_10 * _loc_10 > b2Settings.b2_maxTranslationSquared)
                    {
                        _loc_6.m_linearVelocity.Normalize();
                        _loc_6.m_linearVelocity.x = _loc_6.m_linearVelocity.x * (b2Settings.b2_maxTranslation * param1.inv_dt);
                        _loc_6.m_linearVelocity.y = _loc_6.m_linearVelocity.y * (b2Settings.b2_maxTranslation * param1.inv_dt);
                    }
                    _loc_11 = param1.dt * _loc_6.m_angularVelocity;
                    if (param1.dt * _loc_6.m_angularVelocity * _loc_11 > b2Settings.b2_maxRotationSquared)
                    {
                        if (_loc_6.m_angularVelocity < 0)
                        {
                            _loc_6.m_angularVelocity = (-b2Settings.b2_maxRotation) * param1.inv_dt;
                        }
                        else
                        {
                            _loc_6.m_angularVelocity = b2Settings.b2_maxRotation * param1.inv_dt;
                        }
                    }
                    _loc_6.m_sweep.c0.SetV(_loc_6.m_sweep.c);
                    _loc_6.m_sweep.a0 = _loc_6.m_sweep.a;
                    _loc_6.m_sweep.c.x = _loc_6.m_sweep.c.x + param1.dt * _loc_6.m_linearVelocity.x;
                    _loc_6.m_sweep.c.y = _loc_6.m_sweep.c.y + param1.dt * _loc_6.m_linearVelocity.y;
                    _loc_6.m_sweep.a = _loc_6.m_sweep.a + param1.dt * _loc_6.m_angularVelocity;
                    _loc_6.SynchronizeTransform();
                }
                _loc_4++;
            }
            _loc_4 = 0;
            while (_loc_4 < param1.positionIterations)
            {
                
                _loc_12 = _loc_8.SolvePositionConstraints(b2Settings.b2_contactBaumgarte);
                _loc_13 = true;
                _loc_5 = 0;
                while (_loc_5 < m_jointCount)
                {
                    
                    _loc_7 = m_joints[_loc_5];
                    _loc_14 = _loc_7.SolvePositionConstraints(b2Settings.b2_contactBaumgarte);
                    _loc_13 = _loc_13 && _loc_14;
                    _loc_5++;
                }
                if (_loc_12 && _loc_13)
                {
                    break;
                }
                _loc_4++;
            }
            Report(_loc_8.m_constraints);
            if (param3)
            {
                _loc_15 = Number.MAX_VALUE;
                _loc_16 = b2Settings.b2_linearSleepTolerance * b2Settings.b2_linearSleepTolerance;
                _loc_17 = b2Settings.b2_angularSleepTolerance * b2Settings.b2_angularSleepTolerance;
                _loc_4 = 0;
                while (_loc_4 < m_bodyCount)
                {
                    
                    _loc_6 = m_bodies[_loc_4];
                    if (_loc_6.GetType() == b2Body.b2_staticBody)
                    {
                    }
                    else
                    {
                        if ((_loc_6.m_flags & b2Body.e_allowSleepFlag) == 0)
                        {
                            _loc_6.m_sleepTime = 0;
                            _loc_15 = 0;
                        }
                        if ((_loc_6.m_flags & b2Body.e_allowSleepFlag) == 0 || _loc_6.m_angularVelocity * _loc_6.m_angularVelocity > _loc_17 || b2Math.Dot(_loc_6.m_linearVelocity, _loc_6.m_linearVelocity) > _loc_16)
                        {
                            _loc_6.m_sleepTime = 0;
                            _loc_15 = 0;
                        }
                        else
                        {
                            _loc_6.m_sleepTime = _loc_6.m_sleepTime + param1.dt;
                            _loc_15 = b2Math.Min(_loc_15, _loc_6.m_sleepTime);
                        }
                    }
                    _loc_4++;
                }
                if (_loc_15 >= b2Settings.b2_timeToSleep)
                {
                    _loc_4 = 0;
                    while (_loc_4 < m_bodyCount)
                    {
                        
                        _loc_6 = m_bodies[_loc_4];
                        _loc_6.SetAwake(false);
                        _loc_4++;
                    }
                }
            }
            return;
        }// end function

        public function Clear() : void
        {
            m_bodyCount = 0;
            m_contactCount = 0;
            m_jointCount = 0;
            return;
        }// end function

        public function SolveTOI(param1:b2TimeStep) : void
        {
            var _loc_2:int = 0;
            var _loc_3:int = 0;
            var _loc_6:b2Body = null;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Boolean = false;
            var _loc_11:Boolean = false;
            var _loc_12:Boolean = false;
            m_contactSolver.Initialize(param1, m_contacts, m_contactCount, m_allocator);
            var _loc_4:* = m_contactSolver;
            _loc_2 = 0;
            while (_loc_2 < m_jointCount)
            {
                
                m_joints[_loc_2].InitVelocityConstraints(param1);
                _loc_2++;
            }
            _loc_2 = 0;
            while (_loc_2 < param1.velocityIterations)
            {
                
                _loc_4.SolveVelocityConstraints();
                _loc_3 = 0;
                while (_loc_3 < m_jointCount)
                {
                    
                    m_joints[_loc_3].SolveVelocityConstraints(param1);
                    _loc_3++;
                }
                _loc_2++;
            }
            _loc_2 = 0;
            while (_loc_2 < m_bodyCount)
            {
                
                _loc_6 = m_bodies[_loc_2];
                if (_loc_6.GetType() == b2Body.b2_staticBody)
                {
                }
                else
                {
                    _loc_7 = param1.dt * _loc_6.m_linearVelocity.x;
                    _loc_8 = param1.dt * _loc_6.m_linearVelocity.y;
                    if (_loc_7 * _loc_7 + _loc_8 * _loc_8 > b2Settings.b2_maxTranslationSquared)
                    {
                        _loc_6.m_linearVelocity.Normalize();
                        _loc_6.m_linearVelocity.x = _loc_6.m_linearVelocity.x * (b2Settings.b2_maxTranslation * param1.inv_dt);
                        _loc_6.m_linearVelocity.y = _loc_6.m_linearVelocity.y * (b2Settings.b2_maxTranslation * param1.inv_dt);
                    }
                    _loc_9 = param1.dt * _loc_6.m_angularVelocity;
                    if (param1.dt * _loc_6.m_angularVelocity * _loc_9 > b2Settings.b2_maxRotationSquared)
                    {
                        if (_loc_6.m_angularVelocity < 0)
                        {
                            _loc_6.m_angularVelocity = (-b2Settings.b2_maxRotation) * param1.inv_dt;
                        }
                        else
                        {
                            _loc_6.m_angularVelocity = b2Settings.b2_maxRotation * param1.inv_dt;
                        }
                    }
                    _loc_6.m_sweep.c0.SetV(_loc_6.m_sweep.c);
                    _loc_6.m_sweep.a0 = _loc_6.m_sweep.a;
                    _loc_6.m_sweep.c.x = _loc_6.m_sweep.c.x + param1.dt * _loc_6.m_linearVelocity.x;
                    _loc_6.m_sweep.c.y = _loc_6.m_sweep.c.y + param1.dt * _loc_6.m_linearVelocity.y;
                    _loc_6.m_sweep.a = _loc_6.m_sweep.a + param1.dt * _loc_6.m_angularVelocity;
                    _loc_6.SynchronizeTransform();
                }
                _loc_2++;
            }
            var _loc_5:Number = 0.75;
            _loc_2 = 0;
            while (_loc_2 < param1.positionIterations)
            {
                
                _loc_10 = _loc_4.SolvePositionConstraints(_loc_5);
                _loc_11 = true;
                _loc_3 = 0;
                while (_loc_3 < m_jointCount)
                {
                    
                    _loc_12 = m_joints[_loc_3].SolvePositionConstraints(b2Settings.b2_contactBaumgarte);
                    _loc_11 = _loc_11 && _loc_12;
                    _loc_3++;
                }
                if (_loc_10 && _loc_11)
                {
                    break;
                }
                _loc_2++;
            }
            Report(_loc_4.m_constraints);
            return;
        }// end function

        public function Initialize(param1:int, param2:int, param3:int, param4, param5:b2ContactListener, param6:b2ContactSolver) : void
        {
            var _loc_7:int = 0;
            m_bodyCapacity = param1;
            m_contactCapacity = param2;
            m_jointCapacity = param3;
            m_bodyCount = 0;
            m_contactCount = 0;
            m_jointCount = 0;
            m_allocator = param4;
            m_listener = param5;
            m_contactSolver = param6;
            _loc_7 = m_bodies.length;
            while (_loc_7 < param1)
            {
                
                m_bodies[_loc_7] = null;
                _loc_7++;
            }
            _loc_7 = m_contacts.length;
            while (_loc_7 < param2)
            {
                
                m_contacts[_loc_7] = null;
                _loc_7++;
            }
            _loc_7 = m_joints.length;
            while (_loc_7 < param3)
            {
                
                m_joints[_loc_7] = null;
                _loc_7++;
            }
            return;
        }// end function

    }
}
