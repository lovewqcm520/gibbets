package States.PlayState
{
    import Box2D.Dynamics.*;

    public class Blood extends MapObject
    {

        public function Blood()
        {
            cacheAsBitmap = true;
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            if (m_liveTime > 0.3)
            {
                alpha = alpha - 1.5 * param1;
            }
            return;
        }// end function

        override public function onDead(param1:b2World) : void
        {
            parent.removeChild(this);
            param1.DestroyBody(m_body);
            return;
        }// end function

        override public function isDead() : Boolean
        {
            return alpha <= 0;
        }// end function

    }
}
