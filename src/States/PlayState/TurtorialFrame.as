package States.PlayState
{
    import flash.display.*;
    import flash.events.*;

    public class TurtorialFrame extends MovieClip
    {
        private var m_endScale:Number = 1;
        private var m_finished:Boolean = false;
        private var m_clickSign:MovieClip;
        private var m_isShow:Boolean = true;
        private var m_startScale:Number = 9;
        private const m_maxShowTime:Number = 0.5;
        private const m_maxHideTime:Number = 0.2;
        private var m_needToHide:Boolean = false;
        private var m_liveTime:Number = 0;
        private var m_textClip:DisplayObject;
        private var m_checkBox:HideTipsPanel;

        public function TurtorialFrame(param1:Number, param2:DisplayObject) : void
        {
            this.buttonMode = true;
            (param2 as MovieClip).buttonMode = true;
            m_endScale = param1 / 80;
            m_textClip = param2;
            update(0);
            return;
        }// end function

        public function isShow() : Boolean
        {
            return m_isShow;
        }// end function

        public function update(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            m_liveTime = m_liveTime + param1;
            if (m_clickSign)
            {
                m_clickSign.scaleX = Math.sin(m_liveTime * 6) * 0.03 + 1;
                m_clickSign.scaleY = Math.sin(m_liveTime * 6) * 0.03 + 1;
            }
            if (!m_finished)
            {
                if (m_isShow)
                {
                    _loc_2 = m_liveTime / m_maxShowTime;
                    if (_loc_2 > 1)
                    {
                        m_finished = true;
                        _loc_2 = 1;
                    }
                    alpha = 0.6 * _loc_2;
                    if (m_clickSign)
                    {
                        m_clickSign.scaleX = _loc_2;
                        m_clickSign.scaleY = _loc_2;
                    }
                    if (m_textClip)
                    {
                        m_textClip.alpha = _loc_2;
                    }
                    if (m_checkBox)
                    {
                        m_checkBox.alpha = _loc_2;
                    }
                    scaleX = m_startScale + (m_endScale - m_startScale) * _loc_2;
                    scaleY = scaleX;
                }
                else
                {
                    _loc_2 = m_liveTime / m_maxHideTime;
                    if (_loc_2 > 1)
                    {
                        m_finished = true;
                        _loc_2 = 1;
                        this.visible = false;
                    }
                    alpha = 0.6 * (1 - _loc_2);
                    scaleX = m_endScale + 2 * _loc_2;
                    scaleY = scaleX;
                    if (m_clickSign)
                    {
                        m_clickSign.alpha = 1 - _loc_2;
                    }
                    if (m_textClip)
                    {
                        m_textClip.alpha = 1 - _loc_2;
                    }
                    if (m_checkBox)
                    {
                        m_checkBox.alpha = 1 - _loc_2;
                    }
                }
            }
            return;
        }// end function

        public function hide() : void
        {
            m_liveTime = 0;
            m_isShow = false;
            m_finished = false;
            return;
        }// end function

        public function isNeedToHide() : Boolean
        {
            return m_needToHide;
        }// end function

        public function getCheckBox() : HideTipsPanel
        {
            return m_checkBox;
        }// end function

        public function getTextClip() : DisplayObject
        {
            return m_textClip;
        }// end function

        public function setClickSign(param1:MovieClip) : void
        {
            m_clickSign = param1;
            m_clickSign.scaleX = 0;
            m_clickSign.scaleY = 0;
            return;
        }// end function

        public function setCheckBox(param1:HideTipsPanel) : void
        {
            m_checkBox = param1;
            m_checkBox.alpha = 0;
            param1.m_checkBox.addEventListener(CheckBox.EVENT_CHANGE, onCheckBoxChange);
            return;
        }// end function

        public function getClickSign() : MovieClip
        {
            return m_clickSign;
        }// end function

        private function onCheckBoxChange(event:Event) : void
        {
            var _loc_2:* = event.target as CheckBox;
            SoundManager.play(SoundConst.CLICK);
            m_needToHide = _loc_2.isChecked();
            return;
        }// end function

        public function isFinished() : Boolean
        {
            return m_finished;
        }// end function

    }
}
