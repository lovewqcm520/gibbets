package 
{
    import flash.display.*;

    public class Shader extends MovieClip
    {
        private var m_clip:black_square;
        private var m_endShade:Number;
        private var m_liveTime:Number = 0;
        private var m_startTime:Number;
        private var m_endTime:Number;
        private var m_startShade:Number;

        public function Shader(param1:Number, param2:Number, param3:Number, param4:Number)
        {
            m_clip = new black_square();
            addChild(m_clip);
            m_startTime = param1;
            m_endTime = param2;
            m_startShade = param3;
            m_endShade = param4;
            m_clip.alpha = param3;
            return;
        }// end function

        public function update(param1:Number) : void
        {
            m_liveTime = m_liveTime + param1;
            var _loc_2:* = m_startShade + (m_liveTime - m_startTime) / (m_endTime - m_startTime) * (m_endShade - m_startShade);
            if (_loc_2 > Math.max(m_startShade, m_endShade))
            {
                _loc_2 = Math.max(m_startShade, m_endShade);
            }
            if (_loc_2 < Math.min(m_startShade, m_endShade))
            {
                _loc_2 = Math.min(m_startShade, m_endShade);
            }
            m_clip.alpha = _loc_2;
            return;
        }// end function

        public function getShade() : Number
        {
            return m_clip.alpha;
        }// end function

    }
}
