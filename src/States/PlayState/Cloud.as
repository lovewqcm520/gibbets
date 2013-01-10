package States.PlayState
{

    public class Cloud extends MapObject
    {
        private var m_iSpeed:Number;
        private var m_speed:Number;
        private var m_x:int = 0;

        public function Cloud()
        {
            m_speed = Math.round(15 + Math.random() * 15);
            scaleX = 1.001;
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            x = x + m_speed * param1;
            if (x - width > 640)
            {
                x = -width;
                m_speed = 15 + Math.random() * 15;
            }
            return;
        }// end function

    }
}
