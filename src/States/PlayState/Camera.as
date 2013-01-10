package States.PlayState
{
    import flash.display.*;

    public class Camera extends Object
    {
        protected var m_guiLayer:Sprite;
        protected var m_stateClip:Sprite;

        public function Camera()
        {
            return;
        }// end function

        public function onShoot(param1:Arrow) : void
        {
            return;
        }// end function

        public function onHangerDead() : void
        {
            return;
        }// end function

        public function update(param1:Number) : void
        {
            return;
        }// end function

        public function onKillArrow() : void
        {
            return;
        }// end function

        public function canShoot() : Boolean
        {
            return true;
        }// end function

        public function setGibbet(param1:Gibbet) : void
        {
            return;
        }// end function

        public function setGUILayer(param1:Sprite) : void
        {
            m_guiLayer = param1;
            return;
        }// end function

        public function onHangerSave() : void
        {
            return;
        }// end function

        public function setStateClip(param1:Sprite) : void
        {
            m_stateClip = param1;
            return;
        }// end function

    }
}
