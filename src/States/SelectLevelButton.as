package States
{
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class SelectLevelButton extends MovieClip
    {
        private var m_textDown:TextField;
        private var m_down:MovieClip;
        private var m_isShowStar:Boolean = false;
        private var m_starOver:MovieClip;
        private var m_starUp:MovieClip;
        private var m_starDown:MovieClip;
        private var m_unenable:MovieClip;
        private var m_textOver:TextField;
        private var m_up:MovieClip;
        private var m_over:MovieClip;
        private var m_textUp:TextField;
        private var m_state:String = "up";
        public static const DOWN:String = "down";
        public static const OVER:String = "over";
        public static const UP:String = "up";
        public static const UNENABLE:String = "unenable";

        public function SelectLevelButton()
        {
            m_textDown = getChildByName("m_textDown") as TextField;
            m_textUp = getChildByName("m_textUp") as TextField;
            m_textOver = getChildByName("m_textOver") as TextField;
            m_starDown = getChildByName("m_starDown") as MovieClip;
            m_starUp = getChildByName("m_starUp") as MovieClip;
            m_starOver = getChildByName("m_starOver") as MovieClip;
            m_down = getChildByName("m_down") as MovieClip;
            m_up = getChildByName("m_up") as MovieClip;
            m_over = getChildByName("m_over") as MovieClip;
            m_unenable = getChildByName("m_unenable") as MovieClip;
            buttonMode = true;
            this.mouseChildren = false;
            addEventListener(Event.REMOVED_FROM_STAGE, handleRemoveFromStage);
            addEventListener(MouseEvent.MOUSE_OVER, handleMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, handleMouseOut);
            addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
            addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
            setState(UP);
            return;
        }// end function

        private function handleRemoveFromStage(event:Event) : void
        {
            removeEventListener(Event.REMOVED_FROM_STAGE, handleRemoveFromStage);
            removeEventListener(MouseEvent.MOUSE_OVER, handleMouseOver);
            removeEventListener(MouseEvent.MOUSE_OUT, handleMouseOut);
            removeEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
            removeEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
            m_state = null;
            m_textUp = null;
            m_up = null;
            m_starUp = null;
            m_textOver = null;
            m_over = null;
            m_starOver = null;
            m_textDown = null;
            m_down = null;
            m_starDown = null;
            m_unenable = null;
            return;
        }// end function

        private function hide() : void
        {
            m_textUp.visible = false;
            m_up.visible = false;
            m_starUp.visible = false;
            m_textOver.visible = false;
            m_over.visible = false;
            m_starOver.visible = false;
            m_textDown.visible = false;
            m_down.visible = false;
            m_starDown.visible = false;
            m_unenable.visible = false;
            return;
        }// end function

        public function setState(param1:String) : void
        {
            hide();
            buttonMode = true;
            switch(param1)
            {
                case UNENABLE:
                {
                    buttonMode = false;
                    m_unenable.visible = true;
                    break;
                }
                case UP:
                {
                    m_up.visible = true;
                    m_textUp.visible = true;
                    if (m_isShowStar)
                    {
                        m_starUp.visible = true;
                    }
                    break;
                }
                case DOWN:
                {
                    m_down.visible = true;
                    m_textDown.visible = true;
                    if (m_isShowStar)
                    {
                        m_starDown.visible = true;
                    }
                    break;
                }
                case OVER:
                {
                    m_over.visible = true;
                    m_textOver.visible = true;
                    if (m_isShowStar)
                    {
                        m_starOver.visible = true;
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            m_state = param1;
            return;
        }// end function

        private function handleMouseOver(event:MouseEvent) : void
        {
            if (m_state != UNENABLE)
            {
                setState(OVER);
            }
            return;
        }// end function

        public function hideStar() : void
        {
            m_isShowStar = false;
            setState(m_state);
            return;
        }// end function

        public function unenable() : void
        {
            setState(UNENABLE);
            return;
        }// end function

        private function handleMouseUp(event:MouseEvent) : void
        {
            if (m_state != UNENABLE)
            {
                setState(OVER);
            }
            return;
        }// end function

        public function setText(param1:String) : void
        {
            m_textUp.text = param1;
            m_textOver.text = param1;
            m_textDown.text = param1;
            setState(UP);
            return;
        }// end function

        private function handleMouseOut(event:MouseEvent) : void
        {
            if (m_state != UNENABLE)
            {
                setState(UP);
            }
            return;
        }// end function

        public function showStar() : void
        {
            m_isShowStar = true;
            setState(m_state);
            return;
        }// end function

        private function handleMouseDown(event:MouseEvent) : void
        {
            if (m_state != UNENABLE)
            {
                setState(DOWN);
            }
            return;
        }// end function

    }
}
