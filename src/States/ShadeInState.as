package States
{
    import Main.*;

    public class ShadeInState extends GameState
    {
        private var m_nextState:GameState = null;
        private var m_shader:InShader = null;

        public function ShadeInState()
        {
            return;
        }// end function

        override public function onPreInit() : void
        {
            m_shader = new InShader(0.3, 1);
            addChild(m_shader);
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_shader = null;
            m_nextState = null;
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_shader.update(param1);
            if (m_shader.isMaxTime())
            {
                if (m_nextState != null)
                {
                    StateManager.getInstance().changeState(m_nextState);
                    StateManager.getInstance().pushState(new ShadeOutState());
                }
            }
            return;
        }// end function

        public function setNextState(param1:GameState) : void
        {
            m_nextState = param1;
            return;
        }// end function

        override public function onInit() : void
        {
            m_shader.restart();
            return;
        }// end function

    }
}
