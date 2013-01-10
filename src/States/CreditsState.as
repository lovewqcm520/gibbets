package States
{
    import Box2D.Common.Math.*;
    import Main.*;
    import Ragdoll.*;
    import States.PlayState.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.utils.*;

    public class CreditsState extends PhysGameState
    {
        private var m_iter:int = 0;
        private var m_mapObjects:Array;
        private var m_progClouds:Array;
        private var m_timer:Timer;
        private var m_progGibbet:Gibbet;

        public function CreditsState()
        {
            m_mapObjects = new Array();
            m_timer = new Timer(4500);
            m_progClouds = [new ProgrammingCloud()];
            return;
        }// end function

        override public function onCleanup() : void
        {
            if (Capabilities.language == "ru")
            {
                m_view.m_blogLink.removeEventListener(MouseEvent.CLICK, onBlogClick);
            }
            else
            {
                m_view.m_mailLink.removeEventListener(MouseEvent.CLICK, onMailClick);
            }
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_notdoppler.removeEventListener(MouseEvent.CLICK, onNotdopplerClick);
            m_timer.stop();
            m_timer.removeEventListener(TimerEvent.TIMER, onTick);
            m_timer = null;
            m_progGibbet = null;
            m_progClouds = null;
            super.onCleanup();
            return;
        }// end function

        private function onBlogClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            navigateToURL(new URLRequest("http://smrdis.ya.ru"), "_blank");
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

        private function onNotdopplerClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.CREDITS_SCREEN_NOTDOPPLER_BUTTON);
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_1:MovieClip = null;
            var _loc_2:Gibbet = null;
            var _loc_3:MovieClip = null;
            var _loc_4:Gibbet = null;
            var _loc_5:MovieClip = null;
            var _loc_6:int = 0;
            var _loc_7:DisplayObject = null;
            m_view = new CreditsStateView();
            addChild(m_view);
            if (Capabilities.language == "ru")
            {
                m_view.m_blogLink.visible = true;
                m_view.m_blogLink.addEventListener(MouseEvent.CLICK, onBlogClick);
                m_view.m_mailLink.visible = false;
            }
            else
            {
                m_view.m_blogLink.visible = false;
                m_view.m_mailLink.visible = true;
                m_view.m_mailLink.addEventListener(MouseEvent.CLICK, onMailClick);
            }
            super.onInit();
            m_view.m_programmingHanger.visible = false;
            m_view.m_artHanger.visible = false;
            m_view.m_musicHanger.visible = false;
            m_progGibbet = new Gibbet(new b2Vec2(m_view.m_programmingHanger.x / m_physScale, m_view.m_programmingHanger.y / m_physScale), HumanRagdoll.HEAD, 6, m_world, 1, false);
            m_progGibbet.makeLookUgly();
            m_view.m_sky.addChild(m_progGibbet);
            m_progGibbet.getRagdoll().applyImpulse(new b2Vec2(-0.2, 0));
            m_mapObjects.push(m_progGibbet);
            for each (_loc_1 in m_progClouds)
            {
                
                m_view.addChild(_loc_1);
            }
            onTick(null);
            _loc_2 = new Gibbet(new b2Vec2(m_view.m_artHanger.x / m_physScale / scaleX, m_view.m_artHanger.y / m_physScale), HumanRagdoll.HEAD, 6, m_world, 2, false);
            _loc_3 = new ArtCloud();
            m_view.addChild(_loc_3);
            _loc_2.setComixCloud(_loc_3);
            _loc_2.showCloudNow();
            _loc_2.makeLookUgly();
            m_view.m_sky.addChild(_loc_2);
            _loc_2.getRagdoll().applyImpulse(new b2Vec2(-0.2, 0));
            m_mapObjects.push(_loc_2);
            _loc_4 = new Gibbet(new b2Vec2(m_view.m_musicHanger.x / m_physScale, m_view.m_musicHanger.y / m_physScale), HumanRagdoll.HEAD, 6, m_world, 4, false);
            _loc_5 = new MusicCloud();
            m_view.addChild(_loc_5);
            _loc_4.setComixCloud(_loc_5);
            _loc_4.showCloudNow();
            _loc_4.makeLookUgly();
            m_view.m_sky.addChild(_loc_4);
            _loc_4.getRagdoll().applyImpulse(new b2Vec2(-0.2, 0));
            m_mapObjects.push(_loc_4);
            _loc_6 = 0;
            while (_loc_6 < m_view.numChildren)
            {
                
                _loc_7 = m_view.getChildAt(_loc_6);
                if (_loc_7 is Cloud)
                {
                    m_mapObjects.push(_loc_7 as Cloud);
                }
                _loc_6++;
            }
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_notdoppler.addEventListener(MouseEvent.CLICK, onNotdopplerClick);
            update(1 / 30);
            m_view.addChild(new MoreGamesPanel(LinksManager.CREDITS_SCREEN));
            m_timer.addEventListener(TimerEvent.TIMER, onTick);
            m_timer.start();
            return;
        }// end function

        private function onMailClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            navigateToURL(new URLRequest("mailto:gibbetsfeedback@gmail.com"), "_blank");
            return;
        }// end function

        private function onMenuClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(new MainMenuState());
            return;
        }// end function

        private function onTick(event:TimerEvent) : void
        {
            var _loc_2:MovieClip = null;
            m_iter = ++m_iter % m_progClouds.length;
            for each (_loc_2 in m_progClouds)
            {
                
                _loc_2.visible = false;
            }
            m_progClouds[m_iter].visible = true;
            m_progGibbet.setComixCloud(m_progClouds[m_iter]);
            m_progGibbet.showCloudNow();
            return;
        }// end function

    }
}
