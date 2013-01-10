package Main
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Box2D.Dynamics.Joints.*;
    import Utils.*;
    import flash.display.*;
    import flash.events.*;

    public class PhysGameState extends GameState
    {
        protected var m_world:b2World;
        protected var m_physScale:Number = 30;
        private var m_accumulateTime:Number = 0;
        protected var m_debugSprite:Sprite;
        protected var m_mouseDragEnabled:Boolean = false;
        private var m_mouseJoint:b2MouseJoint;
        protected var m_gravity:b2Vec2;

        public function PhysGameState()
        {
            m_debugSprite = new Sprite();
            m_gravity = new b2Vec2(0, 10);
            return;
        }// end function

        override public function onCleanup() : void
        {
            var _loc_2:b2Body = null;
            var _loc_1:* = new Array();
            _loc_2 = m_world.GetBodyList();
            while (_loc_2)
            {
                
                _loc_1.push(_loc_2);
                _loc_2 = _loc_2.GetNext();
            }
            for each (_loc_2 in _loc_1)
            {
                
                m_world.DestroyBody(_loc_2);
            }
            m_world = null;
            m_debugSprite = null;
            m_gravity = null;
            m_mouseJoint = null;
            super.onCleanup();
            return;
        }// end function

        override public function update(param1:Number) : void
        {
            var _loc_3:DisplayObject = null;
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
                    _loc_3 = _loc_2.GetUserData() as DisplayObject;
                    _loc_3.x = _loc_2.GetPosition().x * m_physScale;
                    _loc_3.y = _loc_2.GetPosition().y * m_physScale;
                    _loc_3.rotation = MathUtils.RadToGrad(_loc_2.GetAngle());
                }
                _loc_2 = _loc_2.GetNext();
            }
            if (Constant.m_debugMode)
            {
                m_world.DrawDebugData();
            }
            return;
        }// end function

        public function parseShapeVectorFromClip(param1:MovieClip, param2:String) : Array
        {
            var _loc_3:* = new Array();
            var _loc_4:* = new MovieClip();
            var _loc_5:int = 0;
            while (_loc_4)
            {
                
                _loc_4 = param1.getChildByName(param2 + _loc_5);
                if (_loc_4)
                {
                    _loc_3.push(new b2Vec2(_loc_4.x / m_physScale, _loc_4.y / m_physScale));
                }
                _loc_5++;
            }
            return _loc_3;
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

        override public function onInit() : void
        {
            super.onInit();
            m_world = new b2World(m_gravity, true);
            m_world.SetWarmStarting(true);
            m_world.SetContinuousPhysics(true);
            return;
        }// end function

        public function initDebugDraw() : void
        {
            var _loc_1:b2DebugDraw = null;
            if (Constant.m_debugMode)
            {
                _loc_1 = new b2DebugDraw();
                _loc_1.SetSprite(m_debugSprite);
                _loc_1.SetDrawScale(m_physScale);
                _loc_1.SetFillAlpha(0.8);
                _loc_1.SetLineThickness(1);
                _loc_1.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit);
                m_world.SetDebugDraw(_loc_1);
                m_view.addChild(m_debugSprite);
                m_debugSprite.visible = false;
            }
            return;
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

        public function createStaticBoxFromClip(param1:DisplayObject, param2:Sprite) : b2Fixture
        {
            param2.addChild(param1);
            var _loc_3:* = param1.rotation;
            param1.rotation = 0;
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().position = new b2Vec2(param1.x / m_physScale, param1.y / m_physScale);
            _loc_4.angle = MathUtils.GradToRad(_loc_3);
            var _loc_5:* = m_world.CreateBody(_loc_4);
            var _loc_6:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox((param1.width - 1) / m_physScale / 2, (param1.height - 1) / m_physScale / 2);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_6;
            var _loc_8:* = _loc_5.CreateFixture(_loc_7);
            _loc_5.SetUserData(param1);
            param1.rotation = _loc_3;
            return _loc_8;
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
                        _loc_3.maxForce = 300 * _loc_2.GetMass();
                        m_mouseJoint = m_world.CreateJoint(_loc_3) as b2MouseJoint;
                    }
                }
            }
            return;
        }// end function

        public function createDynamicBoxFromClip(param1:Sprite, param2:DisplayObject) : b2Body
        {
            var _loc_3:* = param2.rotation;
            param1.addChild(param2);
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().type = b2Body.b2_dynamicBody;
            _loc_4.position = new b2Vec2(param2.x / m_physScale, param2.y / m_physScale);
            _loc_4.angle = MathUtils.GradToRad(_loc_3);
            var _loc_5:* = m_world.CreateBody(_loc_4);
            var _loc_6:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox((param2.width - 1) / m_physScale / 2, (param2.height - 1) / m_physScale / 2);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_6;
            _loc_7.density = 1.9;
            _loc_7.friction = 0.4;
            _loc_7.restitution = 0.25;
            _loc_5.CreateFixture(_loc_7);
            _loc_5.SetUserData(param2);
            param2.rotation = _loc_3;
            return _loc_5;
        }// end function

        public function createStaticBox(param1:b2Vec2, param2:b2Vec2, param3:Number) : b2Body
        {
            var _loc_4:* = new b2BodyDef();
            new b2BodyDef().position = param2.Copy();
            _loc_4.angle = MathUtils.GradToRad(param3);
            var _loc_5:* = m_world.CreateBody(_loc_4);
            var _loc_6:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(param1.x / 2, param1.y / 2);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_6;
            _loc_5.CreateFixture(_loc_7);
            return _loc_5;
        }// end function

        public function getMousePhysPos() : b2Vec2
        {
            return new b2Vec2(stage.mouseX / m_physScale / scaleX, stage.mouseY / m_physScale / scaleY);
        }// end function

    }
}
