package States
{
    import Main.*;
    import flash.display.*;

    public class LeftToRightMoveTransactionState extends GameState
    {
        private var m_type:String = null;
        private var m_stateView1:DisplayObject = null;
        private var m_stateView2:DisplayObject = null;
        private var m_state1:GameState = null;
        private var m_state2:GameState = null;
        private var m_maxTransitionTime:Number = 0.5;
        public static const RIGHT_TO_LEFT_TRANSACTION:String = "rightToLeft";
        public static const TOP_TO_DOWN_TRANSACTION:String = "topToDown";
        public static const DOWN_TO_TOP_TRANSACTION:String = "downToTop";
        public static const LEFT_TO_RIGHT_TRANSACTION:String = "leftToRight";

        public function LeftToRightMoveTransactionState(param1:GameState, param2:GameState, param3:String, param4:Number = 0.5)
        {
            m_type = param3;
            m_state1 = param1;
            m_state2 = param2;
            m_stateView1 = param1.getViewClip();
            m_stateView2 = param2.getViewClip();
            m_maxTransitionTime = param4;
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_stateView1.x = 0;
            m_stateView2.x = 0;
            m_stateView1.y = 0;
            m_stateView2.y = 0;
            m_stateView1 = null;
            m_stateView2 = null;
            m_state1 = null;
            m_state2 = null;
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:* = m_liveTime / m_maxTransitionTime;
            var _loc_3:Number = 640;
            var _loc_4:Number = 480;
            switch(m_type)
            {
                case LEFT_TO_RIGHT_TRANSACTION:
                {
                    m_stateView1.x = (-_loc_2) * _loc_3;
                    m_stateView2.x = _loc_3 - _loc_2 * _loc_3;
                    break;
                }
                case RIGHT_TO_LEFT_TRANSACTION:
                {
                    m_stateView1.x = _loc_2 * _loc_3;
                    m_stateView2.x = _loc_2 * _loc_3 - _loc_3;
                    break;
                }
                case DOWN_TO_TOP_TRANSACTION:
                {
                    m_stateView1.y = (-_loc_2) * _loc_4;
                    m_stateView2.y = _loc_4 - _loc_2 * _loc_4;
                    break;
                }
                case TOP_TO_DOWN_TRANSACTION:
                {
                    m_stateView1.y = _loc_2 * _loc_4;
                    m_stateView2.y = _loc_2 * _loc_4 - _loc_4;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (m_liveTime >= m_maxTransitionTime)
            {
                StateManager.getInstance().changeState(m_state2);
            }
            return;
        }// end function

        override public function onInit() : void
        {
            addChild(m_stateView1);
            addChild(m_stateView2);
            update(0);
            return;
        }// end function

    }
}
