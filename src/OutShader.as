package 
{
    import flash.display.*;

    public class OutShader extends MovieClip
    {
        private var m_maxShade:Number;
        private var m_maxShadeTime:Number;
        private var m_blackSquare:MovieClip;
        private var m_liveTime:Number = 0;

        public function OutShader(param1:Number, param2:Number)
        {
            m_blackSquare = new black_square();
            m_maxShadeTime = param1;
            m_maxShade = param2;
            m_blackSquare.alpha = 1;
            addChild(m_blackSquare);
            return;
        }// end function

        public function isMaxTime() : Boolean
        {
            return m_liveTime >= m_maxShadeTime;
        }// end function

        public function update(param1:Number) : void
        {
            var _loc_2:* = m_liveTime + param1;
            m_liveTime = m_liveTime + param1;
            if (_loc_2 > m_maxShadeTime)
            {
                m_liveTime = m_maxShadeTime;
            }
            m_blackSquare.alpha = (1 - m_liveTime / m_maxShadeTime) * m_maxShade;
            return;
        }// end function

        public function restart() : void
        {
            m_liveTime = 0;
            m_blackSquare.alpha = m_maxShade;
            return;
        }// end function

    }
}
