package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2RayCastOutput extends Object
    {
        public var fraction:Number;
        public var normal:b2Vec2;

        public function b2RayCastOutput()
        {
            normal = new b2Vec2();
            return;
        }// end function

    }
}
