package States.GrifShooting
{
    import Box2D.Dynamics.*;
    import States.PlayState.*;

    public class VultureAmmoGhost extends MapObject
    {
        private var m_isActive:Boolean = true;
        private var m_needRun:Boolean = false;
        private var m_power:int;
        private var m_speed:Number;

        public function VultureAmmoGhost(param1:Number)
        {
            m_speed = param1;
            cacheAsBitmap = true;
            return;
        }// end function

        public function setPower(param1:int) : void
        {
            m_power = param1;
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            if (m_body.GetPosition().y > Constant.WINDOW_HEIGHT / Constant.PHYS_SCALE + 300 / Constant.PHYS_SCALE)
            {
                m_isDead = true;
            }
            if (m_body.GetPosition().y < -300 / Constant.PHYS_SCALE)
            {
                m_isDead = true;
            }
            if (m_needRun)
            {
                m_needRun = false;
                GrifShootingState.getInstance().addArrows(m_power, x, y);
            }
            else if (!m_isActive)
            {
                scaleX = scaleX + param1 * 1.5;
                scaleY = scaleY + param1 * 1.5;
                var _loc_2:* = alpha - 0.1;
                alpha = alpha - 0.1;
                if (_loc_2 <= 0)
                {
                    m_isDead = true;
                }
            }
            return;
        }// end function

        override public function isDead() : Boolean
        {
            return m_isDead;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_isActive)
            {
                m_isActive = false;
                m_needRun = true;
                if (Math.random() < 0.5)
                {
                    SoundManager.play(SoundConst.ADD_ARROWS_0);
                }
                else
                {
                    SoundManager.play(SoundConst.ADD_ARROWS_1);
                }
                param1.kill();
            }
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
            onArrowContact(param1, param2);
            return;
        }// end function

    }
}
