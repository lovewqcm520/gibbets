package States.PlayState
{
    import Entity.*;
    import flash.display.*;
    import flash.geom.*;

    public class Bow extends SimpleStatableObject
    {
        private var m_clip:BowClip;
        private const STATE_NORMAL:String = "normal";
        private const STATE_TELEPORT_1:String = "teleport1";
        private const STATE_TELEPORT_2:String = "teleport2";
        private var m_blackHoleEnd:TeleportBack;
        private var m_nextPos:Point;
        private var m_blackHoleStart:TeleportBack;
        private var m_layer:Sprite;

        public function Bow()
        {
            m_blackHoleStart = new TeleportBack();
            m_blackHoleEnd = new TeleportBack();
            m_clip = new BowClip();
            if (PlayState.getInstance())
            {
                m_layer = PlayState.getInstance().getArrowsLayer();
            }
            addChild(m_clip);
            m_clip.m_field.alpha = 0;
            buttonMode = true;
            return;
        }// end function

        public function startStretch() : void
        {
            m_clip.gotoAndPlay("stretch");
            return;
        }// end function

        override protected function vUpdate(param1:Number) : void
        {
            switch(m_state)
            {
                case STATE_NORMAL:
                {
                    if (m_blackHoleEnd.parent)
                    {
                        m_blackHoleEnd.alpha = m_blackHoleEnd.alpha - 1 * param1;
                        if (m_blackHoleEnd.alpha <= 0)
                        {
                            m_layer.removeChild(m_blackHoleEnd);
                        }
                    }
                    break;
                }
                case STATE_TELEPORT_1:
                {
                    m_blackHoleStart.alpha = m_blackHoleStart.alpha + 2 * param1;
                    m_clip.rotation = m_clip.rotation + 360 * param1 * 2;
                    m_clip.scaleX = m_clip.scaleX - 1 * param1;
                    m_clip.scaleY = m_clip.scaleY - 1 * param1;
                    m_clip.alpha = m_clip.alpha - 1 * param1;
                    if (m_clip.scaleX <= 0)
                    {
                        m_blackHoleStart.alpha = 1;
                        x = m_nextPos.x;
                        y = m_nextPos.y;
                        changeState(STATE_TELEPORT_2);
                    }
                    break;
                }
                case STATE_TELEPORT_2:
                {
                    m_blackHoleStart.alpha = m_blackHoleStart.alpha - 1 * param1;
                    m_blackHoleEnd.alpha = m_blackHoleEnd.alpha + 2 * param1;
                    m_clip.rotation = m_clip.rotation - 360 * param1 * 2;
                    m_clip.scaleX = m_clip.scaleX + 1 * param1;
                    m_clip.scaleY = m_clip.scaleY + 1 * param1;
                    m_clip.alpha = m_clip.alpha + 1 * param1;
                    if (m_clip.scaleX >= 1)
                    {
                        m_blackHoleEnd.alpha = 1;
                        m_clip.scaleX = 1;
                        m_clip.scaleY = 1;
                        changeState(STATE_NORMAL);
                        m_layer.removeChild(m_blackHoleStart);
                        PlayState.getInstance().goNormalState();
                        m_clip.rotation = 0;
                        m_clip.alpha = 1;
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override protected function onChangeState(param1:String, param2:String) : void
        {
            if (param2 == STATE_NORMAL)
            {
                buttonMode = true;
            }
            else
            {
                buttonMode = false;
            }
            return;
        }// end function

        public function startTeleport(param1:Point) : void
        {
            changeState(STATE_TELEPORT_1);
            m_nextPos = param1;
            m_layer.addChild(m_blackHoleStart);
            m_blackHoleStart.alpha = 0;
            m_blackHoleStart.x = this.x;
            m_blackHoleStart.y = this.y;
            m_layer.addChild(m_blackHoleEnd);
            m_blackHoleEnd.alpha = 0;
            m_blackHoleEnd.x = param1.x;
            m_blackHoleEnd.y = param1.y;
            return;
        }// end function

        public function fire() : void
        {
            m_clip.gotoAndPlay("fire");
            return;
        }// end function

    }
}
