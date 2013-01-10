package States.PlayState
{

    public class Soul extends MapObject
    {

        public function Soul()
        {
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            y = y - 85 * param1;
            if (m_liveTime > 0.6)
            {
                alpha = alpha - 1.3 * param1;
            }
            return;
        }// end function

    }
}
