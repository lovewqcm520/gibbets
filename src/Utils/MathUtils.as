package Utils
{

    public class MathUtils extends Object
    {
        private static const m_radToGradKoef:Number = 57.2958;
        private static const m_gradToRadKoef:Number = 0.0174533;

        public function MathUtils()
        {
            return;
        }// end function

        public static function GradToRad(param1:Number) : Number
        {
            return param1 * m_gradToRadKoef;
        }// end function

        public static function Round(param1:Number) : int
        {
            return MathUtils.int(param1 + 0.5);
        }// end function

        public static function anyOfNumber(... args) : Number
        {
            return args[MathUtils.int(args.length * Math.random())] as Number;
        }// end function

        public static function anyOfString(... args) : String
        {
            return args[MathUtils.int(args.length * Math.random())] as String;
        }// end function

        public static function RandomRangeInt(param1:int, param2:Number) : int
        {
            return Round(param1 + (param2 - param1) * Math.random());
        }// end function

        public static function rangeToInt(... args) : int
        {
            args = args[0];
            var _loc_3:* = args.length;
            while (_loc_3 > 0)
            {
                
                trace(args, args[_loc_3]);
                if (args > args[_loc_3])
                {
                    return (_loc_3 - 1);
                }
                _loc_3 = _loc_3 - 1;
            }
            return -2;
        }// end function

        public static function RandomRange(param1:Number, param2:Number) : Number
        {
            return param1 + (param2 - param1) * Math.random();
        }// end function

        public static function Sign(param1:Number) : Number
        {
            if (param1 > 0)
            {
                return 1;
            }
            if (param1 < 0)
            {
                return -1;
            }
            return 0;
        }// end function

        public static function RadToGrad(param1:Number) : Number
        {
            return param1 * m_radToGradKoef;
        }// end function

    }
}
