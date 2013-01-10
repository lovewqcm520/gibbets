package Box2D.Collision
{
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2DynamicTree extends Object
    {
        private var m_insertionCount:int;
        private var m_root:b2DynamicTreeNode;
        private var m_freeList:b2DynamicTreeNode;
        private var m_path:uint;

        public function b2DynamicTree()
        {
            m_root = null;
            m_freeList = null;
            m_path = 0;
            m_insertionCount = 0;
            return;
        }// end function

        private function RemoveLeaf(param1:b2DynamicTreeNode) : void
        {
            var _loc_4:b2DynamicTreeNode = null;
            var _loc_5:b2AABB = null;
            if (param1 == m_root)
            {
                m_root = null;
                return;
            }
            var _loc_2:* = param1.parent;
            var _loc_3:* = _loc_2.parent;
            if (_loc_2.child1 == param1)
            {
                _loc_4 = _loc_2.child2;
            }
            else
            {
                _loc_4 = _loc_2.child1;
            }
            if (_loc_3)
            {
                if (_loc_3.child1 == _loc_2)
                {
                    _loc_3.child1 = _loc_4;
                }
                else
                {
                    _loc_3.child2 = _loc_4;
                }
                _loc_4.parent = _loc_3;
                FreeNode(_loc_2);
                while (_loc_3)
                {
                    
                    _loc_5 = _loc_3.aabb;
                    _loc_3.aabb = b2AABB.Combine(_loc_3.child1.aabb, _loc_3.child2.aabb);
                    if (_loc_5.Contains(_loc_3.aabb))
                    {
                        break;
                    }
                    _loc_3 = _loc_3.parent;
                }
            }
            else
            {
                m_root = _loc_4;
                _loc_4.parent = null;
                FreeNode(_loc_2);
            }
            return;
        }// end function

        public function GetFatAABB(param1:b2DynamicTreeNode) : b2AABB
        {
            return param1.aabb;
        }// end function

        public function Query(param1:Function, param2:b2AABB) : void
        {
            var _loc_5:b2DynamicTreeNode = null;
            var _loc_6:Boolean = false;
            if (m_root == null)
            {
                return;
            }
            var _loc_3:* = new Array();
            var _loc_4:int = 0;
            _loc_3[++_loc_4] = m_root;
            while (_loc_4 > 0)
            {
                
                _loc_5 = _loc_3[--_loc_4];
                if (_loc_5.aabb.TestOverlap(param2))
                {
                    if (_loc_5.IsLeaf())
                    {
                        _loc_6 = this.param1(_loc_5);
                        if (!_loc_6)
                        {
                            return;
                        }
                        continue;
                    }
                    _loc_4 = --_loc_4 + 1;
                    _loc_3[--_loc_4] = _loc_5.child1;
                    _loc_3[++_loc_4] = _loc_5.child2;
                }
            }
            return;
        }// end function

        public function RayCast(param1:Function, param2:b2RayCastInput) : void
        {
            var _loc_3:b2Vec2 = null;
            var _loc_9:b2AABB = null;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_14:b2DynamicTreeNode = null;
            var _loc_15:b2Vec2 = null;
            var _loc_16:b2Vec2 = null;
            var _loc_17:Number = NaN;
            var _loc_18:b2RayCastInput = null;
            if (m_root == null)
            {
                return;
            }
            _loc_3 = param2.p1;
            var _loc_4:* = param2.p2;
            var _loc_5:* = b2Math.SubtractVV(_loc_3, _loc_4);
            b2Math.SubtractVV(_loc_3, _loc_4).Normalize();
            var _loc_6:* = b2Math.CrossFV(1, _loc_5);
            var _loc_7:* = b2Math.AbsV(_loc_6);
            var _loc_8:* = param2.maxFraction;
            _loc_9 = new b2AABB();
            _loc_10 = _loc_3.x + _loc_8 * (_loc_4.x - _loc_3.x);
            _loc_11 = _loc_3.y + _loc_8 * (_loc_4.y - _loc_3.y);
            _loc_9.lowerBound.x = Math.min(_loc_3.x, _loc_10);
            _loc_9.lowerBound.y = Math.min(_loc_3.y, _loc_11);
            _loc_9.upperBound.x = Math.max(_loc_3.x, _loc_10);
            _loc_9.upperBound.y = Math.max(_loc_3.y, _loc_11);
            var _loc_12:* = new Array();
            var _loc_13:int = 0;
            _loc_12[++_loc_13] = m_root;
            while (_loc_13 > 0)
            {
                
                _loc_14 = _loc_12[--_loc_13];
                if (_loc_14.aabb.TestOverlap(_loc_9) == false)
                {
                    continue;
                }
                _loc_15 = _loc_14.aabb.GetCenter();
                _loc_16 = _loc_14.aabb.GetExtents();
                _loc_17 = Math.abs(_loc_6.x * (_loc_3.x - _loc_15.x) + _loc_6.y * (_loc_3.y - _loc_15.y)) - _loc_7.x * _loc_16.x - _loc_7.y * _loc_16.y;
                if (_loc_17 > 0)
                {
                    continue;
                }
                if (_loc_14.IsLeaf())
                {
                    _loc_18 = new b2RayCastInput();
                    _loc_18.p1 = param2.p1;
                    _loc_18.p2 = param2.p2;
                    _loc_18.maxFraction = param2.maxFraction;
                    _loc_8 = this.param1(_loc_18, _loc_14);
                    if (_loc_8 == 0)
                    {
                        return;
                    }
                    _loc_10 = _loc_3.x + _loc_8 * (_loc_4.x - _loc_3.x);
                    _loc_11 = _loc_3.y + _loc_8 * (_loc_4.y - _loc_3.y);
                    _loc_9.lowerBound.x = Math.min(_loc_3.x, _loc_10);
                    _loc_9.lowerBound.y = Math.min(_loc_3.y, _loc_11);
                    _loc_9.upperBound.x = Math.max(_loc_3.x, _loc_10);
                    _loc_9.upperBound.y = Math.max(_loc_3.y, _loc_11);
                    continue;
                }
                _loc_13 = --_loc_13 + 1;
                _loc_12[--_loc_13] = _loc_14.child1;
                _loc_12[++_loc_13] = _loc_14.child2;
            }
            return;
        }// end function

        public function GetUserData(param1:b2DynamicTreeNode)
        {
            return param1.userData;
        }// end function

        private function FreeNode(param1:b2DynamicTreeNode) : void
        {
            param1.parent = m_freeList;
            m_freeList = param1;
            return;
        }// end function

        public function Rebalance(param1:int) : void
        {
            var _loc_3:b2DynamicTreeNode = null;
            var _loc_4:uint = 0;
            if (m_root == null)
            {
                return;
            }
            var _loc_2:int = 0;
            while (_loc_2 < param1)
            {
                
                _loc_3 = m_root;
                _loc_4 = 0;
                while (_loc_3.IsLeaf() == false)
                {
                    
                    _loc_3 = m_path >> _loc_4 & 1 ? (_loc_3.child2) : (_loc_3.child1);
                    _loc_4 = (_loc_4 + 1) & 31;
                }
                var _loc_6:* = m_path + 1;
                m_path = _loc_6;
                RemoveLeaf(_loc_3);
                InsertLeaf(_loc_3);
                _loc_2++;
            }
            return;
        }// end function

        public function CreateProxy(param1:b2AABB, param2) : b2DynamicTreeNode
        {
            var _loc_3:b2DynamicTreeNode = null;
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            _loc_3 = AllocateNode();
            _loc_4 = b2Settings.b2_aabbExtension;
            _loc_5 = b2Settings.b2_aabbExtension;
            _loc_3.aabb.lowerBound.x = param1.lowerBound.x - _loc_4;
            _loc_3.aabb.lowerBound.y = param1.lowerBound.y - _loc_5;
            _loc_3.aabb.upperBound.x = param1.upperBound.x + _loc_4;
            _loc_3.aabb.upperBound.y = param1.upperBound.y + _loc_5;
            _loc_3.userData = param2;
            InsertLeaf(_loc_3);
            return _loc_3;
        }// end function

        public function DestroyProxy(param1:b2DynamicTreeNode) : void
        {
            RemoveLeaf(param1);
            FreeNode(param1);
            return;
        }// end function

        private function InsertLeaf(param1:b2DynamicTreeNode) : void
        {
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_11:* = m_insertionCount + 1;
            m_insertionCount = _loc_11;
            if (m_root == null)
            {
                m_root = param1;
                m_root.parent = null;
                return;
            }
            var _loc_2:* = param1.aabb.GetCenter();
            var _loc_3:* = m_root;
            if (_loc_3.IsLeaf() == false)
            {
                do
                {
                    
                    _loc_6 = _loc_3.child1;
                    _loc_7 = _loc_3.child2;
                    _loc_8 = Math.abs((_loc_6.aabb.lowerBound.x + _loc_6.aabb.upperBound.x) / 2 - _loc_2.x) + Math.abs((_loc_6.aabb.lowerBound.y + _loc_6.aabb.upperBound.y) / 2 - _loc_2.y);
                    _loc_9 = Math.abs((_loc_7.aabb.lowerBound.x + _loc_7.aabb.upperBound.x) / 2 - _loc_2.x) + Math.abs((_loc_7.aabb.lowerBound.y + _loc_7.aabb.upperBound.y) / 2 - _loc_2.y);
                    if (_loc_8 < _loc_9)
                    {
                        _loc_3 = _loc_6;
                        continue;
                    }
                    _loc_3 = _loc_7;
                }while (_loc_3.IsLeaf() == false)
            }
            var _loc_4:* = _loc_3.parent;
            var _loc_5:* = AllocateNode();
            AllocateNode().parent = _loc_4;
            _loc_5.userData = null;
            _loc_5.aabb.Combine(param1.aabb, _loc_3.aabb);
            if (_loc_4)
            {
                if (_loc_3.parent.child1 == _loc_3)
                {
                    _loc_4.child1 = _loc_5;
                }
                else
                {
                    _loc_4.child2 = _loc_5;
                }
                _loc_5.child1 = _loc_3;
                _loc_5.child2 = param1;
                _loc_3.parent = _loc_5;
                param1.parent = _loc_5;
                do
                {
                    
                    if (_loc_4.aabb.Contains(_loc_5.aabb))
                    {
                        break;
                    }
                    _loc_4.aabb.Combine(_loc_4.child1.aabb, _loc_4.child2.aabb);
                    _loc_5 = _loc_4;
                    _loc_4 = _loc_4.parent;
                }while (_loc_4)
            }
            else
            {
                _loc_5.child1 = _loc_3;
                _loc_5.child2 = param1;
                _loc_3.parent = _loc_5;
                param1.parent = _loc_5;
                m_root = _loc_5;
            }
            return;
        }// end function

        public function MoveProxy(param1:b2DynamicTreeNode, param2:b2AABB, param3:b2Vec2) : Boolean
        {
            var _loc_4:Number = NaN;
            var _loc_5:Number = NaN;
            b2Settings.b2Assert(param1.IsLeaf());
            if (param1.aabb.Contains(param2))
            {
                return false;
            }
            RemoveLeaf(param1);
            _loc_4 = b2Settings.b2_aabbExtension + b2Settings.b2_aabbMultiplier * (param3.x > 0 ? (param3.x) : (-param3.x));
            _loc_5 = b2Settings.b2_aabbExtension + b2Settings.b2_aabbMultiplier * (param3.y > 0 ? (param3.y) : (-param3.y));
            param1.aabb.lowerBound.x = param2.lowerBound.x - _loc_4;
            param1.aabb.lowerBound.y = param2.lowerBound.y - _loc_5;
            param1.aabb.upperBound.x = param2.upperBound.x + _loc_4;
            param1.aabb.upperBound.y = param2.upperBound.y + _loc_5;
            InsertLeaf(param1);
            return true;
        }// end function

        private function AllocateNode() : b2DynamicTreeNode
        {
            var _loc_1:b2DynamicTreeNode = null;
            if (m_freeList)
            {
                _loc_1 = m_freeList;
                m_freeList = _loc_1.parent;
                _loc_1.parent = null;
                _loc_1.child1 = null;
                _loc_1.child2 = null;
                return _loc_1;
            }
            return new b2DynamicTreeNode();
        }// end function

    }
}
