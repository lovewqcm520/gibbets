package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2DistanceJointDef extends b2JointDef
    {
        public var localAnchorA:b2Vec2;
        public var length:Number;
        public var dampingRatio:Number;
        public var localAnchorB:b2Vec2;
        public var frequencyHz:Number;

        public function b2DistanceJointDef()
        {
            localAnchorA = new b2Vec2();
            localAnchorB = new b2Vec2();
            type = b2Joint.e_distanceJoint;
            length = 1;
            frequencyHz = 0;
            dampingRatio = 0;
            return;
        }// end function

        public function Initialize(param1:b2Body, param2:b2Body, param3:b2Vec2, param4:b2Vec2) : void
        {
            bodyA = param1;
            bodyB = param2;
            localAnchorA.SetV(bodyA.GetLocalPoint(param3));
            localAnchorB.SetV(bodyB.GetLocalPoint(param4));
            var _loc_5:* = param4.x - param3.x;
            var _loc_6:* = param4.y - param3.y;
            length = Math.sqrt(_loc_5 * _loc_5 + _loc_6 * _loc_6);
            frequencyHz = 0;
            dampingRatio = 0;
            return;
        }// end function

    }
}
