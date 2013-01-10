package 
{
    import flash.display.*;
    import flash.events.*;

    public class CheckBox extends MovieClip
    {
        private var m_isChecked:Boolean = false;
        public static const EVENT_CHANGE:String = "checkChange";

        public function CheckBox()
        {
            buttonMode = true;
            stop();
            addEventListener(MouseEvent.CLICK, onClick);
            addEventListener(Event.REMOVED_FROM_STAGE, handleRemoveFromStage);
            return;
        }// end function

        public function setChecked(param1:Boolean) : void
        {
            m_isChecked = param1;
            if (m_isChecked)
            {
                gotoAndStop(2);
            }
            else
            {
                gotoAndStop(1);
            }
            return;
        }// end function

        public function handleRemoveFromStage(event:Event) : void
        {
            removeEventListener(MouseEvent.CLICK, onClick);
            removeEventListener(Event.REMOVED_FROM_STAGE, handleRemoveFromStage);
            return;
        }// end function

        private function onClick(event:MouseEvent) : void
        {
            setChecked(!m_isChecked);
            dispatchEvent(new Event(EVENT_CHANGE));
            return;
        }// end function

        public function isChecked() : Boolean
        {
            return m_isChecked;
        }// end function

    }
}
