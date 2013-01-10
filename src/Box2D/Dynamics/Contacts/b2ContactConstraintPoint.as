package Box2D.Dynamics.Contacts
{
    import Box2D.Common.Math.*;

    public class b2ContactConstraintPoint extends Object
    {
        public var localPoint:b2Vec2;
        public var normalImpulse:Number;
        public var rA:b2Vec2;
        public var rB:b2Vec2;
        public var tangentImpulse:Number;
        public var equalizedMass:Number;
        public var tangentMass:Number;
        public var normalMass:Number;
        public var velocityBias:Number;

        public function b2ContactConstraintPoint()
        {
            localPoint = new b2Vec2();
            rA = new b2Vec2();
            rB = new b2Vec2();
            return;
        }// end function

    }
}
