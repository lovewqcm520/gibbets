package States.PlayState
{
    import Box2D.Dynamics.*;
    import flash.display.*;

    public class Sun extends MapObject
    {
        public var m_sunCircle:MovieClip;
        public var m_face:MovieClip;

        public function Sun()
        {
            m_face.stop();
            return;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_face.currentFrame == 1)
            {
                SoundManager.play(SoundConst.SUN_VOICE);
                m_face.play();
            }
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            if (m_face.currentFrame == m_face.totalFrames)
            {
                m_face.gotoAndStop(1);
            }
            m_sunCircle.rotation = -rotation;
            return;
        }// end function

        override public function onArrowHeadContact(param1:Arrow, param2:b2Fixture) : void
        {
            onArrowContact(param1, param2);
            return;
        }// end function

    }
}
