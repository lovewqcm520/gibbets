package Box2D.Dynamics.Contacts
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2EdgeAndCircleContact extends b2Contact
    {

        public function b2EdgeAndCircleContact()
        {
            return;
        }// end function

        override function Evaluate() : void
        {
            var _loc_1:* = m_fixtureA.GetBody();
            var _loc_2:* = m_fixtureB.GetBody();
            b2CollideEdgeAndCircle(m_manifold, m_fixtureA.GetShape() as b2EdgeShape, _loc_1.m_xf, m_fixtureB.GetShape() as b2CircleShape, _loc_2.m_xf);
            return;
        }// end function

        private function b2CollideEdgeAndCircle(param1:b2Manifold, param2:b2EdgeShape, param3:b2Transform, param4:b2CircleShape, param5:b2Transform) : void
        {
            return;
        }// end function

        public function Reset(param1:b2Fixture, param2:b2Fixture) : void
        {
            super.Reset(param1, param2);
            return;
        }// end function

        public static function Destroy(param1:b2Contact, param2) : void
        {
            return;
        }// end function

        public static function Create(param1) : b2Contact
        {
            return new b2EdgeAndCircleContact;
        }// end function

    }
}
