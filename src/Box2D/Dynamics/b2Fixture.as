package Box2D.Dynamics
{
    import Box2D.Collision.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.Contacts.*;

    public class b2Fixture extends Object
    {
        var m_next:b2Fixture;
        var m_shape:b2Shape;
        var m_restitution:Number;
        var m_friction:Number;
        var m_proxy:Object;
        var m_filter:b2FilterData;
        var m_density:Number;
        private var m_massData:b2MassData;
        var m_isSensor:Boolean;
        var m_userData:Object;
        var m_aabb:b2AABB;
        var m_body:b2Body;

        public function b2Fixture()
        {
            m_filter = new b2FilterData();
            m_aabb = new b2AABB();
            m_userData = null;
            m_body = null;
            m_next = null;
            m_shape = null;
            m_density = 0;
            m_friction = 0;
            m_restitution = 0;
            return;
        }// end function

        public function TestPoint(param1:b2Vec2) : Boolean
        {
            return m_shape.TestPoint(m_body.GetTransform(), param1);
        }// end function

        public function SetDensity(param1:Number) : void
        {
            m_density = param1;
            return;
        }// end function

        public function SetRestitution(param1:Number) : void
        {
            m_restitution = param1;
            return;
        }// end function

        public function GetNext() : b2Fixture
        {
            return m_next;
        }// end function

        public function GetShape() : b2Shape
        {
            return m_shape;
        }// end function

        public function GetFriction() : Number
        {
            return m_friction;
        }// end function

        public function GetDensity() : Number
        {
            return m_density;
        }// end function

        public function GetMassData(param1:b2MassData = null) : b2MassData
        {
            if (param1 == null)
            {
                param1 = new b2MassData();
            }
            m_shape.ComputeMass(param1, m_density);
            return param1;
        }// end function

        public function GetAABB() : b2AABB
        {
            return m_aabb;
        }// end function

        public function GetType() : int
        {
            return m_shape.GetType();
        }// end function

        public function GetFilterData() : b2FilterData
        {
            return m_filter.Copy();
        }// end function

        function Destroy() : void
        {
            m_shape = null;
            return;
        }// end function

        public function GetRestitution() : Number
        {
            return m_restitution;
        }// end function

        public function SetFriction(param1:Number) : void
        {
            m_friction = param1;
            return;
        }// end function

        function Create(param1:b2Body, param2:b2Transform, param3:b2FixtureDef) : void
        {
            m_userData = param3.userData;
            m_friction = param3.friction;
            m_restitution = param3.restitution;
            m_body = param1;
            m_next = null;
            m_filter = param3.filter.Copy();
            m_isSensor = param3.isSensor;
            m_shape = param3.shape.Copy();
            m_density = param3.density;
            return;
        }// end function

        public function IsSensor() : Boolean
        {
            return m_isSensor;
        }// end function

        public function RayCast(param1:b2RayCastOutput, param2:b2RayCastInput) : Boolean
        {
            return m_shape.RayCast(param1, param2, m_body.GetTransform());
        }// end function

        public function GetUserData()
        {
            return m_userData;
        }// end function

        function Synchronize(param1:IBroadPhase, param2:b2Transform, param3:b2Transform) : void
        {
            if (!m_proxy)
            {
                return;
            }
            var _loc_4:* = new b2AABB();
            var _loc_5:* = new b2AABB();
            m_shape.ComputeAABB(_loc_4, param2);
            m_shape.ComputeAABB(_loc_5, param3);
            m_aabb.Combine(_loc_4, _loc_5);
            var _loc_6:* = b2Math.SubtractVV(param3.position, param2.position);
            param1.MoveProxy(m_proxy, m_aabb, _loc_6);
            return;
        }// end function

        function CreateProxy(param1:IBroadPhase, param2:b2Transform) : void
        {
            m_shape.ComputeAABB(m_aabb, param2);
            m_proxy = param1.CreateProxy(m_aabb, this);
            return;
        }// end function

        public function SetFilterData(param1:b2FilterData) : void
        {
            var _loc_3:b2Contact = null;
            var _loc_4:b2Fixture = null;
            var _loc_5:b2Fixture = null;
            m_filter = param1.Copy();
            if (m_body)
            {
                return;
            }
            var _loc_2:* = m_body.GetContactList();
            while (_loc_2)
            {
                
                _loc_3 = _loc_2.contact;
                _loc_4 = _loc_3.GetFixtureA();
                _loc_5 = _loc_3.GetFixtureB();
                if (_loc_4 == this || _loc_5 == this)
                {
                    _loc_3.FlagForFiltering();
                }
                _loc_2 = _loc_2.next;
            }
            return;
        }// end function

        function DestroyProxy(param1:IBroadPhase) : void
        {
            if (m_proxy == null)
            {
                return;
            }
            param1.DestroyProxy(m_proxy);
            m_proxy = null;
            return;
        }// end function

        public function SetUserData(param1) : void
        {
            m_userData = param1;
            return;
        }// end function

        public function GetBody() : b2Body
        {
            return m_body;
        }// end function

        public function SetSensor(param1:Boolean) : void
        {
            var _loc_3:b2Contact = null;
            var _loc_4:b2Fixture = null;
            var _loc_5:b2Fixture = null;
            if (m_isSensor == param1)
            {
                return;
            }
            m_isSensor = param1;
            if (m_body == null)
            {
                return;
            }
            var _loc_2:* = m_body.GetContactList();
            while (_loc_2)
            {
                
                _loc_3 = _loc_2.contact;
                _loc_4 = _loc_3.GetFixtureA();
                _loc_5 = _loc_3.GetFixtureB();
                if (_loc_4 == this || _loc_5 == this)
                {
                    _loc_3.SetSensor(_loc_4.IsSensor() || _loc_5.IsSensor());
                }
                _loc_2 = _loc_2.next;
            }
            return;
        }// end function

    }
}
