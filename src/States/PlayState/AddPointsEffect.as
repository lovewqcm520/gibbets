package States.PlayState
{
    import Box2D.Dynamics.*;
    import flash.display.*;
    import flash.text.*;

    public class AddPointsEffect extends MapObject
    {
        public var m_label:TextField;
        private var m_startX:Number;
        private var m_sign:MovieClip;

        public function AddPointsEffect(param1:int, param2:int, param3:Number, param4:Number, param5 = "")
        {
            m_label.text = "+" + param1.toString() + param5;
            this.x = param3;
            this.y = param4;
            m_startX = param3;
            switch(param2)
            {
                case 2:
                {
                    m_sign = new DoubleSave();
                    break;
                }
                case 3:
                {
                    m_sign = new TripleSave();
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (m_sign)
            {
                addChild(m_sign);
                m_sign.y = -18;
            }
            return;
        }// end function

        override public function isDead() : Boolean
        {
            return m_liveTime > 1.7;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            m_liveTime = m_liveTime + param1;
            y = y - param1 * 65;
            x = m_startX + Math.sin(m_liveTime * 4) * (10 + m_liveTime * 4);
            var _loc_2:Number = 0.5;
            _loc_3 = 1.6;
            if (m_liveTime > _loc_2 && m_liveTime < _loc_3)
            {
                alpha = 1 - (m_liveTime - _loc_2) / (_loc_3 - _loc_2);
                _loc_4 = 1 + 0.4 * (m_liveTime - _loc_2) / (_loc_3 - _loc_2);
                scaleX = _loc_4;
                scaleY = _loc_4;
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
