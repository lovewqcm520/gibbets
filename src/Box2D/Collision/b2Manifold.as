package Box2D.Collision
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2Manifold extends Object
    {
        public var m_pointCount:int = 0;
        public var m_localPlaneNormal:b2Vec2;
        public var m_type:int;
        public var m_points:Array;
        public var m_localPoint:b2Vec2;
        public static const e_circles:int = 1;
        public static const e_faceA:int = 2;
        public static const e_faceB:int = 4;

        public function b2Manifold()
        {
            m_points = new Array(b2Settings.b2_maxManifoldPoints);
            var _loc_1:int = 0;
            while (_loc_1 < b2Settings.b2_maxManifoldPoints)
            {
                
                m_points[_loc_1] = new b2ManifoldPoint();
                _loc_1++;
            }
            m_localPlaneNormal = new b2Vec2();
            m_localPoint = new b2Vec2();
            return;
        }// end function

        public function Set(param1:b2Manifold) : void
        {
            m_pointCount = param1.m_pointCount;
            var _loc_2:int = 0;
            while (_loc_2 < b2Settings.b2_maxManifoldPoints)
            {
                
                (m_points[_loc_2] as b2ManifoldPoint).Set(param1.m_points[_loc_2]);
                _loc_2++;
            }
            m_localPlaneNormal.SetV(param1.m_localPlaneNormal);
            m_localPoint.SetV(param1.m_localPoint);
            m_type = param1.m_type;
            return;
        }// end function

        public function Reset() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < b2Settings.b2_maxManifoldPoints)
            {
                
                (m_points[_loc_1] as b2ManifoldPoint).Reset();
                _loc_1++;
            }
            m_localPlaneNormal.SetZero();
            m_localPoint.SetZero();
            m_type = 0;
            m_pointCount = 0;
            return;
        }// end function

        public function Copy() : b2Manifold
        {
            var _loc_1:* = new b2Manifold();
            _loc_1.Set(this);
            return _loc_1;
        }// end function

    }
}
