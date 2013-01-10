package States
{
    import Box2D.Common.Math.*;
    import Main.*;
    import Ragdoll.*;
    import States.PlayState.*;
    import flash.display.*;
    import flash.events.*;

    public class GameCompleteState extends PhysGameState
    {
        private var m_mapObjects:Array;

        public function GameCompleteState()
        {
            m_mapObjects = new Array();
            return;
        }// end function

        private function onSubmitClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().pushState(new SubmitScoreState());
            return;
        }// end function

        private function onMenuClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(new MainMenuState());
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_view.m_buttonSubmit.removeEventListener(MouseEvent.CLICK, onSubmitClick);
            m_view.m_notDoppler.removeEventListener(MouseEvent.CLICK, onNotDopplerClick);
            m_view.m_buttonMoreGames.removeEventListener(MouseEvent.CLICK, onMoreGamesClick);
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onMenuClick);
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:MapObject = null;
            super.update(param1);
            for each (_loc_2 in m_mapObjects)
            {
                
                _loc_2.update(param1);
            }
            return;
        }// end function

        private function onMoreGamesClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.GAME_COMPLETE_MORE_GAMES_BUTTON);
            return;
        }// end function

        private function onNotDopplerClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.GAME_COMPLETE_NOTDOPPLER_BUTTON);
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_5:DisplayObject = null;
            super.onInit();
            m_view = new GameCompleteStateView();
            addChild(m_view);
            var _loc_1:int = 0;
            while (_loc_1 < m_view.numChildren)
            {
                
                _loc_5 = m_view.getChildAt(_loc_1);
                if (_loc_5 is Cloud)
                {
                    m_mapObjects.push(_loc_5 as Cloud);
                }
                _loc_1++;
            }
            var _loc_2:* = new MovieClip();
            _loc_2.scaleX = 1.6;
            _loc_2.scaleY = 1.6;
            var _loc_3:* = new Gibbet(new b2Vec2(345 / m_physScale / _loc_2.scaleX, 105 / m_physScale / _loc_2.scaleY), HumanRagdoll.HEAD, 6, m_world, 3, false);
            _loc_3.makeLookUgly();
            var _loc_4:* = new GameCompleteCloud();
            _loc_3.setComixCloud(_loc_4);
            _loc_3.showCloudNow();
            _loc_2.addChild(_loc_3);
            _loc_2.addChild(_loc_4);
            _loc_3.getRagdoll().applyImpulse(new b2Vec2(-0.05, 0));
            m_mapObjects.push(_loc_3);
            m_view.addChild(m_view.m_gibbetFront);
            m_view.addChild(_loc_2);
            m_view.m_notDoppler.addEventListener(MouseEvent.CLICK, onNotDopplerClick);
            m_view.m_buttonMoreGames.addEventListener(MouseEvent.CLICK, onMoreGamesClick);
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_buttonSubmit.addEventListener(MouseEvent.CLICK, onSubmitClick);
            m_view.m_totalScore.m_text.text = GameData.totalScore.toString();
            update(Constant.TIME_STEP);
            SoundManager.playLoop(SoundConst.MAIN_MENU_MUSIC);
            m_view.addChild(new MoreGamesPanel(LinksManager.GAME_COMPLETE_SCREEN));
            if (!GameData.canSubmitScore())
            {
                m_view.m_buttonSubmit.visible = false;
            }
            return;
        }// end function

    }
}
