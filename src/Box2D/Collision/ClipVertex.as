package Box2D.Collision
{
    import Box2D.Common.Math.*;

    public class ClipVertex extends Object
    {
        public var id:b2ContactID;
        public var v:b2Vec2;

        public function ClipVertex()
        {
            v = new b2Vec2();
            id = new b2ContactID();
            return;
        }// end function

        public function Set(param1:ClipVertex) : void
        {
            v.SetV(param1.v);
            id.Set(param1.id);
            return;
        }// end function

    }
}
