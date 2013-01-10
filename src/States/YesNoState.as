package States
{
    import Main.*;
    import flash.events.*;
    import flash.geom.*;

    public class YesNoState extends GameState
    {
        private const m_endPosition:Point;
        private const STATE_MOVE_DOWN:int = 0;
        private const STATE_MOVE_BACK:int = 3;
        private const STATE_MOVE_UP:int = 1;
        private var m_shader:Shader;
        private const m_startPosition:Point;
        private const STATE_MOVE_END:int = 2;
        private var m_state:int = 0;

        public function YesNoState()
        {
            m_shader = new Shader(0.6, 1.2, 0, 0.5);
            m_startPosition = new Point(584, -215);
            m_endPosition = new Point(493, 62);
            return;
        }// end function

        private function onYesClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            m_state = STATE_MOVE_BACK;
            removeChild(m_shader);
            m_shader = new Shader(0, 0.25, m_shader.getShade(), 0);
            addChildAt(m_shader, 0);
            GameData.resetGame();
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_view.m_buttonYes.removeEventListener(MouseEvent.CLICK, onYesClick);
            m_view.m_buttonNo.removeEventListener(MouseEvent.CLICK, onNoClick);
            super.onCleanup();
            return;
        }// end function

        private function onNoClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            m_state = STATE_MOVE_BACK;
            removeChild(m_shader);
            m_shader = new Shader(0, 0.25, m_shader.getShade(), 0);
            addChildAt(m_shader, 0);
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_shader.update(param1);
            switch(m_state)
            {
                case STATE_MOVE_DOWN:
                {
                    var _loc_2:* = m_view.y + param1 * 1000;
                    m_view.y = m_view.y + param1 * 1000;
                    if (_loc_2 > 20)
                    {
                        m_state = STATE_MOVE_UP;
                    }
                    break;
                }
                case STATE_MOVE_UP:
                {
                    var _loc_2:* = m_view.y - param1 * 150;
                    m_view.y = m_view.y - param1 * 150;
                    if (_loc_2 < 0)
                    {
                        m_view.y = -0;
                        m_state = STATE_MOVE_END;
                    }
                    break;
                }
                case STATE_MOVE_BACK:
                {
                    var _loc_2:* = m_view.y - param1 * 1300;
                    m_view.y = m_view.y - param1 * 1300;
                    if (_loc_2 < -480)
                    {
                        StateManager.getInstance().popState();
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

        override public function onInit() : void
        {
            super.onInit();
            m_view = new YesNoStateView();
            addChild(m_shader);
            addChild(m_view);
            m_view.y = -480;
            m_view.m_buttonYes.addEventListener(MouseEvent.CLICK, onYesClick);
            m_view.m_buttonNo.addEventListener(MouseEvent.CLICK, onNoClick);
            return;
        }// end function

    }
}
