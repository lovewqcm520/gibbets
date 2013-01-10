package Box2D.Collision
{
    import Box2D.Common.Math.*;

    class b2SimplexVertex extends Object
    {
        public var a:Number;
        public var wA:b2Vec2;
        public var wB:b2Vec2;
        public var indexA:int;
        public var indexB:int;
        public var w:b2Vec2;

        function b2SimplexVertex()
        {
            return;
        }// end function

        public function Set(param1:b2SimplexVertex) : void
        {
            wA.SetV(param1.wA);
            wB.SetV(param1.wB);
            w.SetV(param1.w);
            a = param1.a;
            indexA = param1.indexA;
            indexB = param1.indexB;
            return;
        }// end function

    }
}
