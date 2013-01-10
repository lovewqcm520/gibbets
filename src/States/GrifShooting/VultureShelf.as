package States.GrifShooting
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import States.PlayState.*;

    public class VultureShelf extends MapObject
    {
        private var m_speed:Number;
        private var m_movingSpeed:Number = 1.66667;
        private var m_isMovingDown:Boolean = true;

        public function VultureShelf(param1:Number, param2:b2Vec2)
        {
            m_speed = param1;
            return;
        }// end function

        override public function onDead(param1:b2World) : void
        {
            param1.DestroyBody(m_body);
            parent.removeChild(this);
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            m_body.SetLinearVelocity(new b2Vec2(0, m_speed));
            m_body.SetAngle(0);
            if (m_body.GetPosition().y > Constant.WINDOW_HEIGHT / Constant.PHYS_SCALE + 300 / Constant.PHYS_SCALE)
            {
                m_isDead = true;
            }
            if (m_body.GetPosition().y < -300 / Constant.PHYS_SCALE)
            {
                m_isDead = true;
            }
            return;
        }// end function

    }
}
