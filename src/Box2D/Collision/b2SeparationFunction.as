package Box2D.Collision
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    class b2SeparationFunction extends Object
    {
        public var m_proxyA:b2DistanceProxy;
        public var m_proxyB:b2DistanceProxy;
        public var m_type:int;
        public var m_axis:b2Vec2;
        public var m_localPoint:b2Vec2;
        public static const e_faceA:int = 2;
        public static const e_faceB:int = 4;
        public static const e_points:int = 1;

        function b2SeparationFunction()
        {
            m_localPoint = new b2Vec2();
            m_axis = new b2Vec2();
            return;
        }// end function

        public function Initialize(param1:b2SimplexCache, param2:b2DistanceProxy, param3:b2Transform, param4:b2DistanceProxy, param5:b2Transform) : void
        {
            var _loc_7:b2Vec2 = null;
            var _loc_8:b2Vec2 = null;
            var _loc_9:b2Vec2 = null;
            var _loc_10:b2Vec2 = null;
            var _loc_11:b2Vec2 = null;
            var _loc_12:b2Vec2 = null;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:b2Mat22 = null;
            var _loc_20:b2Vec2 = null;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:b2Vec2 = null;
            var _loc_24:b2Vec2 = null;
            var _loc_25:b2Vec2 = null;
            var _loc_26:b2Vec2 = null;
            var _loc_27:Number = NaN;
            var _loc_28:Number = NaN;
            var _loc_29:b2Vec2 = null;
            var _loc_30:Number = NaN;
            var _loc_31:Number = NaN;
            var _loc_32:Number = NaN;
            var _loc_33:Number = NaN;
            var _loc_34:Number = NaN;
            m_proxyA = param2;
            m_proxyB = param4;
            var _loc_6:* = param1.count;
            b2Settings.b2Assert(_loc_6 > 0 && _loc_6 < 3);
            if (_loc_6 == 1)
            {
                m_type = e_points;
                _loc_7 = m_proxyA.GetVertex(param1.indexA[0]);
                _loc_10 = m_proxyB.GetVertex(param1.indexB[0]);
                _loc_20 = _loc_7;
                _loc_19 = param3.R;
                _loc_13 = param3.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                _loc_14 = param3.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                _loc_20 = _loc_10;
                _loc_19 = param5.R;
                _loc_15 = param5.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                _loc_16 = param5.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                m_axis.x = _loc_15 - _loc_13;
                m_axis.y = _loc_16 - _loc_14;
                m_axis.Normalize();
            }
            else if (param1.indexB[0] == param1.indexB[1])
            {
                m_type = e_faceA;
                _loc_8 = m_proxyA.GetVertex(param1.indexA[0]);
                _loc_9 = m_proxyA.GetVertex(param1.indexA[1]);
                _loc_10 = m_proxyB.GetVertex(param1.indexB[0]);
                m_localPoint.x = 0.5 * (_loc_8.x + _loc_9.x);
                m_localPoint.y = 0.5 * (_loc_8.y + _loc_9.y);
                m_axis = b2Math.CrossVF(b2Math.SubtractVV(_loc_9, _loc_8), 1);
                m_axis.Normalize();
                _loc_20 = m_axis;
                _loc_19 = param3.R;
                _loc_17 = _loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y;
                _loc_18 = _loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y;
                _loc_20 = m_localPoint;
                _loc_19 = param3.R;
                _loc_13 = param3.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                _loc_14 = param3.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                _loc_20 = _loc_10;
                _loc_19 = param5.R;
                _loc_15 = param5.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                _loc_16 = param5.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                _loc_21 = (_loc_15 - _loc_13) * _loc_17 + (_loc_16 - _loc_14) * _loc_18;
                if (_loc_21 < 0)
                {
                    m_axis.NegativeSelf();
                }
            }
            else if (param1.indexA[0] == param1.indexA[0])
            {
                m_type = e_faceB;
                _loc_11 = m_proxyB.GetVertex(param1.indexB[0]);
                _loc_12 = m_proxyB.GetVertex(param1.indexB[1]);
                _loc_7 = m_proxyA.GetVertex(param1.indexA[0]);
                m_localPoint.x = 0.5 * (_loc_11.x + _loc_12.x);
                m_localPoint.y = 0.5 * (_loc_11.y + _loc_12.y);
                m_axis = b2Math.CrossVF(b2Math.SubtractVV(_loc_12, _loc_11), 1);
                m_axis.Normalize();
                _loc_20 = m_axis;
                _loc_19 = param5.R;
                _loc_17 = _loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y;
                _loc_18 = _loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y;
                _loc_20 = m_localPoint;
                _loc_19 = param5.R;
                _loc_15 = param5.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                _loc_16 = param5.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                _loc_20 = _loc_7;
                _loc_19 = param3.R;
                _loc_13 = param3.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                _loc_14 = param3.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                _loc_21 = (_loc_13 - _loc_15) * _loc_17 + (_loc_14 - _loc_16) * _loc_18;
                if (_loc_21 < 0)
                {
                    m_axis.NegativeSelf();
                }
            }
            else
            {
                _loc_8 = m_proxyA.GetVertex(param1.indexA[0]);
                _loc_9 = m_proxyA.GetVertex(param1.indexA[1]);
                _loc_11 = m_proxyB.GetVertex(param1.indexB[0]);
                _loc_12 = m_proxyB.GetVertex(param1.indexB[1]);
                _loc_23 = b2Math.MulX(param3, _loc_7);
                _loc_24 = b2Math.MulMV(param3.R, b2Math.SubtractVV(_loc_9, _loc_8));
                _loc_25 = b2Math.MulX(param5, _loc_10);
                _loc_26 = b2Math.MulMV(param5.R, b2Math.SubtractVV(_loc_12, _loc_11));
                _loc_27 = _loc_24.x * _loc_24.x + _loc_24.y * _loc_24.y;
                _loc_28 = _loc_26.x * _loc_26.x + _loc_26.y * _loc_26.y;
                _loc_29 = b2Math.SubtractVV(_loc_26, _loc_24);
                _loc_30 = _loc_24.x * _loc_29.x + _loc_24.y * _loc_29.y;
                _loc_31 = _loc_26.x * _loc_29.x + _loc_26.y * _loc_29.y;
                _loc_32 = _loc_24.x * _loc_26.x + _loc_24.y * _loc_26.y;
                _loc_33 = _loc_27 * _loc_28 - _loc_32 * _loc_32;
                _loc_21 = 0;
                if (_loc_33 != 0)
                {
                    _loc_21 = b2Math.Clamp((_loc_32 * _loc_31 - _loc_30 * _loc_28) / _loc_33, 0, 1);
                }
                _loc_34 = (_loc_32 * _loc_21 + _loc_31) / _loc_28;
                if (_loc_34 < 0)
                {
                    _loc_34 = 0;
                    _loc_21 = b2Math.Clamp((_loc_32 - _loc_30) / _loc_27, 0, 1);
                }
                _loc_7 = new b2Vec2();
                _loc_7.x = _loc_8.x + _loc_21 * (_loc_9.x - _loc_8.x);
                _loc_7.y = _loc_8.y + _loc_21 * (_loc_9.y - _loc_8.y);
                _loc_10 = new b2Vec2();
                _loc_10.x = _loc_11.x + _loc_21 * (_loc_12.x - _loc_11.x);
                _loc_10.y = _loc_11.y + _loc_21 * (_loc_12.y - _loc_11.y);
                if (_loc_21 == 0 || _loc_21 == 1)
                {
                    m_type = e_faceB;
                    m_axis = b2Math.CrossVF(b2Math.SubtractVV(_loc_12, _loc_11), 1);
                    m_localPoint = _loc_10;
                    _loc_20 = m_axis;
                    _loc_19 = param5.R;
                    _loc_17 = _loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y;
                    _loc_18 = _loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y;
                    _loc_20 = m_localPoint;
                    _loc_19 = param5.R;
                    _loc_15 = param5.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                    _loc_16 = param5.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                    _loc_20 = _loc_7;
                    _loc_19 = param3.R;
                    _loc_13 = param3.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                    _loc_14 = param3.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                    _loc_22 = (_loc_13 - _loc_15) * _loc_17 + (_loc_14 - _loc_16) * _loc_18;
                    if (_loc_21 < 0)
                    {
                        m_axis.NegativeSelf();
                    }
                }
                else
                {
                    m_type = e_faceA;
                    m_axis = b2Math.CrossVF(b2Math.SubtractVV(_loc_9, _loc_8), 1);
                    m_localPoint = _loc_7;
                    _loc_20 = m_axis;
                    _loc_19 = param3.R;
                    _loc_17 = _loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y;
                    _loc_18 = _loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y;
                    _loc_20 = m_localPoint;
                    _loc_19 = param3.R;
                    _loc_13 = param3.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                    _loc_14 = param3.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                    _loc_20 = _loc_10;
                    _loc_19 = param5.R;
                    _loc_15 = param5.position.x + (_loc_19.col1.x * _loc_20.x + _loc_19.col2.x * _loc_20.y);
                    _loc_16 = param5.position.y + (_loc_19.col1.y * _loc_20.x + _loc_19.col2.y * _loc_20.y);
                    _loc_22 = (_loc_15 - _loc_13) * _loc_17 + (_loc_16 - _loc_14) * _loc_18;
                    if (_loc_21 < 0)
                    {
                        m_axis.NegativeSelf();
                    }
                }
            }
            return;
        }// end function

        public function Evaluate(param1:b2Transform, param2:b2Transform) : Number
        {
            var _loc_3:b2Vec2 = null;
            var _loc_4:b2Vec2 = null;
            var _loc_5:b2Vec2 = null;
            var _loc_6:b2Vec2 = null;
            var _loc_7:b2Vec2 = null;
            var _loc_8:b2Vec2 = null;
            var _loc_9:Number = NaN;
            var _loc_10:b2Vec2 = null;
            switch(m_type)
            {
                case e_points:
                {
                    _loc_3 = b2Math.MulTMV(param1.R, m_axis);
                    _loc_4 = b2Math.MulTMV(param2.R, m_axis.GetNegative());
                    _loc_5 = m_proxyA.GetSupportVertex(_loc_3);
                    _loc_6 = m_proxyB.GetSupportVertex(_loc_4);
                    _loc_7 = b2Math.MulX(param1, _loc_5);
                    _loc_8 = b2Math.MulX(param2, _loc_6);
                    _loc_9 = (_loc_8.x - _loc_7.x) * m_axis.x + (_loc_8.y - _loc_7.y) * m_axis.y;
                    return _loc_9;
                }
                case e_faceA:
                {
                    _loc_10 = b2Math.MulMV(param1.R, m_axis);
                    _loc_7 = b2Math.MulX(param1, m_localPoint);
                    _loc_4 = b2Math.MulTMV(param2.R, _loc_10.GetNegative());
                    _loc_6 = m_proxyB.GetSupportVertex(_loc_4);
                    _loc_8 = b2Math.MulX(param2, _loc_6);
                    _loc_9 = (_loc_8.x - _loc_7.x) * _loc_10.x + (_loc_8.y - _loc_7.y) * _loc_10.y;
                    return _loc_9;
                }
                case e_faceB:
                {
                    _loc_10 = b2Math.MulMV(param2.R, m_axis);
                    _loc_8 = b2Math.MulX(param2, m_localPoint);
                    _loc_3 = b2Math.MulTMV(param1.R, _loc_10.GetNegative());
                    _loc_5 = m_proxyA.GetSupportVertex(_loc_3);
                    _loc_7 = b2Math.MulX(param1, _loc_5);
                    _loc_9 = (_loc_7.x - _loc_8.x) * _loc_10.x + (_loc_7.y - _loc_8.y) * _loc_10.y;
                    return _loc_9;
                }
                default:
                {
                    b2Settings.b2Assert(false);
                    return 0;
                    break;
                }
            }
        }// end function

    }
}
