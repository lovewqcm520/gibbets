package Main
{
    import flash.events.*;
    import flash.utils.*;

    public class FPSCounter extends Object
    {
        private var m_timer:Timer;
        private var m_fps:int = 0;
        private var m_framesFromLastSecond:int = 0;

        public function FPSCounter()
        {
            m_timer = new Timer(1000);
            m_timer.addEventListener(TimerEvent.TIMER, onTick);
            m_timer.start();
            return;
        }// end function

        public function getFPS() : int
        {
            return m_fps;
        }// end function

        public function onTick(event:TimerEvent) : void
        {
            m_fps = m_framesFromLastSecond;
            m_framesFromLastSecond = 0;
            return;
        }// end function

        public function addFrame() : void
        {
            var _loc_2:* = m_framesFromLastSecond + 1;
            m_framesFromLastSecond = _loc_2;
            return;
        }// end function

    }
}
