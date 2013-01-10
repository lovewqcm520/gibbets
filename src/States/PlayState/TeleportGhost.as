package States.PlayState
{
    import Box2D.Dynamics.*;
    import flash.display.*;

    public class TeleportGhost extends MapObject
    {
        private var m_isActive:Boolean = true;
        private var m_needRun:Boolean = false;

        public function TeleportGhost()
        {
            return;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_isActive)
            {
                m_body = body;
                m_isActive = false;
                m_needRun = true;
                param1.kill();
            }
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:Sprite = null;
            if (m_needRun)
            {
                m_needRun = false;
                PlayState.getInstance().startTeleportHere(m_body.GetPosition());
                PlayState.getInstance().getWorld().DestroyBody(m_body);
                SoundManager.play(SoundConst.TELEPORT);
            }
            else if (!m_isActive)
            {
                _loc_2 = m_body.GetUserData() as Sprite;
                var _loc_3:* = _loc_2.alpha - 0.1;
                _loc_2.alpha = _loc_2.alpha - 0.1;
                if (_loc_3 <= 0)
                {
                    _loc_2.alpha = 0;
                }
            }
            return;
        }// end function

    }
}
