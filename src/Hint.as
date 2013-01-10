package 
{
    import flash.display.*;
    import flash.text.*;

    public class Hint extends MovieClip
    {
        private var m_isShow:Boolean = false;
        private const m_hideSpeed:Number = 0.3;
        private const m_showSpeed:Number = 0.2;
        public var m_text:TextField;

        public function Hint()
        {
            mouseEnabled = false;
            mouseChildren = false;
            alpha = 0;
            return;
        }// end function

        public function hide() : void
        {
            m_isShow = false;
            return;
        }// end function

        public function isShow() : Boolean
        {
            return m_isShow;
        }// end function

        public function update() : void
        {
            if (m_isShow)
            {
                var _loc_1:* = alpha + m_showSpeed;
                alpha = alpha + m_showSpeed;
                if (_loc_1 > 1)
                {
                    alpha = 1;
                }
            }
            else
            {
                var _loc_1:* = alpha - m_hideSpeed;
                alpha = alpha - m_hideSpeed;
                if (_loc_1 < 0)
                {
                    alpha = 0;
                }
            }
            return;
        }// end function

        public function setText(param1:String) : void
        {
            m_text.autoSize = TextFieldAutoSize.CENTER;
            m_text.htmlText = param1;
            m_text.y = height / 2 - m_text.height / 2;
            return;
        }// end function

        override public function set y(param1:Number) : void
        {
            super.y = param1;
            if (super.y < 0)
            {
                super.y = 0;
            }
            if (super.y + height > 480)
            {
                super.y = 480 - height;
            }
            return;
        }// end function

        override public function set x(param1:Number) : void
        {
            super.x = param1;
            if (super.x < 0)
            {
                super.x = 0;
            }
            if (super.x + width > 640)
            {
                super.x = 640 - width;
            }
            return;
        }// end function

        public function show() : void
        {
            m_isShow = true;
            return;
        }// end function

    }
}
