package 
{
    import Main.*;
    import States.*;
    import flash.display.*;
    import flash.events.*;

    public class MoreGamesPanel extends MovieClip
    {
        public var m_walkthrough:SimpleButton;
        public var m_moreGames:SimpleButton;
        private var m_isNeedPause:Boolean;
        private var m_source:String;

        public function MoreGamesPanel(param1:String, param2:Boolean = false)
        {
            m_isNeedPause = param2;
            m_source = param1;
            m_moreGames.addEventListener(MouseEvent.CLICK, onMoreGamesClick);
            m_walkthrough.addEventListener(MouseEvent.CLICK, onWalkthroughClick);
            addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
            return;
        }// end function

        private function onRemoveFromStage(event:Event) : void
        {
            m_moreGames.removeEventListener(MouseEvent.CLICK, onMoreGamesClick);
            m_walkthrough.removeEventListener(MouseEvent.CLICK, onWalkthroughClick);
            removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
            return;
        }// end function

        private function onWalkthroughClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.WALKROUTGH_URL, m_source);
            if (m_isNeedPause)
            {
                StateManager.getInstance().pushState(new GamePausedState());
            }
            return;
        }// end function

        private function onMoreGamesClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, m_source);
            if (m_isNeedPause)
            {
                StateManager.getInstance().pushState(new GamePausedState());
            }
            return;
        }// end function

    }
}
