package Box2D.Dynamics.Joints
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2Joint extends Object
    {
        var m_islandFlag:Boolean;
        var m_prev:b2Joint;
        var m_invMassA:Number;
        var m_localCenterA:b2Vec2;
        var m_type:int;
        var m_bodyA:b2Body;
        var m_bodyB:b2Body;
        var m_edgeA:b2JointEdge;
        var m_edgeB:b2JointEdge;
        var m_next:b2Joint;
        private var m_userData:Object;
        var m_invMassB:Number;
        var m_localCenterB:b2Vec2;
        var m_invIB:Number;
        var m_collideConnected:Boolean;
        var m_invIA:Number;
        static const e_prismaticJoint:int = 2;
        static const e_weldJoint:int = 8;
        static const e_equalLimits:int = 3;
        static const e_frictionJoint:int = 9;
        static const e_lineJoint:int = 7;
        static const e_gearJoint:int = 6;
        static const e_atUpperLimit:int = 2;
        static const e_atLowerLimit:int = 1;
        static const e_revoluteJoint:int = 1;
        static const e_inactiveLimit:int = 0;
        static const e_pulleyJoint:int = 4;
        static const e_unknownJoint:int = 0;
        static const e_distanceJoint:int = 3;
        static const e_mouseJoint:int = 5;

        public function b2Joint(param1:b2JointDef)
        {
            m_edgeA = new b2JointEdge();
            m_edgeB = new b2JointEdge();
            m_localCenterA = new b2Vec2();
            m_localCenterB = new b2Vec2();
            b2Settings.b2Assert(param1.bodyA != param1.bodyB);
            m_type = param1.type;
            m_prev = null;
            m_next = null;
            m_bodyA = param1.bodyA;
            m_bodyB = param1.bodyB;
            m_collideConnected = param1.collideConnected;
            m_islandFlag = false;
            m_userData = param1.userData;
            return;
        }// end function

        function InitVelocityConstraints(param1:b2TimeStep) : void
        {
            return;
        }// end function

        public function GetBodyB() : b2Body
        {
            return m_bodyB;
        }// end function

        public function GetNext() : b2Joint
        {
            return m_next;
        }// end function

        public function GetAnchorA() : b2Vec2
        {
            return null;
        }// end function

        public function GetType() : int
        {
            return m_type;
        }// end function

        public function GetAnchorB() : b2Vec2
        {
            return null;
        }// end function

        public function GetBodyA() : b2Body
        {
            return m_bodyA;
        }// end function

        public function GetReactionTorque(param1:Number) : Number
        {
            return 0;
        }// end function

        public function GetUserData()
        {
            return m_userData;
        }// end function

        public function GetReactionForce(param1:Number) : b2Vec2
        {
            return null;
        }// end function

        function SolvePositionConstraints(param1:Number) : Boolean
        {
            return false;
        }// end function

        public function IsActive() : Boolean
        {
            return m_bodyA.IsActive() && m_bodyB.IsActive();
        }// end function

        public function SetUserData(param1) : void
        {
            m_userData = param1;
            return;
        }// end function

        function SolveVelocityConstraints(param1:b2TimeStep) : void
        {
            return;
        }// end function

        function FinalizeVelocityConstraints() : void
        {
            return;
        }// end function

        static function Destroy(param1:b2Joint, param2) : void
        {
            return;
        }// end function

        static function Create(param1:b2JointDef, param2) : b2Joint
        {
            var _loc_3:b2Joint = null;
            switch(param1.type)
            {
                case e_distanceJoint:
                {
                    _loc_3 = new b2DistanceJoint(param1 as b2DistanceJointDef);
                    break;
                }
                case e_mouseJoint:
                {
                    _loc_3 = new b2MouseJoint(param1 as b2MouseJointDef);
                    break;
                }
                case e_prismaticJoint:
                {
                    _loc_3 = new b2PrismaticJoint(param1 as b2PrismaticJointDef);
                    break;
                }
                case e_revoluteJoint:
                {
                    _loc_3 = new b2RevoluteJoint(param1 as b2RevoluteJointDef);
                    break;
                }
                case e_pulleyJoint:
                {
                    _loc_3 = new b2PulleyJoint(param1 as b2PulleyJointDef);
                    break;
                }
                case e_gearJoint:
                {
                    _loc_3 = new b2GearJoint(param1 as b2GearJointDef);
                    break;
                }
                case e_lineJoint:
                {
                    _loc_3 = new b2LineJoint(param1 as b2LineJointDef);
                    break;
                }
                case e_weldJoint:
                {
                    _loc_3 = new b2WeldJoint(param1 as b2WeldJointDef);
                    break;
                }
                case e_frictionJoint:
                {
                    _loc_3 = new b2FrictionJoint(param1 as b2FrictionJointDef);
                    break;
                }
                default:
                {
                    break;
                    break;
                }
            }
            return _loc_3;
        }// end function

    }
}
