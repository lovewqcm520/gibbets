package 
{
    import flash.display.*;
    import flash.events.*;

    public class SoundButton extends MovieClip
    {
        private var m_isSoundOn:Boolean = false;
        private var m_sound:DisplayObject = null;

        public function SoundButton()
        {
            onSoundClick(null);
            return;
        }// end function

        private function onSoundClick(event:MouseEvent) : void
        {
            m_isSoundOn = !m_isSoundOn;
            if (m_sound)
            {
                m_sound.removeEventListener(MouseEvent.CLICK, onSoundClick);
                removeChild(m_sound);
            }
            if (m_isSoundOn)
            {
                m_sound = new SoundOn();
            }
            else
            {
                m_sound = new SoundOff();
            }
            m_sound.x = 640 - 40;
            m_sound.y = 20;
            addChild(m_sound);
            m_sound.addEventListener(MouseEvent.CLICK, onSoundClick);
            SoundManager.setSoundEnable(m_isSoundOn);
            return;
        }// end function

    }
}
