package States.PlayState
{
    import Box2D.Dynamics.*;
    import flash.display.*;

    public class Cow extends MapObject
    {
        private var m_clip:MovieClip;
        private var m_isCry:Boolean = false;

        public function Cow()
        {
            m_clip = new CowNormal();
            addChild(m_clip);
            return;
        }// end function

        override public function onArrowHeadContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (!m_isCry)
            {
                SoundManager.play(SoundConst.MOO);
                removeChild(m_clip);
                m_clip = new CowCry();
                addChild(m_clip);
                m_isCry = true;
            }
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            if (m_isCry)
            {
                if (m_clip.currentFrame == m_clip.totalFrames)
                {
                    removeChild(m_clip);
                    m_clip = new CowNormal();
                    addChild(m_clip);
                    m_isCry = false;
                }
            }
            return;
        }// end function

    }
}
