package Box2D.Collision
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2WorldManifold extends Object
    {
        public var m_normal:b2Vec2;
        public var m_points:Array;

        public function b2WorldManifold()
        {
            m_normal = new b2Vec2();
            m_points = new Array(b2Settings.b2_maxManifoldPoints);
            var _loc_1:int = 0;
            while (_loc_1 < b2Settings.b2_maxManifoldPoints)
            {
                
                m_points[_loc_1] = new b2Vec2();
                _loc_1++;
            }
            return;
        }// end function

        public function Initialize(param1:b2Manifold, param2:b2Transform, param3:Number, param4:b2Transform, param5:Number) : void
        {
            var _loc_6:int = 0;
            var _loc_7:b2Vec2 = null;
            var _loc_8:b2Mat22 = null;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_25:Number = NaN;
            var _loc_26:Number = NaN;
            if (param1.m_pointCount == 0)
            {
                return;
            }
            switch(param1.m_type)
            {
                case b2Manifold.e_circles:
                {
                    _loc_8 = param2.R;
                    _loc_7 = param1.m_localPoint;
                    _loc_15 = param2.position.x + _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                    _loc_16 = param2.position.y + _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                    _loc_8 = param4.R;
                    _loc_7 = param1.m_points[0].m_localPoint;
                    _loc_17 = param4.position.x + _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                    _loc_18 = param4.position.y + _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                    _loc_19 = _loc_17 - _loc_15;
                    _loc_20 = _loc_18 - _loc_16;
                    _loc_21 = _loc_19 * _loc_19 + _loc_20 * _loc_20;
                    if (_loc_21 > Number.MIN_VALUE * Number.MIN_VALUE)
                    {
                        _loc_26 = Math.sqrt(_loc_21);
                        m_normal.x = _loc_19 / _loc_26;
                        m_normal.y = _loc_20 / _loc_26;
                    }
                    else
                    {
                        m_normal.x = 1;
                        m_normal.y = 0;
                    }
                    _loc_22 = _loc_15 + param3 * m_normal.x;
                    _loc_23 = _loc_16 + param3 * m_normal.y;
                    _loc_24 = _loc_17 - param5 * m_normal.x;
                    _loc_25 = _loc_18 - param5 * m_normal.y;
                    m_points[0].x = 0.5 * (_loc_22 + _loc_24);
                    m_points[0].y = 0.5 * (_loc_23 + _loc_25);
                    break;
                }
                case b2Manifold.e_faceA:
                {
                    _loc_8 = param2.R;
                    _loc_7 = param1.m_localPlaneNormal;
                    _loc_9 = _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                    _loc_10 = _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                    _loc_8 = param2.R;
                    _loc_7 = param1.m_localPoint;
                    _loc_11 = param2.position.x + _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                    _loc_12 = param2.position.y + _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                    m_normal.x = _loc_9;
                    m_normal.y = _loc_10;
                    _loc_6 = 0;
                    while (_loc_6 < param1.m_pointCount)
                    {
                        
                        _loc_8 = param4.R;
                        _loc_7 = param1.m_points[_loc_6].m_localPoint;
                        _loc_13 = param4.position.x + _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                        _loc_14 = param4.position.y + _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                        m_points[_loc_6].x = _loc_13 + 0.5 * (param3 - (_loc_13 - _loc_11) * _loc_9 - (_loc_14 - _loc_12) * _loc_10 - param5) * _loc_9;
                        m_points[_loc_6].y = _loc_14 + 0.5 * (param3 - (_loc_13 - _loc_11) * _loc_9 - (_loc_14 - _loc_12) * _loc_10 - param5) * _loc_10;
                        _loc_6++;
                    }
                    break;
                }
                case b2Manifold.e_faceB:
                {
                    _loc_8 = param4.R;
                    _loc_7 = param1.m_localPlaneNormal;
                    _loc_9 = _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                    _loc_10 = _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                    _loc_8 = param4.R;
                    _loc_7 = param1.m_localPoint;
                    _loc_11 = param4.position.x + _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                    _loc_12 = param4.position.y + _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                    m_normal.x = -_loc_9;
                    m_normal.y = -_loc_10;
                    _loc_6 = 0;
                    while (_loc_6 < param1.m_pointCount)
                    {
                        
                        _loc_8 = param2.R;
                        _loc_7 = param1.m_points[_loc_6].m_localPoint;
                        _loc_13 = param2.position.x + _loc_8.col1.x * _loc_7.x + _loc_8.col2.x * _loc_7.y;
                        _loc_14 = param2.position.y + _loc_8.col1.y * _loc_7.x + _loc_8.col2.y * _loc_7.y;
                        m_points[_loc_6].x = _loc_13 + 0.5 * (param5 - (_loc_13 - _loc_11) * _loc_9 - (_loc_14 - _loc_12) * _loc_10 - param3) * _loc_9;
                        m_points[_loc_6].y = _loc_14 + 0.5 * (param5 - (_loc_13 - _loc_11) * _loc_9 - (_loc_14 - _loc_12) * _loc_10 - param3) * _loc_10;
                        _loc_6++;
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

    }
}
