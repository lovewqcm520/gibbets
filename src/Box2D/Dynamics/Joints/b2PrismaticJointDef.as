package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2PrismaticJointDef extends b2JointDef
    {
        public var localAnchorA:b2Vec2;
        public var motorSpeed:Number;
        public var referenceAngle:Number;
        public var localAnchorB:b2Vec2;
        public var upperTranslation:Number;
        public var lowerTranslation:Number;
        public var localAxisA:b2Vec2;
        public var enableLimit:Boolean;
        public var enableMotor:Boolean;
        public var maxMotorForce:Number;

        public function b2PrismaticJointDef()
        {
            localAnchorA = new b2Vec2();
            localAnchorB = new b2Vec2();
            localAxisA = new b2Vec2();
            type = b2Joint.e_prismaticJoint;
            localAxisA.Set(1, 0);
            referenceAngle = 0;
            enableLimit = false;
            lowerTranslation = 0;
            upperTranslation = 0;
            enableMotor = false;
            maxMotorForce = 0;
            motorSpeed = 0;
            return;
        }// end function

        public function Initialize(param1:b2Body, param2:b2Body, param3:b2Vec2, param4:b2Vec2) : void
        {
            bodyA = param1;
            bodyB = param2;
            localAnchorA = bodyA.GetLocalPoint(param3);
            localAnchorB = bodyB.GetLocalPoint(param3);
            localAxisA = bodyA.GetLocalVector(param4);
            referenceAngle = bodyB.GetAngle() - bodyA.GetAngle();
            return;
        }// end function

    }
}
