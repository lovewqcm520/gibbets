package States
{
    import Main.*;
    import States.GrifShooting.*;
    import flash.events.*;
    import flash.geom.*;

    public class GrifShootingWinState extends GameState
    {
        private const STATE_MOVE_DOWN:int = 0;
        private var m_wasStarSound:Boolean = false;
        private const m_endPosition:Point;
        private const m_cupEndPosition:Point;
        private const m_startPosition:Point;
        private const STATE_MOVE_END:int = 2;
        private const m_cupStartPosition:Point;
        private var m_wasNewAchievement:Boolean = false;
        private var m_shader:Shader;
        private const STATE_MOVE_UP:int = 1;
        private var m_state:int = 0;

        public function GrifShootingWinState()
        {
            m_shader = new Shader(0.6, 1.2, 0, 0.5);
            m_startPosition = new Point(584, -215);
            m_endPosition = new Point(493, 62);
            m_cupStartPosition = new Point(841, 248);
            m_cupEndPosition = new Point(521, 248);
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            m_shader.update(param1);
            switch(m_state)
            {
                case STATE_MOVE_DOWN:
                {
                    var _loc_8:* = m_view.y + param1 * 1000;
                    m_view.y = m_view.y + param1 * 1000;
                    if (_loc_8 > 20)
                    {
                        m_state = STATE_MOVE_UP;
                    }
                    break;
                }
                case STATE_MOVE_UP:
                {
                    var _loc_8:* = m_view.y - param1 * 150;
                    m_view.y = m_view.y - param1 * 150;
                    if (_loc_8 < 0)
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
            if (GrifShootingState.m_wasStar)
            {
                _loc_2 = 0.9;
                _loc_3 = 1.35;
                if (m_liveTime > _loc_2)
                {
                    m_view.m_star.visible = GrifShootingState.m_wasStar;
                    _loc_4 = (m_liveTime - _loc_2) / (_loc_3 - _loc_2);
                    if (m_liveTime < _loc_3)
                    {
                        m_view.m_star.x = m_startPosition.x + (m_endPosition.x - m_startPosition.x) * _loc_4;
                        m_view.m_star.y = m_startPosition.y + (m_endPosition.y - m_startPosition.y) * _loc_4;
                    }
                    else
                    {
                        m_view.m_star.m_perfectSign.rotation = Math.sin(m_liveTime * 7) * 3.5;
                        m_view.m_star.x = m_endPosition.x;
                        m_view.m_star.y = m_endPosition.y;
                        if (!m_wasStarSound)
                        {
                            m_wasStarSound = true;
                            SoundManager.play(SoundConst.PERFECT_STAR);
                        }
                    }
                }
            }
            if (m_wasNewAchievement)
            {
                _loc_5 = 1.2;
                _loc_6 = 1.65;
                if (m_liveTime > _loc_5)
                {
                    _loc_7 = (m_liveTime - _loc_5) / (_loc_6 - _loc_5);
                    if (m_liveTime < _loc_6)
                    {
                        m_view.m_buttonNewAchievement.x = m_cupStartPosition.x + (m_cupEndPosition.x - m_cupStartPosition.x) * _loc_7;
                        m_view.m_buttonNewAchievement.y = m_cupStartPosition.y + (m_cupEndPosition.y - m_cupStartPosition.y) * _loc_7;
                    }
                    else
                    {
                        m_view.m_buttonNewAchievement.x = m_cupEndPosition.x;
                        m_view.m_buttonNewAchievement.y = m_cupEndPosition.y;
                    }
                }
            }
            return;
        }// end function

        private function onButtonMoreGamesClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.GRIF_SHOOTING_WIN_STATE_BUTTON);
            return;
        }// end function

        override public function onInit() : void
        {
            GameData.onWinGrifShootingLevel(GrifShootingState.m_curLevel, GrifShootingState.m_vulturesKilled);
            addChild(m_shader);
            m_view = new GrifShootingWinStateView();
            addChild(m_view);
            m_view.y = -480;
            m_view.m_levelNum.text = ((GrifShootingState.m_curLevel + 1)).toString();
            m_view.m_accuracy.m_text.text = this.int(GrifShootingState.m_vulturesKilled / GrifShootingState.m_arrowsUsed * 100) + "%";
            m_view.m_currentScore.m_text.text = GrifShootingState.m_currentScores.toString();
            m_view.m_bestScore.m_text.text = GameData.getBestScore(GrifShootingState.m_curLevel);
            m_view.m_star.visible = false;
            m_view.m_buttonNext.addEventListener(MouseEvent.CLICK, onButtonNextClick);
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onButtonMenuClick);
            m_view.m_buttonMoreGames.addEventListener(MouseEvent.CLICK, onButtonMoreGamesClick);
            m_view.m_buttonNewAchievement.addEventListener(MouseEvent.CLICK, onAchievementsClick);
            m_wasNewAchievement = GameData.wasNewAchievements();
            SoundManager.playFadeOut(SoundConst.WIN);
            addChild(new MoreGamesPanel(LinksManager.MINIGAME_WIN_SCREEN));
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_view.m_buttonNext.removeEventListener(MouseEvent.CLICK, onButtonNextClick);
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onButtonMenuClick);
            m_view.m_buttonMoreGames.removeEventListener(MouseEvent.CLICK, onButtonMoreGamesClick);
            m_view.m_buttonNewAchievement.removeEventListener(MouseEvent.CLICK, onAchievementsClick);
            super.onCleanup();
            return;
        }// end function

        private function onAchievementsClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(new AchievementsState());
            return;
        }// end function

        private function onButtonNextClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(GameData.getNextState((GrifShootingState.m_curLevel + 1)));
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
