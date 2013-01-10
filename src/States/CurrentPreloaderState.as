package States
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Box2D.Dynamics.Joints.*;
    import CPMStar.*;
    import Main.*;
    import Ragdoll.*;
    import States.PlayState.*;
    import Utils.*;
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;

    public class CurrentPreloaderState extends PreloaderState
    {
        protected var m_world:b2World;
        public var m_gibbetFront:MovieClip;
        public var m_loadingBar:MovieClip;
        protected var m_physScale:Number = 30;
        public var m_adBox:MovieClip;
        public var m_playButton:SimpleButton;
        private var m_needShowPlay:Boolean = false;
        private var m_accumulateTime:Number = 0;
        private var m_gibbetPlace:MovieClip;
        protected var m_mouseDragEnabled:Boolean = true;
        private var m_mapObjects:Array;
        public var m_notDoppler:SimpleButton;
        public var m_loadingLabel:TextField;
        public var m_closeButton:SimpleButton;
        public var m_scrollBar:ScrollBar;
        protected var m_gravity:b2Vec2;
        private var m_mouseJoint:b2MouseJoint;

        public function CurrentPreloaderState()
        {
            m_mapObjects = new Array();
            m_gibbetPlace = new MovieClip();
            m_gravity = new b2Vec2(0, 10);
            m_playButton.visible = false;
            return;
        }// end function

        override public function onCleanup() : void
        {
            m_notDoppler.removeEventListener(MouseEvent.CLICK, onNotDopplerClick);
            super.onCleanup();
            return;
        }// end function

        override public function onFinishLoading() : void
        {
            m_needShowPlay = true;
            GameData.load();
            m_playButton.visible = true;
            return;
        }// end function

        public function getMousePhysPos() : b2Vec2
        {
            return new b2Vec2(stage.mouseX / m_physScale / m_gibbetPlace.scaleX, stage.mouseY / m_physScale / m_gibbetPlace.scaleY);
        }// end function

        private function onNotDopplerClick(event:MouseEvent) : void
        {
            SoundManager.play(SoundConst.CLICK);
            LinksManager.goURL(LinksManager.MAIN_PAGE_URL, LinksManager.PRELOADER_SCREEN_BANNER);
            return;
        }// end function

        override public function onInit() : void
        {
            var _loc_3:DisplayObject = null;
            super.onInit();
            if (m_loaderInfo.url.indexOf("notdoppler.com") != -1 || m_loaderInfo.url.indexOf("addictinggames.com") != -1 || m_loaderInfo.url.indexOf("andkon.com") != -1 || m_loaderInfo.url.indexOf("armorgames.com") != -1 || m_loaderInfo.url.indexOf("agame.com") != -1 || m_loaderInfo.url.indexOf("kongregate.com") != -1)
            {
                GameData.hideAds();
            }
            if (m_loaderInfo.url.indexOf("kongregate.com") != -1)
            {
                GameData.m_isKongregate = true;
            }
            m_playButton.addEventListener(MouseEvent.CLICK, onPlayClick);
            var _loc_1:int = 0;
            while (_loc_1 < numChildren)
            {
                
                _loc_3 = getChildAt(_loc_1);
                if (_loc_3 is Cloud)
                {
                    m_mapObjects.push(_loc_3 as Cloud);
                }
                _loc_1++;
            }
            m_world = new b2World(m_gravity, true);
            m_world.SetWarmStarting(true);
            m_world.SetContinuousPhysics(true);
            m_gibbetPlace.scaleX = 1.6;
            m_gibbetPlace.scaleY = 1.6;
            addChild(m_gibbetPlace);
            var _loc_2:* = new Gibbet(new b2Vec2(345 / m_physScale / m_gibbetPlace.scaleX, 105 / m_physScale / m_gibbetPlace.scaleY), HumanRagdoll.HEAD, 6, m_world, 3, false);
            _loc_2.makeLookUgly();
            m_gibbetPlace.addChild(_loc_2);
            _loc_2.getRagdoll().applyImpulse(new b2Vec2(-0.05, 0));
            m_mapObjects.push(_loc_2);
            addChild(m_gibbetFront);
            if (GameData.haveAds())
            {
                showAds();
            }
            else
            {
                onCloseClick(null);
            }
            m_playButton.x = m_playButton.x + 200;
            m_notDoppler.addEventListener(MouseEvent.CLICK, onNotDopplerClick);
            if (GameData.hasKongregateAPI())
            {
                initKongregateAPI();
            }
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_3:MapObject = null;
            var _loc_4:DisplayObject = null;
            m_accumulateTime = m_accumulateTime + param1;
            while (m_accumulateTime > Constant.TIME_STEP)
            {
                
                m_accumulateTime = m_accumulateTime - Constant.TIME_STEP;
                m_world.Step(Constant.TIME_STEP, Constant.PHYSICS_VELOCITY_ITERATION_COUNT, Constant.PHYSICS_POSITIONS_ITERATION_COUNT);
            }
            var _loc_2:* = m_world.GetBodyList();
            while (_loc_2)
            {
                
                if (_loc_2.GetUserData() is DisplayObject)
                {
                    _loc_4 = _loc_2.GetUserData() as DisplayObject;
                    _loc_4.x = _loc_2.GetPosition().x * m_physScale;
                    _loc_4.y = _loc_2.GetPosition().y * m_physScale;
                    _loc_4.rotation = MathUtils.RadToGrad(_loc_2.GetAngle());
                }
                _loc_2 = _loc_2.GetNext();
            }
            if (Constant.m_debugMode)
            {
                m_world.DrawDebugData();
            }
            super.update(param1);
            m_loadingBar.m_textClip.m_text.text = "loading: " + this.int(getPercent() * 100) + "%";
            m_loadingBar.m_bar.gotoAndStop(Math.round(m_loadingBar.m_bar.totalFrames * getPercent()));
            for each (_loc_3 in m_mapObjects)
            {
                
                _loc_3.update(param1);
            }
            if (m_needShowPlay)
            {
                m_playButton.x = m_playButton.x - 400 * param1;
                if (m_playButton.x <= 523)
                {
                    m_playButton.x = 523;
                }
            }
            return;
        }// end function

        private function onPlayClick(event:MouseEvent) : void
        {
            StateManager.getInstance().gotoAndStop(2);
            GameData.init();
            SoundManager.play(SoundConst.CLICK);
            StateManager.getInstance().changeState(new SponsorIntroState());
            return;
        }// end function

        private function loadComplete(event:Event) : void
        {
            var event:* = event;
            try
            {
                GameData.kongregate = event.target.content;
                GameData.kongregate.services.connect();
            }
            catch (e:Error)
            {
                trace(e, e.getStackTrace());
            }
            return;
        }// end function

        override public function handleMouseMove(event:MouseEvent) : void
        {
            if (m_mouseDragEnabled)
            {
                if (m_mouseJoint)
                {
                    m_mouseJoint.SetTarget(getMousePhysPos());
                }
            }
            return;
        }// end function

        public function initKongregateAPI() : void
        {
            var paramObj:Object;
            var apiPath:String;
            var request:URLRequest;
            var loader:Loader;
            try
            {
                paramObj = LoaderInfo(root.loaderInfo).parameters;
                apiPath = paramObj.kongregate_api_path || "http://www.kongregate.com/flash/API_AS3_Local.swf";
                trace("api path:", apiPath);
                Security.allowDomain(apiPath);
                request = new URLRequest(apiPath);
                loader = new Loader();
                loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
                loader.load(request);
                StateManager.getInstance().addChild(loader);
            }
            catch (e:Error)
            {
                trace(e, e.getStackTrace());
            }
            return;
        }// end function

        override public function handleMouseDown(event:MouseEvent) : void
        {
            var _loc_2:b2Body = null;
            var _loc_3:b2MouseJointDef = null;
            super.handleMouseDown(event);
            if (m_mouseDragEnabled)
            {
                if (!m_mouseJoint)
                {
                    _loc_2 = GetBodyAtMouse();
                    if (_loc_2)
                    {
                        _loc_3 = new b2MouseJointDef();
                        _loc_3.bodyA = m_world.GetGroundBody();
                        _loc_3.bodyB = _loc_2;
                        _loc_3.target.SetV(getMousePhysPos());
                        _loc_3.collideConnected = true;
                        _loc_3.maxForce = 10 * _loc_2.GetMass();
                        m_mouseJoint = m_world.CreateJoint(_loc_3) as b2MouseJoint;
                    }
                }
            }
            return;
        }// end function

        public function GetBodyAtMouse() : b2Body
        {
            var mouse_pos:b2Vec2;
            var fixture:b2Fixture;
            var GetBodyCallback:Function;
            GetBodyCallback = function (param1:b2Fixture) : Boolean
            {
                var _loc_3:Boolean = false;
                var _loc_2:* = param1.GetShape();
                if (param1.GetBody().GetType() != b2Body.b2_staticBody)
                {
                    _loc_3 = _loc_2.TestPoint(param1.GetBody().GetTransform(), mouse_pos);
                    if (_loc_3)
                    {
                        body = param1.GetBody();
                        return false;
                    }
                }
                return true;
            }// end function
            ;
            mouse_pos = getMousePhysPos();
            var aabb:* = new b2AABB();
            aabb.lowerBound.Set(mouse_pos.x - 0.001, mouse_pos.y - 0.001);
            aabb.upperBound.Set(mouse_pos.x + 0.001, mouse_pos.y + 0.001);
            var body:b2Body;
            m_world.QueryAABB(GetBodyCallback, aabb);
            return body;
        }// end function

        override public function handleMouseUp(event:MouseEvent) : void
        {
            super.handleMouseUp(event);
            if (m_mouseDragEnabled)
            {
                if (m_mouseJoint)
                {
                    m_world.DestroyJoint(m_mouseJoint);
                    m_mouseJoint = null;
                }
            }
            return;
        }// end function

        private function onCloseClick(event:MouseEvent) : void
        {
            m_adBox.visible = false;
            m_closeButton.visible = false;
            return;
        }// end function

        private function showAds() : void
        {
            var ad:DisplayObject;
            try
            {
                ad = new AdLoader(Constant.CPMSTAR_PREROLL_CODE);
                m_adBox.addChild(ad);
                m_closeButton.addEventListener(MouseEvent.CLICK, onCloseClick);
                addChild(m_adBox);
                addChild(m_closeButton);
            }
            catch (e:Error)
            {
                trace("CPMstar error!", e);
            }
            return;
        }// end function

        override public function onPreInit() : void
        {
            setMinimalLoadTime(0.1);
            return;
        }// end function

    }
}
