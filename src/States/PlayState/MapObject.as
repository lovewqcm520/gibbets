package States.PlayState
{
    import Box2D.Dynamics.*;
    import flash.display.*;

    public class MapObject extends MovieClip
    {
        protected var m_isDead:Boolean = false;
        protected var m_liveTime:Number = 0;
        protected var m_body:b2Body = null;

        public function MapObject()
        {
            return;
        }// end function

        public function isItYourFixture(param1:b2Fixture) : Boolean
        {
            return param1.GetBody() == m_body;
        }// end function

        public function get body() : b2Body
        {
            return m_body;
        }// end function

        public function onDead(param1:b2World) : void
        {
            return;
        }// end function

        public function set body(param1:b2Body) : void
        {
            m_body = param1;
            return;
        }// end function

        public function onArrowHeadContact(param1:Arrow, param2:b2Fixture) : void
        {
            return;
        }// end function

        public function update(param1:Number) : void
        {
            return;
        }// end function

        public function canStickInMe() : Boolean
        {
            return true;
        }// end function

        public function goTop(param1:Sprite, param2:Sprite, param3:Sprite, param4:Sprite, param5:Sprite) : void
        {
            return;
        }// end function

        public function isDead() : Boolean
        {
            return m_isDead;
        }// end function

        public function connectWithBody(param1:b2Body) : void
        {
            this.body = param1;
            m_body.SetUserData(this);
            return;
        }// end function

        public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            return;
        }// end function

    }
}
