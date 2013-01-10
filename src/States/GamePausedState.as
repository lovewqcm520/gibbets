package States
{
    import Main.*;
    import flash.events.*;

    public class GamePausedState extends GameState
    {

        public function GamePausedState()
        {
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_view.m_clickToContinue.scaleX = Math.sin(m_liveTime * 6) * 0.03 + 1;
            m_view.m_clickToContinue.scaleY = Math.sin(m_liveTime * 6) * 0.03 + 1;
            return;
        }// end function

        override public function handleMouseDown(event:MouseEvent) : void
        {
            StateManager.getInstance().popState();
            return;
        }// end function

        override public function onInit() : void
        {
            m_view = new GamePausedStateView();
            addChild(m_view);
            m_view.buttonMode = true;
            return;
        }// end function

    }
}
