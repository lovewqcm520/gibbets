package Box2D.Dynamics
{

    public class b2TimeStep extends Object
    {
        public var warmStarting:Boolean;
        public var inv_dt:Number;
        public var dt:Number;
        public var velocityIterations:int;
        public var dtRatio:Number;
        public var positionIterations:int;

        public function b2TimeStep()
        {
            return;
        }// end function

        public function Set(param1:b2TimeStep) : void
        {
            dt = param1.dt;
            inv_dt = param1.inv_dt;
            positionIterations = param1.positionIterations;
            velocityIterations = param1.velocityIterations;
            warmStarting = param1.warmStarting;
            return;
        }// end function

    }
}
