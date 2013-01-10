package Box2D.Dynamics.Controllers
{
    import Box2D.Dynamics.*;

    public class b2Controller extends Object
    {
        var m_world:b2World;
        var m_prev:b2Controller;
        var m_next:b2Controller;
        protected var m_bodyList:b2ControllerEdge;
        protected var m_bodyCount:int;

        public function b2Controller()
        {
            return;
        }// end function

        public function AddBody(param1:b2Body) : void
        {
            var _loc_2:* = new b2ControllerEdge();
            _loc_2.controller = this;
            _loc_2.body = param1;
            _loc_2.nextBody = m_bodyList;
            _loc_2.prevBody = null;
            m_bodyList = _loc_2;
            if (_loc_2.nextBody)
            {
                _loc_2.nextBody.prevBody = _loc_2;
            }
            var _loc_4:* = m_bodyCount + 1;
            m_bodyCount = _loc_4;
            _loc_2.nextController = param1.m_controllerList;
            _loc_2.prevController = null;
            param1.m_controllerList = _loc_2;
            if (_loc_2.nextController)
            {
                _loc_2.nextController.prevController = _loc_2;
            }
            var _loc_3:* = param1;
            var _loc_4:* = param1.m_controllerCount + 1;
            _loc_3.m_controllerCount = _loc_4;
            return;
        }// end function

        public function Draw(param1:b2DebugDraw) : void
        {
            return;
        }// end function

        public function RemoveBody(param1:b2Body) : void
        {
            var _loc_2:* = param1.m_controllerList;
            while (_loc_2 && _loc_2.controller != this)
            {
                
                _loc_2 = _loc_2.nextController;
            }
            if (_loc_2.prevBody)
            {
                _loc_2.prevBody.nextBody = _loc_2.nextBody;
            }
            if (_loc_2.nextBody)
            {
                _loc_2.nextBody.prevBody = _loc_2.prevBody;
            }
            if (_loc_2.nextController)
            {
                _loc_2.nextController.prevController = _loc_2.prevController;
            }
            if (_loc_2.prevController)
            {
                _loc_2.prevController.nextController = _loc_2.nextController;
            }
            if (m_bodyList == _loc_2)
            {
                m_bodyList = _loc_2.nextBody;
            }
            if (param1.m_controllerList == _loc_2)
            {
                param1.m_controllerList = _loc_2.nextController;
            }
            var _loc_3:* = param1;
            var _loc_4:* = param1.m_controllerCount - 1;
            _loc_3.m_controllerCount = _loc_4;
            var _loc_4:* = m_bodyCount - 1;
            m_bodyCount = _loc_4;
            return;
        }// end function

        public function GetNext() : b2Controller
        {
            return m_next;
        }// end function

        public function Clear() : void
        {
            while (m_bodyList)
            {
                
                RemoveBody(m_bodyList.body);
            }
            return;
        }// end function

        public function Step(param1:b2TimeStep) : void
        {
            return;
        }// end function

        public function GetBodyList() : b2ControllerEdge
        {
            return m_bodyList;
        }// end function

        public function GetWorld() : b2World
        {
            return m_world;
        }// end function

    }
}
