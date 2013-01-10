package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2WeldJointDef extends b2JointDef
    {
        public var localAnchorA:b2Vec2;
        public var referenceAngle:Number;
        public var localAnchorB:b2Vec2;

        public function b2WeldJointDef()
        {
            localAnchorA = new b2Vec2();
            localAnchorB = new b2Vec2();
            type = b2Joint.e_weldJoint;
            referenceAngle = 0;
            return;
        }// end function

        public function Initialize(param1:b2Body, param2:b2Body, param3:b2Vec2) : void
        {
            bodyA = param1;
            bodyB = param2;
            localAnchorA.SetV(bodyA.GetLocalPoint(param3));
            localAnchorB.SetV(bodyB.GetLocalPoint(param3));
            referenceAngle = bodyB.GetAngle() - bodyA.GetAngle();
            return;
        }// end function

    }
}
