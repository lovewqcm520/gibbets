package States.PlayState
{
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Box2D.Dynamics.Joints.*;
    import Ragdoll.*;
    import Utils.*;
    import flash.display.*;

    public class Gibbet extends MapObject
    {
        private var m_arrowDamage:Number = 0.15;
        private var m_destroyBuffer:Array;
        private var m_healthWithoutDamage:Number = 1;
        private var m_ragdoll:HumanRagdoll;
        private var m_isSafed:Boolean = false;
        private var m_arrowsInBody:int = 0;
        private var m_comixCloudTime:Number = -1;
        private var m_persID:int;
        private var m_comixCloudProb:Number = 0;
        private var m_faceColor:MovieClip;
        private var m_comixCloud:MovieClip;
        private var m_dieSpeed:Number = 0.03;
        private var m_world:b2World;
        private var m_showCloudState:int = 0;
        private var m_injureTime:Number = -1;
        private var m_healthClip:MovieClip;
        private var m_chain:Array;
        private var m_health:Number = 1;

        public function Gibbet(param1:b2Vec2, param2:String, param3:int, param4:b2World, param5:int, param6:Boolean)
        {
            var _loc_7:int = 0;
            var _loc_15:b2Vec2 = null;
            var _loc_19:b2Body = null;
            var _loc_20:b2Body = null;
            var _loc_21:b2Body = null;
            var _loc_22:b2Vec2 = null;
            m_chain = new Array();
            m_destroyBuffer = new Array();
            m_world = param4;
            m_dieSpeed = MathUtils.RandomRange(0.025, 0.035);
            if (GameData.haveAchievement(Achievements.LEVEL_30_IN_6_SHOT))
            {
                m_dieSpeed = m_dieSpeed * 0.9;
            }
            var _loc_8:* = new b2Vec2(1 / Constant.PHYS_SCALE, 3 / Constant.PHYS_SCALE);
            var _loc_9:* = new b2BodyDef();
            new b2BodyDef().position.x = param1.x;
            _loc_9.type = b2Body.b2_dynamicBody;
            var _loc_10:* = new b2FixtureDef();
            new b2FixtureDef().density = 30;
            _loc_10.friction = 0.5;
            _loc_10.restitution = 0.1;
            _loc_10.isSensor = true;
            var _loc_11:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(_loc_8.x, _loc_8.y);
            _loc_10.shape = _loc_11;
            _loc_7 = 0;
            while (_loc_7 < param3)
            {
                
                _loc_9.position.y = param1.y + _loc_8.y * _loc_7 * 2 - 1 / Constant.PHYS_SCALE;
                _loc_19 = m_world.CreateBody(_loc_9);
                _loc_19.CreateFixture(_loc_10);
                _loc_19.SetUserData(new Rope());
                addChild(_loc_19.GetUserData());
                m_chain.push(_loc_19);
                _loc_7++;
            }
            var _loc_12:* = new b2RevoluteJointDef();
            new b2RevoluteJointDef().lowerAngle = (-Math.PI) / 2;
            _loc_12.upperAngle = Math.PI / 2;
            _loc_12.enableLimit = true;
            _loc_7 = 0;
            while (_loc_7 < (m_chain.length - 1))
            {
                
                _loc_20 = m_chain[_loc_7];
                _loc_21 = m_chain[(_loc_7 + 1)];
                _loc_22 = new b2Vec2((_loc_20.GetPosition().x + _loc_21.GetPosition().x) / 2, (_loc_20.GetPosition().y + _loc_21.GetPosition().y) / 2);
                _loc_12.Initialize(_loc_20, _loc_21, _loc_22);
                m_world.CreateJoint(_loc_12);
                _loc_7++;
            }
            var _loc_13:* = new b2RevoluteJointDef();
            new b2RevoluteJointDef().collideConnected = true;
            _loc_13.Initialize(m_world.GetGroundBody(), m_chain[0], new b2Vec2(param1.x, param1.y - 3 / Constant.PHYS_SCALE));
            m_world.CreateJoint(_loc_13);
            var _loc_14:Boolean = false;
            if (param2 != HumanRagdoll.HEAD)
            {
                m_dieSpeed = m_dieSpeed / 3;
            }
            switch(param2)
            {
                case HumanRagdoll.HEAD:
                {
                    _loc_15 = new b2Vec2(0, 0);
                    _loc_14 = false;
                    break;
                }
                case HumanRagdoll.LEFT_LOWER_HAND:
                {
                    _loc_15 = new b2Vec2(31 / Constant.PHYS_SCALE, -5 / Constant.PHYS_SCALE);
                    _loc_14 = false;
                    break;
                }
                case HumanRagdoll.RIGHT_LOWER_HAND:
                {
                    _loc_15 = new b2Vec2(-31 / Constant.PHYS_SCALE, -5 / Constant.PHYS_SCALE);
                    _loc_14 = false;
                    break;
                }
                case HumanRagdoll.LEFT_LOWER_LEG:
                {
                    _loc_15 = new b2Vec2(4 / Constant.PHYS_SCALE, 55 / Constant.PHYS_SCALE);
                    _loc_14 = true;
                    break;
                }
                case HumanRagdoll.RIGHT_LOWER_LEG:
                {
                    _loc_15 = new b2Vec2(-4 / Constant.PHYS_SCALE, 55 / Constant.PHYS_SCALE);
                    _loc_14 = true;
                    break;
                }
                default:
                {
                    break;
                }
            }
            var _loc_16:* = (m_chain[(m_chain.length - 1)] as b2Body).GetPosition().Copy();
            m_ragdoll = new HumanRagdoll(new b2Vec2(_loc_16.x + _loc_15.x, _loc_16.y + _loc_15.y), m_world, _loc_14, param5, param6);
            m_faceColor = m_ragdoll.getBodyByName(HumanRagdoll.HEAD).GetUserData() as MovieClip;
            addChild(m_ragdoll);
            var _loc_17:* = m_ragdoll.getBodyByName(param2);
            var _loc_18:* = new b2RevoluteJointDef();
            new b2RevoluteJointDef().Initialize(_loc_17, m_chain[(m_chain.length - 1)], _loc_16);
            m_world.CreateJoint(_loc_18);
            m_healthClip = new HealthBar();
            addChild(m_healthClip);
            calcHealthClip(false);
            calcComixCloudPos();
            m_persID = param5;
            if (GameData.haveAchievement(Achievements.LEVEL_44_IN_6_SHOT))
            {
                m_arrowDamage = 0.12;
            }
            return;
        }// end function

        private function calcHealthClip(param1:Boolean) : void
        {
            var _loc_2:* = getHeadPosition();
            m_healthClip.x = _loc_2.x * Constant.PHYS_SCALE + 15;
            m_healthClip.y = _loc_2.y * Constant.PHYS_SCALE - 11;
            var _loc_3:* = this.int((1 - m_health) * 3);
            m_healthClip.gotoAndStop(this.int(m_healthClip.totalFrames * (1 - m_health)));
            if (m_isSafed)
            {
                if (!m_isDead)
                {
                    m_faceColor.gotoAndStop(5 + _loc_3);
                }
                else
                {
                    m_faceColor.gotoAndStop(4);
                }
            }
            else if (!m_isDead)
            {
                if (param1)
                {
                    m_injureTime = 0.6;
                    m_faceColor.gotoAndStop(8 + _loc_3);
                }
                else if (m_injureTime < 0)
                {
                    m_faceColor.gotoAndStop(1 + _loc_3);
                }
            }
            else
            {
                m_faceColor.gotoAndStop(4);
            }
            m_faceColor.addChild(m_faceColor.getChildByName("head_damage"));
            return;
        }// end function

        public function getPersID() : int
        {
            return m_persID;
        }// end function

        private function checkRopeKill(param1:Arrow, param2:b2Fixture) : void
        {
            var _loc_3:b2Body = null;
            var _loc_4:Boolean = false;
            var _loc_5:int = 0;
            var _loc_6:b2Body = null;
            var _loc_7:b2MassData = null;
            if (m_chain.indexOf(param2.GetBody()) != -1 && !m_isSafed)
            {
                _loc_3 = param2.GetBody();
                SoundManager.play(MathUtils.anyOfString(SoundConst.TAPE_ROPE_0, SoundConst.TAPE_ROPE_1, SoundConst.TAPE_ROPE_2));
                param1.onKillRope();
                _loc_4 = false;
                _loc_5 = 0;
                while (_loc_5 < m_chain.length)
                {
                    
                    _loc_6 = m_chain[_loc_5];
                    if (_loc_3 == _loc_6)
                    {
                        _loc_4 = true;
                        m_destroyBuffer.push(_loc_6);
                    }
                    else if (_loc_4)
                    {
                        _loc_7 = new b2MassData();
                        _loc_6.GetMassData(_loc_7);
                        _loc_7.mass = _loc_7.mass / 40;
                        _loc_6.SetMassData(_loc_7);
                    }
                    else
                    {
                        _loc_6.ApplyImpulse(new b2Vec2(-0.2, MathUtils.RandomRange(-1, 1)), _loc_6.GetPosition());
                    }
                    _loc_5++;
                }
                PlayState.getInstance().onHangerSafe(param1.getRopesKilled(), this);
                m_healthClip.visible = false;
                m_isSafed = true;
            }
            return;
        }// end function

        private function calcComixCloudPos() : void
        {
            var _loc_1:b2Vec2 = null;
            if (m_comixCloud)
            {
                _loc_1 = getHeadPosition();
                m_comixCloud.x = _loc_1.x * Constant.PHYS_SCALE - 14;
                m_comixCloud.y = _loc_1.y * Constant.PHYS_SCALE;
            }
            return;
        }// end function

        public function getHeadPosition() : b2Vec2
        {
            return m_ragdoll.getBodyByName(HumanRagdoll.HEAD).GetPosition().Copy();
        }// end function

        override public function isItYourFixture(param1:b2Fixture) : Boolean
        {
            var _loc_2:* = param1.GetBody();
            return m_chain.indexOf(_loc_2) != -1 || m_ragdoll.getAllPaths().indexOf(_loc_2) != -1;
        }// end function

        public function setComixCloud(param1:MovieClip, param2:Number = 1) : void
        {
            m_comixCloud = param1;
            m_comixCloud.visible = false;
            m_comixCloudProb = param2;
            return;
        }// end function

        public function getRagdoll() : HumanRagdoll
        {
            return m_ragdoll;
        }// end function

        override public function isDead() : Boolean
        {
            return false;
        }// end function

        public function showCloud(param1:Number = 2.5) : void
        {
            if (m_comixCloud)
            {
                if (!isDead() && m_comixCloudProb > Math.random())
                {
                    m_comixCloudTime = param1;
                    m_comixCloud.visible = true;
                    m_comixCloudProb = 0;
                    m_comixCloud.alpha = 0;
                    m_showCloudState = 0;
                }
            }
            return;
        }// end function

        public function isKilled() : Boolean
        {
            return m_isDead;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_2:b2Body = null;
            m_injureTime = m_injureTime - param1;
            if (m_comixCloud && m_comixCloud.visible)
            {
                switch(m_showCloudState)
                {
                    case 0:
                    {
                        var _loc_3:* = m_comixCloud.alpha + 4 * param1;
                        m_comixCloud.alpha = m_comixCloud.alpha + 4 * param1;
                        if (_loc_3 >= 1)
                        {
                            m_showCloudState = 1;
                            m_comixCloud.alpha = 1;
                        }
                        break;
                    }
                    case 1:
                    {
                        var _loc_3:* = m_comixCloudTime - param1;
                        m_comixCloudTime = m_comixCloudTime - param1;
                        if (_loc_3 < 0)
                        {
                            m_showCloudState = 2;
                        }
                        break;
                    }
                    case 2:
                    {
                        var _loc_3:* = m_comixCloud.alpha - 4 * param1;
                        m_comixCloud.alpha = m_comixCloud.alpha - 4 * param1;
                        if (_loc_3 <= 0)
                        {
                            m_showCloudState = 3;
                            m_comixCloud.visible = false;
                        }
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            if (!m_isSafed && !m_isDead)
            {
                m_healthWithoutDamage = m_healthWithoutDamage + m_dieSpeed * param1;
                var _loc_3:* = m_health + m_dieSpeed * param1;
                m_health = m_health + m_dieSpeed * param1;
                if (_loc_3 <= 0)
                {
                    SoundManager.play(SoundConst.DEATH_CRY);
                    PlayState.getInstance().onHangerDead(this);
                    m_isDead = true;
                    m_healthClip.visible = false;
                    if (m_comixCloud)
                    {
                        m_comixCloud.visible = false;
                    }
                }
            }
            if (m_destroyBuffer.length != 0)
            {
                for each (_loc_2 in m_destroyBuffer)
                {
                    
                    if (_loc_2.GetUserData())
                    {
                        _loc_2.GetUserData().parent.removeChild(_loc_2.GetUserData());
                    }
                    m_world.DestroyBody(_loc_2);
                }
                m_destroyBuffer.length = 0;
                m_chain.length = 0;
            }
            calcHealthClip(false);
            calcComixCloudPos();
            return;
        }// end function

        override public function goTop(param1:Sprite, param2:Sprite, param3:Sprite, param4:Sprite, param5:Sprite) : void
        {
            param5.addChild(m_healthClip);
            if (m_comixCloud)
            {
                param5.addChild(m_comixCloud);
            }
            return;
        }// end function

        public function getHealth() : Number
        {
            return m_health;
        }// end function

        override public function onArrowHeadContact(param1:Arrow, param2:b2Fixture) : void
        {
            if (param1.canInjure())
            {
                if (m_ragdoll.getAllPaths().indexOf(param2.GetBody()) != -1)
                {
                    var _loc_4:* = m_arrowsInBody + 1;
                    m_arrowsInBody = _loc_4;
                    if (param1.contactWithManBody(param2.GetBody(), !m_isDead))
                    {
                        if (!m_isDead)
                        {
                            PlayState.getInstance().createBlood(param2.GetBody().GetPosition());
                        }
                        if (!m_isSafed)
                        {
                            m_health = m_health - m_arrowDamage;
                            showCloud();
                        }
                        calcHealthClip(true);
                    }
                }
            }
            checkRopeKill(param1, param2);
            return;
        }// end function

        override public function onArrowContact(param1:Arrow, param2:b2Fixture) : void
        {
            checkRopeKill(param1, param2);
            return;
        }// end function

        public function makeLookUgly() : void
        {
            m_healthClip.visible = false;
            m_faceColor.gotoAndStop(4);
            m_dieSpeed = 0;
            return;
        }// end function

        public function haveChainSection(param1:b2Body) : Boolean
        {
            return m_chain.indexOf(param1) != -1;
        }// end function

        public function showCloudNow() : void
        {
            m_comixCloudTime = Number.MAX_VALUE;
            m_comixCloud.visible = true;
            m_showCloudState = 1;
            return;
        }// end function

    }
}
