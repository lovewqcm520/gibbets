package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2ManifoldPoint extends Object
    {
        public var m_localPoint:b2Vec2;
        public var m_tangentImpulse:Number;
        public var m_normalImpulse:Number;
        public var m_id:b2ContactID;

        public function b2ManifoldPoint()
        {
            m_localPoint = new b2Vec2();
            m_id = new b2ContactID();
            Reset();
            return;
        }// end function

        public function Set(param1:b2ManifoldPoint) : void
        {
            m_localPoint.SetV(param1.m_localPoint);
            m_normalImpulse = param1.m_normalImpulse;
            m_tangentImpulse = param1.m_tangentImpulse;
            m_id.Set(param1.m_id);
            return;
        }// end function

        public function Reset() : void
        {
            m_localPoint.SetZero();
            m_normalImpulse = 0;
            m_tangentImpulse = 0;
            m_id.key = 0;
            return;
        }// end function

    }
}
