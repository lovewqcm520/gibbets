package States
{
    import Main.*;
    import States.PlayState.*;
    import flash.display.*;
    import flash.events.*;

    public class SelectLevelState extends GameState
    {
        private var m_mapObjects:Array;
        private static var m_isSecondPart:Boolean = false;

        public function SelectLevelState(param1:Boolean) : void
        {
            m_mapObjects = new Array();
            m_isSecondPart = param1;
            return;
        }// end function

        private function onArrowUpClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().changeState(new LeftToRightMoveTransactionState(this, new SelectSecretLevelState(), LeftToRightMoveTransactionState.TOP_TO_DOWN_TRANSACTION, 1));
            return;
        }// end function

        private function onAchievementsClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(new AchievementsState());
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:MapObject = null;
            for each (_loc_2 in m_mapObjects)
            {
                
                _loc_2.update(param1);
            }
            return;
        }// end function

        override public function handleMouseClick(event:MouseEvent) : void
        {
            var _loc_4:int = 0;
            var _loc_2:* = GameData.levelsCompleted;
            var _loc_3:int = 0;
            while (_loc_3 < 24)
            {
                
                _loc_4 = _loc_3;
                if (m_isSecondPart)
                {
                    _loc_4 = _loc_4 + 24;
                }
                if (m_view.m_buttonsPanel.getChildByName("m_level" + _loc_3).hitTestPoint(event.stageX, event.stageY))
                {
                    if (_loc_4 <= _loc_2)
                    {
                        SoundManager.play(SoundConst.CLICK);
                        StateManager.getInstance().coolChangeState(GameData.getNextState(_loc_4));
                        return;
                    }
                }
                _loc_3++;
            }
            return;
        }// end function

        private function prepareView(param1:MovieClip) : void
        {
            var _loc_2:* = GameData.levelsCompleted;
            param1.m_totalScore.m_text.text = GameData.totalScore.toString();
            prepareLevelsList(param1.m_buttonsPanel);
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_2:DisplayObject = null;
            SoundManager.playLoop(SoundConst.MAIN_MENU_MUSIC);
            if (m_isSecondPart)
            {
                GameData.onEnterSelectLevelScreen(GameData.SCREEN_25_48);
            }
            else
            {
                GameData.onEnterSelectLevelScreen(GameData.SCREEN_1_24);
            }
            m_view = new SelectLevelStateView();
            prepareView(m_view);
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_buttonAchievements.addEventListener(MouseEvent.CLICK, onAchievementsClick);
            if (GameData.levelsCompleted >= 48)
            {
                m_view.m_arrowUp.addEventListener(MouseEvent.CLICK, onArrowUpClick);
            }
            else
            {
                m_view.m_arrowUp.visible = false;
            }
            m_view.m_arrowRight.addEventListener(MouseEvent.CLICK, onArrowRightClick);
            addChild(m_view);
            m_view.addChild(new MoreGamesPanel(LinksManager.SELECT_LEVEL_SCREEN));
            m_view.m_buttonSubmit.addEventListener(MouseEvent.CLICK, onSubmitClick);
            if (!GameData.canSubmitScore())
            {
                m_view.m_buttonSubmit.visible = false;
            }
            var _loc_1:int = 0;
            while (_loc_1 < m_view.numChildren)
            {
                
                _loc_2 = m_view.getChildAt(_loc_1);
                if (_loc_2 is Cloud)
                {
                    m_mapObjects.push(_loc_2 as Cloud);
                }
                _loc_1++;
            }
            return;
        }// end function

        private function onSubmitClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().pushState(new SubmitScoreState());
            return;
        }// end function

        override public function getViewClip() : DisplayObject
        {
            var _loc_1:SelectLevelStateView = null;
            var _loc_2:int = 0;
            var _loc_3:DisplayObject = null;
            _loc_1 = new SelectLevelStateView();
            prepareView(_loc_1);
            if (m_view)
            {
                _loc_2 = 0;
                while (_loc_2 < m_view.numChildren)
                {
                    
                    _loc_3 = m_view.getChildAt(_loc_2);
                    if (_loc_3 is Cloud)
                    {
                        _loc_1.getChildAt(_loc_2).x = _loc_3.x;
                        _loc_1.getChildAt(_loc_2).y = _loc_3.y;
                    }
                    _loc_2++;
                }
            }
            if (!GameData.canSubmitScore())
            {
                _loc_1.m_buttonSubmit.visible = false;
            }
            _loc_1.addChild(new MoreGamesPanel(LinksManager.NO_SCREEN));
            return _loc_1;
        }// end function

        private function onArrowRightClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            m_isSecondPart = !m_isSecondPart;
            prepareLevelsList(m_view.m_buttonsPanel);
            if (m_isSecondPart)
            {
                GameData.onEnterSelectLevelScreen(GameData.SCREEN_25_48);
            }
            else
            {
                GameData.onEnterSelectLevelScreen(GameData.SCREEN_1_24);
            }
            return;
        }// end function

        private function onMenuClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(new MainMenuState());
            return;
        }// end function

        private function prepareLevelsList(param1:MovieClip) : void
        {
            var _loc_3:SelectLevelButton = null;
            var _loc_4:int = 0;
            var _loc_2:int = 0;
            while (_loc_2 < 24)
            {
                
                _loc_3 = param1.getChildByName("m_level" + _loc_2) as SelectLevelButton;
                _loc_4 = _loc_2;
                if (m_isSecondPart)
                {
                    _loc_4 = _loc_4 + 24;
                }
                if (_loc_4 <= GameData.levelsCompleted)
                {
                    _loc_3.setText(((_loc_4 + 1)).toString());
                }
                else
                {
                    _loc_3.unenable();
                }
                if (GameData.isLevelWithStar(_loc_4))
                {
                    _loc_3.showStar();
                }
                else
                {
                    _loc_3.hideStar();
                }
                _loc_2++;
            }
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_arrowUp.removeEventListener(MouseEvent.CLICK, onArrowUpClick);
            m_view.m_arrowRight.removeEventListener(MouseEvent.CLICK, onArrowRightClick);
            m_view.m_buttonAchievements.removeEventListener(MouseEvent.CLICK, onAchievementsClick);
            m_view.m_buttonSubmit.removeEventListener(MouseEvent.CLICK, onSubmitClick);
            m_mapObjects = null;
            super.onCleanup();
            return;
        }// end function

    }
}
