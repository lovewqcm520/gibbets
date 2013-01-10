package Box2D.Dynamics
{
    import Box2D.Common.*;

    public class b2ContactImpulse extends Object
    {
        public var tangentImpulses:Array;
        public var normalImpulses:Array;

        public function b2ContactImpulse()
        {
            normalImpulses = new Array(b2Settings.b2_maxManifoldPoints);
            tangentImpulses = new Array(b2Settings.b2_maxManifoldPoints);
            return;
        }// end function

    }
}
