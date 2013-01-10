package States.PlayState
{
    import Box2D.Dynamics.*;

    public class AutoreleaseClip extends MapObject
    {

        public function AutoreleaseClip()
        {
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            if (currentFrame == totalFrames)
            {
                m_isDead = true;
            }
            return;
        }// end function

        override public function onDead(param1:b2World) : void
        {
            parent.removeChild(this);
            return;
        }// end function

    }
}
