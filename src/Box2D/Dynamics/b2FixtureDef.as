package Box2D.Dynamics
{
    import Box2D.Collision.Shapes.*;

    public class b2FixtureDef extends Object
    {
        public var shape:b2Shape;
        public var isSensor:Boolean;
        public var density:Number;
        public var restitution:Number;
        public var userData:Object;
        public var filter:b2FilterData;
        public var friction:Number;

        public function b2FixtureDef()
        {
            filter = new b2FilterData();
            shape = null;
            userData = null;
            friction = 0.2;
            restitution = 0;
            density = 0;
            filter.categoryBits = 1;
            filter.maskBits = 65535;
            filter.groupIndex = 0;
            isSensor = false;
            return;
        }// end function

    }
}
