package Box2D.Common
{

    public class b2Settings extends Object
    {
        public static const b2_polygonRadius:Number = 2 * b2_linearSlop;
        public static const b2_pi:Number = 3.14159;
        public static const b2_aabbExtension:Number = 0.1;
        public static const b2_linearSleepTolerance:Number = 0.01;
        public static const b2_maxTranslationSquared:Number = 4;
        public static const b2_angularSlop:Number = 0.0349066;
        public static const b2_linearSlop:Number = 0.005;
        public static const b2_maxRotation:Number = 1.5708;
        public static const b2_maxRotationSquared:Number = 2.4674;
        public static const b2_angularSleepTolerance:Number = 0.0349066;
        public static const b2_timeToSleep:Number = 0.5;
        public static const b2_maxTOIJointsPerIsland:int = 32;
        public static const b2_contactBaumgarte:Number = 0.2;
        public static const b2_maxTOIContactsPerIsland:int = 32;
        public static const b2_maxManifoldPoints:int = 2;
        public static const b2_maxAngularCorrection:Number = 0.139626;
        public static const b2_velocityThreshold:Number = 1;
        public static const USHRT_MAX:int = 65535;
        public static const VERSION:String = "2.1alpha";
        public static const b2_toiSlop:Number = 0.04;
        public static const b2_maxTranslation:Number = 2;
        public static const b2_aabbMultiplier:Number = 2;
        public static const b2_maxLinearCorrection:Number = 0.2;

        public function b2Settings()
        {
            return;
        }// end function

        public static function b2MixFriction(param1:Number, param2:Number) : Number
        {
            return Math.sqrt(param1 * param2);
        }// end function

        public static function b2MixRestitution(param1:Number, param2:Number) : Number
        {
            return param1 > param2 ? (param1) : (param2);
        }// end function

        public static function b2Assert(param1:Boolean, param2:String = "") : void
        {
            if (!param1)
            {
                throw "Assertion Failed " + param2;
            }
            return;
        }// end function

    }
}
