package Box2D.Collision
{

    public class b2SimplexCache extends Object
    {
        public var metric:Number;
        public var count:uint;
        public var indexB:Array;
        public var indexA:Array;

        public function b2SimplexCache()
        {
            indexA = new Array(3);
            indexB = new Array(3);
            return;
        }// end function

    }
}
