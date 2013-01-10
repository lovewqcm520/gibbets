package 
{
    import flash.display.*;
    import flash.events.*;

    public class ScrollBar extends MovieClip
    {
        private var m_isMouseDown:Boolean = false;
        private var m_maxWidth:Number;
        public var m_slider:MovieClip;
        private var m_progress:Number;
        public static const EVENT_CHANGE:String = "eventChange";

        public function ScrollBar()
        {
            buttonMode = true;
            mouseChildren = false;
            addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
            addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
            addEventListener(Event.ADDED_TO_STAGE, handleAddToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, handleRemoveFromStage);
            m_maxWidth = width;
            return;
        }// end function

        public function getProgress() : Number
        {
            return m_progress;
        }// end function

        public function setProgress(param1:Number) : void
        {
            if (param1 < 0)
            {
                param1 = 0;
            }
            if (param1 > 1)
            {
                param1 = 1;
            }
            m_progress = param1;
            m_slider.x = m_maxWidth * m_progress;
            return;
        }// end function

        private function handleRemoveFromStage(event:Event) : void
        {
            removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
            removeEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
            removeEventListener(Event.ADDED_TO_STAGE, handleAddToStage);
            removeEventListener(Event.REMOVED_FROM_STAGE, handleRemoveFromStage);
            stage.removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
            return;
        }// end function

        private function handleAddToStage(event:Event) : void
        {
            stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
            return;
        }// end function

        private function handleMouseDown(event:MouseEvent) : void
        {
            m_isMouseDown = true;
            handleMouseMove(event);
            return;
        }// end function

        private function handleMouseMove(event:MouseEvent) : void
        {
            if (m_isMouseDown)
            {
                setProgress(event.localX / m_maxWidth);
                dispatchEvent(new Event(EVENT_CHANGE));
            }
            return;
        }// end function

        private function handleMouseUp(event:MouseEvent) : void
        {
            m_isMouseDown = false;
            return;
        }// end function

    }
}
