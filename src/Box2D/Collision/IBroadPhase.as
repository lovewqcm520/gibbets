package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public interface IBroadPhase
    {

        public function IBroadPhase();

        function GetFatAABB(param1) : b2AABB;

        function Query(param1:Function, param2:b2AABB) : void;

        function Rebalance(param1:int) : void;

        function GetUserData(param1);

        function UpdatePairs(param1:Function) : void;

        function CreateProxy(param1:b2AABB, param2);

        function DestroyProxy(param1) : void;

        function TestOverlap(param1, param2) : Boolean;

        function Validate() : void;

        function GetProxyCount() : int;

        function RayCast(param1:Function, param2:b2RayCastInput) : void;

        function MoveProxy(param1, param2:b2AABB, param3:b2Vec2) : void;

    }
}
