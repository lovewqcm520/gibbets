package States.GrifShooting
{
    import Box2D.Dynamics.*;
    import States.PlayState.*;
    import Utils.*;
    import flash.display.*;

    public class DeathVulture extends MapObject
    {
        private var m_isKilled:Boolean = false;
        private var m_anim:MovieClip;
        private var m_torsoFixture:b2Fixture = null;
        private var m_needGoSensor:Boolean = false;
        private var m_section:int;
        private var m_speed:Number;
        private var m_headFixture:b2Fixture = null;
        private var m_legsFixture:b2Fixture = null;

        public function DeathVulture(param1:b2Fixture, param2:b2Fixture, param3:b2Fixture, param4:int) : void
        {
            m_anim = new VultureHere();
            m_section = param4;
            m_legsFixture = param3;
            m_torsoFixture = param2;
            m_headFixture = param1;
            scaleX = -1;
            addChild(m_anim);
            m_anim.clip.stop();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:b2Fixture = null;
            if (m_anim.clip.currentFrame == m_anim.clip.totalFrames && !m_isKilled)
            {
                m_anim.clip.gotoAndStop(1);
            }
            if (m_body.GetPosition().y > Constant.WINDOW_HEIGHT / Constant.PHYS_SCALE + 300 / Constant.PHYS_SCALE)
            {
                m_isDead = true;
            }
            if (m_body.GetPosition().y < -300 / Constant.PHYS_SCALE)
            {
                m_isDead = true;
            }
            if (m_needGoSensor)
            {
                _loc_2 = m_body.GetFixtureList();
                while (_loc_2)
                {
                    
                    _loc_2.SetSensor(true);
                    _loc_2 = _loc_2.GetNext();
                }
                m_needGoSensor = false;
            }
            return;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            onArrowHeadContact(param1, param2);
            return;
        }// end function

        override public function onDead(param1:b2World) : void
        {
            param1.DestroyBody(m_body);
            parent.removeChild(this);
            return;
        }// end function

        override public function onArrowHeadContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_isKilled)
            {
                return;
            }
            removeChild(m_anim);
            switch(param2)
            {
                case m_legsFixture:
                {
                    m_anim = new VultureJump();
                    SoundManager.play(MathUtils.anyOfString(SoundConst.VULTURE_CACLE_1, SoundConst.VULTURE_CACLE_2));
                    break;
                }
                case m_headFixture:
                {
                    m_anim = new VultureBend();
                    break;
                }
                case m_torsoFixture:
                {
                    m_anim = new VultureDie();
                    m_isKilled = true;
                    GrifShootingState.getInstance().onVultureKill(m_body.GetPosition(), m_section);
                    m_needGoSensor = true;
                    SoundManager.play(MathUtils.anyOfString(SoundConst.VULTURE_CRY_1, SoundConst.VULTURE_CRY_2, SoundConst.VULTURE_CRY_3, SoundConst.VULTURE_CRY_4));
                    break;
                }
                default:
                {
                    break;
                }
            }
            addChild(m_anim);
            m_anim.clip.play();
            return;
        }// end function

    }
}
