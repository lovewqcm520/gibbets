package Box2D.Dynamics.Contacts
{
    import Box2D.Collision.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    class b2PositionSolverManifold extends Object
    {
        public var m_points:Array;
        public var m_normal:b2Vec2;
        public var m_separations:Array;
        private static var circlePointA:b2Vec2 = new b2Vec2();
        private static var circlePointB:b2Vec2 = new b2Vec2();

        function b2PositionSolverManifold()
        {
            m_normal = new b2Vec2();
            m_separations = new Array(b2Settings.b2_maxManifoldPoints);
            m_points = new Array(b2Settings.b2_maxManifoldPoints);
            var _loc_1:int = 0;
            while (_loc_1 < b2Settings.b2_maxManifoldPoints)
            {
                
                m_points[_loc_1] = new b2Vec2();
                _loc_1++;
            }
            return;
        }// end function

        public function Initialize(param1:b2ContactConstraint) : void
        {
            var _loc_2:int = 0;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:b2Mat22 = null;
            var _loc_6:b2Vec2 = null;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            b2Settings.b2Assert(param1.pointCount > 0);
            switch(param1.type)
            {
                case b2Manifold.e_circles:
                {
                    _loc_5 = param1.bodyA.m_xf.R;
                    _loc_6 = param1.localPoint;
                    _loc_9 = param1.bodyA.m_xf.position.x + (_loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y);
                    _loc_10 = param1.bodyA.m_xf.position.y + (_loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y);
                    _loc_5 = param1.bodyB.m_xf.R;
                    _loc_6 = param1.points[0].localPoint;
                    _loc_11 = param1.bodyB.m_xf.position.x + (_loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y);
                    _loc_12 = param1.bodyB.m_xf.position.y + (_loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y);
                    _loc_13 = _loc_11 - _loc_9;
                    _loc_14 = _loc_12 - _loc_10;
                    _loc_15 = _loc_13 * _loc_13 + _loc_14 * _loc_14;
                    if (_loc_15 > Number.MIN_VALUE * Number.MIN_VALUE)
                    {
                        _loc_16 = Math.sqrt(_loc_15);
                        m_normal.x = _loc_13 / _loc_16;
                        m_normal.y = _loc_14 / _loc_16;
                    }
                    else
                    {
                        m_normal.x = 1;
                        m_normal.y = 0;
                    }
                    m_points[0].x = 0.5 * (_loc_9 + _loc_11);
                    m_points[0].y = 0.5 * (_loc_10 + _loc_12);
                    m_separations[0] = _loc_13 * m_normal.x + _loc_14 * m_normal.y - param1.radius;
                    break;
                }
                case b2Manifold.e_faceA:
                {
                    _loc_5 = param1.bodyA.m_xf.R;
                    _loc_6 = param1.localPlaneNormal;
                    m_normal.x = _loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y;
                    m_normal.y = _loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y;
                    _loc_5 = param1.bodyA.m_xf.R;
                    _loc_6 = param1.localPoint;
                    _loc_7 = param1.bodyA.m_xf.position.x + (_loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y);
                    _loc_8 = param1.bodyA.m_xf.position.y + (_loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y);
                    _loc_5 = param1.bodyB.m_xf.R;
                    _loc_2 = 0;
                    while (_loc_2 < param1.pointCount)
                    {
                        
                        _loc_6 = param1.points[_loc_2].localPoint;
                        _loc_3 = param1.bodyB.m_xf.position.x + (_loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y);
                        _loc_4 = param1.bodyB.m_xf.position.y + (_loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y);
                        m_separations[_loc_2] = (_loc_3 - _loc_7) * m_normal.x + (_loc_4 - _loc_8) * m_normal.y - param1.radius;
                        m_points[_loc_2].x = _loc_3;
                        m_points[_loc_2].y = _loc_4;
                        _loc_2++;
                    }
                    break;
                }
                case b2Manifold.e_faceB:
                {
                    _loc_5 = param1.bodyB.m_xf.R;
                    _loc_6 = param1.localPlaneNormal;
                    m_normal.x = _loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y;
                    m_normal.y = _loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y;
                    _loc_5 = param1.bodyB.m_xf.R;
                    _loc_6 = param1.localPoint;
                    _loc_7 = param1.bodyB.m_xf.position.x + (_loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y);
                    _loc_8 = param1.bodyB.m_xf.position.y + (_loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y);
                    _loc_5 = param1.bodyA.m_xf.R;
                    _loc_2 = 0;
                    while (_loc_2 < param1.pointCount)
                    {
                        
                        _loc_6 = param1.points[_loc_2].localPoint;
                        _loc_3 = param1.bodyA.m_xf.position.x + (_loc_5.col1.x * _loc_6.x + _loc_5.col2.x * _loc_6.y);
                        _loc_4 = param1.bodyA.m_xf.position.y + (_loc_5.col1.y * _loc_6.x + _loc_5.col2.y * _loc_6.y);
                        m_separations[_loc_2] = (_loc_3 - _loc_7) * m_normal.x + (_loc_4 - _loc_8) * m_normal.y - param1.radius;
                        m_points[_loc_2].Set(_loc_3, _loc_4);
                        _loc_2++;
                    }
                    m_normal.x = m_normal.x * -1;
                    m_normal.y = m_normal.y * -1;
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
