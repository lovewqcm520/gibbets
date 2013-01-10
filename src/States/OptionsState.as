package States
{
    import Main.*;
    import flash.events.*;
    import flash.geom.*;

    public class OptionsState extends GameState
    {
        private const STATE_MOVE_DOWN:int = 0;
        private const STATE_MOVE_BACK:int = 3;
        private const m_endPosition:Point;
        private const m_startPosition:Point;
        private const STATE_MOVE_END:int = 2;
        private var m_shader:Shader;
        private const STATE_MOVE_UP:int = 1;
        private var m_state:int = 0;

        public function OptionsState()
        {
            m_shader = new Shader(0.6, 1.2, 0, 0.5);
            m_startPosition = new Point(584, -215);
            m_endPosition = new Point(493, 62);
            return;
        }// end function

        private function onDisableBloodChange(event:Event) : void
        {
            var _loc_2:* = event.target as CheckBox;
            GameData.m_isBloodDisabled = _loc_2.isChecked();
            SoundManager.play(SoundConst.CLICK);
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_view.m_musicVolume.removeEventListener(ScrollBar.EVENT_CHANGE, onMusicVolumeChange);
            m_view.m_soundVolume.removeEventListener(ScrollBar.EVENT_CHANGE, onSoundVolumeChange);
            m_view.m_invertControl.removeEventListener(CheckBox.EVENT_CHANGE, onInvertControlChange);
            m_view.m_disableBlood.removeEventListener(CheckBox.EVENT_CHANGE, onDisableBloodChange);
            m_view.m_hideTips.removeEventListener(CheckBox.EVENT_CHANGE, onHideTipsChange);
            m_view.m_buttonOk.removeEventListener(MouseEvent.CLICK, onOkClick);
            m_view.m_buttonReset.removeEventListener(MouseEvent.CLICK, onResetClick);
            m_shader = null;
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
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
                case STATE_MOVE_BACK:
                {
                    var _loc_2:* = m_view.y - param1 * 1300;
                    m_view.y = m_view.y - param1 * 1300;
                    if (_loc_2 < -480)
                    {
                        StateManager.getInstance().popState();
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

        override public function onInit() : void
        {
            m_view = new OptionsStateView();
            addChild(m_shader);
            addChild(m_view);
            m_view.y = -480;
            m_view.m_musicVolume.setProgress(SoundManager.getMusicVolume());
            m_view.m_soundVolume.setProgress(SoundManager.getSoundVolume());
            m_view.m_musicVolume.addEventListener(ScrollBar.EVENT_CHANGE, onMusicVolumeChange);
            m_view.m_soundVolume.addEventListener(ScrollBar.EVENT_CHANGE, onSoundVolumeChange);
            m_view.m_invertControl.setChecked(GameData.m_invertedControl);
            m_view.m_invertControl.addEventListener(CheckBox.EVENT_CHANGE, onInvertControlChange);
            m_view.m_disableBlood.setChecked(GameData.m_isBloodDisabled);
            m_view.m_disableBlood.addEventListener(CheckBox.EVENT_CHANGE, onDisableBloodChange);
            m_view.m_hideTips.setChecked(!GameData.m_isHintsOn);
            m_view.m_hideTips.addEventListener(CheckBox.EVENT_CHANGE, onHideTipsChange);
            m_view.m_buttonOk.addEventListener(MouseEvent.CLICK, onOkClick);
            m_view.m_buttonReset.addEventListener(MouseEvent.CLICK, onResetClick);
            super.onInit();
            return;
        }// end function

        private function onMusicVolumeChange(event:Event) : void
        {
            SoundManager.setMusicVolume(m_view.m_musicVolume.getProgress());
            return;
        }// end function

        private function onInvertControlChange(event:Event) : void
        {
            var _loc_2:* = event.target as CheckBox;
            GameData.m_invertedControl = _loc_2.isChecked();
            SoundManager.play(SoundConst.CLICK);
            return;
        }// end function

        private function onHideTipsChange(event:Event) : void
        {
            var _loc_2:* = event.target as CheckBox;
            GameData.setHideTips(_loc_2.isChecked());
            SoundManager.play(SoundConst.CLICK);
            return;
        }// end function

        private function onOkClick(event:MouseEvent) : void
        {
            GameData.save();
            SoundManager.play(SoundConst.CLICK);
            m_state = STATE_MOVE_BACK;
            removeChild(m_shader);
            m_shader = new Shader(0, 0.25, m_shader.getShade(), 0);
            addChildAt(m_shader, 0);
            return;
        }// end function

        private function onResetClick(event:MouseEvent) : void
        {
            trace("onResetClick");
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().pushState(new YesNoState());
            return;
        }// end function

        private function onSoundVolumeChange(event:Event) : void
        {
            SoundManager.play(SoundConst.CLICK);
            SoundManager.setSoundVolume(m_view.m_soundVolume.getProgress());
            return;
        }// end function

    }
}
