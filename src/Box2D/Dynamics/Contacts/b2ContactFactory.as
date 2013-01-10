package Box2D.Dynamics.Contacts
{
    import Box2D.Collision.Shapes.*;
    import Box2D.Dynamics.*;

    public class b2ContactFactory extends Object
    {
        private var m_allocator:Object;
        private var m_registers:Array;

        public function b2ContactFactory(param1)
        {
            m_allocator = param1;
            InitializeRegisters();
            return;
        }// end function

        function InitializeRegisters() : void
        {
            var _loc_2:int = 0;
            m_registers = new Array(b2Shape.e_shapeTypeCount);
            var _loc_1:int = 0;
            while (_loc_1 < b2Shape.e_shapeTypeCount)
            {
                
                m_registers[_loc_1] = new Array(b2Shape.e_shapeTypeCount);
                _loc_2 = 0;
                while (_loc_2 < b2Shape.e_shapeTypeCount)
                {
                    
                    m_registers[_loc_1][_loc_2] = new b2ContactRegister();
                    _loc_2++;
                }
                _loc_1++;
            }
            AddType(b2CircleContact.Create, b2CircleContact.Destroy, b2Shape.e_circleShape, b2Shape.e_circleShape);
            AddType(b2PolyAndCircleContact.Create, b2PolyAndCircleContact.Destroy, b2Shape.e_polygonShape, b2Shape.e_circleShape);
            AddType(b2PolygonContact.Create, b2PolygonContact.Destroy, b2Shape.e_polygonShape, b2Shape.e_polygonShape);
            AddType(b2EdgeAndCircleContact.Create, b2EdgeAndCircleContact.Destroy, b2Shape.e_edgeShape, b2Shape.e_circleShape);
            AddType(b2PolyAndEdgeContact.Create, b2PolyAndEdgeContact.Destroy, b2Shape.e_polygonShape, b2Shape.e_edgeShape);
            return;
        }// end function

        public function Destroy(param1:b2Contact) : void
        {
            if (param1.m_manifold.m_pointCount > 0)
            {
                param1.m_fixtureA.m_body.SetAwake(true);
                param1.m_fixtureB.m_body.SetAwake(true);
            }
            var _loc_2:* = param1.m_fixtureA.GetType();
            var _loc_3:* = param1.m_fixtureB.GetType();
            var _loc_4:* = m_registers[_loc_2][_loc_3];
            var _loc_6:* = m_registers[_loc_2][_loc_3];
            var _loc_7:* = m_registers[_loc_2][_loc_3].poolCount + 1;
            _loc_6.poolCount = _loc_7;
            param1.m_next = _loc_4.pool;
            _loc_4.pool = param1;
            var _loc_5:* = _loc_4.destroyFcn;
            this._loc_4.destroyFcn(param1, m_allocator);
            return;
        }// end function

        function AddType(param1:Function, param2:Function, param3:int, param4:int) : void
        {
            m_registers[param3][param4].createFcn = param1;
            m_registers[param3][param4].destroyFcn = param2;
            m_registers[param3][param4].primary = true;
            if (param3 != param4)
            {
                m_registers[param4][param3].createFcn = param1;
                m_registers[param4][param3].destroyFcn = param2;
                m_registers[param4][param3].primary = false;
            }
            return;
        }// end function

        public function Create(param1:b2Fixture, param2:b2Fixture) : b2Contact
        {
            var _loc_6:b2Contact = null;
            var _loc_3:* = param1.GetType();
            var _loc_4:* = param2.GetType();
            var _loc_5:* = m_registers[_loc_3][_loc_4];
            if (m_registers[_loc_3][_loc_4].pool)
            {
                _loc_6 = _loc_5.pool;
                _loc_5.pool = _loc_6.m_next;
                var _loc_8:* = _loc_5;
                var _loc_9:* = _loc_5.poolCount - 1;
                _loc_8.poolCount = _loc_9;
                _loc_6.Reset(param1, param2);
                return _loc_6;
            }
            var _loc_7:* = _loc_5.createFcn;
            if (_loc_5.createFcn != null)
            {
                if (_loc_5.primary)
                {
                    _loc_6 = this._loc_7(m_allocator);
                    _loc_6.Reset(param1, param2);
                    return _loc_6;
                }
                _loc_6 = this._loc_7(m_allocator);
                _loc_6.Reset(param2, param1);
                return _loc_6;
            }
            else
            {
                return null;
            }
        }// end function

    }
}
