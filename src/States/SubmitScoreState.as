package States
{
    import Main.*;
    import flash.display.*;
    import flash.events.*;

    public class SubmitScoreState extends GameState
    {
        private var m_closeCross:SimpleButton;
        private const HIDE:int = 4;
        private var hs_game:String = "gibbets2";
        private var m_shader:Shader;
        private var hs_view:Number = 2;
        private var hs_URL:String = "http://www.notdoppler.com/gibbets2-highscores.asd?ref=gibbets2&game=gibbets2";
        private const SHOW:int = 0;
        private var hs_score:Number;
        private var m_state:int;

        public function SubmitScoreState()
        {
            m_shader = new Shader(0.6, 1.2, 0, 0.5);
            m_state = SHOW;
            hs_score = GameData.totalScore;
            m_closeCross = new CloseCross();
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_closeCross.removeEventListener(MouseEvent.CLICK, onCloseClick);
            removeChild(m_shader);
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_shader.update(param1);
            switch(m_state)
            {
                case HIDE:
                {
                    if (m_shader.getShade() <= 0)
                    {
                        StateManager.getInstance().popState();
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override public function onInit() : void
        {
            addChild(m_shader);
            addChild(StateManager.getInstance().hsloader);
            StateManager.getInstance().hsloader.loadHighscores(hs_game, hs_score, hs_view, hs_URL);
            addChild(m_closeCross);
            m_closeCross.x = 479;
            m_closeCross.y = 160;
            m_closeCross.addEventListener(MouseEvent.CLICK, onCloseClick);
            return;
        }// end function

        private function onCloseClick(event:MouseEvent) : void
        {
            removeChild(StateManager.getInstance().hsloader);
            removeChild(m_closeCross);
            removeChild(m_shader);
            m_shader = new Shader(0, 0.25, m_shader.getShade(), 0);
            addChild(m_shader);
            m_state = HIDE;
            return;
        }// end function

    }
}
