package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class b2DynamicTreeBroadPhase extends Object implements IBroadPhase
    {
        private var m_moveBuffer:Array;
        private var m_tree:b2DynamicTree;
        private var m_pairBuffer:Array;
        private var m_pairCount:int = 0;
        private var m_proxyCount:int;

        public function b2DynamicTreeBroadPhase()
        {
            m_tree = new b2DynamicTree();
            m_moveBuffer = new Array();
            m_pairBuffer = new Array();
            return;
        }// end function

        public function Validate() : void
        {
            return;
        }// end function

        private function UnBufferMove(param1:b2DynamicTreeNode) : void
        {
            var _loc_2:* = m_moveBuffer.indexOf(param1);
            m_moveBuffer.splice(_loc_2, 1);
            return;
        }// end function

        private function BufferMove(param1:b2DynamicTreeNode) : void
        {
            m_moveBuffer[m_moveBuffer.length] = param1;
            return;
        }// end function

        private function ComparePairs(param1:b2DynamicTreePair, param2:b2DynamicTreePair) : int
        {
            return 0;
        }// end function

        public function GetProxyCount() : int
        {
            return m_proxyCount;
        }// end function

        public function GetFatAABB(param1) : b2AABB
        {
            return m_tree.GetFatAABB(param1);
        }// end function

        public function Query(param1:Function, param2:b2AABB) : void
        {
            m_tree.Query(param1, param2);
            return;
        }// end function

        public function Rebalance(param1:int) : void
        {
            m_tree.Rebalance(param1);
            return;
        }// end function

        public function TestOverlap(param1, param2) : Boolean
        {
            var _loc_3:* = m_tree.GetFatAABB(param1);
            var _loc_4:* = m_tree.GetFatAABB(param2);
            return _loc_3.TestOverlap(_loc_4);
        }// end function

        public function UpdatePairs(param1:Function) : void
        {
            var queryProxy:b2DynamicTreeNode;
            var i:int;
            var fatAABB:b2AABB;
            var primaryPair:b2DynamicTreePair;
            var userDataA:*;
            var userDataB:*;
            var pair:b2DynamicTreePair;
            var callback:* = param1;
            m_pairCount = 0;
            var _loc_3:int = 0;
            var _loc_4:* = m_moveBuffer;
            while (_loc_4 in _loc_3)
            {
                
                queryProxy = _loc_4[_loc_3];
                var QueryCallback:* = function (param1:b2DynamicTreeNode) : Boolean
            {
                if (param1 == queryProxy)
                {
                    return true;
                }
                if (m_pairCount == m_pairBuffer.length)
                {
                    m_pairBuffer[m_pairCount] = new b2DynamicTreePair();
                }
                var _loc_2:* = m_pairBuffer[m_pairCount];
                _loc_2.proxyA = param1 < queryProxy ? (param1) : (queryProxy);
                _loc_2.proxyB = param1 >= queryProxy ? (param1) : (queryProxy);
                var _loc_4:* = m_pairCount + 1;
                m_pairCount = _loc_4;
                return true;
            }// end function
            ;
                fatAABB = m_tree.GetFatAABB(queryProxy);
                m_tree.Query(QueryCallback, fatAABB);
            }
            m_moveBuffer.length = 0;
            i;
            while (i < m_pairCount)
            {
                
                primaryPair = m_pairBuffer[i];
                userDataA = m_tree.GetUserData(primaryPair.proxyA);
                userDataB = m_tree.GetUserData(primaryPair.proxyB);
                this.callback(userDataA, userDataB);
                i = (i + 1);
                while (i < m_pairCount)
                {
                    
                    pair = m_pairBuffer[i];
                    if (pair.proxyA != primaryPair.proxyA || pair.proxyB != primaryPair.proxyB)
                    {
                        break;
                    }
                    i = (i + 1);
                }
            }
            return;
        }// end function

        public function RayCast(param1:Function, param2:b2RayCastInput) : void
        {
            m_tree.RayCast(param1, param2);
            return;
        }// end function

        public function CreateProxy(param1:b2AABB, param2)
        {
            var _loc_3:* = m_tree.CreateProxy(param1, param2);
            var _loc_5:* = m_proxyCount + 1;
            m_proxyCount = _loc_5;
            BufferMove(_loc_3);
            return _loc_3;
        }// end function

        public function GetUserData(param1)
        {
            return m_tree.GetUserData(param1);
        }// end function

        public function DestroyProxy(param1) : void
        {
            UnBufferMove(param1);
            var _loc_3:* = m_proxyCount - 1;
            m_proxyCount = _loc_3;
            m_tree.DestroyProxy(param1);
            return;
        }// end function

        public function MoveProxy(param1, param2:b2AABB, param3:b2Vec2) : void
        {
            var _loc_4:* = m_tree.MoveProxy(param1, param2, param3);
            if (m_tree.MoveProxy(param1, param2, param3))
            {
                BufferMove(param1);
            }
            return;
        }// end function

    }
}
