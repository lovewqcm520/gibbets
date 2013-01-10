package Box2D.Collision
{

    public class b2ContactID extends Object
    {
        var _key:uint;
        public var features:Features;

        public function b2ContactID()
        {
            features = new Features();
            features._m_id = this;
            return;
        }// end function

        public function Set(param1:b2ContactID) : void
        {
            key = param1._key;
            return;
        }// end function

        public function Copy() : b2ContactID
        {
            var _loc_1:* = new b2ContactID();
            _loc_1.key = key;
            return _loc_1;
        }// end function

        public function set key(param1:uint) : void
        {
            _key = param1;
            features._referenceEdge = _key & 255;
            features._incidentEdge = (_key & 65280) >> 8 & 255;
            features._incidentVertex = (_key & 16711680) >> 16 & 255;
            features._flip = (_key & 4278190080) >> 24 & 255;
            return;
        }// end function

        public function get key() : uint
        {
            return _key;
        }// end function

    }
}
