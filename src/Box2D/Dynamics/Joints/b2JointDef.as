package Box2D.Dynamics.Joints
{
    import Box2D.Dynamics.*;

    public class b2JointDef extends Object
    {
        public var bodyB:b2Body;
        public var type:int;
        public var userData:Object;
        public var collideConnected:Boolean;
        public var bodyA:b2Body;

        public function b2JointDef()
        {
            type = b2Joint.e_unknownJoint;
            userData = null;
            bodyA = null;
            bodyB = null;
            collideConnected = false;
            return;
        }// end function

    }
}
