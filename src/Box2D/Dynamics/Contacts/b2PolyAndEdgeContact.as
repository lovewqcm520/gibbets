package Box2D.Dynamics.Contacts
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2PolyAndEdgeContact extends b2Contact
    {

        public function b2PolyAndEdgeContact()
        {
            return;
        }// end function

        override function Evaluate() : void
        {
            var _loc_1:* = m_fixtureA.GetBody();
            var _loc_2:* = m_fixtureB.GetBody();
            b2CollidePolyAndEdge(m_manifold, m_fixtureA.GetShape() as b2PolygonShape, _loc_1.m_xf, m_fixtureB.GetShape() as b2EdgeShape, _loc_2.m_xf);
            return;
        }// end function

        private function b2CollidePolyAndEdge(param1:b2Manifold, param2:b2PolygonShape, param3:b2Transform, param4:b2EdgeShape, param5:b2Transform) : void
        {
            return;
        }// end function

        public function Reset(param1:b2Fixture, param2:b2Fixture) : void
        {
            super.Reset(param1, param2);
            b2Settings.b2Assert(param1.GetType() == b2Shape.e_polygonShape);
            b2Settings.b2Assert(param2.GetType() == b2Shape.e_edgeShape);
            return;
        }// end function

        public static function Destroy(param1:b2Contact, param2) : void
        {
            return;
        }// end function

        public static function Create(param1) : b2Contact
        {
            return new b2PolyAndEdgeContact;
        }// end function

    }
}
