package Ragdoll
{
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;
    import Box2D.Dynamics.Joints.*;
    import States.PlayState.*;
    import flash.display.*;
    import flash.utils.*;

    public class HumanRagdoll extends MapObject
    {
        private var m_world:b2World;
        private var m_persID:int = -1;
        protected var m_nameBodyPath:Dictionary;
        private var m_allPaths:Array;
        private var m_isInverted:Boolean = false;
        public static const LEFT_UPPER_HAND:String = "LEFT_UPPER_HAND";
        public static const LEFT_LOWER_HAND:String = "LEFT_LOWER_HAND";
        public static const TORSO3:String = "TORSO3";
        public static const RIGHT_LOWER_LEG:String = "RIGHT_LOWER_LEG";
        public static const ALL_PATHS:Array = [HEAD, TORSO1, TORSO2, TORSO3, LEFT_UPPER_HAND, LEFT_LOWER_HAND, RIGHT_UPPER_HAND, RIGHT_LOWER_HAND, LEFT_UPPER_LEG, LEFT_LOWER_LEG, RIGHT_UPPER_LEG, RIGHT_LOWER_LEG];
        public static const LEFT_LOWER_LEG:String = "LEFT_LOWER_LEG";
        public static const HEAD:String = "HEAD";
        public static const RIGHT_UPPER_LEG:String = "RIGHT_UPPER_LEG";
        public static const RIGHT_UPPER_HAND:String = "RIGHT_UPPER_HAND";
        public static const RIGHT_LOWER_HAND:String = "RIGHT_LOWER_HAND";
        public static const LEFT_UPPER_LEG:String = "LEFT_UPPER_LEG";
        public static const TORSO1:String = "TORSO1";
        public static const TORSO2:String = "TORSO2";

        public function HumanRagdoll(param1:b2Vec2, param2:b2World, param3:Boolean, param4:int, param5:Boolean)
        {
            var _loc_21:b2Body = null;
            var _loc_22:b2Body = null;
            var _loc_23:MovieClip = null;
            m_nameBodyPath = new Dictionary();
            m_allPaths = new Array();
            m_world = param2;
            m_persID = param4;
            m_isInverted = param3;
            var _loc_6:* = param3 ? (-1) : (1);
            var _loc_7:* = Constant.PHYS_SCALE / 0.4;
            var _loc_8:* = createCircleBody(new b2Vec2(param1.x, param1.y - 5 / _loc_7 * _loc_6), 18 / _loc_7, "FaceColors");
            var _loc_9:* = createBoxBody(new b2Vec2(param1.x, param1.y + 28 / _loc_7 * _loc_6), 15 / _loc_7, 10 / _loc_7, "Torso1");
            var _loc_10:* = createBoxBody(new b2Vec2(param1.x, param1.y + 43 / _loc_7 * _loc_6), 15 / _loc_7, 10 / _loc_7, "Torso2");
            var _loc_11:* = createBoxBody(new b2Vec2(param1.x, param1.y + 58 / _loc_7 * _loc_6), 15 / _loc_7, 10 / _loc_7, "Torso3");
            var _loc_12:* = createBoxBody(new b2Vec2(param1.x - 30 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), 18 / _loc_7, 6.5 / _loc_7, "LeftUpperHand");
            var _loc_13:* = createBoxBody(new b2Vec2(param1.x + 30 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), 18 / _loc_7, 6.5 / _loc_7, "RightUpperHand");
            var _loc_14:* = createBoxBody(new b2Vec2(param1.x - 64 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), 17 / _loc_7, 6 / _loc_7, "LeftLowerHand");
            var _loc_15:* = createBoxBody(new b2Vec2(param1.x + 64 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), 17 / _loc_7, 6 / _loc_7, "RightLowerHand");
            var _loc_16:* = createBoxBody(new b2Vec2(param1.x - 8 / _loc_7, param1.y + 85 / _loc_7 * _loc_6), 7.5 / _loc_7, 22 / _loc_7, "LeftUpperLeg");
            var _loc_17:* = createBoxBody(new b2Vec2(param1.x + 8 / _loc_7, param1.y + 85 / _loc_7 * _loc_6), 7.5 / _loc_7, 22 / _loc_7, "RightUpperLeg");
            var _loc_18:* = createBoxBody(new b2Vec2(param1.x - 8 / _loc_7, param1.y + 120 / _loc_7 * _loc_6), 6 / _loc_7, 20 / _loc_7, "LeftLowerLeg");
            var _loc_19:* = createBoxBody(new b2Vec2(param1.x + 8 / _loc_7, param1.y + 120 / _loc_7 * _loc_6), 6 / _loc_7, 20 / _loc_7, "RightLowerLeg");
            createJoint(_loc_9, _loc_8, new b2Vec2(param1.x, param1.y + 15 / _loc_7 * _loc_6), -40, 40);
            createJoint(_loc_9, _loc_12, new b2Vec2(param1.x - 18 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), -85, 130);
            createJoint(_loc_9, _loc_13, new b2Vec2(param1.x + 18 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), -130, 85);
            createJoint(_loc_12, _loc_14, new b2Vec2(param1.x - 45 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), -130, 10);
            createJoint(_loc_13, _loc_15, new b2Vec2(param1.x + 45 / _loc_7, param1.y + 20 / _loc_7 * _loc_6), -10, 130);
            createJoint(_loc_9, _loc_10, new b2Vec2(param1.x, param1.y + 35 / _loc_7 * _loc_6), -15, 15);
            createJoint(_loc_10, _loc_11, new b2Vec2(param1.x, param1.y + 50 / _loc_7 * _loc_6), -15, 15);
            createJoint(_loc_11, _loc_16, new b2Vec2(param1.x - 8 / _loc_7, param1.y + 72 / _loc_7 * _loc_6), -25, 45);
            createJoint(_loc_11, _loc_17, new b2Vec2(param1.x + 8 / _loc_7, param1.y + 72 / _loc_7 * _loc_6), -45, 25);
            createJoint(_loc_16, _loc_18, new b2Vec2(param1.x - 8 / _loc_7, param1.y + 105 / _loc_7 * _loc_6), -25, 115);
            createJoint(_loc_17, _loc_19, new b2Vec2(param1.x + 8 / _loc_7, param1.y + 105 / _loc_7 * _loc_6), -115, 25);
            if (param5)
            {
                createJoint(_loc_18, _loc_19, new b2Vec2(param1.x, param1.y + 110 / _loc_7 * _loc_6), 0, 0);
            }
            m_allPaths = new Array();
            var _loc_20:Array = [_loc_9, _loc_10, _loc_12, _loc_13, _loc_14, _loc_15, _loc_16, _loc_17, _loc_18, _loc_19, _loc_11, _loc_8];
            for each (_loc_21 in _loc_20)
            {
                
                m_allPaths.push(_loc_21);
            }
            m_nameBodyPath[HEAD] = _loc_8;
            m_nameBodyPath[TORSO1] = _loc_9;
            m_nameBodyPath[TORSO2] = _loc_10;
            m_nameBodyPath[TORSO3] = _loc_11;
            m_nameBodyPath[LEFT_UPPER_HAND] = _loc_12;
            m_nameBodyPath[LEFT_LOWER_HAND] = _loc_14;
            m_nameBodyPath[RIGHT_UPPER_HAND] = _loc_13;
            m_nameBodyPath[RIGHT_LOWER_HAND] = _loc_15;
            m_nameBodyPath[LEFT_UPPER_LEG] = _loc_16;
            m_nameBodyPath[LEFT_LOWER_LEG] = _loc_18;
            m_nameBodyPath[RIGHT_UPPER_LEG] = _loc_17;
            m_nameBodyPath[RIGHT_LOWER_LEG] = _loc_19;
            for each (_loc_22 in m_allPaths)
            {
                
                _loc_23 = _loc_22.GetUserData() as MovieClip;
                if (param3)
                {
                    _loc_23.scaleY = -1;
                }
                addChild(_loc_23);
            }
            return;
        }// end function

        public function getAllPaths() : Array
        {
            return m_allPaths;
        }// end function

        public function resetVelocity() : void
        {
            var _loc_1:String = null;
            for each (_loc_1 in ALL_PATHS)
            {
                
                getBodyByName(_loc_1).SetLinearVelocity(new b2Vec2());
                getBodyByName(_loc_1).SetAngularVelocity(0);
            }
            return;
        }// end function

        private function createCircleBody(param1:b2Vec2, param2:Number, param3:String) : b2Body
        {
            var _loc_4:* = new (getDefinitionByName(param3 + "_" + m_persID) as Class)() as MovieClip;
            (new (getDefinitionByName(param3 + "_" + m_persID) as Class)() as MovieClip).stop();
            var _loc_5:* = new b2CircleShape(param2);
            var _loc_6:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_5;
            _loc_6.density = 1;
            _loc_6.friction = 0.4;
            _loc_6.restitution = 0.3;
            var _loc_7:* = new b2BodyDef();
            new b2BodyDef().type = b2Body.b2_dynamicBody;
            _loc_7.position = param1;
            var _loc_8:* = m_world.CreateBody(_loc_7);
            m_world.CreateBody(_loc_7).CreateFixture(_loc_6);
            _loc_8.SetUserData(_loc_4);
            var _loc_9:* = new HangerFace();
            _loc_4.addChild(_loc_9);
            _loc_9.name = "head_damage";
            return _loc_8;
        }// end function

        public function applyImpulse(param1:b2Vec2) : void
        {
            var _loc_2:String = null;
            for each (_loc_2 in ALL_PATHS)
            {
                
                getBodyByName(_loc_2).ApplyImpulse(param1, getBodyByName(_loc_2).GetPosition());
            }
            return;
        }// end function

        private function createBoxBody(param1:b2Vec2, param2:Number, param3:Number, param4:String) : b2Body
        {
            var _loc_5:* = new (getDefinitionByName(param4 + "_" + m_persID) as Class)() as MovieClip;
            (new (getDefinitionByName(param4 + "_" + m_persID) as Class)() as MovieClip).stop();
            var _loc_6:* = new b2PolygonShape();
            new b2PolygonShape().SetAsBox(param2, param3);
            var _loc_7:* = new b2FixtureDef();
            new b2FixtureDef().shape = _loc_6;
            _loc_7.density = 1;
            _loc_7.friction = 0.4;
            _loc_7.restitution = 0.3;
            var _loc_8:* = new b2BodyDef();
            new b2BodyDef().position = param1;
            _loc_8.type = b2Body.b2_dynamicBody;
            var _loc_9:* = m_world.CreateBody(_loc_8);
            m_world.CreateBody(_loc_8).CreateFixture(_loc_7);
            _loc_9.SetUserData(_loc_5);
            return _loc_9;
        }// end function

        public function getBodyByName(param1:String) : b2Body
        {
            return m_nameBodyPath[param1];
        }// end function

        private function createJoint(param1:b2Body, param2:b2Body, param3:b2Vec2, param4:Number, param5:Number) : b2Joint
        {
            var _loc_6:* = new b2RevoluteJointDef();
            new b2RevoluteJointDef().enableLimit = true;
            _loc_6.lowerAngle = param4 / (180 / Math.PI);
            _loc_6.upperAngle = param5 / (180 / Math.PI);
            _loc_6.Initialize(param1, param2, param3);
            return m_world.CreateJoint(_loc_6);
        }// end function

        public function setVelocity(param1:b2Vec2) : void
        {
            var _loc_2:String = null;
            for each (_loc_2 in ALL_PATHS)
            {
                
                getBodyByName(_loc_2).SetLinearVelocity(param1);
            }
            return;
        }// end function

    }
}
