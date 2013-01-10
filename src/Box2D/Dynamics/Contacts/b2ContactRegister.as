package Box2D.Dynamics.Contacts
{

    public class b2ContactRegister extends Object
    {
        public var primary:Boolean;
        public var poolCount:int;
        public var createFcn:Function;
        public var destroyFcn:Function;
        public var pool:b2Contact;

        public function b2ContactRegister()
        {
            return;
        }// end function

    }
}
