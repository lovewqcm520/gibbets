package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2PulleyJointDef extends b2JointDef
    {
        public var localAnchorA:b2Vec2;
        public var groundAnchorA:b2Vec2;
        public var groundAnchorB:b2Vec2;
        public var localAnchorB:b2Vec2;
        public var ratio:Number;
        public var maxLengthA:Number;
        public var lengthA:Number;
        public var lengthB:Number;
        public var maxLengthB:Number;

        public function b2PulleyJointDef()
        {
            groundAnchorA = new b2Vec2();
            groundAnchorB = new b2Vec2();
            localAnchorA = new b2Vec2();
            localAnchorB = new b2Vec2();
            type = b2Joint.e_pulleyJoint;
            groundAnchorA.Set(-1, 1);
            groundAnchorB.Set(1, 1);
            localAnchorA.Set(-1, 0);
            localAnchorB.Set(1, 0);
            lengthA = 0;
            maxLengthA = 0;
            lengthB = 0;
            maxLengthB = 0;
            ratio = 1;
            collideConnected = true;
            return;
        }// end function

        public function Initialize(param1:b2Body, param2:b2Body, param3:b2Vec2, param4:b2Vec2, param5:b2Vec2, param6:b2Vec2, param7:Number) : void
        {
            bodyA = param1;
            bodyB = param2;
            groundAnchorA.SetV(param3);
            groundAnchorB.SetV(param4);
            localAnchorA = bodyA.GetLocalPoint(param5);
            localAnchorB = bodyB.GetLocalPoint(param6);
            var _loc_8:* = param5.x - param3.x;
            var _loc_9:* = param5.y - param3.y;
            lengthA = Math.sqrt(_loc_8 * _loc_8 + _loc_9 * _loc_9);
            var _loc_10:* = param6.x - param4.x;
            var _loc_11:* = param6.y - param4.y;
            lengthB = Math.sqrt(_loc_10 * _loc_10 + _loc_11 * _loc_11);
            ratio = param7;
            var _loc_12:* = lengthA + ratio * lengthB;
            maxLengthA = _loc_12 - ratio * b2PulleyJoint.b2_minPulleyLength;
            maxLengthB = (_loc_12 - b2PulleyJoint.b2_minPulleyLength) / ratio;
            return;
        }// end function

    }
}
