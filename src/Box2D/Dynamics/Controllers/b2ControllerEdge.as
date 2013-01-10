package Box2D.Dynamics.Controllers
{
    import Box2D.Dynamics.*;

    public class b2ControllerEdge extends Object
    {
        public var body:b2Body;
        public var nextBody:b2ControllerEdge;
        public var nextController:b2ControllerEdge;
        public var prevBody:b2ControllerEdge;
        public var prevController:b2ControllerEdge;
        public var controller:b2Controller;

        public function b2ControllerEdge()
        {
            return;
        }// end function

    }
}
