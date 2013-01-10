package 
{
    import flash.display.*;
    import flash.events.*;

    public class Achievement extends MovieClip
    {
        private var m_hint:Hint = null;

        public function Achievement()
        {
            buttonMode = true;
            addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
            addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            addEventListener(Event.ENTER_FRAME, update);
            addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
            return;
        }// end function

        private function onRemoveFromStage(event:Event) : void
        {
            removeEventListener(Event.ADDED_TO_STAGE, onRemoveFromStage);
            removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
            removeEventListener(Event.ENTER_FRAME, update);
            removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
            return;
        }// end function

        private function onMouseMove(event:MouseEvent) : void
        {
            if (m_hint)
            {
                m_hint.x = event.stageX;
                m_hint.y = event.stageY;
            }
            return;
        }// end function

        public function setHint(param1:Hint) : void
        {
            m_hint = param1;
            m_hint.x = x;
            m_hint.y = y;
            return;
        }// end function

        private function update(event:Event) : void
        {
            if (m_hint)
            {
                m_hint.update();
            }
            return;
        }// end function

        private function onMouseOver(event:MouseEvent) : void
        {
            if (m_hint)
            {
                m_hint.show();
            }
            return;
        }// end function

        private function onMouseOut(event:MouseEvent) : void
        {
            if (m_hint)
            {
                m_hint.hide();
            }
            return;
        }// end function

    }
}
