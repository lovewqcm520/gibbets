package Box2D.Dynamics
{
    import Box2D.Common.Math.*;

    public class b2BodyDef extends Object
    {
        public var angularDamping:Number;
        public var bullet:Boolean;
        public var awake:Boolean;
        public var active:Boolean;
        public var allowSleep:Boolean;
        public var angle:Number;
        public var userData:Object;
        public var fixedRotation:Boolean;
        public var linearDamping:Number;
        public var angularVelocity:Number;
        public var linearVelocity:b2Vec2;
        public var position:b2Vec2;
        public var inertiaScale:Number;
        public var type:uint;

        public function b2BodyDef()
        {
            position = new b2Vec2();
            linearVelocity = new b2Vec2();
            userData = null;
            position.Set(0, 0);
            angle = 0;
            linearVelocity.Set(0, 0);
            angularVelocity = 0;
            linearDamping = 0;
            angularDamping = 0;
            allowSleep = true;
            awake = true;
            fixedRotation = false;
            bullet = false;
            type = b2Body.b2_staticBody;
            active = true;
            inertiaScale = 1;
            return;
        }// end function

    }
}
