package Main
{
    import States.*;
    import flash.display.*;
    import flash.events.*;
    import flash.ui.*;
    import flash.utils.*;

    public class StateManager extends MovieClip
    {
        private var m_lastState:GameState = null;
        private var m_states:Array;
        public var m_preloaderClip:CurrentPreloaderState;
        public var hsloader:MovieClip;
        private var m_currentTime:int;
        private var m_fpsCounter:FPSCounter;
        private var m_seconds:int = 0;
        private var m_timer:Timer;
        private var m_overlay:DisplayObject = null;
        private static var m_instance:StateManager = null;

        public function StateManager()
        {
            m_states = new Array();
            m_fpsCounter = new FPSCounter();
            m_timer = new Timer(1000);
            m_currentTime = getTimer();
            addFrameScript(0, frame1);
            m_instance = this;
            stop();
            addEventListener(Event.ENTER_FRAME, update);
            stage.addEventListener(MouseEvent.CLICK, handleMouseClick);
            stage.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
            stage.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
            stage.addEventListener(MouseEvent.MOUSE_MOVE, handleMouseMove);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
            stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
            m_timer.addEventListener(TimerEvent.TIMER, onTimer);
            m_timer.start();
            pushState(m_preloaderClip);
            customizeContextMenu();
            return;
        }// end function

        private function onKey(event:KeyboardEvent) : void
        {
            if (m_states.length != 0)
            {
                m_states[(m_states.length - 1)].handleKeyDown(event);
            }
            return;
        }// end function

        public function changeState(param1:GameState) : void
        {
            if (m_states.length != 0)
            {
                m_lastState = m_states[(m_states.length - 1)];
            }
            while (m_states.length != 0)
            {
                
                popState();
            }
            pushState(param1);
            return;
        }// end function

        private function goNotdoppler(event:ContextMenuEvent) : void
        {
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, "");
            return;
        }// end function

        public function popState() : void
        {
            if (m_states.length != 0)
            {
                m_lastState = m_states[(m_states.length - 1)];
                m_lastState.onCleanup();
                m_states.pop();
                removeChild(m_lastState);
                if (m_states.length != 0)
                {
                    m_states[(m_states.length - 1)].onResume();
                }
            }
            onStateChanging();
            return;
        }// end function

        public function haveOverlay() : Boolean
        {
            return m_overlay != null;
        }// end function

        private function handleMouseMove(event:MouseEvent) : void
        {
            if (m_states.length != 0)
            {
                m_states[(m_states.length - 1)].handleMouseMove(event);
            }
            return;
        }// end function

        public function hitTestOverlays(param1:Number, param2:Number) : Boolean
        {
            return m_overlay && m_overlay.hitTestPoint(param1, param2, true);
        }// end function

        public function getSeconds() : int
        {
            return m_seconds;
        }// end function

        public function setOverlay(param1:DisplayObject) : void
        {
            if (param1)
            {
                m_overlay = param1;
                addChild(m_overlay);
            }
            else
            {
                trace(new Error().getStackTrace());
            }
            return;
        }// end function

        public function pushState(param1:GameState) : void
        {
            if (m_states.length != 0)
            {
                m_lastState = m_states[(m_states.length - 1)];
                m_lastState.onStop();
            }
            else
            {
                m_lastState = param1;
            }
            m_states.push(param1);
            addChild(param1);
            param1.InternalInit();
            onStateChanging();
            return;
        }// end function

        private function handleMouseUp(event:MouseEvent) : void
        {
            if (m_states.length != 0)
            {
                m_states[(m_states.length - 1)].handleMouseUp(event);
            }
            return;
        }// end function

        private function handleKeyUp(event:KeyboardEvent) : void
        {
            if (m_states.length != 0)
            {
                m_states[(m_states.length - 1)].handleKeyUp(event);
            }
            return;
        }// end function

        private function handleMouseDown(event:MouseEvent) : void
        {
            if (m_states.length != 0)
            {
                m_states[(m_states.length - 1)].handleMouseDown(event);
            }
            return;
        }// end function

        private function update(event:Event) : void
        {
            var _loc_3:GameState = null;
            var _loc_2:* = 1 / stage.frameRate;
            if (m_states.length != 0)
            {
                m_states[(m_states.length - 1)].internalUpdate(_loc_2);
            }
            for each (_loc_3 in m_states)
            {
                
                _loc_3.internalForsedUpdate(_loc_2);
            }
            m_fpsCounter.addFrame();
            SoundManager.update(_loc_2);
            return;
        }// end function

        function frame1()
        {
            MochiBot.track(this, "bb4d2594");
            return;
        }// end function

        private function customizeContextMenu() : void
        {
            var _loc_1:* = new ContextMenu();
            _loc_1.hideBuiltInItems();
            var _loc_2:* = _loc_1.builtInItems;
            _loc_2.print = true;
            _loc_2.quality = true;
            _loc_1.builtInItems = _loc_2;
            var _loc_3:* = new ContextMenuItem("More games", false);
            _loc_3.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, goNotdoppler);
            var _loc_4:* = new ContextMenuItem("www.notdoppler.com", false);
            new ContextMenuItem("www.notdoppler.com", false).addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, goNotdoppler);
            _loc_1.customItems = [_loc_3, _loc_4];
            contextMenu = _loc_1;
            return;
        }// end function

        public function getLastState() : GameState
        {
            return m_lastState;
        }// end function

        private function handleMouseClick(event:MouseEvent) : void
        {
            if (m_states.length != 0)
            {
                m_states[(m_states.length - 1)].handleMouseClick(event);
            }
            return;
        }// end function

        public function getFPS() : Number
        {
            return m_fpsCounter.getFPS();
        }// end function

        private function onTimer(event:TimerEvent) : void
        {
            var _loc_3:* = m_seconds + 1;
            m_seconds = _loc_3;
            return;
        }// end function

        public function coolChangeState(param1:GameState) : void
        {
            var _loc_2:* = new ShadeInState();
            pushState(_loc_2);
            _loc_2.setNextState(param1);
            return;
        }// end function

        public function getTopState() : GameState
        {
            return m_states[(m_states.length - 1)];
        }// end function

        private function onStateChanging() : void
        {
            if (m_overlay != null)
            {
                addChild(m_overlay);
            }
            return;
        }// end function

        public static function getInstance() : StateManager
        {
            return m_instance;
        }// end function

    }
}
