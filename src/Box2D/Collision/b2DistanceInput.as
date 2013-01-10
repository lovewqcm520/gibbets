package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2DistanceInput extends Object
    {
        public var proxyA:b2DistanceProxy;
        public var proxyB:b2DistanceProxy;
        public var transformA:b2Transform;
        public var transformB:b2Transform;
        public var useRadii:Boolean;

        public function b2DistanceInput()
        {
            return;
        }// end function

    }
}
