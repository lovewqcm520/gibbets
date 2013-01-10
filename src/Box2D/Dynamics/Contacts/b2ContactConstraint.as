package Box2D.Dynamics.Contacts
{
    import Box2D.Collision.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;
    import Box2D.Dynamics.*;

    public class b2ContactConstraint extends Object
    {
        public var type:int;
        public var normalMass:b2Mat22;
        public var K:b2Mat22;
        public var manifold:b2Manifold;
        public var radius:Number;
        public var bodyA:b2Body;
        public var bodyB:b2Body;
        public var points:Array;
        public var localPoint:b2Vec2;
        public var pointCount:int;
        public var normal:b2Vec2;
        public var restitution:Number;
        public var localPlaneNormal:b2Vec2;
        public var friction:Number;

        public function b2ContactConstraint()
        {
            localPlaneNormal = new b2Vec2();
            localPoint = new b2Vec2();
            normal = new b2Vec2();
            normalMass = new b2Mat22();
            K = new b2Mat22();
            points = new Array(b2Settings.b2_maxManifoldPoints);
            var _loc_1:int = 0;
            while (_loc_1 < b2Settings.b2_maxManifoldPoints)
            {
                
                points[_loc_1] = new b2ContactConstraintPoint();
                _loc_1++;
            }
            return;
        }// end function

    }
}
