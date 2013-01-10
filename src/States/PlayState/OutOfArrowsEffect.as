package States.PlayState
{

    public class OutOfArrowsEffect extends MapObject
    {
        private var m_stage:int = 0;

        public function OutOfArrowsEffect()
        {
            x = 320;
            y = 240;
            scale = 0;
            alpha = -1;
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            switch(m_stage)
            {
                case 0:
                {
                    alpha = alpha + param1 * 4;
                    var _loc_2:* = scale + param1 * 2;
                    scale = scale + param1 * 2;
                    if (_loc_2 > 1)
                    {
                        scale = 1;
                        alpha = 1;
                        m_liveTime = 0;
                        m_stage = 1;
                    }
                    break;
                }
                case 1:
                {
                    scale = 1 + Math.sin(m_liveTime * 5) * 0.07;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function get scale() : Number
        {
            return scaleX;
        }// end function

        private function set scale(param1:Number) : void
        {
            scaleX = param1;
            scaleY = param1;
            return;
        }// end function

    }
}
