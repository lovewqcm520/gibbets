package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2RevoluteJointDef extends b2JointDef
    {
        public var localAnchorA:b2Vec2;
        public var referenceAngle:Number;
        public var localAnchorB:b2Vec2;
        public var motorSpeed:Number;
        public var upperAngle:Number;
        public var lowerAngle:Number;
        public var enableLimit:Boolean;
        public var enableMotor:Boolean;
        public var maxMotorTorque:Number;

        public function b2RevoluteJointDef()
        {
            localAnchorA = new b2Vec2();
            localAnchorB = new b2Vec2();
            type = b2Joint.e_revoluteJoint;
            localAnchorA.Set(0, 0);
            localAnchorB.Set(0, 0);
            referenceAngle = 0;
            lowerAngle = 0;
            upperAngle = 0;
            maxMotorTorque = 0;
            motorSpeed = 0;
            enableLimit = false;
            enableMotor = false;
            return;
        }// end function

        public function Initialize(param1:b2Body, param2:b2Body, param3:b2Vec2) : void
        {
            bodyA = param1;
            bodyB = param2;
            localAnchorA = bodyA.GetLocalPoint(param3);
            localAnchorB = bodyB.GetLocalPoint(param3);
            referenceAngle = bodyB.GetAngle() - bodyA.GetAngle();
            return;
        }// end function

    }
}
