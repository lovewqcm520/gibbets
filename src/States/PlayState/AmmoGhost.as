package States.PlayState
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import flash.display.*;

    public class AmmoGhost extends MapObject
    {
        private var m_isActive:Boolean = true;
        private var m_needRun:Boolean = false;
        private var m_power:int;

        public function AmmoGhost()
        {
            cacheAsBitmap = true;
            return;
        }// end function

        override public function isDead() : Boolean
        {
            return m_isDead;
        }// end function

        public function setPower(param1:int) : void
        {
            m_power = param1;
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:Sprite = null;
            m_liveTime = m_liveTime + param1;
            m_body.SetPosition(new b2Vec2(m_body.GetPosition().x, m_body.GetPosition().y + Math.sin(m_liveTime * 2.5) * 0.007));
            if (m_needRun)
            {
                m_needRun = false;
                PlayState.getInstance().getWorld().DestroyBody(m_body);
                PlayState.getInstance().addArrows(m_power, x, y);
                this.cacheAsBitmap = false;
            }
            else if (!m_isActive)
            {
                _loc_2 = m_body.GetUserData() as Sprite;
                _loc_2.scaleX = _loc_2.scaleX + param1 * 1.5;
                _loc_2.scaleY = _loc_2.scaleY + param1 * 1.5;
                var _loc_3:* = _loc_2.alpha - 0.1;
                _loc_2.alpha = _loc_2.alpha - 0.1;
                if (_loc_3 <= 0)
                {
                    _loc_2.alpha = 0;
                    m_isDead = true;
                }
            }
            return;
        }// end function

        override public function onDead(param1:b2World) : void
        {
            parent.removeChild(this);
            return;
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
            }
            return;
        }// end function

    }
}
