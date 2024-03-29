package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2LineJointDef extends b2JointDef
    {
        public var localAnchorA:b2Vec2;
        public var localAnchorB:b2Vec2;
        public var upperTranslation:Number;
        public var enableMotor:Boolean;
        public var localAxisA:b2Vec2;
        public var enableLimit:Boolean;
        public var motorSpeed:Number;
        public var maxMotorForce:Number;
        public var lowerTranslation:Number;

        public function b2LineJointDef()
        {
            localAnchorA = new b2Vec2();
            localAnchorB = new b2Vec2();
            localAxisA = new b2Vec2();
            type = b2Joint.e_lineJoint;
            localAxisA.Set(1, 0);
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
            return;
        }// end function

    }
}
