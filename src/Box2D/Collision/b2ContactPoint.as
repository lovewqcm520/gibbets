package Box2D.Collision
{
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;

    public class b2ContactPoint extends Object
    {
        public var friction:Number;
        public var separation:Number;
        public var normal:b2Vec2;
        public var position:b2Vec2;
        public var restitution:Number;
        public var shape1:b2Shape;
        public var shape2:b2Shape;
        public var id:b2ContactID;
        public var velocity:b2Vec2;

        public function b2ContactPoint()
        {
            position = new b2Vec2();
            velocity = new b2Vec2();
            normal = new b2Vec2();
            id = new b2ContactID();
            return;
        }// end function

    }
}
