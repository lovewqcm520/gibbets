package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2RayCastInput extends Object
    {
        public var p1:b2Vec2;
        public var maxFraction:Number;
        public var p2:b2Vec2;

        public function b2RayCastInput(param1:b2Vec2 = null, param2:b2Vec2 = null, param3:Number = 1)
        {
            p1 = new b2Vec2();
            p2 = new b2Vec2();
            if (param1)
            {
                this.p1.SetV(param1);
            }
            if (param2)
            {
                this.p2.SetV(param2);
            }
            this.maxFraction = param3;
            return;
        }// end function

    }
}
