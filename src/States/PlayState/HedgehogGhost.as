package States.PlayState
{
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Utils.*;
    import flash.display.*;

    public class HedgehogGhost extends MapObject
    {
        private var m_isActive:Boolean = true;
        private var m_needRun:Boolean = false;
        private var m_charge:int;
        private var m_arrow:Arrow;
        private var m_rotatedPath:DisplayObject;
        private var m_rotationSpeed:Number = 70;

        public function HedgehogGhost()
        {
            m_rotatedPath = getChildByName("m_rotatedPath");
            return;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (m_isActive)
            {
                m_arrow = param1;
                m_isActive = false;
                m_needRun = true;
                SoundManager.play(SoundConst.ARROW_GHOST);
            }
            return;
        }// end function

        public function setRotationSpeed(param1:Number) : void
        {
            m_rotationSpeed = param1;
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:int = 0;
            var _loc_3:Number = NaN;
            var _loc_4:b2Vec2 = null;
            m_liveTime = m_liveTime + param1;
            if (!m_rotatedPath)
            {
                return;
            }
            m_rotatedPath.rotation = m_rotatedPath.rotation + m_rotationSpeed * param1;
            if (m_needRun)
            {
                if (m_charge != 1)
                {
                    m_arrow.kill();
                }
                m_needRun = false;
                _loc_2 = 0;
                while (_loc_2 < m_charge)
                {
                    
                    _loc_3 = MathUtils.GradToRad(m_rotatedPath.rotation) - Math.PI / 2 - _loc_2 * Math.PI * 2 / m_charge;
                    _loc_4 = new b2Vec2(Math.cos(_loc_3), Math.sin(_loc_3));
                    _loc_4.Multiply((Constant.MIN_SHOOTING_POWER + Constant.MAX_SHOOTING_POWER) / 2);
                    PlayState.getInstance().getWorld().DestroyBody(m_body);
                    PlayState.getInstance().createArrow(m_body.GetPosition().Copy(), _loc_4);
                    _loc_2++;
                }
            }
            else if (!m_isActive)
            {
                scaleX = scaleX + 0.03;
                scaleY = scaleY + 0.03;
                var _loc_5:* = alpha - 0.08;
                alpha = alpha - 0.08;
                if (_loc_5 <= 0)
                {
                    alpha = 0;
                    m_isDead = true;
                }
            }
            return;
        }// end function

        override public function onDead(param1:b2World) : void
        {
            parent.removeChild(this);
            param1.DestroyBody(m_body);
            return;
        }// end function

        override public function isDead() : Boolean
        {
            return m_isDead;
        }// end function

        public function setCharge(param1:int)
        {
            m_charge = param1;
            return;
        }// end function

        public function initRotation() : void
        {
            m_rotatedPath.rotation = rotation;
            rotation = 0;
            return;
        }// end function

    }
}
