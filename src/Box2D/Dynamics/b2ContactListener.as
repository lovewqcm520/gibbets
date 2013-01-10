package Box2D.Dynamics
{
    import Box2D.Collision.*;
    import Box2D.Dynamics.Contacts.*;

    public class b2ContactListener extends Object
    {
        static var b2_defaultListener:b2ContactListener = new b2ContactListener;

        public function b2ContactListener()
        {
            return;
        }// end function

        public function PreSolve(param1:b2Contact, param2:b2Manifold) : void
        {
            return;
        }// end function

        public function EndContact(param1:b2Contact) : void
        {
            return;
        }// end function

        public function PostSolve(param1:b2Contact, param2:b2ContactImpulse) : void
        {
            return;
        }// end function

        public function BeginContact(param1:b2Contact) : void
        {
            return;
        }// end function

    }
}
