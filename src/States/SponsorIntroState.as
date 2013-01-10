package States
{
    import Main.*;
    import flash.display.*;
    import flash.events.*;
    import flash.media.*;

    public class SponsorIntroState extends GameState
    {
        private var m_introClip:MovieClip;
        private var m_introButton:SimpleButton;
        private var m_sound:SoundChannel;

        public function SponsorIntroState()
        {
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_introButton.removeEventListener(MouseEvent.CLICK, onIntroClick);
            try
            {
                m_sound.stop();
            }
            catch (e:Error)
            {
                trace(e, e.getStackTrace());
            }
            sound_button = new SoundButton();
            StateManager.getInstance().setOverlay(sound_button);
            m_introClip = null;
            m_sound = null;
            m_introButton = null;
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            if (m_introClip.currentFrame == m_introClip.totalFrames)
            {
                StateManager.getInstance().changeState(new MainMenuState());
            }
            return;
        }// end function

        private function onIntroClick(event:MouseEvent) : void
        {
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.INTRO_SCREEN_BUTTON);
            return;
        }// end function

        override public function onInit() : void
        {
            var sound:Sound;
            m_introClip = new SponsorIntro();
            m_introButton = new IntroButton();
            m_introButton.addEventListener(MouseEvent.CLICK, onIntroClick);
            addChild(m_introClip);
            addChild(m_introButton);
            try
            {
                sound = new SponsorMusic();
                m_sound = sound.play();
            }
            catch (e:Error)
            {
                trace(e, e.getStackTrace());
            }
            return;
        }// end function

    }
}
