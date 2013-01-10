package Box2D.Collision
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2TimeOfImpact extends Object
    {
        private static var b2_toiCalls:int = 0;
        private static var s_xfA:b2Transform = new b2Transform();
        private static var s_distanceInput:b2DistanceInput = new b2DistanceInput();
        private static var s_xfB:b2Transform = new b2Transform();
        private static var s_distanceOutput:b2DistanceOutput = new b2DistanceOutput();
        private static var b2_toiMaxRootIters:int = 0;
        private static var s_cache:b2SimplexCache = new b2SimplexCache();
        private static var b2_toiRootIters:int = 0;
        private static var b2_toiIters:int = 0;
        private static var b2_toiMaxIters:int = 0;
        private static var s_fcn:b2SeparationFunction = new b2SeparationFunction();

        public function b2TimeOfImpact()
        {
            return;
        }// end function

        public static function TimeOfImpact(param1:b2TOIInput) : Number
        {
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:int = 0;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_22:* = b2_toiCalls + 1;
            b2_toiCalls = _loc_22;
            var _loc_2:* = param1.proxyA;
            var _loc_3:* = param1.proxyB;
            var _loc_4:* = param1.sweepA;
            var _loc_5:* = param1.sweepB;
            b2Settings.b2Assert(_loc_4.t0 == _loc_5.t0);
            b2Settings.b2Assert(1 - _loc_4.t0 > Number.MIN_VALUE);
            var _loc_6:* = _loc_2.m_radius + _loc_3.m_radius;
            var _loc_7:* = param1.tolerance;
            var _loc_8:Number = 0;
            var _loc_9:int = 1000;
            var _loc_10:int = 0;
            var _loc_11:Number = 0;
            s_cache.count = 0;
            s_distanceInput.useRadii = false;
            while (true)
            {
                
                _loc_4.GetTransform(s_xfA, _loc_8);
                _loc_5.GetTransform(s_xfB, _loc_8);
                s_distanceInput.proxyA = _loc_2;
                s_distanceInput.proxyB = _loc_3;
                s_distanceInput.transformA = s_xfA;
                s_distanceInput.transformB = s_xfB;
                b2Distance.Distance(s_distanceOutput, s_cache, s_distanceInput);
                if (s_distanceOutput.distance <= 0)
                {
                    _loc_8 = 1;
                    break;
                }
                s_fcn.Initialize(s_cache, _loc_2, s_xfA, _loc_3, s_xfB);
                _loc_12 = s_fcn.Evaluate(s_xfA, s_xfB);
                if (_loc_12 <= 0)
                {
                    _loc_8 = 1;
                    break;
                }
                if (_loc_10 == 0)
                {
                    if (_loc_12 > _loc_6)
                    {
                        _loc_11 = b2Math.Max(_loc_6 - _loc_7, 0.75 * _loc_6);
                    }
                    else
                    {
                        _loc_11 = b2Math.Max(_loc_12 - _loc_7, 0.02 * _loc_6);
                    }
                }
                if (_loc_12 - _loc_11 < 0.5 * _loc_7)
                {
                    if (_loc_10 == 0)
                    {
                        _loc_8 = 1;
                        break;
                    }
                    break;
                }
                _loc_13 = _loc_8;
                _loc_14 = _loc_8;
                _loc_15 = 1;
                _loc_16 = _loc_12;
                _loc_4.GetTransform(s_xfA, _loc_15);
                _loc_5.GetTransform(s_xfB, _loc_15);
                _loc_17 = s_fcn.Evaluate(s_xfA, s_xfB);
                if (_loc_17 >= _loc_11)
                {
                    _loc_8 = 1;
                    break;
                }
                _loc_18 = 0;
                while (true)
                {
                    
                    if (_loc_18 & 1)
                    {
                        _loc_19 = _loc_14 + (_loc_11 - _loc_16) * (_loc_15 - _loc_14) / (_loc_17 - _loc_16);
                    }
                    else
                    {
                        _loc_19 = 0.5 * (_loc_14 + _loc_15);
                    }
                    _loc_4.GetTransform(s_xfA, _loc_19);
                    _loc_5.GetTransform(s_xfB, _loc_19);
                    _loc_20 = s_fcn.Evaluate(s_xfA, s_xfB);
                    if (b2Math.Abs(_loc_20 - _loc_11) < 0.025 * _loc_7)
                    {
                        _loc_13 = _loc_19;
                        break;
                    }
                    if (_loc_20 > _loc_11)
                    {
                        _loc_14 = _loc_19;
                        _loc_16 = _loc_20;
                    }
                    else
                    {
                        _loc_15 = _loc_19;
                        _loc_17 = _loc_20;
                    }
                    _loc_18++;
                    var _loc_22:* = b2_toiRootIters + 1;
                    b2_toiRootIters = _loc_22;
                    if (_loc_18 == 50)
                    {
                        break;
                    }
                }
                b2_toiMaxRootIters = b2Math.Max(b2_toiMaxRootIters, _loc_18);
                if (_loc_13 < (1 + 100 * Number.MIN_VALUE) * _loc_8)
                {
                    break;
                }
                _loc_8 = _loc_13;
                _loc_10++;
                var _loc_22:* = b2_toiIters + 1;
                b2_toiIters = _loc_22;
                if (_loc_10 == _loc_9)
                {
                    break;
                }
            }
            b2_toiMaxIters = b2Math.Max(b2_toiMaxIters, _loc_10);
            return _loc_8;
        }// end function

    }
}
