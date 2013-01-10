package States.PlayState
{
    import Box2D.Dynamics.*;
    import flash.display.*;

    public class Vulture extends MapObject
    {
        private var m_anim:MovieClip;
        private var m_torsoFixture:b2Fixture = null;
        private var m_isLeft:Boolean = false;
        private var m_legsFixture:b2Fixture = null;
        private var m_headFixture:b2Fixture = null;

        public function Vulture(param1:b2Fixture, param2:b2Fixture, param3:b2Fixture, param4:Boolean)
        {
            m_anim = new VultureJump();
            m_isLeft = param4;
            m_legsFixture = param3;
            m_torsoFixture = param2;
            m_headFixture = param1;
            m_anim.clip.stop();
            addChild(m_anim);
            if (m_isLeft)
            {
                m_anim.scaleX = -1;
            }
            return;
        }// end function

        override public function isItYourFixture(param1:b2Fixture) : Boolean
        {
            return param1 == m_legsFixture || param1 == m_torsoFixture || param1 == m_headFixture;
        }// end function

        override public function update(param1:Number) : void
        {
            if (m_anim.clip.currentFrame == m_anim.clip.totalFrames && !m_isDead)
            {
                m_anim.clip.gotoAndStop(1);
            }
            return;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_anim.clip.currentFrame == 1)
            {
                removeChild(m_anim);
                switch(param2)
                {
                    case m_legsFixture:
                    {
                        m_anim = new VultureJump();
                        break;
                    }
                    case m_headFixture:
                    {
                        m_anim = new VultureBend();
                        break;
                    }
                    case m_torsoFixture:
                    {
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                if (m_isLeft)
                {
                    m_anim.scaleX = -1;
                }
                addChild(m_anim);
                m_anim.clip.play();
            }
            return;
        }// end function

    }
}
