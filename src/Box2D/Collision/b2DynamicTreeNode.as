package Box2D.Collision
{

    public class b2DynamicTreeNode extends Object
    {
        public var aabb:b2AABB;
        public var parent:b2DynamicTreeNode;
        public var userData:Object;
        public var child2:b2DynamicTreeNode;
        public var child1:b2DynamicTreeNode;

        public function b2DynamicTreeNode()
        {
            aabb = new b2AABB();
            return;
        }// end function

        public function IsLeaf() : Boolean
        {
            return child1 == null;
        }// end function

    }
}
