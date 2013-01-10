package Box2D.Dynamics.Contacts
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2ContactSolver extends Object
    {
        private var m_constraintCount:int;
        var m_constraints:Array;
        private var m_allocator:Object;
        private var m_step:b2TimeStep;
        private static var s_psm:b2PositionSolverManifold = new b2PositionSolverManifold();
        private static var s_worldManifold:b2WorldManifold = new b2WorldManifold();

        public function b2ContactSolver()
        {
            m_step = new b2TimeStep();
            m_constraints = new Array();
            return;
        }// end function

        public function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            var _loc_2:b2Vec2 = null;
            var _loc_3:b2Vec2 = null;
            var _loc_4:b2Mat22 = null;
            var _loc_6:b2ContactConstraint = null;
            var _loc_7:b2Body = null;
            var _loc_8:b2Body = null;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:int = 0;
            var _loc_19:int = 0;
            var _loc_20:b2ContactConstraintPoint = null;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:b2ContactConstraintPoint = null;
            var _loc_5:int = 0;
            while (_loc_5 < m_constraintCount)
            {
                
                _loc_6 = m_constraints[_loc_5];
                _loc_7 = _loc_6.bodyA;
                _loc_8 = _loc_6.bodyB;
                _loc_9 = _loc_7.m_invMass;
                _loc_10 = _loc_7.m_invI;
                _loc_11 = _loc_8.m_invMass;
                _loc_12 = _loc_8.m_invI;
                _loc_13 = _loc_6.normal.x;
                _loc_14 = _loc_6.normal.y;
                _loc_15 = _loc_14;
                _loc_16 = -_loc_13;
                if (param1.warmStarting)
                {
                    _loc_19 = _loc_6.pointCount;
                    _loc_18 = 0;
                    while (_loc_18 < _loc_19)
                    {
                        
                        _loc_20 = _loc_6.points[_loc_18];
                        _loc_6.points[_loc_18].normalImpulse = _loc_20.normalImpulse * param1.dtRatio;
                        _loc_20.tangentImpulse = _loc_20.tangentImpulse * param1.dtRatio;
                        _loc_21 = _loc_20.normalImpulse * _loc_13 + _loc_20.tangentImpulse * _loc_15;
                        _loc_22 = _loc_20.normalImpulse * _loc_14 + _loc_20.tangentImpulse * _loc_16;
                        _loc_7.m_angularVelocity = _loc_7.m_angularVelocity - _loc_10 * (_loc_20.rA.x * _loc_22 - _loc_20.rA.y * _loc_21);
                        _loc_7.m_linearVelocity.x = _loc_7.m_linearVelocity.x - _loc_9 * _loc_21;
                        _loc_7.m_linearVelocity.y = _loc_7.m_linearVelocity.y - _loc_9 * _loc_22;
                        _loc_8.m_angularVelocity = _loc_8.m_angularVelocity + _loc_12 * (_loc_20.rB.x * _loc_22 - _loc_20.rB.y * _loc_21);
                        _loc_8.m_linearVelocity.x = _loc_8.m_linearVelocity.x + _loc_11 * _loc_21;
                        _loc_8.m_linearVelocity.y = _loc_8.m_linearVelocity.y + _loc_11 * _loc_22;
                        _loc_18++;
                    }
                }
                else
                {
                    _loc_19 = _loc_6.pointCount;
                    _loc_18 = 0;
                    while (_loc_18 < _loc_19)
                    {
                        
                        _loc_23 = _loc_6.points[_loc_18];
                        _loc_23.normalImpulse = 0;
                        _loc_23.tangentImpulse = 0;
                        _loc_18++;
                    }
                }
                _loc_5++;
            }
            return;
        }// end function

        public function SolvePositionConstraints(param1:Number) : Boolean
        {
            var _loc_4:b2ContactConstraint = null;
            var _loc_5:b2Body = null;
            var _loc_6:b2Body = null;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:b2Vec2 = null;
            var _loc_12:int = 0;
            var _loc_13:b2ContactConstraintPoint = null;
            var _loc_14:b2Vec2 = null;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_2:Number = 0;
            var _loc_3:int = 0;
            while (_loc_3 < m_constraintCount)
            {
                
                _loc_4 = m_constraints[_loc_3];
                _loc_5 = _loc_4.bodyA;
                _loc_6 = _loc_4.bodyB;
                _loc_7 = _loc_5.m_mass * _loc_5.m_invMass;
                _loc_8 = _loc_5.m_mass * _loc_5.m_invI;
                _loc_9 = _loc_6.m_mass * _loc_6.m_invMass;
                _loc_10 = _loc_6.m_mass * _loc_6.m_invI;
                s_psm.Initialize(_loc_4);
                _loc_11 = s_psm.m_normal;
                _loc_12 = 0;
                while (_loc_12 < _loc_4.pointCount)
                {
                    
                    _loc_13 = _loc_4.points[_loc_12];
                    _loc_14 = s_psm.m_points[_loc_12];
                    _loc_15 = s_psm.m_separations[_loc_12];
                    _loc_16 = _loc_14.x - _loc_5.m_sweep.c.x;
                    _loc_17 = _loc_14.y - _loc_5.m_sweep.c.y;
                    _loc_18 = _loc_14.x - _loc_6.m_sweep.c.x;
                    _loc_19 = _loc_14.y - _loc_6.m_sweep.c.y;
                    _loc_2 = _loc_2 < _loc_15 ? (_loc_2) : (_loc_15);
                    _loc_20 = b2Math.Clamp(param1 * (_loc_15 + b2Settings.b2_linearSlop), -b2Settings.b2_maxLinearCorrection, 0);
                    _loc_21 = (-_loc_13.equalizedMass) * _loc_20;
                    _loc_22 = _loc_21 * _loc_11.x;
                    _loc_23 = _loc_21 * _loc_11.y;
                    _loc_5.m_sweep.c.x = _loc_5.m_sweep.c.x - _loc_7 * _loc_22;
                    _loc_5.m_sweep.c.y = _loc_5.m_sweep.c.y - _loc_7 * _loc_23;
                    _loc_5.m_sweep.a = _loc_5.m_sweep.a - _loc_8 * (_loc_16 * _loc_23 - _loc_17 * _loc_22);
                    _loc_5.SynchronizeTransform();
                    _loc_6.m_sweep.c.x = _loc_6.m_sweep.c.x + _loc_9 * _loc_22;
                    _loc_6.m_sweep.c.y = _loc_6.m_sweep.c.y + _loc_9 * _loc_23;
                    _loc_6.m_sweep.a = _loc_6.m_sweep.a + _loc_10 * (_loc_18 * _loc_23 - _loc_19 * _loc_22);
                    _loc_6.SynchronizeTransform();
                    _loc_12++;
                }
                _loc_3++;
            }
            return _loc_2 > -1.5 * b2Settings.b2_linearSlop;
        }// end function

        public function Initialize(param1:b2TimeStep, param2:Array, param3:int, param4) : void
        {
            var _loc_5:b2Contact = null;
            var _loc_6:int = 0;
            var _loc_7:b2Vec2 = null;
            var _loc_8:b2Mat22 = null;
            var _loc_9:b2Fixture = null;
            var _loc_10:b2Fixture = null;
            var _loc_11:b2Shape = null;
            var _loc_12:b2Shape = null;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:b2Body = null;
            var _loc_16:b2Body = null;
            var _loc_17:b2Manifold = null;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_25:Number = NaN;
            var _loc_26:Number = NaN;
            var _loc_27:Number = NaN;
            var _loc_28:b2ContactConstraint = null;
            var _loc_29:uint = 0;
            var _loc_30:b2ManifoldPoint = null;
            var _loc_31:b2ContactConstraintPoint = null;
            var _loc_32:Number = NaN;
            var _loc_33:Number = NaN;
            var _loc_34:Number = NaN;
            var _loc_35:Number = NaN;
            var _loc_36:Number = NaN;
            var _loc_37:Number = NaN;
            var _loc_38:Number = NaN;
            var _loc_39:Number = NaN;
            var _loc_40:Number = NaN;
            var _loc_41:Number = NaN;
            var _loc_42:Number = NaN;
            var _loc_43:Number = NaN;
            var _loc_44:Number = NaN;
            var _loc_45:Number = NaN;
            var _loc_46:Number = NaN;
            var _loc_47:Number = NaN;
            var _loc_48:b2ContactConstraintPoint = null;
            var _loc_49:b2ContactConstraintPoint = null;
            var _loc_50:Number = NaN;
            var _loc_51:Number = NaN;
            var _loc_52:Number = NaN;
            var _loc_53:Number = NaN;
            var _loc_54:Number = NaN;
            var _loc_55:Number = NaN;
            var _loc_56:Number = NaN;
            var _loc_57:Number = NaN;
            var _loc_58:Number = NaN;
            var _loc_59:Number = NaN;
            var _loc_60:Number = NaN;
            var _loc_61:Number = NaN;
            m_step.Set(param1);
            m_allocator = param4;
            m_constraintCount = param3;
            while (m_constraints.length < m_constraintCount)
            {
                
                m_constraints[m_constraints.length] = new b2ContactConstraint();
            }
            _loc_6 = 0;
            while (_loc_6 < param3)
            {
                
                _loc_5 = param2[_loc_6];
                _loc_9 = _loc_5.m_fixtureA;
                _loc_10 = _loc_5.m_fixtureB;
                _loc_11 = _loc_9.m_shape;
                _loc_12 = _loc_10.m_shape;
                _loc_13 = _loc_11.m_radius;
                _loc_14 = _loc_12.m_radius;
                _loc_15 = _loc_9.m_body;
                _loc_16 = _loc_10.m_body;
                _loc_17 = _loc_5.GetManifold();
                _loc_18 = b2Settings.b2MixFriction(_loc_9.GetFriction(), _loc_10.GetFriction());
                _loc_19 = b2Settings.b2MixRestitution(_loc_9.GetRestitution(), _loc_10.GetRestitution());
                _loc_20 = _loc_15.m_linearVelocity.x;
                _loc_21 = _loc_15.m_linearVelocity.y;
                _loc_22 = _loc_16.m_linearVelocity.x;
                _loc_23 = _loc_16.m_linearVelocity.y;
                _loc_24 = _loc_15.m_angularVelocity;
                _loc_25 = _loc_16.m_angularVelocity;
                b2Settings.b2Assert(_loc_17.m_pointCount > 0);
                s_worldManifold.Initialize(_loc_17, _loc_15.m_xf, _loc_13, _loc_16.m_xf, _loc_14);
                _loc_26 = s_worldManifold.m_normal.x;
                _loc_27 = s_worldManifold.m_normal.y;
                _loc_28 = m_constraints[_loc_6];
                _loc_28.bodyA = _loc_15;
                _loc_28.bodyB = _loc_16;
                _loc_28.manifold = _loc_17;
                _loc_28.normal.x = _loc_26;
                _loc_28.normal.y = _loc_27;
                _loc_28.pointCount = _loc_17.m_pointCount;
                _loc_28.friction = _loc_18;
                _loc_28.restitution = _loc_19;
                _loc_28.localPlaneNormal.x = _loc_17.m_localPlaneNormal.x;
                _loc_28.localPlaneNormal.y = _loc_17.m_localPlaneNormal.y;
                _loc_28.localPoint.x = _loc_17.m_localPoint.x;
                _loc_28.localPoint.y = _loc_17.m_localPoint.y;
                _loc_28.radius = _loc_13 + _loc_14;
                _loc_28.type = _loc_17.m_type;
                _loc_29 = 0;
                while (_loc_29 < _loc_28.pointCount)
                {
                    
                    _loc_30 = _loc_17.m_points[_loc_29];
                    _loc_31 = _loc_28.points[_loc_29];
                    _loc_31.normalImpulse = _loc_30.m_normalImpulse;
                    _loc_31.tangentImpulse = _loc_30.m_tangentImpulse;
                    _loc_31.localPoint.SetV(_loc_30.m_localPoint);
                    var _loc_62:* = s_worldManifold.m_points[_loc_29].x - _loc_15.m_sweep.c.x;
                    _loc_31.rA.x = s_worldManifold.m_points[_loc_29].x - _loc_15.m_sweep.c.x;
                    _loc_32 = _loc_62;
                    var _loc_62:* = s_worldManifold.m_points[_loc_29].y - _loc_15.m_sweep.c.y;
                    _loc_31.rA.y = s_worldManifold.m_points[_loc_29].y - _loc_15.m_sweep.c.y;
                    _loc_33 = _loc_62;
                    var _loc_62:* = s_worldManifold.m_points[_loc_29].x - _loc_16.m_sweep.c.x;
                    _loc_31.rB.x = s_worldManifold.m_points[_loc_29].x - _loc_16.m_sweep.c.x;
                    _loc_34 = _loc_62;
                    var _loc_62:* = s_worldManifold.m_points[_loc_29].y - _loc_16.m_sweep.c.y;
                    _loc_31.rB.y = s_worldManifold.m_points[_loc_29].y - _loc_16.m_sweep.c.y;
                    _loc_35 = _loc_62;
                    _loc_36 = _loc_32 * _loc_27 - _loc_33 * _loc_26;
                    _loc_37 = _loc_34 * _loc_27 - _loc_35 * _loc_26;
                    _loc_36 = _loc_36 * _loc_36;
                    _loc_37 = _loc_37 * _loc_37;
                    _loc_38 = _loc_15.m_invMass + _loc_16.m_invMass + _loc_15.m_invI * _loc_36 + _loc_16.m_invI * _loc_37;
                    _loc_31.normalMass = 1 / _loc_38;
                    _loc_39 = _loc_15.m_mass * _loc_15.m_invMass + _loc_16.m_mass * _loc_16.m_invMass;
                    _loc_39 = _loc_39 + (_loc_15.m_mass * _loc_15.m_invI * _loc_36 + _loc_16.m_mass * _loc_16.m_invI * _loc_37);
                    _loc_31.equalizedMass = 1 / _loc_39;
                    _loc_40 = _loc_27;
                    _loc_41 = -_loc_26;
                    _loc_42 = _loc_32 * _loc_41 - _loc_33 * _loc_40;
                    _loc_43 = _loc_34 * _loc_41 - _loc_35 * _loc_40;
                    _loc_42 = _loc_42 * _loc_42;
                    _loc_43 = _loc_43 * _loc_43;
                    _loc_44 = _loc_15.m_invMass + _loc_16.m_invMass + _loc_15.m_invI * _loc_42 + _loc_16.m_invI * _loc_43;
                    _loc_31.tangentMass = 1 / _loc_44;
                    _loc_31.velocityBias = 0;
                    _loc_45 = _loc_22 + (-_loc_25) * _loc_35 - _loc_20 - (-_loc_24) * _loc_33;
                    _loc_46 = _loc_23 + _loc_25 * _loc_34 - _loc_21 - _loc_24 * _loc_32;
                    _loc_47 = _loc_28.normal.x * _loc_45 + _loc_28.normal.y * _loc_46;
                    if (_loc_47 < -b2Settings.b2_velocityThreshold)
                    {
                        _loc_31.velocityBias = _loc_31.velocityBias + (-_loc_28.restitution) * _loc_47;
                    }
                    _loc_29 = _loc_29 + 1;
                }
                if (_loc_28.pointCount == 2)
                {
                    _loc_48 = _loc_28.points[0];
                    _loc_49 = _loc_28.points[1];
                    _loc_50 = _loc_15.m_invMass;
                    _loc_51 = _loc_15.m_invI;
                    _loc_52 = _loc_16.m_invMass;
                    _loc_53 = _loc_16.m_invI;
                    _loc_54 = _loc_48.rA.x * _loc_27 - _loc_48.rA.y * _loc_26;
                    _loc_55 = _loc_48.rB.x * _loc_27 - _loc_48.rB.y * _loc_26;
                    _loc_56 = _loc_49.rA.x * _loc_27 - _loc_49.rA.y * _loc_26;
                    _loc_57 = _loc_49.rB.x * _loc_27 - _loc_49.rB.y * _loc_26;
                    _loc_58 = _loc_50 + _loc_52 + _loc_51 * _loc_54 * _loc_54 + _loc_53 * _loc_55 * _loc_55;
                    _loc_59 = _loc_50 + _loc_52 + _loc_51 * _loc_56 * _loc_56 + _loc_53 * _loc_57 * _loc_57;
                    _loc_60 = _loc_50 + _loc_52 + _loc_51 * _loc_54 * _loc_56 + _loc_53 * _loc_55 * _loc_57;
                    _loc_61 = 100;
                    if (_loc_58 * _loc_58 < _loc_61 * (_loc_58 * _loc_59 - _loc_60 * _loc_60))
                    {
                        _loc_28.K.col1.Set(_loc_58, _loc_60);
                        _loc_28.K.col2.Set(_loc_60, _loc_59);
                        _loc_28.K.GetInverse(_loc_28.normalMass);
                    }
                    else
                    {
                        _loc_28.pointCount = 1;
                    }
                }
                _loc_6++;
            }
            return;
        }// end function

        public function SolveVelocityConstraints() : void
        {
            var _loc_1:int = 0;
            var _loc_2:b2ContactConstraintPoint = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:b2Mat22 = null;
            var _loc_23:b2Vec2 = null;
            var _loc_25:b2ContactConstraint = null;
            var _loc_26:b2Body = null;
            var _loc_27:b2Body = null;
            var _loc_28:Number = NaN;
            var _loc_29:Number = NaN;
            var _loc_30:b2Vec2 = null;
            var _loc_31:b2Vec2 = null;
            var _loc_32:Number = NaN;
            var _loc_33:Number = NaN;
            var _loc_34:Number = NaN;
            var _loc_35:Number = NaN;
            var _loc_36:Number = NaN;
            var _loc_37:Number = NaN;
            var _loc_38:Number = NaN;
            var _loc_39:Number = NaN;
            var _loc_40:Number = NaN;
            var _loc_41:Number = NaN;
            var _loc_42:int = 0;
            var _loc_43:b2ContactConstraintPoint = null;
            var _loc_44:b2ContactConstraintPoint = null;
            var _loc_45:Number = NaN;
            var _loc_46:Number = NaN;
            var _loc_47:Number = NaN;
            var _loc_48:Number = NaN;
            var _loc_49:Number = NaN;
            var _loc_50:Number = NaN;
            var _loc_51:Number = NaN;
            var _loc_52:Number = NaN;
            var _loc_53:Number = NaN;
            var _loc_54:Number = NaN;
            var _loc_55:Number = NaN;
            var _loc_56:Number = NaN;
            var _loc_57:Number = NaN;
            var _loc_24:int = 0;
            while (_loc_24 < m_constraintCount)
            {
                
                _loc_25 = m_constraints[_loc_24];
                _loc_26 = _loc_25.bodyA;
                _loc_27 = _loc_25.bodyB;
                _loc_28 = _loc_26.m_angularVelocity;
                _loc_29 = _loc_27.m_angularVelocity;
                _loc_30 = _loc_26.m_linearVelocity;
                _loc_31 = _loc_27.m_linearVelocity;
                _loc_32 = _loc_26.m_invMass;
                _loc_33 = _loc_26.m_invI;
                _loc_34 = _loc_27.m_invMass;
                _loc_35 = _loc_27.m_invI;
                _loc_36 = _loc_25.normal.x;
                _loc_37 = _loc_25.normal.y;
                _loc_38 = _loc_37;
                _loc_39 = -_loc_36;
                _loc_40 = _loc_25.friction;
                _loc_1 = 0;
                while (_loc_1 < _loc_25.pointCount)
                {
                    
                    _loc_2 = _loc_25.points[_loc_1];
                    _loc_7 = _loc_31.x - _loc_29 * _loc_2.rB.y - _loc_30.x + _loc_28 * _loc_2.rA.y;
                    _loc_8 = _loc_31.y + _loc_29 * _loc_2.rB.x - _loc_30.y - _loc_28 * _loc_2.rA.x;
                    _loc_10 = _loc_7 * _loc_38 + _loc_8 * _loc_39;
                    _loc_11 = _loc_2.tangentMass * (-_loc_10);
                    _loc_12 = _loc_40 * _loc_2.normalImpulse;
                    _loc_13 = b2Math.Clamp(_loc_2.tangentImpulse + _loc_11, -_loc_12, _loc_12);
                    _loc_11 = _loc_13 - _loc_2.tangentImpulse;
                    _loc_14 = _loc_11 * _loc_38;
                    _loc_15 = _loc_11 * _loc_39;
                    _loc_30.x = _loc_30.x - _loc_32 * _loc_14;
                    _loc_30.y = _loc_30.y - _loc_32 * _loc_15;
                    _loc_28 = _loc_28 - _loc_33 * (_loc_2.rA.x * _loc_15 - _loc_2.rA.y * _loc_14);
                    _loc_31.x = _loc_31.x + _loc_34 * _loc_14;
                    _loc_31.y = _loc_31.y + _loc_34 * _loc_15;
                    _loc_29 = _loc_29 + _loc_35 * (_loc_2.rB.x * _loc_15 - _loc_2.rB.y * _loc_14);
                    _loc_2.tangentImpulse = _loc_13;
                    _loc_1++;
                }
                _loc_42 = _loc_25.pointCount;
                if (_loc_25.pointCount == 1)
                {
                    _loc_2 = _loc_25.points[0];
                    _loc_7 = _loc_31.x + (-_loc_29) * _loc_2.rB.y - _loc_30.x - (-_loc_28) * _loc_2.rA.y;
                    _loc_8 = _loc_31.y + _loc_29 * _loc_2.rB.x - _loc_30.y - _loc_28 * _loc_2.rA.x;
                    _loc_9 = _loc_7 * _loc_36 + _loc_8 * _loc_37;
                    _loc_11 = (-_loc_2.normalMass) * (_loc_9 - _loc_2.velocityBias);
                    _loc_13 = _loc_2.normalImpulse + _loc_11;
                    _loc_13 = _loc_13 > 0 ? (_loc_13) : (0);
                    _loc_11 = _loc_13 - _loc_2.normalImpulse;
                    _loc_14 = _loc_11 * _loc_36;
                    _loc_15 = _loc_11 * _loc_37;
                    _loc_30.x = _loc_30.x - _loc_32 * _loc_14;
                    _loc_30.y = _loc_30.y - _loc_32 * _loc_15;
                    _loc_28 = _loc_28 - _loc_33 * (_loc_2.rA.x * _loc_15 - _loc_2.rA.y * _loc_14);
                    _loc_31.x = _loc_31.x + _loc_34 * _loc_14;
                    _loc_31.y = _loc_31.y + _loc_34 * _loc_15;
                    _loc_29 = _loc_29 + _loc_35 * (_loc_2.rB.x * _loc_15 - _loc_2.rB.y * _loc_14);
                    _loc_2.normalImpulse = _loc_13;
                }
                else
                {
                    _loc_43 = _loc_25.points[0];
                    _loc_44 = _loc_25.points[1];
                    _loc_45 = _loc_43.normalImpulse;
                    _loc_46 = _loc_44.normalImpulse;
                    _loc_47 = _loc_31.x - _loc_29 * _loc_43.rB.y - _loc_30.x + _loc_28 * _loc_43.rA.y;
                    _loc_48 = _loc_31.y + _loc_29 * _loc_43.rB.x - _loc_30.y - _loc_28 * _loc_43.rA.x;
                    _loc_49 = _loc_31.x - _loc_29 * _loc_44.rB.y - _loc_30.x + _loc_28 * _loc_44.rA.y;
                    _loc_50 = _loc_31.y + _loc_29 * _loc_44.rB.x - _loc_30.y - _loc_28 * _loc_44.rA.x;
                    _loc_51 = _loc_47 * _loc_36 + _loc_48 * _loc_37;
                    _loc_52 = _loc_49 * _loc_36 + _loc_50 * _loc_37;
                    _loc_53 = _loc_51 - _loc_43.velocityBias;
                    _loc_54 = _loc_52 - _loc_44.velocityBias;
                    _loc_22 = _loc_25.K;
                    _loc_53 = _loc_53 - (_loc_22.col1.x * _loc_45 + _loc_22.col2.x * _loc_46);
                    _loc_54 = _loc_54 - (_loc_22.col1.y * _loc_45 + _loc_22.col2.y * _loc_46);
                    _loc_55 = 0.001;
                    while (true)
                    {
                        
                        _loc_22 = _loc_25.normalMass;
                        _loc_56 = -(_loc_22.col1.x * _loc_53 + _loc_22.col2.x * _loc_54);
                        _loc_57 = -(_loc_22.col1.y * _loc_53 + _loc_22.col2.y * _loc_54);
                        if (_loc_56 >= 0 && _loc_57 >= 0)
                        {
                            _loc_16 = _loc_56 - _loc_45;
                            _loc_17 = _loc_57 - _loc_46;
                            _loc_18 = _loc_16 * _loc_36;
                            _loc_19 = _loc_16 * _loc_37;
                            _loc_20 = _loc_17 * _loc_36;
                            _loc_21 = _loc_17 * _loc_37;
                            _loc_30.x = _loc_30.x - _loc_32 * (_loc_18 + _loc_20);
                            _loc_30.y = _loc_30.y - _loc_32 * (_loc_19 + _loc_21);
                            _loc_28 = _loc_28 - _loc_33 * (_loc_43.rA.x * _loc_19 - _loc_43.rA.y * _loc_18 + _loc_44.rA.x * _loc_21 - _loc_44.rA.y * _loc_20);
                            _loc_31.x = _loc_31.x + _loc_34 * (_loc_18 + _loc_20);
                            _loc_31.y = _loc_31.y + _loc_34 * (_loc_19 + _loc_21);
                            _loc_29 = _loc_29 + _loc_35 * (_loc_43.rB.x * _loc_19 - _loc_43.rB.y * _loc_18 + _loc_44.rB.x * _loc_21 - _loc_44.rB.y * _loc_20);
                            _loc_43.normalImpulse = _loc_56;
                            _loc_44.normalImpulse = _loc_57;
                            break;
                        }
                        _loc_56 = (-_loc_43.normalMass) * _loc_53;
                        _loc_57 = 0;
                        _loc_51 = 0;
                        _loc_52 = _loc_25.K.col1.y * _loc_56 + _loc_54;
                        if (_loc_56 >= 0 && _loc_52 >= 0)
                        {
                            _loc_16 = _loc_56 - _loc_45;
                            _loc_17 = _loc_57 - _loc_46;
                            _loc_18 = _loc_16 * _loc_36;
                            _loc_19 = _loc_16 * _loc_37;
                            _loc_20 = _loc_17 * _loc_36;
                            _loc_21 = _loc_17 * _loc_37;
                            _loc_30.x = _loc_30.x - _loc_32 * (_loc_18 + _loc_20);
                            _loc_30.y = _loc_30.y - _loc_32 * (_loc_19 + _loc_21);
                            _loc_28 = _loc_28 - _loc_33 * (_loc_43.rA.x * _loc_19 - _loc_43.rA.y * _loc_18 + _loc_44.rA.x * _loc_21 - _loc_44.rA.y * _loc_20);
                            _loc_31.x = _loc_31.x + _loc_34 * (_loc_18 + _loc_20);
                            _loc_31.y = _loc_31.y + _loc_34 * (_loc_19 + _loc_21);
                            _loc_29 = _loc_29 + _loc_35 * (_loc_43.rB.x * _loc_19 - _loc_43.rB.y * _loc_18 + _loc_44.rB.x * _loc_21 - _loc_44.rB.y * _loc_20);
                            _loc_43.normalImpulse = _loc_56;
                            _loc_44.normalImpulse = _loc_57;
                            break;
                        }
                        _loc_56 = 0;
                        _loc_57 = (-_loc_44.normalMass) * _loc_54;
                        _loc_51 = _loc_25.K.col2.x * _loc_57 + _loc_53;
                        _loc_52 = 0;
                        if (_loc_57 >= 0 && _loc_51 >= 0)
                        {
                            _loc_16 = _loc_56 - _loc_45;
                            _loc_17 = _loc_57 - _loc_46;
                            _loc_18 = _loc_16 * _loc_36;
                            _loc_19 = _loc_16 * _loc_37;
                            _loc_20 = _loc_17 * _loc_36;
                            _loc_21 = _loc_17 * _loc_37;
                            _loc_30.x = _loc_30.x - _loc_32 * (_loc_18 + _loc_20);
                            _loc_30.y = _loc_30.y - _loc_32 * (_loc_19 + _loc_21);
                            _loc_28 = _loc_28 - _loc_33 * (_loc_43.rA.x * _loc_19 - _loc_43.rA.y * _loc_18 + _loc_44.rA.x * _loc_21 - _loc_44.rA.y * _loc_20);
                            _loc_31.x = _loc_31.x + _loc_34 * (_loc_18 + _loc_20);
                            _loc_31.y = _loc_31.y + _loc_34 * (_loc_19 + _loc_21);
                            _loc_29 = _loc_29 + _loc_35 * (_loc_43.rB.x * _loc_19 - _loc_43.rB.y * _loc_18 + _loc_44.rB.x * _loc_21 - _loc_44.rB.y * _loc_20);
                            _loc_43.normalImpulse = _loc_56;
                            _loc_44.normalImpulse = _loc_57;
                            break;
                        }
                        _loc_56 = 0;
                        _loc_57 = 0;
                        _loc_51 = _loc_53;
                        _loc_52 = _loc_54;
                        if (_loc_51 >= 0 && _loc_52 >= 0)
                        {
                            _loc_16 = _loc_56 - _loc_45;
                            _loc_17 = _loc_57 - _loc_46;
                            _loc_18 = _loc_16 * _loc_36;
                            _loc_19 = _loc_16 * _loc_37;
                            _loc_20 = _loc_17 * _loc_36;
                            _loc_21 = _loc_17 * _loc_37;
                            _loc_30.x = _loc_30.x - _loc_32 * (_loc_18 + _loc_20);
                            _loc_30.y = _loc_30.y - _loc_32 * (_loc_19 + _loc_21);
                            _loc_28 = _loc_28 - _loc_33 * (_loc_43.rA.x * _loc_19 - _loc_43.rA.y * _loc_18 + _loc_44.rA.x * _loc_21 - _loc_44.rA.y * _loc_20);
                            _loc_31.x = _loc_31.x + _loc_34 * (_loc_18 + _loc_20);
                            _loc_31.y = _loc_31.y + _loc_34 * (_loc_19 + _loc_21);
                            _loc_29 = _loc_29 + _loc_35 * (_loc_43.rB.x * _loc_19 - _loc_43.rB.y * _loc_18 + _loc_44.rB.x * _loc_21 - _loc_44.rB.y * _loc_20);
                            _loc_43.normalImpulse = _loc_56;
                            _loc_44.normalImpulse = _loc_57;
                            break;
                        }
                        break;
                    }
                }
                _loc_26.m_angularVelocity = _loc_28;
                _loc_27.m_angularVelocity = _loc_29;
                _loc_24++;
            }
            return;
        }// end function

        public function FinalizeVelocityConstraints() : void
        {
            var _loc_2:b2ContactConstraint = null;
            var _loc_3:b2Manifold = null;
            var _loc_4:int = 0;
            var _loc_5:b2ManifoldPoint = null;
            var _loc_6:b2ContactConstraintPoint = null;
            var _loc_1:int = 0;
            while (_loc_1 < m_constraintCount)
            {
                
                _loc_2 = m_constraints[_loc_1];
                _loc_3 = _loc_2.manifold;
                _loc_4 = 0;
                while (_loc_4 < _loc_2.pointCount)
                {
                    
                    _loc_5 = _loc_3.m_points[_loc_4];
                    _loc_6 = _loc_2.points[_loc_4];
                    _loc_5.m_normalImpulse = _loc_6.normalImpulse;
                    _loc_5.m_tangentImpulse = _loc_6.tangentImpulse;
                    _loc_4++;
                }
                _loc_1++;
            }
            return;
        }// end function

    }
}
