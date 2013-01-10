package Utils
{
    import flash.display.*;
    import flash.geom.*;

    public class Utils extends Object
    {

        public function Utils()
        {
            return;
        }// end function

        public static function AnyOf(param1:Array)
        {
            return param1[int(Math.random() * param1.length)];
        }// end function

        public static function RandomRangeInt(param1:int, param2:int) : int
        {
            return Math.round(param1 + Math.random() * (param2 - param1));
        }// end function

        public static function InRange(param1:Number, param2:Number, param3:Number) : Boolean
        {
            return param1 >= param2 && param1 <= param3;
        }// end function

        public static function RandomRange(param1:Number, param2:Number) : Number
        {
            return param1 + Math.random() * (param2 - param1);
        }// end function

        public static function SetPosition(param1:DisplayObject, param2:Point) : void
        {
            param1.x = param2.x;
            param1.y = param2.y;
            return;
        }// end function

        public static function Sign(param1:Number) : Number
        {
            if (param1 == 0)
            {
                return 0;
            }
            return param1 < 0 ? (-1) : (1);
        }// end function

        public static function intToTimeString(param1:int) : String
        {
            var _loc_3:String = null;
            var _loc_5:String = null;
            var _loc_2:* = param1 / 60;
            if (_loc_2 < 10)
            {
                _loc_3 = "0" + _loc_2;
            }
            else
            {
                _loc_3 = _loc_2.toString();
            }
            var _loc_4:* = param1 % 60;
            if (param1 % 60 < 10)
            {
                _loc_5 = "0" + _loc_4;
            }
            else
            {
                _loc_5 = _loc_4.toString();
            }
            return _loc_3 + ":" + _loc_5;
        }// end function

    }
}
