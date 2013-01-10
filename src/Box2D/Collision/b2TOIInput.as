package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2TOIInput extends Object
    {
        public var proxyA:b2DistanceProxy;
        public var proxyB:b2DistanceProxy;
        public var sweepA:b2Sweep;
        public var sweepB:b2Sweep;
        public var tolerance:Number;

        public function b2TOIInput()
        {
            proxyA = new b2DistanceProxy();
            proxyB = new b2DistanceProxy();
            sweepA = new b2Sweep();
            sweepB = new b2Sweep();
            return;
        }// end function

    }
}
