package States.PlayState
{
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Utils.*;
    import flash.display.*;

    public class Arrow extends MovieClip
    {
        private var m_isDead:Boolean = false;
        private var m_wasBodyContact:Boolean = false;
        private var m_wasAnyContact:Boolean = false;
        private var m_ropesKilled:int = 0;
        private var m_arrowHeadFixture:b2Fixture = null;
        var m_isNextFrame:Boolean = false;
        private var m_isFreeFly:Boolean = false;
        private var m_lastVelocity:b2Vec2;
        private var m_liveTime:Number = 0;
        var m_isMassKilled:Boolean = false;
        private var m_stickInTime:Number = 0;
        private var m_body:b2Body = null;
        private var m_bodyFixture:b2Fixture = null;
        private var m_isStickIn:Boolean = false;
        public static const m_halfWidth:Number = 1;
        public static const m_halfHeight:Number = 12;

        public function Arrow(param1:b2Fixture, param2:b2Fixture, param3:b2Body)
        {
            m_lastVelocity = new b2Vec2();
            m_arrowHeadFixture = param1;
            m_bodyFixture = param2;
            m_body = param3;
            var _loc_4:int = 0;
            while (_loc_4 < 100)
            {
                
                calcDirection(1 / 30);
                _loc_4++;
            }
            this.scaleX = 1.0001;
            this.scaleY = 1.0001;
            return;
        }// end function

        public function calcDirection(param1:Number) : void
        {
            var _loc_2:b2Vec2 = null;
            var _loc_3:Number = NaN;
            if (!m_wasAnyContact)
            {
                _loc_2 = m_body.GetLinearVelocity();
                _loc_3 = MathUtils.GradToRad(new Vector3(_loc_2.x, _loc_2.y, 0).get2DRotation());
                if (!isNaN(_loc_3))
                {
                    m_body.SetAngle(_loc_3);
                }
            }
            return;
        }// end function

        public function contactWithManBody(param1:b2Body, param2:Boolean) : Boolean
        {
            var _loc_3:MovieClip = null;
            var _loc_4:MovieClip = null;
            if (getRopesKilled() != 0)
            {
                return false;
            }
            if (!m_wasBodyContact)
            {
                _loc_3 = param1.GetUserData() as MovieClip;
                if (_loc_3)
                {
                    if (_loc_3 is FaceColors_1 || _loc_3 is FaceColors_2 || _loc_3 is FaceColors_3 || _loc_3 is FaceColors_4)
                    {
                        trace("Head Shot");
                        _loc_4 = _loc_3.getChildByName("head_damage") as MovieClip;
                        (_loc_3.getChildByName("head_damage") as MovieClip).gotoAndStop((_loc_4.currentFrame + 1));
                    }
                    else
                    {
                        _loc_3.gotoAndStop((_loc_3.currentFrame + 1));
                    }
                }
                m_wasBodyContact = true;
                if (param2)
                {
                    PlayState.getInstance().onManCry();
                    SoundManager.play(MathUtils.anyOfString(SoundConst.CRY_0, SoundConst.CRY_1, SoundConst.CRY_2, SoundConst.CRY_3, SoundConst.CRY_4, SoundConst.CRY_5, SoundConst.CRY_6, SoundConst.CRY_7));
                }
                return true;
            }
            return false;
        }// end function

        public function resumeFly() : void
        {
            m_body.SetLinearVelocity(m_lastVelocity);
            return;
        }// end function

        public function canStickIn() : Boolean
        {
            return m_lastVelocity.LengthSquared() >= 15 * 15;
        }// end function

        public function update(param1:Number) : void
        {
            var _loc_2:b2MassData = null;
            if (m_isStickIn)
            {
                m_stickInTime = m_stickInTime + param1;
            }
            if (!m_isMassKilled && m_isStickIn)
            {
                if (!m_isNextFrame)
                {
                    m_isNextFrame = true;
                }
                else
                {
                    m_isMassKilled = true;
                    _loc_2 = new b2MassData();
                    m_body.GetMassData(_loc_2);
                    _loc_2.mass = _loc_2.mass / 15;
                    m_body.SetMassData(_loc_2);
                }
            }
            m_lastVelocity = m_body.GetLinearVelocity().Copy();
            m_liveTime = m_liveTime + param1;
            calcDirection(param1);
            return;
        }// end function

        public function stopFly() : void
        {
            m_body.SetLinearVelocity(new b2Vec2());
            return;
        }// end function

        public function onAnyContact() : void
        {
            m_wasAnyContact = true;
            return;
        }// end function

        public function stickIn() : void
        {
            m_isStickIn = true;
            m_arrowHeadFixture.SetSensor(true);
            m_bodyFixture.SetSensor(true);
            return;
        }// end function

        public function canInjure() : Boolean
        {
            if (PlayState.getInstance() && PlayState.m_curLevel == 50 && GameData.haveAchievement(Achievements.TWO_HOURS_PLAYED))
            {
                return false;
            }
            return m_lastVelocity.LengthSquared() >= 4 * 4;
        }// end function

        public function isStickIn() : Boolean
        {
            return m_isStickIn;
        }// end function

        public function kill() : void
        {
            m_isDead = true;
            return;
        }// end function

        public function getBody() : b2Body
        {
            return m_body;
        }// end function

        public function getHeadFixture() : b2Fixture
        {
            return m_arrowHeadFixture;
        }// end function

        public function getBodyFixture() : b2Fixture
        {
            return m_bodyFixture;
        }// end function

        public function setFreeFly() : void
        {
            m_isFreeFly = true;
            return;
        }// end function

        public function getRopesKilled() : int
        {
            return m_ropesKilled;
        }// end function

        public function wasAnyContact() : Boolean
        {
            return m_wasAnyContact;
        }// end function

        public function onKillRope() : void
        {
            m_body.SetLinearVelocity(new b2Vec2(m_body.GetLinearVelocity().x * 0.6, m_body.GetLinearVelocity().y * 0.6));
            var _loc_2:* = m_ropesKilled + 1;
            m_ropesKilled = _loc_2;
            return;
        }// end function

        public function destroyBody(param1:b2World) : void
        {
            param1.DestroyBody(m_body);
            m_body = null;
            return;
        }// end function

        public function isDead() : Boolean
        {
            return m_isDead;
        }// end function

        public function isNeeded() : Boolean
        {
            if (m_isStickIn && m_stickInTime > 0.2)
            {
                return false;
            }
            if (!m_isFreeFly)
            {
                if (m_body.GetPosition().x * Constant.PHYS_SCALE < -200 || m_body.GetPosition().x * Constant.PHYS_SCALE > Constant.WINDOW_WIDTH + 200)
                {
                    return false;
                }
            }
            if (m_body.GetPosition().y * Constant.PHYS_SCALE > Constant.WINDOW_HEIGHT)
            {
                return false;
            }
            if (m_liveTime > 10)
            {
                return false;
            }
            return !m_isDead && m_body.IsAwake();
        }// end function

    }
}
