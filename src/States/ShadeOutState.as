package States
{
    import Main.*;

    public class ShadeOutState extends GameState
    {
        private var m_shader:OutShader;

        public function ShadeOutState()
        {
            return;
        }// end function

        override public function onPreInit() : void
        {
            m_shader = new OutShader(0.3, 1);
            addChild(m_shader);
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_shader = null;
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_shader.update(param1);
            if (m_shader.isMaxTime())
            {
                StateManager.getInstance().popState();
            }
            return;
        }// end function

        override public function onInit() : void
        {
            m_shader.restart();
            return;
        }// end function

    }
}
