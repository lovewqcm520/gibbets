package States
{
    import CPMStar.*;
    import Main.*;
    import States.PlayState.*;
    import flash.display.*;
    import flash.events.*;

    public class SelectSecretLevelState extends GameState
    {
        private var m_mapObjects:Array;

        public function SelectSecretLevelState()
        {
            m_mapObjects = new Array();
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
            if (GameData.haveAds() && m_liveTime > 0.5)
            {
                if (m_view.m_adBox.x < 150)
                {
                    m_view.m_adBox.x = m_view.m_adBox.x + 1600 * param1;
                    m_view.m_closeButton.x = m_view.m_closeButton.x + 1600 * param1;
                }
            }
            return;
        }// end function

        private function onMenuClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(new MainMenuState());
            return;
        }// end function

        override public function getViewClip() : DisplayObject
        {
            var _loc_2:int = 0;
            var _loc_3:DisplayObject = null;
            var _loc_1:* = new SelectSecretLevelStateView();
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
            _loc_1.addChild(new MoreGamesPanel(LinksManager.NO_SCREEN));
            if (!GameData.canSubmitScore())
            {
                _loc_1.m_buttonSubmit.visible = false;
            }
            return _loc_1;
        }// end function

        private function prepareView(param1:MovieClip) : void
        {
            var _loc_4:SelectLevelButton = null;
            param1.m_totalScore.m_text.text = GameData.totalScore.toString();
            var _loc_2:* = GameData.levelsCompleted;
            var _loc_3:int = 48;
            while (_loc_3 < 48 + 5)
            {
                
                _loc_4 = param1["m_level" + _loc_3];
                if (_loc_3 <= _loc_2)
                {
                    _loc_4.setText(((_loc_3 + 1)).toString());
                    if (GameData.isLevelWithStar(_loc_3))
                    {
                        _loc_4.showStar();
                    }
                }
                else
                {
                    _loc_4.unenable();
                }
                _loc_3++;
            }
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_2:DisplayObject = null;
            SoundManager.playLoop(SoundConst.MAIN_MENU_MUSIC);
            GameData.onEnterSelectLevelScreen(GameData.SCREEN_49_54);
            m_view = new SelectSecretLevelStateView();
            addChild(m_view);
            prepareView(m_view);
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_arrowDown.addEventListener(MouseEvent.CLICK, onArrowDownClick);
            m_view.m_buttonAchievements.addEventListener(MouseEvent.CLICK, onAchievementsClick);
            m_view.m_buttonSubmit.addEventListener(MouseEvent.CLICK, onSubmitClick);
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
            m_view.addChild(new MoreGamesPanel(LinksManager.SELECT_SECRET_LEVEL_SCREEN));
            if (GameData.haveAds())
            {
                showAds();
            }
            if (!GameData.canSubmitScore())
            {
                m_view.m_buttonSubmit.visible = false;
            }
            return;
        }// end function

        private function onSubmitClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().pushState(new SubmitScoreState());
            return;
        }// end function

        override public function handleMouseClick(event:MouseEvent) : void
        {
            var _loc_4:int = 0;
            var _loc_2:* = GameData.levelsCompleted;
            var _loc_3:int = 0;
            while (_loc_3 < 5)
            {
                
                _loc_4 = _loc_3 + 48;
                if (m_view.getChildByName("m_level" + _loc_4).hitTestPoint(event.stageX, event.stageY))
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

        private function showAds() : void
        {
            var ad:DisplayObject;
            try
            {
                ad = new AdLoader(Constant.CPMSTAR_INTER_LEVEL_CODE);
                m_view.m_adBox.addChild(ad);
                m_view.m_closeButton.addEventListener(MouseEvent.CLICK, onCloseClick);
            }
            catch (e:Error)
            {
                trace("CPMstar error!", e);
            }
            return;
        }// end function

        private function onCloseClick(event:MouseEvent) : void
        {
            m_view.m_adBox.visible = false;
            m_view.m_closeButton.visible = false;
            return;
        }// end function

        private function onArrowDownClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().changeState(new LeftToRightMoveTransactionState(this, new SelectLevelState(true), LeftToRightMoveTransactionState.DOWN_TO_TOP_TRANSACTION, 1));
            return;
        }// end function

        override public function onCleanup() : void
        {
            try
            {
                m_view.m_buttonSubmit.removeEventListener(MouseEvent.CLICK, onSubmitClick);
                m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onMenuClick);
                m_view.m_arrowDown.removeEventListener(MouseEvent.CLICK, onArrowDownClick);
                m_view.m_buttonAchievements.removeEventListener(MouseEvent.CLICK, onAchievementsClick);
                m_view.m_closeButton.removeEventListener(MouseEvent.CLICK, onCloseClick);
                m_mapObjects = null;
                super.onCleanup();
            }
            catch (e:Error)
            {
                trace(e, e.getStackTrace());
            }
            return;
        }// end function

    }
}
