package States.PlayState
{
    import Box2D.Dynamics.*;

    public class TNTBarrel extends MapObject
    {
        private var m_isActivated:Boolean = true;

        public function TNTBarrel()
        {
            stop();
            return;
        }// end function

        override public function onDead(param1:b2World) : void
        {
            parent.removeChild(this);
            return;
        }// end function

        override public function onArrowHeadContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_isActivated)
            {
                m_isActivated = false;
                PlayState.getInstance().boomAt(m_body);
                play();
            }
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            if (currentFrame == totalFrames)
            {
                m_isDead = true;
            }
            return;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_isActivated)
            {
                m_isActivated = false;
                PlayState.getInstance().boomAt(m_body);
                play();
            }
            return;
        }// end function

    }
}
