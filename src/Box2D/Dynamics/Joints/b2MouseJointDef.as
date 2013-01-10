package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;

    public class b2MouseJointDef extends b2JointDef
    {
        public var target:b2Vec2;
        public var maxForce:Number;
        public var dampingRatio:Number;
        public var frequencyHz:Number;

        public function b2MouseJointDef()
        {
            target = new b2Vec2();
            type = b2Joint.e_mouseJoint;
            maxForce = 0;
            frequencyHz = 5;
            dampingRatio = 0.7;
            return;
        }// end function

    }
}
