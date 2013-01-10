package Box2D.Dynamics.Joints
{
    import Box2D.Common.Math.*;

    public class b2Jacobian extends Object
    {
        public var angularB:Number;
        public var linearA:b2Vec2;
        public var linearB:b2Vec2;
        public var angularA:Number;

        public function b2Jacobian()
        {
            linearA = new b2Vec2();
            linearB = new b2Vec2();
            return;
        }// end function

        public function Set(param1:b2Vec2, param2:Number, param3:b2Vec2, param4:Number) : void
        {
            linearA.SetV(param1);
            angularA = param2;
            linearB.SetV(param3);
            angularB = param4;
            return;
        }// end function

        public function SetZero() : void
        {
            linearA.SetZero();
            angularA = 0;
            linearB.SetZero();
            angularB = 0;
            return;
        }// end function

        public function Compute(param1:b2Vec2, param2:Number, param3:b2Vec2, param4:Number) : Number
        {
            return linearA.x * param1.x + linearA.y * param1.y + angularA * param2 + (linearB.x * param3.x + linearB.y * param3.y) + angularB * param4;
        }// end function

    }
}
