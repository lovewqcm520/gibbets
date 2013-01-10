package Main
{
    import flash.display.*;
    import flash.events.*;

    public class GameState extends MovieClip
    {
        private var m_isMouseDown:Boolean = false;
        private var m_isInitiliazed:Boolean = false;
        protected var m_liveTime:Number = 0;
        protected var m_forsedLiveTime:Number = 0;
        protected var m_view:MovieClip;

        public function GameState()
        {
            return;
        }// end function

        public function onStop() : void
        {
            return;
        }// end function

        public function onCleanup() : void
        {
            if (m_view)
            {
                while (m_view.numChildren != 0)
                {
                    
                    m_view.removeChildAt(0);
                }
                m_view = null;
            }
            return;
        }// end function

        public function update(param1:Number) : void
        {
            return;
        }// end function

        public function getViewClip() : DisplayObject
        {
            return null;
        }// end function

        public function InternalInit() : void
        {
            if (!m_isInitiliazed)
            {
                m_isInitiliazed = true;
                onPreInit();
            }
            m_liveTime = 0;
            onInit();
            return;
        }// end function

        public function handleMouseMove(event:MouseEvent) : void
        {
            return;
        }// end function

        public function onInit() : void
        {
            return;
        }// end function

        public function handleKeyUp(event:KeyboardEvent) : void
        {
            return;
        }// end function

        public function handleMouseUp(event:MouseEvent) : void
        {
            m_isMouseDown = false;
            return;
        }// end function

        public function forsedUpdate(param1:Number) : void
        {
            return;
        }// end function

        public function handleMouseDown(event:MouseEvent) : void
        {
            m_isMouseDown = true;
            return;
        }// end function

        public function handleKeyDown(event:KeyboardEvent) : void
        {
            return;
        }// end function

        public function isInitiliazed() : Boolean
        {
            return m_isInitiliazed;
        }// end function

        final public function internalUpdate(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            update(param1);
            return;
        }// end function

        public function onResume() : void
        {
            return;
        }// end function

        final public function internalForsedUpdate(param1:Number) : void
        {
            m_forsedLiveTime = m_forsedLiveTime + param1;
            forsedUpdate(param1);
            return;
        }// end function

        public function handleMouseClick(event:MouseEvent) : void
        {
            return;
        }// end function

        public function isMouseDown() : Boolean
        {
            return m_isMouseDown;
        }// end function

        public function onPreInit() : void
        {
            return;
        }// end function

    }
}
