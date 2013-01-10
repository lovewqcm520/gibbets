package States.PlayState
{
    import Ragdoll.*;
    import Utils.*;
    import flash.display.*;
    import flash.geom.*;

    public class TargetedCamera extends Camera
    {
        private var m_curPos:Vector3;
        private const m_ceil:Number = 200;
        private var m_scrollBackStartPos:Vector3;
        private var m_rightEdgeClip:DisplayObject;
        private var m_guiArrow:DisplayObject;
        private const m_scrollbackMaxTime:Number = 1;
        private var m_stateTime:Number;
        private var m_targetPos:Vector3;
        private const m_maxCameraSpeed:Number = 900;
        private const m_floor:Number = 0;
        private var m_arrow:Arrow;
        private var m_state:String = "AIMING_STATE";
        private var m_cameraSpeed:Vector3;
        private var m_gibbetHeadX:Number;
        private var m_cameraAcceleration:Vector3;
        private var m_gibbetHead:MovieClip;
        private var m_leftEdgeClip:DisplayObject;
        private var m_liveTime:Number = 0;
        private var m_bow:MovieClip;
        public static const TEST_STATE:String = "TEST_STATE";
        public static const ARROW_FLY_STATE:String = "ARROW_FLY_STATE";
        public static const COMPLETE_STATE:String = "COMPLETE_STATE";
        public static const AIMING_STATE:String = "AIMING_STATE";
        public static const SHOW_GIBBET:String = "SHOW_GIBBET";
        public static const WAIT_BEFORE_BACK_STATE:String = "WAIT_BEFORE_BACK_STATE";
        public static const SCROLL_BACK:String = "SCROLL_BACK";

        public function TargetedCamera()
        {
            m_guiArrow = new LongShootArrow();
            return;
        }// end function

        override public function onShoot(param1:Arrow) : void
        {
            m_arrow = param1;
            setState(ARROW_FLY_STATE);
            return;
        }// end function

        public function setBow(param1:MovieClip) : void
        {
            m_bow = param1;
            return;
        }// end function

        override public function canShoot() : Boolean
        {
            return m_state == AIMING_STATE;
        }// end function

        override public function onKillArrow() : void
        {
            if (m_state == ARROW_FLY_STATE)
            {
                setState(WAIT_BEFORE_BACK_STATE);
            }
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:Number = NaN;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            m_liveTime = m_liveTime + param1;
            m_stateTime = m_stateTime + param1;
            if (m_stateClip)
            {
                switch(m_state)
                {
                    case SHOW_GIBBET:
                    {
                        if (m_gibbetHeadX > 0)
                        {
                            m_stateClip.x = -m_gibbetHeadX + 320;
                        }
                        else
                        {
                            m_stateClip.x = -m_gibbetHead.x + 320;
                        }
                        m_stateClip.y = -m_gibbetHead.y + 240;
                        if (m_stateTime > 1.5)
                        {
                            setState(SCROLL_BACK);
                        }
                        break;
                    }
                    case AIMING_STATE:
                    {
                        break;
                    }
                    case ARROW_FLY_STATE:
                    {
                        m_stateClip.x = -m_arrow.x + 320;
                        m_stateClip.y = -m_arrow.y + 240;
                        _loc_3 = m_rightEdgeClip.localToGlobal(new Point()).x;
                        if (_loc_3 < 640)
                        {
                            setState(WAIT_BEFORE_BACK_STATE);
                        }
                        _loc_4 = m_leftEdgeClip.localToGlobal(new Point()).x;
                        if (_loc_4 > 0)
                        {
                            setState(WAIT_BEFORE_BACK_STATE);
                        }
                        break;
                    }
                    case SCROLL_BACK:
                    {
                        if (m_stateTime < m_scrollbackMaxTime)
                        {
                            _loc_2 = Math.sin(m_stateTime / m_scrollbackMaxTime * Math.PI / 2);
                            m_stateClip.x = m_scrollBackStartPos.x + (-m_bow.x + 320 - m_scrollBackStartPos.x) * _loc_2;
                            m_stateClip.y = m_scrollBackStartPos.y + (-m_bow.y + 240 - m_scrollBackStartPos.y) * _loc_2;
                        }
                        else
                        {
                            setState(AIMING_STATE);
                        }
                        break;
                    }
                    case WAIT_BEFORE_BACK_STATE:
                    {
                        if (m_stateTime > 0.9)
                        {
                            setState(SCROLL_BACK);
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
                if (m_stateClip.y < m_floor)
                {
                    m_stateClip.y = m_floor;
                }
                if (m_stateClip.y > m_ceil)
                {
                    m_stateClip.y = m_ceil;
                }
                updateHintArrow();
            }
            return;
        }// end function

        override public function setStateClip(param1:Sprite) : void
        {
            super.setStateClip(param1);
            m_leftEdgeClip = param1.getChildByName(Constant.LEFT_EDGE_MARKER_NAME);
            m_rightEdgeClip = param1.getChildByName(Constant.RIGHT_EDGE_MARKER_NAME);
            return;
        }// end function

        public function setState(param1:String) : void
        {
            m_stateTime = 0;
            m_state = param1;
            switch(m_state)
            {
                case SHOW_GIBBET:
                {
                    m_gibbetHeadX = m_gibbetHead.x;
                    break;
                }
                case AIMING_STATE:
                {
                    m_stateClip.x = -m_bow.x + 320;
                    break;
                }
                case SCROLL_BACK:
                {
                    m_scrollBackStartPos = new Vector3(m_stateClip.x, m_stateClip.y, 0);
                    break;
                }
                case WAIT_BEFORE_BACK_STATE:
                {
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        override public function setGibbet(param1:Gibbet) : void
        {
            m_gibbetHead = param1.getRagdoll().getBodyByName(HumanRagdoll.HEAD).GetUserData();
            m_gibbetHeadX = m_gibbetHead.x;
            setState(SHOW_GIBBET);
            return;
        }// end function

        override public function setGUILayer(param1:Sprite) : void
        {
            super.setGUILayer(param1);
            m_guiLayer.addChild(m_guiArrow);
            m_guiArrow.visible = false;
            return;
        }// end function

        override public function onHangerDead() : void
        {
            setState(COMPLETE_STATE);
            return;
        }// end function

        private function updateHintArrow() : void
        {
            var _loc_1:Number = NaN;
            if (m_bow)
            {
                _loc_1 = m_gibbetHead.localToGlobal(new Point()).x;
                if (_loc_1 > -50 && _loc_1 < 640 + 50)
                {
                    m_guiArrow.visible = false;
                }
                else
                {
                    m_guiArrow.y = m_gibbetHead.localToGlobal(new Point()).y;
                    if (m_bow.x < m_gibbetHead.x)
                    {
                        m_guiArrow.scaleX = 0.7;
                        m_guiArrow.scaleY = 0.7;
                        m_guiArrow.x = 640 - m_guiArrow.width - 10 + 7 * Math.sin(m_liveTime * 5);
                    }
                    else
                    {
                        m_guiArrow.scaleX = -0.7;
                        m_guiArrow.scaleY = 0.7;
                        m_guiArrow.x = m_guiArrow.width + 10 + 7 * Math.sin(m_liveTime * 5);
                    }
                    m_guiArrow.visible = true;
                }
            }
            return;
        }// end function

        override public function onHangerSave() : void
        {
            setState(COMPLETE_STATE);
            return;
        }// end function

    }
}
