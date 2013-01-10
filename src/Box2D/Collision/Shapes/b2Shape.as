package Box2D.Collision.Shapes
{
    import Box2D.Collision.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2Shape extends Object
    {
        var m_radius:Number;
        var m_type:int;
        static const e_polygonShape:int = 1;
        public static const e_hitCollide:int = 1;
        public static const e_missCollide:int = 0;
        static const e_edgeShape:int = 2;
        static const e_shapeTypeCount:int = 3;
        static const e_unknownShape:int = -1;
        static const e_circleShape:int = 0;
        public static const e_startsInsideCollide:int = -1;

        public function b2Shape()
        {
            m_type = e_unknownShape;
            m_radius = b2Settings.b2_linearSlop;
            return;
        }// end function

        public function RayCast(param1:b2RayCastOutput, param2:b2RayCastInput, param3:b2Transform) : Boolean
        {
            return false;
        }// end function

        public function ComputeSubmergedArea(param1:b2Vec2, param2:Number, param3:b2Transform, param4:b2Vec2) : Number
        {
            return 0;
        }// end function

        public function Set(param1:b2Shape) : void
        {
            m_radius = param1.m_radius;
            return;
        }// end function

        public function ComputeMass(param1:b2MassData, param2:Number) : void
        {
            return;
        }// end function

        public function GetType() : int
        {
            return m_type;
        }// end function

        public function Copy() : b2Shape
        {
            return null;
        }// end function

        public function ComputeAABB(param1:b2AABB, param2:b2Transform) : void
        {
            return;
        }// end function

        public function TestPoint(param1:b2Transform, param2:b2Vec2) : Boolean
        {
            return false;
        }// end function

        public static function TestOverlap(param1:b2Shape, param2:b2Transform, param3:b2Shape, param4:b2Transform) : Boolean
        {
            var _loc_5:* = new b2DistanceInput();
            new b2DistanceInput().proxyA = new b2DistanceProxy();
            _loc_5.proxyA.Set(param1);
            _loc_5.proxyB = new b2DistanceProxy();
            _loc_5.proxyB.Set(param3);
            _loc_5.transformA = param2;
            _loc_5.transformB = param4;
            _loc_5.useRadii = true;
            var _loc_6:* = new b2SimplexCache();
            new b2SimplexCache().count = 0;
            var _loc_7:* = new b2DistanceOutput();
            b2Distance.Distance(_loc_7, _loc_6, _loc_5);
            return _loc_7.distance < 10 * Number.MIN_VALUE;
        }// end function

    }
}
