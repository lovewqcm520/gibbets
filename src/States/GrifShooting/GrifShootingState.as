package States.GrifShooting
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Box2D.Dynamics.Contacts.*;
    import Box2D.Dynamics.Joints.*;
    import Main.*;
    import States.*;
    import States.PlayState.*;
    import Utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.utils.*;

    public class GrifShootingState extends PhysGameState
    {
        private var m_timeLeft:int;
        private var m_nextState:GrifShootingWinState = null;
        private var m_spawnVultureTimer:Timer;
        private var m_shootingPower:Number;
        private var m_arrowsLayer:Sprite;
        private var m_totalArrowCount:int;
        private var m_contactListener:b2ContactListener;
        private var m_mapObjects:Array;
        private var m_sightClip:MovieClip;
        private var m_state:int = -1;
        private var m_cloudsLayer:Sprite;
        private var m_allStones:Array;
        private var m_randomCounter:int = 0;
        private var m_guiLayer:Sprite;
        private var m_arrowHeadsToBodyContacts:Dictionary;
        private const STATE_SHOOTING:int = 2;
        private const STATE_NORMAL:int = 0;
        private const STATE_TAKE_AIM:int = 1;
        private var m_arrowBodyToBodyContacts:Dictionary;
        private var m_layersContainer:Sprite;
        private var m_nextStateTimer:Timer;
        private var m_arrows:Array;
        private var m_lastSection:int = -1;
        private var m_staticLayer:Sprite;
        private const STATE_NOT_INITILIAZED:int = -1;
        private var m_frontLayer:Sprite;
        private var m_arrowsLeft:int;
        private var m_tmpScores:int = 0;
        private var m_dynamicLayer:Sprite;
        private var m_timer:Timer;
        private var m_backgroundLayer:Sprite;
        private var m_bow:Bow;
        public static var m_vulturesKilled:int;
        private static var m_instance:GrifShootingState = null;
        public static var m_currentScores:int = 0;
        public static var m_curLevel:int;
        public static var m_wasStar:Boolean = true;
        public static var m_arrowsUsed:int;

        public function GrifShootingState(param1:int)
        {
            m_allStones = new Array();
            m_mapObjects = new Array();
            m_guiLayer = new Sprite();
            m_spawnVultureTimer = new Timer(3000);
            m_layersContainer = new Sprite();
            m_backgroundLayer = new Sprite();
            m_cloudsLayer = new Sprite();
            m_staticLayer = new Sprite();
            m_dynamicLayer = new Sprite();
            m_frontLayer = new Sprite();
            m_arrowsLayer = new Sprite();
            m_arrows = new Array();
            m_contactListener = new GrifContactListener();
            m_sightClip = new Sight();
            m_nextStateTimer = new Timer(3000, 1);
            m_timer = new Timer(1000);
            m_arrowBodyToBodyContacts = new Dictionary();
            m_arrowHeadsToBodyContacts = new Dictionary();
            m_curLevel = param1;
            m_instance = this;
            m_timeLeft = 90 + param1 / 6 * 10;
            m_totalArrowCount = 15 + param1 / 6 * 2;
            m_arrowsLeft = m_totalArrowCount;
            if (GameData.haveAchievement(Achievements.GRIFS_KILLED))
            {
                m_arrowsLeft = m_arrowsLeft + 10;
            }
            return;
        }// end function

        private function onSpawnVulture(event:TimerEvent) : void
        {
            var _loc_2:b2Vec2 = null;
            var _loc_3:Number = NaN;
            var _loc_10:int = 0;
            while (_loc_10 == m_lastSection)
            {
                
                _loc_10 = MathUtils.RandomRangeInt(0, 2);
            }
            m_lastSection = _loc_10;
            switch(_loc_10)
            {
                case 0:
                {
                    _loc_2 = new b2Vec2(300 / m_physScale + MathUtils.RandomRange(-45, 45) / m_physScale, -100 / m_physScale);
                    _loc_3 = MathUtils.RandomRange(2.2, 2.6);
                    break;
                }
                case 1:
                {
                    _loc_2 = new b2Vec2(450 / m_physScale + MathUtils.RandomRange(-45, 45) / m_physScale, 580 / m_physScale);
                    _loc_3 = MathUtils.RandomRange(-2.4, -2);
                    break;
                }
                case 2:
                {
                    _loc_2 = new b2Vec2(600 / m_physScale + MathUtils.RandomRange(-45, 5) / m_physScale, -100 / m_physScale);
                    _loc_3 = MathUtils.RandomRange(1.6, 2);
                    break;
                }
                default:
                {
                    break;
                }
            }
            m_spawnVultureTimer.delay = MathUtils.RandomRangeInt(1000, 3000);
            spawnObjectOnShelf(_loc_2, _loc_3, _loc_10);
            var _loc_4:* = new b2Vec2(50 / m_physScale, 8 / m_physScale);
            var _loc_5:* = new VultureShelf(_loc_3, _loc_4);
            var _loc_6:* = new b2BodyDef();
            new b2BodyDef().type = b2Body.b2_dynamicBody;
            _loc_6.position = new b2Vec2(_loc_2.x, _loc_2.y + 20 / m_physScale);
            var _loc_7:* = m_world.CreateBody(_loc_6);
            var _loc_8:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(_loc_4.x / 2, _loc_4.y / 2);
            var _loc_9:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_8;
            _loc_9.density = 1000;
            _loc_9.restitution = 0.5;
            _loc_9.friction = 0.5;
            _loc_7.CreateFixture(_loc_9);
            m_staticLayer.addChild(_loc_5);
            _loc_5.connectWithBody(_loc_7);
            _loc_5.x = _loc_7.GetPosition().x * m_physScale;
            _loc_5.y = _loc_7.GetPosition().y * m_physScale;
            m_mapObjects.push(_loc_5);
            return;
        }// end function

        private function spawnVultureOnShelf(param1:b2Vec2, param2:Number, param3:int) : void
        {
            var _loc_5:int = 0;
            var _loc_4:* = new b2Vec2(47 / m_physScale, 51 / m_physScale);
            var _loc_6:* = new b2BodyDef();
            new b2BodyDef().type = b2Body.b2_dynamicBody;
            _loc_6.position = param1.Copy();
            var _loc_7:* = m_world.CreateBody(_loc_6);
            var _loc_8:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(_loc_4.x, _loc_4.y / 6);
            _loc_5 = 0;
            while (_loc_5 < 4)
            {
                
                _loc_8.GetVertices()[_loc_5].y = _loc_8.GetVertices()[_loc_5].y - _loc_4.y / 3;
                _loc_5++;
            }
            var _loc_9:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_8;
            var _loc_10:* = _loc_7.CreateFixture(_loc_9);
            _loc_7.CreateFixture(_loc_9).SetSensor(true);
            var _loc_11:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(_loc_4.x / 7, 13 / m_physScale);
            var _loc_12:* = new b2FixtureDef();
            new b2FixtureDef().density = 1;
            _loc_12.restitution = 0.2;
            _loc_12.friction = 0.5;
            _loc_12.shape = _loc_11;
            var _loc_13:* = _loc_7.CreateFixture(_loc_12);
            var _loc_14:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(_loc_4.x, _loc_4.y / 7);
            _loc_5 = 0;
            while (_loc_5 < 4)
            {
                
                _loc_14.GetVertices()[_loc_5].y = _loc_14.GetVertices()[_loc_5].y + _loc_4.y / 3;
                _loc_5++;
            }
            var _loc_15:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_14;
            var _loc_16:* = _loc_7.CreateFixture(_loc_15);
            _loc_7.CreateFixture(_loc_15).SetSensor(true);
            var _loc_17:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(_loc_4.x / 7, 19 / m_physScale);
            var _loc_18:* = new b2FixtureDef();
            new b2FixtureDef().density = 0;
            _loc_18.friction = 0.1;
            _loc_18.restitution = 0;
            _loc_18.shape = _loc_17;
            _loc_18.filter.groupIndex = -1;
            var _loc_19:* = _loc_7.CreateFixture(_loc_18);
            var _loc_20:* = new DeathVulture(_loc_10, _loc_13, _loc_16, param3);
            m_dynamicLayer.addChild(_loc_20);
            _loc_20.connectWithBody(_loc_7);
            m_mapObjects.push(_loc_20);
            _loc_20.stop();
            _loc_20.x = param1.x * m_physScale;
            _loc_20.y = param1.y * m_physScale;
            return;
        }// end function

        private function spawnAmmoGhost(param1:b2Vec2, param2:Number, param3:int) : void
        {
            var _loc_4:VultureAmmoGhost = null;
            switch(param3)
            {
                case 0:
                case 1:
                {
                    _loc_4 = new VultureAmmoGhost(param2);
                    _loc_4.setPower(3);
                    _loc_4.addChild(new AmmoGhost3());
                    break;
                }
                case 2:
                {
                    _loc_4 = new VultureAmmoGhost(param2);
                    _loc_4.setPower(5);
                    _loc_4.addChild(new AmmoGhost5());
                    break;
                }
                default:
                {
                    break;
                }
            }
            _loc_4.x = param1.x * m_physScale;
            _loc_4.y = param1.y * m_physScale;
            var _loc_5:* = new b2BodyDef();
            new b2BodyDef().position = param1;
            _loc_5.type = b2Body.b2_dynamicBody;
            var _loc_6:* = m_world.CreateBody(_loc_5);
            var _loc_7:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(_loc_4.width / 2 / m_physScale, _loc_4.height / 2 / m_physScale);
            var _loc_8:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_7;
            var _loc_9:* = _loc_6.CreateFixture(_loc_8);
            _loc_4.connectWithBody(_loc_6);
            m_dynamicLayer.addChild(_loc_4);
            m_mapObjects.push(_loc_4);
            return;
        }// end function

        public function onVultureKill(param1:b2Vec2, param2:int) : void
        {
            var _loc_3:int = 100;
            switch(param2)
            {
                case 0:
                {
                    _loc_3 = 100;
                    break;
                }
                case 1:
                {
                    _loc_3 = 200;
                    break;
                }
                case 2:
                {
                    _loc_3 = 400;
                    break;
                }
                default:
                {
                    break;
                }
            }
            if (GameData.haveAchievement(Achievements.ACCURACY_70))
            {
                _loc_3 = _loc_3 + 50;
            }
            var _loc_4:* = new AddPointsEffect(_loc_3, 1, param1.x * m_physScale, param1.y * m_physScale);
            m_frontLayer.addChild(_loc_4);
            m_mapObjects.push(_loc_4);
            createBlood(param1);
            var _loc_5:* = new VultureFeathers();
            m_arrowsLayer.addChild(_loc_5);
            _loc_5.x = param1.x * m_physScale + 13;
            _loc_5.y = param1.y * m_physScale - 45;
            if (Math.random() < 0.5)
            {
                _loc_5.scaleX = -1;
            }
            var _loc_6:* = MathUtils.RandomRange(0.95, 1.05);
            _loc_5.scaleX = _loc_5.scaleX * _loc_6;
            _loc_5.scaleY = _loc_5.scaleY * _loc_6;
            m_mapObjects.push(_loc_5);
            addScores(_loc_3);
            var _loc_8:* = m_vulturesKilled + 1;
            m_vulturesKilled = _loc_8;
            return;
        }// end function

        private function addScores(param1:int) : void
        {
            m_currentScores = m_currentScores + param1;
            return;
        }// end function

        private function recalcGui() : void
        {
            m_view.m_arrowsLeftClip.m_text.text = m_arrowsLeft.toString();
            var _loc_1:* = m_currentScores.toString();
            switch(m_tmpScores.toString().length)
            {
                case 4:
                {
                    _loc_1 = "0" + m_tmpScores.toString();
                    break;
                }
                case 3:
                {
                    _loc_1 = "00" + m_tmpScores.toString();
                    break;
                }
                case 2:
                {
                    _loc_1 = "000" + m_tmpScores.toString();
                    break;
                }
                case 1:
                {
                    _loc_1 = "0000" + m_tmpScores.toString();
                    break;
                }
                default:
                {
                    break;
                }
            }
            m_view.m_scoreClip.m_text.text = _loc_1;
            m_view.m_timeLeftClip.m_text.text = Utils.intToTimeString(m_timeLeft);
            return;
        }// end function

        private function onNextStateTimer(event:TimerEvent) : void
        {
            StateManager.getInstance().pushState(m_nextState);
            return;
        }// end function

        private function onMenuClick(event:MouseEvent) : void
        {
            if (m_nextState == null)
            {
                SoundManager.play(SoundConst.CLICK);
                StateManager.getInstance().coolChangeState(GameData.getSelectLevelScreen());
            }
            return;
        }// end function

        private function setState(param1:int) : void
        {
            m_state = param1;
            switch(param1)
            {
                case STATE_NORMAL:
                {
                    m_sightClip.visible = false;
                    break;
                }
                case STATE_TAKE_AIM:
                {
                    m_sightClip.visible = true;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function updateScores() : void
        {
            if (m_tmpScores < m_currentScores)
            {
                m_tmpScores = m_tmpScores + 21;
                if (m_tmpScores > m_currentScores)
                {
                    m_tmpScores = m_currentScores;
                }
            }
            return;
        }// end function

        override public function handleKeyDown(event:KeyboardEvent) : void
        {
            super.handleKeyDown(event);
            if (event.keyCode == Keyboard.DOWN)
            {
                m_debugSprite.visible = !m_debugSprite.visible;
            }
            return;
        }// end function

        public function createBlood(param1:b2Vec2) : void
        {
            var _loc_3:int = 0;
            var _loc_4:b2BodyDef = null;
            var _loc_5:b2Body = null;
            var _loc_6:b2PolygonShape = null;
            var _loc_7:b2FixtureDef = null;
            var _loc_8:b2Fixture = null;
            var _loc_9:Blood = null;
            if (GameData.m_isBloodDisabled)
            {
                return;
            }
            var _loc_2:* = MathUtils.RandomRangeInt(6, 10);
            while (_loc_3 < _loc_2)
            {
                
                _loc_4 = new b2BodyDef();
                _loc_4.position = param1;
                _loc_4.type = b2Body.b2_dynamicBody;
                _loc_4.angle = MathUtils.GradToRad(MathUtils.RandomRange(0, Math.PI * 2));
                _loc_5 = m_world.CreateBody(_loc_4);
                _loc_6 = new b2PolygonShape();
                _loc_6.SetAsBox(1 / m_physScale, 1 / m_physScale);
                _loc_7 = new b2FixtureDef();
                _loc_7.shape = _loc_6;
                _loc_8 = _loc_5.CreateFixture(_loc_7);
                _loc_8.SetSensor(true);
                _loc_5.ApplyImpulse(new b2Vec2(MathUtils.RandomRange(0, 2.7), MathUtils.RandomRange(0, -3)), param1);
                _loc_5.ApplyTorque(MathUtils.RandomRange(-1, 1));
                _loc_9 = new Blood();
                _loc_9.connectWithBody(_loc_5);
                m_arrowsLayer.addChild(_loc_9);
                m_mapObjects.push(_loc_9);
                _loc_3++;
            }
            return;
        }// end function

        private function onTimerTick(event:TimerEvent) : void
        {
            var _loc_2:TimeIsOutEffect = null;
            if (m_nextState == null)
            {
                if (--m_timeLeft == 0)
                {
                    _loc_2 = new TimeIsOutEffect();
                    addChild(_loc_2);
                    m_mapObjects.push(_loc_2);
                    win();
                }
            }
            return;
        }// end function

        public function onContactWithArrowHeadBody(param1:Arrow, param2:b2Fixture) : void
        {
            var _loc_6:MapObject = null;
            var _loc_7:b2RevoluteJointDef = null;
            var _loc_8:b2AABB = null;
            var _loc_9:b2Vec2 = null;
            var _loc_3:Boolean = false;
            var _loc_4:Boolean = false;
            var _loc_5:Boolean = false;
            for each (_loc_6 in m_mapObjects)
            {
                
                if (_loc_6.isItYourFixture(param2))
                {
                    _loc_6.onArrowHeadContact(param1, param2);
                    if (_loc_6 is Sun)
                    {
                        _loc_3 = true;
                    }
                    if (_loc_6 is DeathVulture)
                    {
                        _loc_4 = true;
                    }
                    if (_loc_6 is VultureAmmoGhost)
                    {
                        _loc_5 = true;
                    }
                    break;
                }
            }
            if (!param2.IsSensor() && !param1.isStickIn() && param1.canStickIn() && m_allStones.indexOf(param2) == -1)
            {
                if (!_loc_5)
                {
                    if (_loc_4)
                    {
                        SoundManager.play(MathUtils.anyOfString(SoundConst.STICK_IN_BODY_0, SoundConst.STICK_IN_BODY_1, SoundConst.STICK_IN_BODY_2));
                    }
                    else
                    {
                        SoundManager.play(SoundConst.STICK_IN_WOOD);
                    }
                }
                param1.stopFly();
                param1.stickIn();
                if (_loc_3)
                {
                    m_backgroundLayer.addChild(param1);
                }
                _loc_7 = new b2RevoluteJointDef();
                _loc_7.lowerAngle = MathUtils.RandomRange((-Math.PI) / 8, (-Math.PI) / 12);
                _loc_7.upperAngle = MathUtils.RandomRange(Math.PI / 12, Math.PI / 8);
                _loc_7.enableLimit = true;
                _loc_8 = param1.getHeadFixture().GetAABB();
                _loc_9 = new b2Vec2((_loc_8.lowerBound.x + _loc_8.upperBound.x) / 2, (_loc_8.lowerBound.y + _loc_8.upperBound.y) / 2);
                _loc_7.Initialize(param1.getBody(), param2.GetBody(), _loc_9);
                m_world.CreateJoint(_loc_7);
                if (param2.GetBody().GetType() == b2Body.b2_dynamicBody)
                {
                    param1.resumeFly();
                }
            }
            if (!param2.IsSensor())
            {
                param1.onAnyContact();
            }
            return;
        }// end function

        public function onContactWithArrowBody(param1:Arrow, param2:b2Fixture) : void
        {
            var _loc_3:MapObject = null;
            for each (_loc_3 in m_mapObjects)
            {
                
                if (_loc_3.isItYourFixture(param2))
                {
                    _loc_3.onArrowContact(param1, param2);
                    break;
                }
            }
            if (!param2.IsSensor())
            {
                param1.onAnyContact();
            }
            return;
        }// end function

        public function createArrow(param1:b2Vec2, param2:b2Vec2) : Arrow
        {
            var _loc_3:* = new b2BodyDef();
            _loc_3.type = b2Body.b2_dynamicBody;
            _loc_3.position = param1;
            var _loc_4:* = m_world.CreateBody(_loc_3);
            var _loc_5:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(Arrow.m_halfWidth / m_physScale, Arrow.m_halfWidth / m_physScale);
            var _loc_6:int = 0;
            while (_loc_6 < _loc_5.GetVertexCount())
            {
                
                _loc_5.GetVertices()[_loc_6].Add(new b2Vec2(0, (-(Arrow.m_halfHeight + Arrow.m_halfWidth)) / m_physScale));
                _loc_6++;
            }
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_5;
            _loc_7.density = 2.5;
            _loc_7.friction = 0.5;
            _loc_7.restitution = 0.1;
            _loc_7.filter.groupIndex = -1;
            var _loc_8:* = _loc_4.CreateFixture(_loc_7);
            var _loc_9:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(Arrow.m_halfWidth / m_physScale, Arrow.m_halfHeight / m_physScale);
            var _loc_10:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_9;
            _loc_10.density = 2.5;
            _loc_10.friction = 0.5;
            _loc_10.restitution = 0.1;
            _loc_10.filter.groupIndex = -1;
            var _loc_11:* = _loc_4.CreateFixture(_loc_10);
            _loc_4.SetLinearVelocity(param2);
            _loc_4.SetBullet(true);
            var _loc_12:* = new Arrow(_loc_8, _loc_11, _loc_4);
            new Arrow(_loc_8, _loc_11, _loc_4).cacheAsBitmap = true;
            m_arrows.push(_loc_12);
            _loc_4.SetUserData(_loc_12);
            m_arrowsLayer.addChild(_loc_12);
            return _loc_12;
        }// end function

        override public function onStop() : void
        {
            m_spawnVultureTimer.stop();
            m_timer.stop();
            return;
        }// end function

        private function spawnTimeGhost(param1:b2Vec2, param2:Number, param3:int) : void
        {
            return;
        }// end function

        public function addArrows(param1:int, param2:Number, param3:Number) : void
        {
            var _loc_6:* = m_vulturesKilled + 1;
            m_vulturesKilled = _loc_6;
            m_arrowsLeft = m_arrowsLeft + param1;
            recalcGui();
            var _loc_4:* = new AddPointsEffect(param1, 1, param2, param3, " arrows");
            m_frontLayer.addChild(_loc_4);
            m_mapObjects.push(_loc_4);
            return;
        }// end function

        private function checkOutOfArrows() : void
        {
            var _loc_1:Arrow = null;
            var _loc_2:OutOfArrowsEffect = null;
            if (m_nextState)
            {
                return;
            }
            if (m_arrowsLeft == 0)
            {
                for each (_loc_1 in m_arrows)
                {
                    
                    if (_loc_1.isNeeded())
                    {
                        return;
                    }
                }
                _loc_2 = new OutOfArrowsEffect();
                addChild(_loc_2);
                m_mapObjects.push(_loc_2);
                win();
                if (GrifShootingState.m_vulturesKilled / GrifShootingState.m_arrowsUsed >= 0.7)
                {
                    GameData.giveAchievement(Achievements.ACCURACY_70);
                }
            }
            return;
        }// end function

        override public function onInit() : void
        {
            m_arrowsUsed = 0;
            m_vulturesKilled = 0;
            m_currentScores = 0;
            super.onInit();
            m_view = new GrifShootingStateView();
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_buttonReplay.addEventListener(MouseEvent.CLICK, onReplayClick);
            SoundManager.playLoop(SoundConst.MAIN_MENU_MUSIC);
            m_nextState = null;
            setState(STATE_NORMAL);
            addChild(m_layersContainer);
            m_layersContainer.addChild(m_backgroundLayer);
            m_layersContainer.addChild(m_cloudsLayer);
            m_layersContainer.addChild(m_staticLayer);
            m_layersContainer.addChild(m_dynamicLayer);
            m_layersContainer.addChild(m_frontLayer);
            m_layersContainer.addChild(m_arrowsLayer);
            addChild(m_debugSprite);
            addChild(m_guiLayer);
            m_world.SetContactListener(m_contactListener);
            m_bow = new Bow();
            addChild(m_bow);
            var _loc_1:* = m_curLevel < 10 ? ("Level0" + m_curLevel) : ("Level" + m_curLevel);
            parseLevel(parseClipToXML(new (ApplicationDomain.currentDomain.getDefinition(_loc_1) as Class)()));
            addChild(m_sightClip);
            m_sightClip.x = m_bow.x;
            m_sightClip.y = m_bow.y;
            recalcGui();
            m_guiLayer.addChild(m_view);
            if (m_state == STATE_NOT_INITILIAZED)
            {
                setState(STATE_NORMAL);
            }
            update(1 / 30);
            super.initDebugDraw();
            m_spawnVultureTimer.addEventListener(TimerEvent.TIMER, onSpawnVulture);
            m_spawnVultureTimer.start();
            m_nextStateTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onNextStateTimer);
            m_timer.addEventListener(TimerEvent.TIMER, onTimerTick);
            m_timer.start();
            var _loc_2:* = new VultureShootingRules();
            addChild(_loc_2);
            m_mapObjects.push(_loc_2);
            m_view.addChild(new MoreGamesPanel(LinksManager.MINIGAME_SCREEN, true));
            GameData.onStartLevel(m_curLevel);
            return;
        }// end function

        private function spawnObjectOnShelf(param1:b2Vec2, param2:Number, param3:int) : void
        {
            var _loc_5:* = m_randomCounter + 1;
            m_randomCounter = _loc_5;
            if (m_randomCounter % 13 == 0)
            {
                spawnAmmoGhost(param1, param2, param3);
            }
            else
            {
                spawnVultureOnShelf(param1, param2, param3);
            }
            return;
        }// end function

        private function parseLevel(param1:XML) : void
        {
            var _loc_2:MapObject = null;
            var _loc_3:Number = NaN;
            var _loc_4:Number = NaN;
            var _loc_5:b2Vec2 = null;
            var _loc_6:Number = NaN;
            var _loc_7:DisplayObject = null;
            for each (param1 in param1.elements("Object"))
            {
                
                _loc_3 = param1.@x;
                _loc_4 = param1.@y;
                _loc_5 = new b2Vec2(_loc_3 / m_physScale, _loc_4 / m_physScale);
                _loc_6 = param1.@rotation;
                if (this.String(param1.@clip_name) != "")
                {
                    _loc_7 = new (getDefinitionByName(param1.@clip_name) as Class)() as DisplayObject;
                    _loc_7.x = _loc_3;
                    _loc_7.y = _loc_4;
                    _loc_7.rotation = _loc_6;
                    _loc_7.cacheAsBitmap = true;
                }
                switch(this.String(param1.@type))
                {
                    case ParserConst.TYPE_STATIC_BOX:
                    {
                        m_allStones.push(createStaticBoxFromClip(_loc_7, m_staticLayer));
                        break;
                    }
                    case ParserConst.TYPE_GROUND:
                    {
                        _loc_7.scaleY = 0.75;
                        createStaticBoxFromClip(_loc_7, m_staticLayer);
                        _loc_7.scaleY = 1;
                        break;
                    }
                    case ParserConst.TYPE_CLOUD:
                    {
                        createCloud(_loc_7);
                        break;
                    }
                    case ParserConst.TYPE_SHOOTING_POINT:
                    {
                        m_bow.x = _loc_3;
                        m_bow.y = _loc_4;
                        m_bow.rotation = _loc_6 + 90;
                        break;
                    }
                    case ParserConst.TYPE_SUN:
                    {
                        createSun(_loc_5);
                        break;
                    }
                    case ParserConst.TYPE_BACKGROUND:
                    {
                        _loc_7.scaleX = param1.@scaleX;
                        _loc_7.scaleY = param1.@scaleY;
                        m_backgroundLayer.addChild(_loc_7);
                        break;
                    }
                    case ParserConst.TYPE_FRONTGROUND:
                    {
                        m_frontLayer.addChild(_loc_7);
                        break;
                    }
                    default:
                    {
                        break;
                    }
                }
            }
            for each (_loc_2 in m_mapObjects)
            {
                
                _loc_2.goTop(m_backgroundLayer, m_cloudsLayer, m_staticLayer, m_dynamicLayer, m_frontLayer);
            }
            return;
        }// end function

        private function onReplayClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(new GrifShootingState(GrifShootingState.m_curLevel));
            return;
        }// end function

        override public function handleMouseDown(event:MouseEvent) : void
        {
            super.handleMouseDown(event);
            switch(m_state)
            {
                case STATE_NORMAL:
                {
                    if (m_bow.hitTestPoint(event.stageX, event.stageY))
                    {
                        if (m_arrowsLeft > 0)
                        {
                            m_shootingPower = 10;
                            m_bow.startStretch();
                            setState(STATE_TAKE_AIM);
                            handleMouseMove(event);
                        }
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function createCloud(param1:DisplayObject) : void
        {
            m_cloudsLayer.addChild(param1);
            m_mapObjects.push(param1 as Cloud);
            return;
        }// end function

        public function createSun(param1:b2Vec2) : void
        {
            var _loc_2:* = new b2CircleShape(22 / m_physScale);
            var _loc_3:* = new b2FixtureDef();
            _loc_3.density = 1;
            _loc_3.friction = 0.4;
            _loc_3.restitution = 0.3;
            _loc_3.shape = _loc_2;
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().position = param1;
            _loc_4.type = b2Body.b2_dynamicBody;
            var _loc_5:* = m_world.CreateBody(_loc_4);
            m_world.CreateBody(_loc_4).CreateFixture(_loc_3);
            var _loc_6:* = new Sun();
            new Sun().connectWithBody(_loc_5);
            m_backgroundLayer.addChild(_loc_5.GetUserData());
            var _loc_7:* = new b2RevoluteJointDef();
            new b2RevoluteJointDef().maxMotorTorque = 0.5;
            _loc_7.motorSpeed = 0;
            _loc_7.enableMotor = true;
            _loc_7.Initialize(m_world.GetGroundBody(), _loc_5, param1);
            m_world.CreateJoint(_loc_7);
            m_mapObjects.push(_loc_6);
            return;
        }// end function

        private function updateArrows(param1:Number) : void
        {
            var _loc_3:Arrow = null;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            var _loc_2:* = new Array();
            for each (_loc_3 in m_arrows)
            {
                
                _loc_3.update(param1);
                _loc_4 = _loc_3.getBody().GetPosition().y * m_physScale;
                _loc_5 = _loc_3.getBody().GetPosition().x * m_physScale;
                if (_loc_4 < -200 || _loc_4 > Constant.WINDOW_HEIGHT + 200 || _loc_5 < -100 || _loc_5 > Constant.WINDOW_WIDTH + 100)
                {
                    _loc_3.kill();
                }
                if (!_loc_3.isDead())
                {
                    _loc_2.push(_loc_3);
                    continue;
                }
                _loc_3.destroyBody(m_world);
                m_arrowsLayer.removeChild(_loc_3);
            }
            m_arrows = _loc_2;
            return;
        }// end function

        public function onBeginContact(param1:b2Contact) : void
        {
            var _loc_4:Arrow = null;
            var _loc_2:* = param1.GetFixtureA();
            var _loc_3:* = param1.GetFixtureB();
            for each (_loc_4 in m_arrows)
            {
                
                if (_loc_2 == _loc_4.getBodyFixture())
                {
                    m_arrowBodyToBodyContacts[_loc_3] = _loc_4;
                }
                if (_loc_3 == _loc_4.getBodyFixture())
                {
                    m_arrowBodyToBodyContacts[_loc_2] = _loc_4;
                }
                if (_loc_2 == _loc_4.getHeadFixture())
                {
                    m_arrowHeadsToBodyContacts[_loc_3] = _loc_4;
                    if (!_loc_3.IsSensor() && !_loc_4.isStickIn() && _loc_4.canStickIn() && m_allStones.indexOf(_loc_3) == -1)
                    {
                        _loc_4.stopFly();
                    }
                }
                if (_loc_3 == _loc_4.getHeadFixture())
                {
                    m_arrowHeadsToBodyContacts[_loc_2] = _loc_4;
                    if (!_loc_2.IsSensor() && !_loc_4.isStickIn() && _loc_4.canStickIn() && m_allStones.indexOf(_loc_3) == -1)
                    {
                        _loc_4.stopFly();
                    }
                }
            }
            return;
        }// end function

        private function parseClipToXML(param1:MovieClip) : XML
        {
            var _loc_4:XML = null;
            var _loc_5:DisplayObject = null;
            var _loc_2:* = <Level></Level>;
            var _loc_3:int = 0;
            while (_loc_3 < param1.numChildren)
            {
                
                _loc_4 = <Object/>;
                _loc_5 = param1.getChildAt(_loc_3);
                if (_loc_5 is Cloud)
                {
                    _loc_4.@type = ParserConst.TYPE_CLOUD;
                }
                else if (_loc_5 is StaticBoxIsStone)
                {
                    _loc_4.@type = ParserConst.TYPE_STATIC_BOX;
                }
                else if (_loc_5 is BowPoint)
                {
                    _loc_4.@type = ParserConst.TYPE_SHOOTING_POINT;
                }
                else if (_loc_5 is Sun)
                {
                    _loc_4.@type = ParserConst.TYPE_SUN;
                }
                else if (_loc_5 is Frontground)
                {
                    _loc_4.@type = ParserConst.TYPE_FRONTGROUND;
                }
                else
                {
                    _loc_4.@scaleX = _loc_5.scaleX;
                    _loc_4.@scaleY = _loc_5.scaleY;
                    _loc_4.@type = ParserConst.TYPE_BACKGROUND;
                }
                _loc_4.@x = this.int(_loc_5.x + 0.5);
                _loc_4.@y = this.int(_loc_5.y + 0.5);
                _loc_4.@rotation = _loc_5.rotation;
                _loc_4.@clip_name = getQualifiedClassName(_loc_5);
                _loc_2.appendChild(_loc_4);
                _loc_3++;
            }
            return _loc_2;
        }// end function

        override public function onCleanup() : void
        {
            m_spawnVultureTimer.removeEventListener(TimerEvent.TIMER, onSpawnVulture);
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_buttonReplay.removeEventListener(MouseEvent.CLICK, onReplayClick);
            m_nextStateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onNextStateTimer);
            m_timer.removeEventListener(TimerEvent.TIMER, onTimerTick);
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            super.update(param1);
            m_bow.update(param1);
            processContacts();
            updateArrows(param1);
            updateMapObjects(param1);
            updateScores();
            checkOutOfArrows();
            recalcGui();
            return;
        }// end function

        override public function handleMouseMove(event:MouseEvent) : void
        {
            var _loc_2:Vector3 = null;
            super.handleMouseMove(event);
            switch(m_state)
            {
                case STATE_TAKE_AIM:
                {
                    _loc_2 = new Vector3(m_bow.x - event.stageX, m_bow.y - event.stageY, 0);
                    if (GameData.m_invertedControl)
                    {
                        _loc_2 = _loc_2.negate();
                    }
                    m_shootingPower = Constant.MIN_SHOOTING_POWER + _loc_2.length() / 7 * Math.pow(_loc_2.length() / Constant.MAX_SHOOTING_POWER, 0.4);
                    if (m_shootingPower < Constant.MIN_SHOOTING_POWER)
                    {
                        m_shootingPower = Constant.MIN_SHOOTING_POWER;
                    }
                    if (m_shootingPower > Constant.MAX_SHOOTING_POWER)
                    {
                        m_shootingPower = Constant.MAX_SHOOTING_POWER;
                    }
                    m_sightClip.scaleY = m_shootingPower / 33;
                    m_sightClip.rotation = _loc_2.get2DRotation();
                    m_bow.rotation = _loc_2.get2DRotation() + 90;
                    break;
                }
                case STATE_NORMAL:
                {
                    if (isMouseDown())
                    {
                        handleMouseDown(event);
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        private function updateMapObjects(param1:Number) : void
        {
            var _loc_3:MapObject = null;
            var _loc_2:* = new Array();
            for each (_loc_3 in m_mapObjects)
            {
                
                _loc_3.update(param1);
                if (!_loc_3.isDead())
                {
                    _loc_2.push(_loc_3);
                    continue;
                }
                _loc_3.onDead(m_world);
            }
            m_mapObjects = _loc_2;
            return;
        }// end function

        private function win() : void
        {
            if (m_nextState == null)
            {
                m_wasStar = m_vulturesKilled >= m_totalArrowCount / 3;
                GameData.onWinLevel(m_curLevel, m_currentScores, m_wasStar, 0);
                m_nextState = new GrifShootingWinState();
                m_spawnVultureTimer.stop();
                m_nextStateTimer.start();
            }
            return;
        }// end function

        override public function handleMouseUp(event:MouseEvent) : void
        {
            var _loc_2:b2Vec2 = null;
            var _loc_3:Arrow = null;
            super.handleMouseUp(event);
            if (m_state == STATE_TAKE_AIM)
            {
                m_bow.fire();
                SoundManager.play(SoundConst.BOW_SHOOT);
                setState(STATE_NORMAL);
                _loc_2 = new b2Vec2(m_bow.x - event.stageX, m_bow.y - event.stageY);
                if (GameData.m_invertedControl)
                {
                    _loc_2.NegativeSelf();
                }
                _loc_2.Normalize();
                _loc_2.Multiply(m_shootingPower);
                _loc_3 = createArrow(new b2Vec2(m_bow.x / m_physScale, m_bow.y / m_physScale), _loc_2);
                recalcGui();
                var _loc_5:* = m_arrowsLeft + 1;
                m_arrowsLeft = _loc_5;
                var _loc_5:* = m_arrowsUsed + 1;
                m_arrowsUsed = _loc_5;
            }
            super.handleMouseUp(event);
            return;
        }// end function

        private function processContacts() : void
        {
            var _loc_1:* = null;
            for (_loc_1 in m_arrowBodyToBodyContacts)
            {
                
                onContactWithArrowBody(m_arrowBodyToBodyContacts[_loc_1], _loc_1);
            }
            m_arrowBodyToBodyContacts = new Dictionary();
            for (_loc_1 in m_arrowHeadsToBodyContacts)
            {
                
                onContactWithArrowHeadBody(m_arrowHeadsToBodyContacts[_loc_1], _loc_1);
            }
            m_arrowHeadsToBodyContacts = new Dictionary();
            return;
        }// end function

        override public function onResume() : void
        {
            m_spawnVultureTimer.start();
            m_timer.start();
            return;
        }// end function

        public static function getInstance() : GrifShootingState
        {
            return m_instance;
        }// end function

    }
}

class GrifContactListener extends b2ContactListener
{

    function GrifContactListener()
    {
        return;
    }// end function

    override public function BeginContact(param1:b2Contact) : void
    {
        if (param1.GetFixtureA().GetBody().GetUserData() is Arrow && param1.GetFixtureA().GetBody().GetUserData().isNeeded())
        {
            GrifShootingState.getInstance().onBeginContact(param1);
            return;
        }
        if (param1.GetFixtureB().GetBody().GetUserData() is Arrow && (param1.GetFixtureB().GetBody().GetUserData() as Arrow).isNeeded())
        {
            GrifShootingState.getInstance().onBeginContact(param1);
            return;
        }
        return;
    }// end function

}

