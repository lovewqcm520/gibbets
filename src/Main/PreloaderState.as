package Main
{
    import flash.display.*;
    import flash.events.*;

    public class PreloaderState extends GameState
    {
        protected var m_scene:MovieClip;
        private var m_minimalLoadTime:Number = 50;
        private var m_isEnded:Boolean = false;
        protected var m_bytesTotal:Number = 100;
        private var m_isLoadingFinished:Boolean = false;
        protected var m_loaderInfo:LoaderInfo = null;
        private var m_percent:Number = 0;
        protected var m_bytesLoaded:Number = 100;

        public function PreloaderState()
        {
            return;
        }// end function

        private function onLoadComplete(event:Event) : void
        {
            m_loaderInfo.removeEventListener(ProgressEvent.PROGRESS, onLoadProgress);
            m_loaderInfo.removeEventListener(Event.COMPLETE, onLoadComplete);
            m_isLoadingFinished = true;
            return;
        }// end function

        override public function onInit() : void
        {
            m_scene = StateManager.getInstance();
            m_loaderInfo = StateManager.getInstance().loaderInfo;
            if (m_loaderInfo.bytesLoaded >= m_loaderInfo.bytesTotal)
            {
                m_isLoadingFinished = true;
            }
            else
            {
                m_loaderInfo.addEventListener(ProgressEvent.PROGRESS, onLoadProgress);
                m_loaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
            }
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            if (!m_isEnded)
            {
                m_percent = Math.min(m_bytesLoaded / m_bytesTotal, m_liveTime / m_minimalLoadTime);
                if (m_isLoadingFinished && m_liveTime >= m_minimalLoadTime)
                {
                    StateManager.getInstance().gotoAndStop(2);
                    onFinishLoading();
                    m_isEnded = true;
                }
            }
            return;
        }// end function

        public function onFinishLoading() : void
        {
            return;
        }// end function

        public function getPercent() : Number
        {
            return m_percent;
        }// end function

        public function setMinimalLoadTime(param1:Number) : void
        {
            m_minimalLoadTime = param1;
            return;
        }// end function

        private function onLoadProgress(event:ProgressEvent) : void
        {
            m_bytesTotal = event.bytesTotal;
            m_bytesLoaded = event.bytesLoaded;
            return;
        }// end function

    }
}
