package Box2D.Dynamics
{

    public class b2ContactFilter extends Object
    {
        static var b2_defaultFilter:b2ContactFilter = new b2ContactFilter;

        public function b2ContactFilter()
        {
            return;
        }// end function

        public function ShouldCollide(param1:b2Fixture, param2:b2Fixture) : Boolean
        {
            var _loc_3:* = param1.GetFilterData();
            var _loc_4:* = param2.GetFilterData();
            if (_loc_3.groupIndex == _loc_4.groupIndex && _loc_3.groupIndex != 0)
            {
                return _loc_3.groupIndex > 0;
            }
            var _loc_5:* = (_loc_3.maskBits & _loc_4.categoryBits) != 0 && (_loc_3.categoryBits & _loc_4.maskBits) != 0;
            return (_loc_3.maskBits & _loc_4.categoryBits) != 0 && (_loc_3.categoryBits & _loc_4.maskBits) != 0;
        }// end function

        public function RayCollide(param1, param2:b2Fixture) : Boolean
        {
            if (!param1)
            {
                return true;
            }
            return ShouldCollide(param1 as b2Fixture, param2);
        }// end function

    }
}
