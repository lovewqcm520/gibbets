package Box2D.Dynamics
{

    public class b2FilterData extends Object
    {
        public var maskBits:uint = 65535;
        public var groupIndex:int = 0;
        public var categoryBits:uint = 1;

        public function b2FilterData()
        {
            return;
        }// end function

        public function Copy() : b2FilterData
        {
            var _loc_1:* = new b2FilterData();
            _loc_1.categoryBits = categoryBits;
            _loc_1.maskBits = maskBits;
            _loc_1.groupIndex = groupIndex;
            return _loc_1;
        }// end function

    }
}
