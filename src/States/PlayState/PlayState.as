package States.PlayState
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Box2D.Dynamics.Contacts.*;
    import Box2D.Dynamics.Joints.*;
    import Main.*;
    import Ragdoll.*;
    import States.*;
    import Utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.system.*;
    import flash.ui.*;
    import flash.utils.*;

    public class PlayState extends PhysGameState
    {
        private var m_nextState:GameState = null;
        private var m_shootingPower:Number;
        private var m_arrowsLayer:Sprite;
        private var m_contactListener:b2ContactListener;
        private var m_mapObjects:Array;
        private var m_camera:Camera;
        private const STATE_TELEPORT:int = 3;
        private var m_sightClip:MovieClip;
        private var m_state:int = -1;
        private var m_turtorialFrame:TurtorialFrame;
        private var m_cloudsLayer:Sprite;
        private var m_allStones:Array;
        private const STATE_SHOW_HIGHLIGHT:int = 5;
        private var m_guiLayer:Sprite;
        private var m_arrowHeadsToBodyContacts:Dictionary;
        private const STATE_SHOOTING:int = 2;
        private const STATE_NORMAL:int = 0;
        private var m_turtorialFrames:Array;
        private const STATE_TAKE_AIM:int = 1;
        private var m_arrowBodyToBodyContacts:Dictionary;
        private var m_layersContainer:Sprite;
        private var m_nextStateTimer:Timer;
        private var m_arrows:Array;
        private var m_staticLayer:Sprite;
        private const STATE_NOT_INITILIAZED:int = -1;
        private var m_frontLayer:Sprite;
        private var m_oldSightClip:MovieClip;
        private var m_arrowsLeft:int;
        private var m_tmpScores:int = 0;
        private var m_gibbetsOnLevel:int;
        private var m_savedCount:int = 0;
        private var m_dynamicLayer:Sprite;
        private const STATE_SCROLLING_FORWARD:int = 4;
        private var m_backgroundLayer:Sprite;
        private var m_bow:Bow;
        private static var m_instance:PlayState = null;
        public static var m_currentScores:int = 0;
        public static var m_deadID:int;
        public static var m_curLevel:int = 0;
        public static var m_wasStar:Boolean = true;
        public static var m_arrowsUsed:int;

        public function PlayState(param1:int)
        {
            m_mapObjects = new Array();
            m_turtorialFrames = new Array();
            m_guiLayer = new Sprite();
            m_layersContainer = new Sprite();
            m_backgroundLayer = new Sprite();
            m_cloudsLayer = new Sprite();
            m_staticLayer = new Sprite();
            m_dynamicLayer = new Sprite();
            m_frontLayer = new Sprite();
            m_arrowsLayer = new Sprite();
            m_arrows = new Array();
            m_contactListener = new MyContactListener();
            m_sightClip = new Sight();
            m_oldSightClip = new Sight();
            m_nextStateTimer = new Timer(2500, 1);
            m_arrowBodyToBodyContacts = new Dictionary();
            m_arrowHeadsToBodyContacts = new Dictionary();
            m_allStones = new Array();
            m_curLevel = param1;
            m_instance = this;
            return;
        }// end function

        public function onHangerDead(param1:Gibbet) : void
        {
            m_deadID = param1.getPersID();
            recalcGui();
            var _loc_2:* = param1.getHeadPosition();
            var _loc_3:* = new (getDefinitionByName("Soul" + param1.getPersID()) as Class)();
            addChild(_loc_3);
            _loc_3.x = _loc_2.x * m_physScale + m_layersContainer.x;
            _loc_3.y = _loc_2.y * m_physScale + m_layersContainer.y;
            m_mapObjects.push(_loc_3);
            lose();
            m_camera.onHangerDead();
            return;
        }// end function

        public function onHangerSafe(param1:int, param2:Gibbet) : void
        {
            var _loc_3:b2Vec2 = null;
            var _loc_4:int = 0;
            var _loc_5:AddPointsEffect = null;
            if (!param2.isKilled())
            {
                var _loc_7:* = m_savedCount + 1;
                m_savedCount = _loc_7;
                _loc_3 = param2.getHeadPosition();
                _loc_4 = param2.getHealth() * 1000 * param1;
                if (_loc_4 < 100)
                {
                    _loc_4 = 100;
                }
                if (GameData.haveAchievement(Achievements.LEVELS_WITHOUT_LOSE))
                {
                    _loc_4 = _loc_4 + 100;
                }
                if (GameData.haveAchievement(Achievements.LEVELS_WITHOUT_INJURE))
                {
                    _loc_4 = _loc_4 + 200;
                }
                _loc_4 = _loc_4 - _loc_4 % 10;
                addScores(_loc_4);
                _loc_5 = new AddPointsEffect(_loc_4, param1, _loc_3.x * m_physScale, _loc_3.y * m_physScale);
                m_frontLayer.addChild(_loc_5);
                m_mapObjects.push(_loc_5);
                var _loc_7:* = m_gibbetsOnLevel - 1;
                m_gibbetsOnLevel = _loc_7;
                recalcGui();
                testEndLevel();
            }
            m_camera.onHangerSave();
            return;
        }// end function

        public function createGibbetObliquely(param1:DisplayObject, param2:Boolean) : void
        {
            var _loc_3:* = new b2BodyDef();
            _loc_3.position.x = param1.x / m_physScale;
            _loc_3.position.y = param1.y / m_physScale;
            var _loc_4:* = new b2PolygonShape();
            var _loc_5:* = new Array();
            if (param2)
            {
                _loc_5.push(new b2Vec2(-22 / m_physScale, -19 / m_physScale));
                _loc_5.push(new b2Vec2(-14 / m_physScale, -19 / m_physScale));
                _loc_5.push(new b2Vec2(22 / m_physScale, 12 / m_physScale));
                _loc_5.push(new b2Vec2(22 / m_physScale, 20 / m_physScale));
            }
            else
            {
                _loc_5.push(new b2Vec2(-22 / m_physScale, 20 / m_physScale));
                _loc_5.push(new b2Vec2(-22 / m_physScale, 12 / m_physScale));
                _loc_5.push(new b2Vec2(14 / m_physScale, -19 / m_physScale));
                _loc_5.push(new b2Vec2(22 / m_physScale, -19 / m_physScale));
            }
            _loc_4.SetAsVector(_loc_5, _loc_5.length);
            var _loc_6:* = m_world.CreateBody(_loc_3);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_4;
            _loc_6.CreateFixture(_loc_7);
            _loc_6.SetUserData(param1);
            m_staticLayer.addChild(param1);
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
            m_view.m_levelClip.m_text.text = ((m_curLevel + 1)).toString();
            return;
        }// end function

        public function getView() : Sprite
        {
            return m_view;
        }// end function

        private function lose() : void
        {
            m_nextState = new LoseState();
            m_nextStateTimer.start();
            return;
        }// end function

        public function setLongShootMode() : void
        {
            m_camera = new TargetedCamera();
            return;
        }// end function

        private function addScores(param1:int) : void
        {
            m_currentScores = m_currentScores + param1;
            return;
        }// end function

        private function testEndLevel() : void
        {
            if (m_gibbetsOnLevel == 0)
            {
                win();
                return;
            }
            return;
        }// end function

        public function startTeleportHere(param1:b2Vec2) : void
        {
            m_bow.startTeleport(new Point(param1.x * m_physScale, param1.y * m_physScale));
            setState(STATE_TELEPORT);
            return;
        }// end function

        public function addPointsAt(param1:b2Vec2, param2:int) : void
        {
            addScores(param2);
            var _loc_3:* = new AddPointsEffect(param2, 1, param1.x * m_physScale, param1.y * m_physScale);
            addChild(_loc_3);
            m_mapObjects.push(_loc_3);
            return;
        }// end function

        private function onNextStateTimer(event:TimerEvent) : void
        {
            m_tmpScores = m_currentScores;
            recalcGui();
            StateManager.getInstance().pushState(m_nextState);
            if (m_nextState is WinState)
            {
                GameData.onWinLevel(m_curLevel, m_currentScores, m_wasStar, m_savedCount);
            }
            return;
        }// end function

        private function updateTurtorialFrame(param1:Number) : void
        {
            if (m_turtorialFrame)
            {
                m_turtorialFrame.update(param1);
                if (m_turtorialFrame.isFinished() && !m_turtorialFrame.isShow())
                {
                    m_state = STATE_NORMAL;
                    m_turtorialFrame.removeEventListener(MouseEvent.CLICK, onTurtotialFrameClick);
                    this.removeChild(m_turtorialFrame.getTextClip());
                    this.removeChild(m_turtorialFrame.getClickSign());
                    this.removeChild(m_turtorialFrame.getCheckBox());
                    if (m_turtorialFrame.isNeedToHide())
                    {
                        m_turtorialFrames.length = 0;
                        GameData.hideTips();
                    }
                    this.removeChild(m_turtorialFrame);
                    m_turtorialFrame = null;
                    if (m_turtorialFrames.length != 0)
                    {
                        highlightZone(m_turtorialFrames.pop());
                    }
                }
            }
            else if (m_turtorialFrames.length != 0)
            {
                highlightZone(m_turtorialFrames.pop());
            }
            return;
        }// end function

        private function onMenuClick(event:MouseEvent) : void
        {
            if (m_nextState == null || m_nextState is LoseState)
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
                case STATE_TELEPORT:
                {
                    m_sightClip.visible = false;
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function getCurrentLevelCompleted() : int
        {
            return m_curLevel;
        }// end function

        override public function handleKeyDown(event:KeyboardEvent) : void
        {
            super.handleKeyDown(event);
            if (Constant.m_debugMode && event.keyCode == Keyboard.DOWN)
            {
                m_debugSprite.visible = !m_debugSprite.visible;
            }
            if (event.keyCode == 82)
            {
                onReplayClick(null);
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
            var _loc_2:* = MathUtils.RandomRangeInt(3, 8);
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
                _loc_5.ApplyImpulse(new b2Vec2(MathUtils.RandomRange(-0.7, 0.7), MathUtils.RandomRange(0, -3)), param1);
                _loc_5.ApplyTorque(MathUtils.RandomRange(-1, 1));
                _loc_9 = new Blood();
                _loc_9.connectWithBody(_loc_5);
                m_arrowsLayer.addChild(_loc_9);
                m_mapObjects.push(_loc_9);
                _loc_3++;
            }
            return;
        }// end function

        public function onContactWithArrowHeadBody(param1:Arrow, param2:b2Fixture) : void
        {
            var _loc_5:MapObject = null;
            var _loc_6:b2RevoluteJointDef = null;
            var _loc_7:b2AABB = null;
            var _loc_8:b2Vec2 = null;
            var _loc_3:Boolean = false;
            var _loc_4:Boolean = false;
            for each (_loc_5 in m_mapObjects)
            {
                
                if (_loc_5.isItYourFixture(param2))
                {
                    _loc_5.onArrowHeadContact(param1, param2);
                    if (_loc_5 is Gibbet)
                    {
                        _loc_3 = true;
                    }
                    if (_loc_5 is Sun)
                    {
                        _loc_4 = true;
                    }
                    break;
                }
            }
            if (!param2.IsSensor() && !param1.isStickIn() && param1.canStickIn() && m_allStones.indexOf(param2) == -1)
            {
                param1.stopFly();
                param1.stickIn();
                if (!_loc_3)
                {
                    SoundManager.play(SoundConst.STICK_IN_WOOD);
                }
                else
                {
                    SoundManager.play(MathUtils.anyOfString(SoundConst.STICK_IN_BODY_0, SoundConst.STICK_IN_BODY_1, SoundConst.STICK_IN_BODY_2));
                    m_staticLayer.addChild(param1);
                }
                if (_loc_4)
                {
                    m_backgroundLayer.addChild(param1);
                }
                _loc_6 = new b2RevoluteJointDef();
                _loc_6.lowerAngle = MathUtils.RandomRange((-Math.PI) / 8, (-Math.PI) / 12);
                _loc_6.upperAngle = MathUtils.RandomRange(Math.PI / 12, Math.PI / 8);
                _loc_6.enableLimit = true;
                _loc_7 = param1.getHeadFixture().GetAABB();
                _loc_8 = new b2Vec2((_loc_7.lowerBound.x + _loc_7.upperBound.x) / 2, (_loc_7.lowerBound.y + _loc_7.upperBound.y) / 2);
                _loc_6.Initialize(param1.getBody(), param2.GetBody(), _loc_8);
                m_world.CreateJoint(_loc_6);
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
            var _loc_6:* = m_physScale;
            _loc_5.SetAsArray([new b2Vec2((-Arrow.m_halfWidth) / _loc_6, (-Arrow.m_halfWidth) / _loc_6), new b2Vec2(0, (-Arrow.m_halfWidth) / _loc_6 * 1.05), new b2Vec2(Arrow.m_halfWidth / _loc_6, (-Arrow.m_halfWidth) / _loc_6), new b2Vec2(Arrow.m_halfWidth / _loc_6, Arrow.m_halfWidth / _loc_6), new b2Vec2((-Arrow.m_halfWidth) / _loc_6, Arrow.m_halfWidth / _loc_6)], 5);
            var _loc_7:int = 0;
            while (_loc_7 < _loc_5.GetVertexCount())
            {
                
                _loc_5.GetVertices()[_loc_7].Add(new b2Vec2(0, (-(Arrow.m_halfHeight + Arrow.m_halfWidth)) / m_physScale));
                _loc_7++;
            }
            var _loc_8:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_5;
            _loc_8.density = 2.5;
            _loc_8.friction = 0.5;
            _loc_8.restitution = 0.1;
            _loc_8.filter.groupIndex = -1;
            var _loc_9:* = _loc_4.CreateFixture(_loc_8);
            var _loc_10:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(Arrow.m_halfWidth / m_physScale, Arrow.m_halfHeight / m_physScale);
            var _loc_11:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_10;
            _loc_11.density = 2.5;
            _loc_11.friction = 0.5;
            _loc_11.restitution = 0.1;
            _loc_11.filter.groupIndex = -1;
            var _loc_12:* = _loc_4.CreateFixture(_loc_11);
            _loc_4.SetLinearVelocity(param2);
            _loc_4.SetBullet(true);
            var _loc_13:* = new Arrow(_loc_9, _loc_12, _loc_4);
            m_arrows.push(_loc_13);
            _loc_4.SetUserData(_loc_13);
            m_arrowsLayer.addChild(_loc_13);
            _loc_13.x = param1.x * m_physScale;
            _loc_13.y = param1.y * m_physScale;
            _loc_13.rotation = MathUtils.RadToGrad(_loc_4.GetAngle());
            if ((m_curLevel + 1) % 12 == 0)
            {
                _loc_13.setFreeFly();
            }
            return _loc_13;
        }// end function

        private function updateScores() : void
        {
            if (m_tmpScores < m_currentScores)
            {
                m_tmpScores = m_tmpScores + 31;
                if (m_tmpScores > m_currentScores)
                {
                    m_tmpScores = m_currentScores;
                }
            }
            return;
        }// end function

        private function highlightZone(param1:TurtorialFrame) : void
        {
            m_state = STATE_SHOW_HIGHLIGHT;
            if (m_turtorialFrame && m_turtorialFrame.parent)
            {
                if (m_turtorialFrame.getTextClip())
                {
                    m_turtorialFrame.getTextClip().removeEventListener(MouseEvent.CLICK, onTurtotialFrameClick);
                }
                if (m_turtorialFrame.getClickSign())
                {
                    m_turtorialFrame.getClickSign().removeEventListener(MouseEvent.CLICK, onTurtotialFrameClick);
                }
                m_turtorialFrame.removeEventListener(MouseEvent.CLICK, onTurtotialFrameClick);
                this.removeChild(m_turtorialFrame);
            }
            m_turtorialFrame = param1;
            this.addChild(m_turtorialFrame);
            var _loc_2:* = new ClickToContinue();
            _loc_2.buttonMode = true;
            this.addChild(_loc_2);
            _loc_2.x = 320;
            _loc_2.y = 460;
            m_turtorialFrame.setClickSign(_loc_2);
            var _loc_3:* = new HideTipsPanel();
            addChild(_loc_3);
            m_turtorialFrame.setCheckBox(_loc_3);
            m_turtorialFrame.addEventListener(MouseEvent.CLICK, onTurtotialFrameClick);
            m_turtorialFrame.getTextClip().addEventListener(MouseEvent.CLICK, onTurtotialFrameClick);
            m_turtorialFrame.getClickSign().addEventListener(MouseEvent.CLICK, onTurtotialFrameClick);
            this.addChild(m_turtorialFrame.getTextClip());
            return;
        }// end function

        public function createGibbletGround(param1:Number, param2:Number) : void
        {
            var _loc_3:* = new b2BodyDef();
            _loc_3.position.x = param1 / m_physScale;
            _loc_3.position.y = param2 / m_physScale;
            var _loc_4:* = new b2PolygonShape();
            var _loc_5:Array = [new b2Vec2(-75 / m_physScale, -33 / m_physScale), new b2Vec2(75 / m_physScale, -33 / m_physScale), new b2Vec2(30 / m_physScale, 27 / m_physScale), new b2Vec2(0 / m_physScale, 38 / m_physScale), new b2Vec2(-28 / m_physScale, 27 / m_physScale)];
            _loc_4.SetAsArray(_loc_5, _loc_5.length);
            var _loc_6:* = m_world.CreateBody(_loc_3);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_4;
            m_allStones.push(_loc_6.CreateFixture(_loc_7));
            _loc_6.SetUserData(new GibbetGround());
            m_staticLayer.addChild(_loc_6.GetUserData());
            return;
        }// end function

        public function boomAt(param1:b2Body) : void
        {
            var _loc_5:b2Body = null;
            var _loc_6:Object = null;
            var _loc_7:b2Vec2 = null;
            var _loc_8:Number = NaN;
            SoundManager.play(SoundConst.EXPLOISON);
            var _loc_2:* = param1.GetPosition();
            var _loc_3:* = new Array();
            var _loc_4:* = m_world.GetBodyList();
            while (_loc_4)
            {
                
                if (param1 == _loc_4)
                {
                }
                else
                {
                    _loc_6 = _loc_4.GetUserData();
                    if (_loc_6 is Box || _loc_6 is TNTBarrel)
                    {
                        _loc_7 = _loc_2.Copy();
                        _loc_7.Subtract(_loc_4.GetPosition());
                        _loc_8 = _loc_7.Length();
                        _loc_7.Normalize();
                        _loc_7.Multiply((-Constant.BOMB_IMPULSE) / (_loc_8 * _loc_8));
                        _loc_4.ApplyImpulse(_loc_7, _loc_4.GetPosition());
                        _loc_4.ApplyTorque(MathUtils.RandomRange(-0.01, 0.01));
                    }
                }
                _loc_4 = _loc_4.GetNext();
            }
            m_world.DestroyBody(param1);
            for each (_loc_5 in _loc_3)
            {
                
                m_world.DestroyBody(_loc_5);
            }
            return;
        }// end function

        private function checkOutOfArrows() : void
        {
            var _loc_1:OutOfArrowsEffect = null;
            if (m_nextState)
            {
                return;
            }
            if (m_arrowsLeft == 0)
            {
                if (m_arrows.length == 0)
                {
                    _loc_1 = new OutOfArrowsEffect();
                    addChild(_loc_1);
                    m_mapObjects.push(_loc_1);
                    lose();
                }
            }
            return;
        }// end function

        private function onTurtotialFrameClick(event:MouseEvent) : void
        {
            if (m_state == STATE_SHOW_HIGHLIGHT)
            {
                hideHighlight();
            }
            return;
        }// end function

        public function addArrows(param1:int, param2:Number, param3:Number) : void
        {
            m_arrowsLeft = m_arrowsLeft + param1;
            recalcGui();
            var _loc_4:* = new AddPointsEffect(param1, 1, param2, param3, " arrows");
            m_frontLayer.addChild(_loc_4);
            m_mapObjects.push(_loc_4);
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_1:String = null;
            var _loc_2:XML = null;
            var _loc_3:String = null;
            var _loc_4:XML = null;
            var _loc_5:TargetedCamera = null;
            super.onInit();
            m_view = new PlayStateView();
            m_view.m_buttonMenu.addEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_buttonReplay.addEventListener(MouseEvent.CLICK, onReplayClick);
            m_nextStateTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onNextStateTimer);
            if (m_camera)
            {
                SoundManager.playLoop(SoundConst.MAIN_MENU_MUSIC);
            }
            else if (m_curLevel % 2)
            {
                SoundManager.playLoop(SoundConst.AMBIENT_1);
            }
            else
            {
                SoundManager.playLoop(SoundConst.AMBIENT_2);
            }
            m_gibbetsOnLevel = 0;
            m_deadID = -1;
            m_arrowsUsed = 0;
            m_currentScores = 0;
            m_arrowsLeft = GameData.getArrowsLeft(m_curLevel);
            if (GameData.haveAchievement(Achievements.WITH_STAR_40))
            {
                var _loc_7:* = m_arrowsLeft + 1;
                m_arrowsLeft = _loc_7;
            }
            m_wasStar = true;
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
            m_frontLayer.addChild(m_bow);
            if (Constant.m_debugMode)
            {
                _loc_1 = m_curLevel < 10 ? ("Level0" + m_curLevel) : ("Level" + m_curLevel);
                _loc_2 = parseClipToXML(new (ApplicationDomain.currentDomain.getDefinition(_loc_1) as Class)());
                trace(_loc_2);
            }
            if (Levels.LEVELS[m_curLevel])
            {
                parseLevel(Levels.LEVELS[m_curLevel]);
            }
            else
            {
                _loc_3 = m_curLevel < 10 ? ("Level0" + m_curLevel) : ("Level" + m_curLevel);
                _loc_4 = parseClipToXML(new (ApplicationDomain.currentDomain.getDefinition(_loc_3) as Class)());
                parseLevel(_loc_4);
            }
            m_layersContainer.addChild(m_sightClip);
            m_sightClip.x = m_bow.x;
            m_sightClip.y = m_bow.y;
            recalcGui();
            m_guiLayer.addChild(m_view);
            if (m_state == STATE_NOT_INITILIAZED)
            {
                setState(STATE_NORMAL);
            }
            if (m_camera == null)
            {
                m_camera = new Camera();
            }
            m_camera.setStateClip(m_layersContainer);
            m_camera.setGUILayer(m_guiLayer);
            update(1 / 30);
            if (Constant.m_debugMode)
            {
                super.initDebugDraw();
            }
            m_view.addChild(new MoreGamesPanel(LinksManager.PLAYSTATE_SCREEN, true));
            GameData.onStartLevel(m_curLevel);
            if (m_camera is TargetedCamera)
            {
                _loc_5 = m_camera as TargetedCamera;
                _loc_5.setBow(m_bow);
                _loc_5.setState(TargetedCamera.SHOW_GIBBET);
            }
            return;
        }// end function

        private function onReplayClick(event:MouseEvent) : void
        {
            m_nextStateTimer.stop();
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().coolChangeState(GameData.getNextState(PlayState.m_curLevel));
            GameData.onRestart();
            return;
        }// end function

        private function hideHighlight() : void
        {
            if (m_turtorialFrame)
            {
                m_turtorialFrame.hide();
            }
            return;
        }// end function

        public function createTeleportGhost(param1:DisplayObject) : void
        {
            var _loc_2:* = new b2CircleShape(21 / m_physScale);
            var _loc_3:* = new b2FixtureDef();
            _loc_3.shape = _loc_2;
            _loc_3.isSensor = true;
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().position = new b2Vec2(param1.x / m_physScale, param1.y / m_physScale);
            var _loc_5:* = m_world.CreateBody(_loc_4);
            m_world.CreateBody(_loc_4).CreateFixture(_loc_3);
            var _loc_6:* = new TeleportGhost();
            new TeleportGhost().connectWithBody(_loc_5);
            m_dynamicLayer.addChild(_loc_6);
            m_mapObjects.push(_loc_6);
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
            var _loc_8:b2Fixture = null;
            var _loc_9:TurtorialFrame = null;
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
                }
                switch(this.String(param1.@type))
                {
                    case ParserConst.TYPE_EDGE_MARKER:
                    {
                        if (param1.@is_left == "true")
                        {
                            _loc_7.name = Constant.LEFT_EDGE_MARKER_NAME;
                        }
                        else
                        {
                            _loc_7.name = Constant.RIGHT_EDGE_MARKER_NAME;
                        }
                        m_layersContainer.addChild(_loc_7);
                        _loc_7.alpha = 0;
                        break;
                    }
                    case ParserConst.TYPE_STATIC_BOX:
                    {
                        _loc_7.cacheAsBitmap = true;
                        _loc_8 = createStaticBoxFromClip(_loc_7, m_staticLayer);
                        if (param1.@is_stone == "true")
                        {
                            m_allStones.push(_loc_8);
                        }
                        break;
                    }
                    case ParserConst.TYPE_GROUND:
                    {
                        _loc_7.cacheAsBitmap = true;
                        _loc_7.scaleY = 0.75;
                        createStaticBoxFromClip(_loc_7, m_staticLayer);
                        _loc_7.scaleY = 1;
                        break;
                    }
                    case ParserConst.TYPE_DYNAMIC_BOX:
                    {
                        createDynamicBoxFromClip(m_dynamicLayer, _loc_7);
                        break;
                    }
                    case ParserConst.TYPE_VULTURE:
                    {
                        createVulture(_loc_7, param1.@inverted == "true");
                        break;
                    }
                    case ParserConst.TYPE_TNT_BARREL:
                    {
                        createTNTBarrel(_loc_7);
                        break;
                    }
                    case ParserConst.TYPE_CLOUD:
                    {
                        createCloud(_loc_7);
                        break;
                    }
                    case ParserConst.TYPE_GIBBET_GROUND:
                    {
                        createGibbletGround(_loc_3, _loc_4);
                        break;
                    }
                    case ParserConst.TYPE_GIBBET:
                    {
                        createGibbet(_loc_5, param1.@pers_id, param1.@path_to_hang, param1.@chains_count, param1.@connect_legs == "true", param1.@cloud_name, param1.@cloud_prob);
                        break;
                    }
                    case ParserConst.TYPE_SHOOTING_POINT:
                    {
                        m_bow.x = _loc_3;
                        m_bow.y = _loc_4;
                        m_bow.rotation = _loc_6 + 90;
                        break;
                    }
                    case ParserConst.TYPE_AMMO_GHOST:
                    {
                        createAmmoGhost(_loc_7, param1.@power);
                        break;
                    }
                    case ParserConst.TYPE_POINTS_GHOST:
                    {
                        createPointsGhost(_loc_7, param1.@power);
                        break;
                    }
                    case ParserConst.TYPE_TELEPORT_GHOST:
                    {
                        createTeleportGhost(_loc_7);
                        break;
                    }
                    case ParserConst.TYPE_SUN:
                    {
                        createSun(_loc_5);
                        break;
                    }
                    case ParserConst.TYPE_BACKGROUND:
                    {
                        _loc_7.cacheAsBitmap = true;
                        _loc_7.scaleX = param1.@scaleX;
                        _loc_7.scaleY = param1.@scaleY;
                        m_backgroundLayer.addChild(_loc_7);
                        break;
                    }
                    case ParserConst.TYPE_FRONTGROUND:
                    {
                        _loc_7.scaleX = param1.@scaleX;
                        _loc_7.scaleY = param1.@scaleY;
                        _loc_7.width = param1.@width;
                        _loc_7.height = param1.@height;
                        m_frontLayer.addChild(_loc_7);
                        break;
                    }
                    case ParserConst.TYPE_ROTOR:
                    {
                        _loc_7.scaleX = param1.@scaleX;
                        _loc_7.scaleY = param1.@scaleY;
                        createRotorFromClip(_loc_7, param1.@speed);
                        break;
                    }
                    case ParserConst.TYPE_HEDHEHOG_GHOST:
                    {
                        createHedgehogGhost(_loc_7, param1.@charge, param1.@speed);
                        break;
                    }
                    case ParserConst.TYPE_HIGHLIGHT:
                    {
                        if (!GameData.isAlreadyPlayed(m_curLevel) && GameData.isHintsOn())
                        {
                            _loc_9 = new TurtorialFrame(param1.@size, _loc_7);
                            _loc_9.x = _loc_3;
                            _loc_9.y = _loc_4;
                            _loc_7.x = 0;
                            _loc_7.y = 0;
                            m_turtorialFrames.push(_loc_9);
                        }
                        break;
                    }
                    case ParserConst.TYPE_GIBBET_OBLIQUELY:
                    {
                        _loc_7.cacheAsBitmap = true;
                        createGibbetObliquely(_loc_7, param1.@inverted == "true");
                        break;
                    }
                    case ParserConst.TYPE_COW:
                    {
                        createCow(_loc_7, param1.@inverted == true);
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

        override public function handleMouseDown(event:MouseEvent) : void
        {
            super.handleMouseDown(event);
            switch(m_state)
            {
                case STATE_NORMAL:
                {
                    if (m_bow.hitTestPoint(event.stageX, event.stageY) && m_camera.canShoot())
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

        private function createRotorFromClip(param1:DisplayObject, param2:Number) : b2Body
        {
            var _loc_3:* = param1.rotation;
            param2 = MathUtils.GradToRad(param2);
            param1.rotation = 0;
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().type = b2Body.b2_dynamicBody;
            var _loc_5:* = m_world.CreateBody(_loc_4);
            var _loc_6:* = new b2PolygonShape();
            var _loc_7:* = new Array();
            new Array().push(new b2Vec2((-param1.width) / 2 / m_physScale, param1.height / 2 / m_physScale));
            _loc_7.push(new b2Vec2((-param1.width) / 2 / m_physScale, (-param1.height) / 2 / m_physScale));
            _loc_7.push(new b2Vec2(param1.width / 4 / m_physScale, 0));
            _loc_6.SetAsVector(_loc_7, _loc_7.length);
            var _loc_8:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_6;
            _loc_8.density = 150;
            _loc_8.friction = 0.4;
            _loc_8.restitution = 0.1;
            m_allStones.push(_loc_5.CreateFixture(_loc_8));
            var _loc_9:* = new b2PolygonShape();
            var _loc_10:* = new Array();
            new Array().push(new b2Vec2(param1.width / 2 / m_physScale, (-param1.height) / 2 / m_physScale));
            _loc_10.push(new b2Vec2(param1.width / 2 / m_physScale, param1.height / 2 / m_physScale));
            _loc_10.push(new b2Vec2((-param1.width) / 4 / m_physScale, 0));
            _loc_9.SetAsVector(_loc_10, _loc_10.length);
            var _loc_11:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_9;
            _loc_11.density = 150;
            _loc_11.friction = 0.4;
            _loc_11.restitution = 0.1;
            m_allStones.push(_loc_5.CreateFixture(_loc_11));
            _loc_5.SetUserData(param1);
            _loc_5.SetPositionAndAngle(new b2Vec2(param1.x / m_physScale, param1.y / m_physScale), MathUtils.GradToRad(_loc_3));
            _loc_5.SetAngularVelocity(param2);
            var _loc_12:* = new b2RevoluteJointDef();
            new b2RevoluteJointDef().Initialize(m_world.GetGroundBody(), _loc_5, _loc_5.GetPosition());
            m_world.CreateJoint(_loc_12);
            m_dynamicLayer.addChild(param1);
            return _loc_5;
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
            var _loc_2:* = new Array();
            for each (_loc_3 in m_arrows)
            {
                
                _loc_3.update(param1);
                if (_loc_3.isNeeded())
                {
                    _loc_2.push(_loc_3);
                    continue;
                }
                if (_loc_3.isDead())
                {
                    _loc_3.destroyBody(m_world);
                    m_arrowsLayer.removeChild(_loc_3);
                }
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
                    if (_loc_3.GetFilterData().groupIndex != -1 && !_loc_3.IsSensor() && !_loc_4.isStickIn() && _loc_4.canStickIn() && m_allStones.indexOf(_loc_3) == -1)
                    {
                        _loc_4.stopFly();
                    }
                }
                if (_loc_3 == _loc_4.getHeadFixture())
                {
                    m_arrowHeadsToBodyContacts[_loc_2] = _loc_4;
                    if (_loc_2.GetFilterData().groupIndex != -1 && !_loc_2.IsSensor() && !_loc_4.isStickIn() && _loc_4.canStickIn() && m_allStones.indexOf(_loc_2) == -1)
                    {
                        _loc_4.stopFly();
                    }
                }
            }
            return;
        }// end function

        public function getArrowsLayer() : Sprite
        {
            return m_arrowsLayer;
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
                if (_loc_5 is StaticBoxIsStone)
                {
                    _loc_4.@type = ParserConst.TYPE_STATIC_BOX;
                    _loc_4.@is_stone = true;
                }
                else if (_loc_5 is RightEdgeMarker)
                {
                    _loc_4.@type = ParserConst.TYPE_EDGE_MARKER;
                    _loc_4.@is_left = false;
                }
                else if (_loc_5 is LeftEdgeMarker)
                {
                    _loc_4.@type = ParserConst.TYPE_EDGE_MARKER;
                    _loc_4.@is_left = true;
                }
                else if (_loc_5 is CowHere)
                {
                    _loc_4.@type = ParserConst.TYPE_COW;
                    _loc_4.@inverted = false;
                }
                else if (_loc_5 is InvertedCowHere)
                {
                    _loc_4.@type = ParserConst.TYPE_COW;
                    _loc_4.@inverted = true;
                }
                else if (_loc_5 is StaticBoxIsNotStone)
                {
                    _loc_4.@type = ParserConst.TYPE_STATIC_BOX;
                    _loc_4.@is_stone = false;
                }
                else if (_loc_5 is Ground)
                {
                    _loc_4.@type = ParserConst.TYPE_GROUND;
                }
                else if (_loc_5 is VultureHere)
                {
                    _loc_4.@type = ParserConst.TYPE_VULTURE;
                    _loc_4.@inverted = false;
                }
                else if (_loc_5 is InvertedVultureHere)
                {
                    _loc_4.@type = ParserConst.TYPE_VULTURE;
                    _loc_4.@inverted = true;
                }
                else if (_loc_5 is TNTBarrel)
                {
                    _loc_4.@type = ParserConst.TYPE_TNT_BARREL;
                }
                else if (_loc_5 is Box)
                {
                    _loc_4.@type = ParserConst.TYPE_DYNAMIC_BOX;
                }
                else if (_loc_5 is Cloud)
                {
                    _loc_4.@type = ParserConst.TYPE_CLOUD;
                }
                else if (_loc_5 is GibbetGround)
                {
                    _loc_4.@type = ParserConst.TYPE_GIBBET_GROUND;
                }
                else if (_loc_5 is HangerPoint)
                {
                    _loc_4.@type = ParserConst.TYPE_GIBBET;
                    _loc_4.@pers_id = 1;
                    _loc_4.@path_to_hang = HumanRagdoll.HEAD;
                    _loc_4.@connect_legs = false;
                    _loc_4.@chains_count = 7;
                }
                else if (_loc_5 is BowPoint)
                {
                    _loc_4.@type = ParserConst.TYPE_SHOOTING_POINT;
                }
                else if (_loc_5 is AmmoGhost3)
                {
                    _loc_4.@type = ParserConst.TYPE_AMMO_GHOST;
                    _loc_4.@power = 3;
                }
                else if (_loc_5 is AmmoGhost5)
                {
                    _loc_4.@type = ParserConst.TYPE_AMMO_GHOST;
                    _loc_4.@power = 5;
                }
                else if (_loc_5 is AmmoGhost10)
                {
                    _loc_4.@type = ParserConst.TYPE_AMMO_GHOST;
                    _loc_4.@power = 10;
                }
                else if (_loc_5 is PointsGhost300)
                {
                    _loc_4.@type = ParserConst.TYPE_POINTS_GHOST;
                    _loc_4.@power = 300;
                }
                else if (_loc_5 is PointsGhost500)
                {
                    _loc_4.@type = ParserConst.TYPE_POINTS_GHOST;
                    _loc_4.@power = 500;
                }
                else if (_loc_5 is PointsGhost1000)
                {
                    _loc_4.@type = ParserConst.TYPE_POINTS_GHOST;
                    _loc_4.@power = 1000;
                }
                else if (_loc_5 is TeleportGhost)
                {
                    _loc_4.@type = ParserConst.TYPE_TELEPORT_GHOST;
                }
                else if (_loc_5 is Sun)
                {
                    _loc_4.@type = ParserConst.TYPE_SUN;
                }
                else if (_loc_5 is MillFan)
                {
                    _loc_4.@type = ParserConst.TYPE_ROTOR;
                    _loc_4.@speed = 1.1;
                    _loc_4.@scaleX = _loc_5.scaleX;
                    _loc_4.@scaleY = _loc_5.scaleY;
                }
                else if (_loc_5 is ArrowGhost1)
                {
                    _loc_4.@type = ParserConst.TYPE_HEDHEHOG_GHOST;
                    _loc_4.@speed = 0;
                    _loc_4.@charge = 1;
                }
                else if (_loc_5 is ArrowGhost3)
                {
                    _loc_4.@type = ParserConst.TYPE_HEDHEHOG_GHOST;
                    _loc_4.@speed = 0;
                    _loc_4.@charge = 3;
                }
                else if (_loc_5 is ArrowGhost4)
                {
                    _loc_4.@type = ParserConst.TYPE_HEDHEHOG_GHOST;
                    _loc_4.@speed = 0;
                    _loc_4.@charge = 4;
                }
                else if (_loc_5 is HintPoint)
                {
                    _loc_4.@type = ParserConst.TYPE_HIGHLIGHT;
                    _loc_4.@size = 150;
                }
                else if (_loc_5 is HintText)
                {
                }
                else if (_loc_5 is GibbetObliquely)
                {
                    _loc_4.@type = ParserConst.TYPE_GIBBET_OBLIQUELY;
                    _loc_4.@inverted = false;
                }
                else if (_loc_5 is InvertedGibbetObliquely)
                {
                    _loc_4.@type = ParserConst.TYPE_GIBBET_OBLIQUELY;
                    _loc_4.@inverted = true;
                }
                else if (_loc_5 is Frontground)
                {
                    _loc_4.@scaleX = _loc_5.scaleX;
                    _loc_4.@scaleY = _loc_5.scaleY;
                    _loc_4.@width = _loc_5.width;
                    _loc_4.@height = _loc_5.height;
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
            m_view.m_buttonMenu.removeEventListener(MouseEvent.CLICK, onMenuClick);
            m_view.m_buttonReplay.removeEventListener(MouseEvent.CLICK, onReplayClick);
            m_nextStateTimer.stop();
            m_nextStateTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onNextStateTimer);
            m_mapObjects = null;
            m_bow = null;
            m_turtorialFrames = null;
            m_turtorialFrame = null;
            m_guiLayer = null;
            m_layersContainer = null;
            m_backgroundLayer = null;
            m_cloudsLayer = null;
            m_staticLayer = null;
            m_dynamicLayer = null;
            m_frontLayer = null;
            m_arrowsLayer = null;
            m_arrows = null;
            m_contactListener = null;
            m_sightClip = null;
            m_nextState = null;
            m_nextStateTimer = null;
            m_arrowBodyToBodyContacts = null;
            m_arrowHeadsToBodyContacts = null;
            m_allStones = null;
            m_camera = null;
            super.onCleanup();
            return;
        }// end function

        private function createHedgehogGhost(param1:DisplayObject, param2:int, param3:Number) : b2Body
        {
            var _loc_6:Number = NaN;
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().type = b2Body.b2_staticBody;
            var _loc_5:* = m_world.CreateBody(_loc_4);
            switch(param2)
            {
                case 1:
                {
                    _loc_6 = 18;
                    break;
                }
                case 3:
                {
                    _loc_6 = 19;
                    break;
                }
                case 4:
                {
                    _loc_6 = 19;
                    break;
                }
                default:
                {
                    break;
                }
            }
            var _loc_7:* = new b2CircleShape(_loc_6 / m_physScale);
            var _loc_8:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_7;
            _loc_8.isSensor = true;
            _loc_5.CreateFixture(_loc_8);
            _loc_5.SetUserData(param1);
            _loc_5.SetPositionAndAngle(new b2Vec2(param1.x / m_physScale, param1.y / m_physScale), 0);
            var _loc_9:* = param1 as HedgehogGhost;
            (param1 as HedgehogGhost).setRotationSpeed(param3);
            _loc_9.setCharge(param2);
            _loc_9.initRotation();
            _loc_9.connectWithBody(_loc_5);
            m_mapObjects.push(_loc_9);
            m_dynamicLayer.addChild(_loc_9);
            return _loc_5;
        }// end function

        override public function update(param1:Number) : void
        {
            super.update(param1);
            updateTurtorialFrame(param1);
            if (m_turtorialFrames.length != 0 || m_turtorialFrame != null)
            {
                return;
            }
            updateMapObjects(param1);
            m_bow.update(param1);
            processContacts();
            updateArrows(param1);
            m_camera.update(param1);
            checkOutOfArrows();
            updateScores();
            recalcGui();
            if (m_arrows.length == 0)
            {
                m_camera.onKillArrow();
            }
            return;
        }// end function

        public function createAmmoGhost(param1:DisplayObject, param2) : void
        {
            var _loc_3:* = new b2BodyDef();
            _loc_3.position = new b2Vec2(param1.x / m_physScale, param1.y / m_physScale);
            var _loc_4:* = m_world.CreateBody(_loc_3);
            var _loc_5:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(param1.width / 2 / m_physScale, param1.height / 2 / m_physScale);
            var _loc_6:* = new b2FixtureDef();
            new b2FixtureDef().isSensor = true;
            _loc_6.shape = _loc_5;
            var _loc_7:* = _loc_4.CreateFixture(_loc_6);
            var _loc_8:* = param1 as AmmoGhost;
            (param1 as AmmoGhost).setPower(param2);
            _loc_8.connectWithBody(_loc_4);
            m_dynamicLayer.addChild(_loc_8);
            m_mapObjects.push(_loc_8);
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
                    _loc_2 = new Vector3(m_bow.x + m_layersContainer.x - event.stageX, m_bow.y + m_layersContainer.y - event.stageY, 0);
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

        public function createPointsGhost(param1:DisplayObject, param2) : void
        {
            var _loc_3:* = new b2BodyDef();
            _loc_3.position = new b2Vec2(param1.x / m_physScale, param1.y / m_physScale);
            var _loc_4:* = m_world.CreateBody(_loc_3);
            var _loc_5:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(param1.width / 2 / m_physScale, param1.height / 2 / m_physScale);
            var _loc_6:* = new b2FixtureDef();
            new b2FixtureDef().isSensor = true;
            _loc_6.shape = _loc_5;
            var _loc_7:* = _loc_4.CreateFixture(_loc_6);
            var _loc_8:* = param1 as PointsGhost;
            (param1 as PointsGhost).setPower(param2);
            _loc_8.connectWithBody(_loc_4);
            m_dynamicLayer.addChild(_loc_8);
            m_mapObjects.push(_loc_8);
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

        public function getWorld() : b2World
        {
            return m_world;
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
                _loc_2 = new b2Vec2(m_bow.x + m_layersContainer.x - event.stageX, m_bow.y + m_layersContainer.y - event.stageY);
                if (GameData.m_invertedControl)
                {
                    _loc_2.NegativeSelf();
                }
                _loc_2.Normalize();
                _loc_2.Multiply(m_shootingPower);
                _loc_3 = createArrow(new b2Vec2(m_bow.x / m_physScale, m_bow.y / m_physScale), _loc_2);
                m_camera.onShoot(_loc_3);
                var _loc_5:* = m_arrowsLeft + 1;
                m_arrowsLeft = _loc_5;
                var _loc_5:* = m_arrowsUsed + 1;
                m_arrowsUsed = _loc_5;
                recalcGui();
                if (m_camera is TargetedCamera)
                {
                    m_frontLayer.addChild(m_oldSightClip);
                    m_oldSightClip.x = m_sightClip.x;
                    m_oldSightClip.y = m_sightClip.y;
                    m_oldSightClip.rotation = m_sightClip.rotation;
                    m_oldSightClip.scaleX = m_sightClip.scaleX;
                    m_oldSightClip.scaleY = m_sightClip.scaleY;
                    m_oldSightClip.alpha = 0.25;
                }
            }
            super.handleMouseUp(event);
            return;
        }// end function

        private function win() : void
        {
            if (m_nextState == null)
            {
                GameData.onWinLevel(m_curLevel, m_currentScores, m_wasStar, m_savedCount);
                m_nextState = new WinState();
                m_nextStateTimer.start();
            }
            return;
        }// end function

        public function createVulture(param1:DisplayObject, param2:Boolean) : void
        {
            var _loc_3:int = 0;
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().position = new b2Vec2(param1.x / m_physScale, param1.y / m_physScale);
            var _loc_5:* = m_world.CreateBody(_loc_4);
            var _loc_6:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(param1.width / 2 / m_physScale * 2, param1.height / 2 / m_physScale / 3 * 2);
            _loc_3 = 0;
            while (_loc_3 < 4)
            {
                
                _loc_6.GetVertices()[_loc_3].y = _loc_6.GetVertices()[_loc_3].y - param1.height / 2 / m_physScale / 3 * 2;
                _loc_3++;
            }
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_6;
            var _loc_8:* = _loc_5.CreateFixture(_loc_7);
            _loc_5.CreateFixture(_loc_7).SetSensor(true);
            var _loc_9:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(param1.width / 2 / m_physScale * 2, param1.height / 2 / m_physScale / 3 * 2);
            _loc_3 = 0;
            while (_loc_3 < 4)
            {
                
                _loc_9.GetVertices()[_loc_3].y = _loc_9.GetVertices()[_loc_3].y + param1.height / 2 / m_physScale / 3 * 2;
                _loc_3++;
            }
            var _loc_10:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_9;
            var _loc_11:* = _loc_5.CreateFixture(_loc_10);
            _loc_5.CreateFixture(_loc_10).SetSensor(true);
            var _loc_12:* = new Vulture(_loc_8, null, _loc_11, param2);
            m_staticLayer.addChild(_loc_12);
            _loc_12.connectWithBody(_loc_5);
            m_mapObjects.push(_loc_12);
            return;
        }// end function

        public function goNormalState() : void
        {
            setState(STATE_NORMAL);
            m_sightClip.x = m_bow.x;
            m_sightClip.y = m_bow.y;
            return;
        }// end function

        public function createTNTBarrel(param1:DisplayObject) : void
        {
            var _loc_2:* = new b2BodyDef();
            _loc_2.position = new b2Vec2(param1.x / m_physScale, param1.y / m_physScale);
            _loc_2.type = b2Body.b2_dynamicBody;
            var _loc_3:* = m_world.CreateBody(_loc_2);
            var _loc_4:Number = 0.7;
            var _loc_5:* = new b2PolygonShape();
            var _loc_6:Array = [new b2Vec2((-param1.width) / 2 / m_physScale, 0), new b2Vec2((-param1.width) / 2 / m_physScale * _loc_4, (-param1.height) / 2 / m_physScale), new b2Vec2(param1.width / 2 / m_physScale * _loc_4, (-param1.height) / 2 / m_physScale), new b2Vec2(param1.width / 2 / m_physScale, 0), new b2Vec2(param1.width / 2 / m_physScale * _loc_4, param1.height / 2 / m_physScale), new b2Vec2((-param1.width) / 2 / m_physScale * _loc_4, param1.height / 2 / m_physScale)];
            _loc_5.SetAsArray(_loc_6, _loc_6.length);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().density = 1;
            _loc_7.friction = 0.5;
            _loc_7.restitution = 0.2;
            _loc_7.shape = _loc_5;
            m_allStones.push(_loc_3.CreateFixture(_loc_7));
            var _loc_8:* = new TNTBarrel();
            new TNTBarrel().connectWithBody(_loc_3);
            m_dynamicLayer.addChild(_loc_8);
            m_mapObjects.push(_loc_8);
            return;
        }// end function

        public function createCow(param1:DisplayObject, param2:Boolean) : void
        {
            var _loc_3:* = new b2BodyDef();
            _loc_3.position.x = param1.x / m_physScale;
            _loc_3.position.y = param1.y / m_physScale;
            var _loc_4:* = new b2PolygonShape();
            var _loc_5:* = parseShapeVectorFromClip(param2 ? (new InvertedCowMaket()) : (new CowMaket()), "vertex");
            _loc_4.SetAsVector(_loc_5, _loc_5.length);
            var _loc_6:* = m_world.CreateBody(_loc_3);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_4;
            _loc_7.friction = 0.8;
            _loc_7.restitution = 0.1;
            _loc_6.CreateFixture(_loc_7);
            var _loc_8:* = new Cow();
            if (param2)
            {
                _loc_8.scaleX = -1;
            }
            _loc_8.connectWithBody(_loc_6);
            m_mapObjects.push(_loc_8);
            m_staticLayer.addChild(_loc_8);
            return;
        }// end function

        public function createGibbet(param1:b2Vec2, param2:int, param3:String, param4:int, param5:Boolean, param6:String, param7:Number = 0) : void
        {
            var _loc_10:* = m_gibbetsOnLevel + 1;
            m_gibbetsOnLevel = _loc_10;
            var _loc_8:* = new Gibbet(param1, param3, param4, m_world, param2, param5);
            if (param6 != "")
            {
                _loc_8.setComixCloud(new (getDefinitionByName(param6) as Class)(), param7);
            }
            m_dynamicLayer.addChild(_loc_8);
            m_mapObjects.push(_loc_8);
            _loc_8.getRagdoll().applyImpulse(new b2Vec2(MathUtils.RandomRange(-0.15, 0.15), 0));
            if (m_camera)
            {
                m_camera.setGibbet(_loc_8);
            }
            return;
        }// end function

        public function onManCry() : void
        {
            if (m_nextState == null)
            {
                m_wasStar = false;
            }
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

        public static function getInstance() : PlayState
        {
            return m_instance;
        }// end function

    }
}

class MyContactListener extends b2ContactListener
{

    function MyContactListener()
    {
        return;
    }// end function

    override public function BeginContact(param1:b2Contact) : void
    {
        if (param1.GetFixtureA().GetBody().GetUserData() is Arrow && param1.GetFixtureA().GetBody().GetUserData().isNeeded())
        {
            PlayState.getInstance().onBeginContact(param1);
            return;
        }
        if (param1.GetFixtureB().GetBody().GetUserData() is Arrow && (param1.GetFixtureB().GetBody().GetUserData() as Arrow).isNeeded())
        {
            PlayState.getInstance().onBeginContact(param1);
            return;
        }
        return;
    }// end function

}

