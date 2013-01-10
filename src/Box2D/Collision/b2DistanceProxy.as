package Box2D.Collision
{
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2DistanceProxy extends Object
    {
        public var m_radius:Number;
        public var m_vertices:Array;
        public var m_count:int;

        public function b2DistanceProxy()
        {
            return;
        }// end function

        public function GetVertex(param1:int) : b2Vec2
        {
            b2Settings.b2Assert(param1 >= 0 && param1 < m_count);
            return m_vertices[param1];
        }// end function

        public function Set(param1:b2Shape) : void
        {
            var _loc_2:b2CircleShape = null;
            var _loc_3:b2PolygonShape = null;
            switch(param1.GetType())
            {
                case b2Shape.e_circleShape:
                {
                    _loc_2 = param1 as b2CircleShape;
                    m_vertices = new Array(1, true);
                    m_vertices[0] = _loc_2.m_p;
                    m_count = 1;
                    m_radius = _loc_2.m_radius;
                    break;
                }
                case b2Shape.e_polygonShape:
                {
                    _loc_3 = param1 as b2PolygonShape;
                    m_vertices = _loc_3.m_vertices;
                    m_count = _loc_3.m_vertexCount;
                    m_radius = _loc_3.m_radius;
                    break;
                }
                default:
                {
                    b2Settings.b2Assert(false);
                    break;
                }
            }
            return;
        }// end function

        public function GetSupportVertex(param1:b2Vec2) : b2Vec2
        {
            var _loc_5:Number = NaN;
            var _loc_2:int = 0;
            var _loc_3:* = m_vertices[0].x * param1.x + m_vertices[0].y * param1.y;
            var _loc_4:int = 1;
            while (_loc_4 < m_count)
            {
                
                _loc_5 = m_vertices[_loc_4].x * param1.x + m_vertices[_loc_4].y * param1.y;
                if (_loc_5 > _loc_3)
                {
                    _loc_2 = _loc_4;
                    _loc_3 = _loc_5;
                }
                _loc_4++;
            }
            return m_vertices[_loc_2];
        }// end function

        public function GetVertexCount() : int
        {
            return m_count;
        }// end function

        public function GetSupport(param1:b2Vec2) : Number
        {
            var _loc_5:Number = NaN;
            var _loc_2:int = 0;
            var _loc_3:* = m_vertices[0].x * param1.x + m_vertices[0].y * param1.y;
            var _loc_4:int = 1;
            while (_loc_4 < m_count)
            {
                
                _loc_5 = m_vertices[_loc_4].x * param1.x + m_vertices[_loc_4].y * param1.y;
                if (_loc_5 > _loc_3)
                {
                    _loc_2 = _loc_4;
                    _loc_3 = _loc_5;
                }
                _loc_4++;
            }
            return _loc_2;
        }// end function

    }
}
