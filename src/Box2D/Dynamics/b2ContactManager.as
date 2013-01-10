package Box2D.Dynamics
{
    import Box2D.Collision.*;
    import Box2D.Dynamics.Contacts.*;

    public class b2ContactManager extends Object
    {
        var m_world:b2World;
        var m_contactCount:int;
        var m_contactFactory:b2ContactFactory;
        var m_contactFilter:b2ContactFilter;
        var m_broadPhase:IBroadPhase;
        var m_contactList:b2Contact;
        var m_contactListener:b2ContactListener;
        var m_allocator:Object;
        private static const s_evalCP:b2ContactPoint = new b2ContactPoint();

        public function b2ContactManager()
        {
            m_world = null;
            m_contactCount = 0;
            m_contactFilter = b2ContactFilter.b2_defaultFilter;
            m_contactListener = b2ContactListener.b2_defaultListener;
            m_contactFactory = new b2ContactFactory(m_allocator);
            m_broadPhase = new b2DynamicTreeBroadPhase();
            return;
        }// end function

        public function FindNewContacts() : void
        {
            m_broadPhase.UpdatePairs(AddPair);
            return;
        }// end function

        public function Destroy(param1:b2Contact) : void
        {
            var _loc_2:* = param1.GetFixtureA();
            var _loc_3:* = param1.GetFixtureB();
            var _loc_4:* = _loc_2.GetBody();
            var _loc_5:* = _loc_3.GetBody();
            if (param1.m_manifold.m_pointCount > 0)
            {
                m_contactListener.EndContact(param1);
            }
            if (param1.m_prev)
            {
                param1.m_prev.m_next = param1.m_next;
            }
            if (param1.m_next)
            {
                param1.m_next.m_prev = param1.m_prev;
            }
            if (param1 == m_world.m_contactList)
            {
                m_world.m_contactList = param1.m_next;
            }
            if (param1.m_nodeA.prev)
            {
                param1.m_nodeA.prev.next = param1.m_nodeA.next;
            }
            if (param1.m_nodeA.next)
            {
                param1.m_nodeA.next.prev = param1.m_nodeA.prev;
            }
            if (param1.m_nodeA == _loc_4.m_contactList)
            {
                _loc_4.m_contactList = param1.m_nodeA.next;
            }
            if (param1.m_nodeB.prev)
            {
                param1.m_nodeB.prev.next = param1.m_nodeB.next;
            }
            if (param1.m_nodeB.next)
            {
                param1.m_nodeB.next.prev = param1.m_nodeB.prev;
            }
            if (param1.m_nodeB == _loc_5.m_contactList)
            {
                _loc_5.m_contactList = param1.m_nodeB.next;
            }
            m_contactFactory.Destroy(param1);
            var _loc_7:* = m_contactCount - 1;
            m_contactCount = _loc_7;
            return;
        }// end function

        public function AddPair(param1, param2) : void
        {
            var _loc_9:b2Fixture = null;
            var _loc_10:b2Fixture = null;
            var _loc_3:* = param1 as b2Fixture;
            var _loc_4:* = param2 as b2Fixture;
            var _loc_5:* = _loc_3.GetBody();
            var _loc_6:* = _loc_4.GetBody();
            if (_loc_5 == _loc_6)
            {
                return;
            }
            var _loc_7:* = _loc_6.GetContactList();
            while (_loc_7)
            {
                
                if (_loc_7.other == _loc_5)
                {
                    _loc_9 = _loc_7.contact.GetFixtureA();
                    _loc_10 = _loc_7.contact.GetFixtureB();
                    if (_loc_9 == _loc_3 && _loc_10 == _loc_4)
                    {
                        return;
                    }
                    if (_loc_9 == _loc_4 && _loc_10 == _loc_3)
                    {
                        return;
                    }
                }
                _loc_7 = _loc_7.next;
            }
            if (_loc_6.ShouldCollide(_loc_5) == false)
            {
                return;
            }
            if (m_contactFilter.ShouldCollide(_loc_3, _loc_4) == false)
            {
                return;
            }
            var _loc_8:* = m_contactFactory.Create(_loc_3, _loc_4);
            _loc_3 = m_contactFactory.Create(_loc_3, _loc_4).GetFixtureA();
            _loc_4 = _loc_8.GetFixtureB();
            _loc_5 = _loc_3.m_body;
            _loc_6 = _loc_4.m_body;
            _loc_8.m_prev = null;
            _loc_8.m_next = m_world.m_contactList;
            if (m_world.m_contactList != null)
            {
                m_world.m_contactList.m_prev = _loc_8;
            }
            m_world.m_contactList = _loc_8;
            _loc_8.m_nodeA.contact = _loc_8;
            _loc_8.m_nodeA.other = _loc_6;
            _loc_8.m_nodeA.prev = null;
            _loc_8.m_nodeA.next = _loc_5.m_contactList;
            if (_loc_5.m_contactList != null)
            {
                _loc_5.m_contactList.prev = _loc_8.m_nodeA;
            }
            _loc_5.m_contactList = _loc_8.m_nodeA;
            _loc_8.m_nodeB.contact = _loc_8;
            _loc_8.m_nodeB.other = _loc_5;
            _loc_8.m_nodeB.prev = null;
            _loc_8.m_nodeB.next = _loc_6.m_contactList;
            if (_loc_6.m_contactList != null)
            {
                _loc_6.m_contactList.prev = _loc_8.m_nodeB;
            }
            _loc_6.m_contactList = _loc_8.m_nodeB;
            var _loc_11:* = m_world;
            var _loc_12:* = m_world.m_contactCount + 1;
            _loc_11.m_contactCount = _loc_12;
            return;
        }// end function

        public function Collide() : void
        {
            var _loc_2:b2Fixture = null;
            var _loc_3:b2Fixture = null;
            var _loc_4:b2Body = null;
            var _loc_5:b2Body = null;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:Boolean = false;
            var _loc_9:b2Contact = null;
            var _loc_1:* = m_world.m_contactList;
            while (_loc_1)
            {
                
                _loc_2 = _loc_1.GetFixtureA();
                _loc_3 = _loc_1.GetFixtureB();
                _loc_4 = _loc_2.GetBody();
                _loc_5 = _loc_3.GetBody();
                if (_loc_4.IsAwake() == false && _loc_5.IsAwake() == false)
                {
                    _loc_1 = _loc_1.GetNext();
                    continue;
                }
                if (_loc_1.m_flags & b2Contact.e_filterFlag)
                {
                    if (_loc_5.ShouldCollide(_loc_4) == false)
                    {
                        _loc_9 = _loc_1;
                        _loc_1 = _loc_9.GetNext();
                        Destroy(_loc_9);
                        continue;
                    }
                    if (m_contactFilter.ShouldCollide(_loc_2, _loc_3) == false)
                    {
                        _loc_9 = _loc_1;
                        _loc_1 = _loc_9.GetNext();
                        Destroy(_loc_9);
                        continue;
                    }
                    _loc_1.m_flags = _loc_1.m_flags & ~b2Contact.e_filterFlag;
                }
                _loc_6 = _loc_2.m_proxy;
                _loc_7 = _loc_3.m_proxy;
                _loc_8 = m_broadPhase.TestOverlap(_loc_6, _loc_7);
                if (_loc_8 == false)
                {
                    _loc_9 = _loc_1;
                    _loc_1 = _loc_9.GetNext();
                    Destroy(_loc_9);
                    continue;
                }
                _loc_1.Update(m_contactListener);
                _loc_1 = _loc_1.GetNext();
            }
            return;
        }// end function

    }
}
