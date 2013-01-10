package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2DistanceOutput extends Object
    {
        public var pointA:b2Vec2;
        public var distance:Number;
        public var iterations:int;
        public var pointB:b2Vec2;

        public function b2DistanceOutput()
        {
            pointA = new b2Vec2();
            pointB = new b2Vec2();
            return;
        }// end function

    }
}
