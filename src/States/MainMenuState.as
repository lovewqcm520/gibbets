package States
{
    import Main.*;
    import States.PlayState.*;
    import flash.display.*;
    import flash.events.*;

    public class MainMenuState extends PhysGameState
    {
        private var m_cheat:Array;
        private var m_phylosophyCloud:MovieClip = null;
        private var m_mapObjects:Array;
        private var m_count:int = 1;

        public function MainMenuState()
        {
            m_mapObjects = new Array();
            m_cheat = new Array();
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_mapObjects = null;
            m_cheat = null;
            super.onCleanup();
            return;
        }// end function

        override public function handleMouseClick(event:MouseEvent) : void
        {
            var right_anim:MovieClip;
            var left_anim:MovieClip;
            var e:* = event;
            try
            {
                right_anim = m_view.m_rightButtonsPanel;
                left_anim = m_view.m_leftButtonsPanel;
                if (right_anim.getChildByName("m_buttonPlay").hitTestPoint(e.stageX, e.stageY, true))
                {
                    SoundManager.play(SoundConst.CLICK);
                    StateManager.getInstance().coolChangeState(GameData.getSelectLevelScreen());
                }
                else if (right_anim.getChildByName("m_buttonOptions").hitTestPoint(e.stageX, e.stageY, true))
                {
                    SoundManager.play(SoundConst.CLICK);
                    StateManager.getInstance().pushState(new OptionsState());
                }
                else if (right_anim.getChildByName("m_buttonCredits").hitTestPoint(e.stageX, e.stageY, true))
                {
                    SoundManager.play(SoundConst.CLICK);
                    StateManager.getInstance().coolChangeState(new CreditsState());
                }
                else if (left_anim.getChildByName("m_buttonHighScores").hitTestPoint(e.stageX, e.stageY, true))
                {
                    SoundManager.play(SoundConst.CLICK);
                    LinksManager.goURL(LinksManager.HIGH_SCORE_URL, "");
                }
                else if (m_view.m_notdoppler.hitTestPoint(e.stageX, e.stageY, true))
                {
                    SoundManager.play(SoundConst.CLICK);
                    LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.MAIN_MENU_NOTDOPPLER_BUTTON);
                }
                else if (left_anim.getChildByName("m_buttonMoreGames").hitTestPoint(e.stageX, e.stageY, true))
                {
                    SoundManager.play(SoundConst.CLICK);
                    LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.MAIN_MENU_MORE_GAMES_BUTTON);
                }
                else if (left_anim.getChildByName("m_buttonGibbetsI").hitTestPoint(e.stageX, e.stageY, true))
                {
                    SoundManager.play(SoundConst.CLICK);
                    LinksManager.goURL(LinksManager.GIBBETS_I_URL, LinksManager.MAIN_MENU_GIBBETS_I_BUTTON);
                }
            }
            catch (e:Error)
            {
                trace("error here", e, e.getStackTrace());
            }
            if (e.target == m_view.m_vulture)
            {
                var _loc_4:* = m_count + 1;
                m_count = _loc_4;
                if (m_count % 10 == 0)
                {
                    if (m_phylosophyCloud)
                    {
                        m_view.removeChild(m_phylosophyCloud);
                    }
                    switch(m_count / 10 % 3)
                    {
                        case 0:
                        {
                            m_phylosophyCloud = new MainMenuCloud1();
                            break;
                        }
                        case 1:
                        {
                            m_phylosophyCloud = new MainMenuCloud2();
                            break;
                        }
                        case 2:
                        {
                            m_phylosophyCloud = new MainMenuCloud3();
                            break;
                        }
                        default:
                        {
                            break;
                        }
                    }
                    m_view.addChild(m_phylosophyCloud);
                    m_phylosophyCloud.x = m_view.m_comixCloud.x;
                    m_phylosophyCloud.y = m_view.m_comixCloud.y;
                    SoundManager.play(SoundConst.VULTURE_CRY_4);
                }
            }
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_2:DisplayObject = null;
            super.onInit();
            m_view = new MainMenuStateView();
            addChild(m_view);
            m_view.m_vulture.buttonMode = true;
            m_view.m_comixCloud.visible = false;
            if (!StateManager.getInstance().haveOverlay())
            {
                StateManager.getInstance().setOverlay(new SoundButton());
            }
            SoundManager.playLoop(SoundConst.MAIN_MENU_MUSIC);
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

        override public function update(param1:Number) : void
        {
            var _loc_2:MapObject = null;
            if (m_view.m_II.currentFrame == 40)
            {
                SoundManager.play(SoundConst.STICK_IN_MAIN_MENU);
            }
            for each (_loc_2 in m_mapObjects)
            {
                
                _loc_2.update(param1);
            }
            return;
        }// end function

        override public function handleKeyDown(event:KeyboardEvent) : void
        {
            var _loc_2:int = 0;
            var _loc_3:String = null;
            m_cheat.push(event.charCode);
            if (m_cheat.length == 5)
            {
                SoundManager.play(SoundConst.VULTURE_CRY_4);
                if (String.fromCharCode(m_cheat[0], m_cheat[1], m_cheat[2], m_cheat[3], m_cheat[4]) == "iddqd")
                {
                    _loc_2 = 0;
                    while (_loc_2 < GameData.totalLevelsCount)
                    {
                        
                        GameData.onWinLevel(_loc_2, 0, false, 0);
                        _loc_2++;
                    }
                    for each (_loc_3 in Achievements.ALL)
                    {
                        
                        GameData.giveAchievement(_loc_3);
                    }
                }
            }
            return;
        }// end function

    }
}
