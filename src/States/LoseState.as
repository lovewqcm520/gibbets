package States
{
    import Box2D.Common.Math.*;
    import Main.*;
    import Ragdoll.*;
    import States.PlayState.*;
    import Utils.*;
    import flash.display.*;
    import flash.events.*;

    public class LoseState extends PhysGameState
    {
        private const STATE_MOVE_DOWN:int = 0;
        private const STATE_MOVE_UP:int = 1;
        private var m_shader:Shader;
        private const STATE_MOVE_END:int = 2;
        private var m_state:int = 0;

        public function LoseState()
        {
            m_shader = new Shader(0.7, 1.4, 0, 0.5);
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_view.m_buttonRestart.removeEventListener(MouseEvent.CLICK, onButtonRestartClick);
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onButtonMenuClick);
            m_view.m_buttonMoreGames.removeEventListener(MouseEvent.CLICK, onButtonMoreGamesClick);
            m_shader = null;
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            super.update(param1);
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
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function onButtonMoreGamesClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.LOSE_STATE_MORE_GAMES_BUTTON);
            return;
        }// end function

        override public function onInit() : void
        {
            super.onInit();
            addChild(m_shader);
            m_view = new LoseStateView();
            addChild(m_view);
            m_view.y = -480;
            var _loc_1:* = new MovieClip();
            _loc_1.scaleX = 1.9;
            _loc_1.scaleY = 1.9;
            m_view.m_window.addChild(_loc_1);
            m_view.m_buttonRestart.addEventListener(MouseEvent.CLICK, onButtonRestartClick);
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onButtonMenuClick);
            m_view.m_buttonMoreGames.addEventListener(MouseEvent.CLICK, onButtonMoreGamesClick);
            var _loc_2:* = PlayState.m_deadID;
            if (_loc_2 == -1)
            {
                _loc_2 = MathUtils.RandomRangeInt(1, 4);
            }
            var _loc_3:* = new Gibbet(new b2Vec2(m_view.m_window.width / 4 / m_physScale, 20 / m_physScale), HumanRagdoll.HEAD, 7, m_world, _loc_2, false);
            _loc_1.addChild(_loc_3);
            _loc_3.getRagdoll().applyImpulse(new b2Vec2(MathUtils.RandomRange(0.1, 0.2), 0));
            _loc_3.makeLookUgly();
            SoundManager.playFadeOut(SoundConst.LOSE);
            addChild(new MoreGamesPanel(LinksManager.LOSE_SCREEN));
            return;
        }// end function

        private function onButtonRestartClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(GameData.getNextState(PlayState.m_curLevel));
            return;
        }// end function

        private function onButtonMenuClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(GameData.getSelectLevelScreen());
            return;
        }// end function

    }
}
