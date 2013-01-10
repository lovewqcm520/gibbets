package Box2D.Collision.Shapes
{
    import Box2D.Collision.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2PolygonShape extends b2Shape
    {
        var m_vertexCount:int;
        var m_vertices:Array;
        var m_centroid:b2Vec2;
        var m_normals:Array;
        private static var s_mat:b2Mat22 = new b2Mat22();

        public function b2PolygonShape()
        {
            m_type = e_polygonShape;
            m_centroid = new b2Vec2();
            m_vertices = new Array();
            m_normals = new Array();
            return;
        }// end function

        override public function Set(param1:b2Shape) : void
        {
            var _loc_2:b2PolygonShape = null;
            var _loc_3:int = 0;
            super.Set(param1);
            if (param1 is b2PolygonShape)
            {
                _loc_2 = param1 as b2PolygonShape;
                m_centroid.SetV(_loc_2.m_centroid);
                m_vertexCount = _loc_2.m_vertexCount;
                Reserve(m_vertexCount);
                _loc_3 = 0;
                while (_loc_3 < m_vertexCount)
                {
                    
                    m_vertices[_loc_3].SetV(_loc_2.m_vertices[_loc_3]);
                    m_normals[_loc_3].SetV(_loc_2.m_normals[_loc_3]);
                    _loc_3++;
                }
            }
            return;
        }// end function

        override public function ComputeAABB(param1:b2AABB, param2:b2Transform) : void
        {
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_3:* = param2.R;
            var _loc_4:* = m_vertices[0];
            var _loc_5:* = param2.position.x + (_loc_3.col1.x * _loc_4.x + _loc_3.col2.x * _loc_4.y);
            var _loc_6:* = param2.position.y + (_loc_3.col1.y * _loc_4.x + _loc_3.col2.y * _loc_4.y);
            var _loc_7:* = _loc_5;
            var _loc_8:* = _loc_6;
            var _loc_9:int = 1;
            while (_loc_9 < m_vertexCount)
            {
                
                _loc_4 = m_vertices[_loc_9];
                _loc_10 = param2.position.x + (_loc_3.col1.x * _loc_4.x + _loc_3.col2.x * _loc_4.y);
                _loc_11 = param2.position.y + (_loc_3.col1.y * _loc_4.x + _loc_3.col2.y * _loc_4.y);
                _loc_5 = _loc_5 < _loc_10 ? (_loc_5) : (_loc_10);
                _loc_6 = _loc_6 < _loc_11 ? (_loc_6) : (_loc_11);
                _loc_7 = _loc_7 > _loc_10 ? (_loc_7) : (_loc_10);
                _loc_8 = _loc_8 > _loc_11 ? (_loc_8) : (_loc_11);
                _loc_9++;
            }
            param1.lowerBound.x = _loc_5 - m_radius;
            param1.lowerBound.y = _loc_6 - m_radius;
            param1.upperBound.x = _loc_7 + m_radius;
            param1.upperBound.y = _loc_8 + m_radius;
            return;
        }// end function

        override public function ComputeSubmergedArea(param1:b2Vec2, param2:Number, param3:b2Transform, param4:b2Vec2) : Number
        {
            var _loc_12:int = 0;
            var _loc_22:b2Vec2 = null;
            var _loc_23:Boolean = false;
            var _loc_24:b2MassData = null;
            var _loc_25:Number = NaN;
            var _loc_5:* = b2Math.MulTMV(param3.R, param1);
            var _loc_6:* = param2 - b2Math.Dot(param1, param3.position);
            var _loc_7:* = new Array();
            var _loc_8:int = 0;
            var _loc_9:int = -1;
            var _loc_10:int = -1;
            var _loc_11:Boolean = false;
            _loc_12 = 0;
            while (_loc_12 < m_vertexCount)
            {
                
                _loc_7[_loc_12] = b2Math.Dot(_loc_5, m_vertices[_loc_12]) - _loc_6;
                _loc_23 = _loc_7[_loc_12] < -Number.MIN_VALUE;
                if (_loc_12 > 0)
                {
                    if (_loc_23)
                    {
                        if (!_loc_11)
                        {
                            _loc_9 = _loc_12 - 1;
                            _loc_8++;
                        }
                    }
                    else if (_loc_11)
                    {
                        _loc_10 = _loc_12 - 1;
                        _loc_8++;
                    }
                }
                _loc_11 = _loc_23;
                _loc_12++;
            }
            switch(_loc_8)
            {
                case 0:
                {
                    if (_loc_11)
                    {
                        _loc_24 = new b2MassData();
                        ComputeMass(_loc_24, 1);
                        param4.SetV(b2Math.MulX(param3, _loc_24.center));
                        return _loc_24.mass;
                    }
                    return 0;
                }
                case 1:
                {
                    if (_loc_9 == -1)
                    {
                        _loc_9 = m_vertexCount - 1;
                    }
                    else
                    {
                        _loc_10 = m_vertexCount - 1;
                    }
                    break;
                }
                default:
                {
                    break;
                }
            }
            var _loc_13:* = (_loc_9 + 1) % m_vertexCount;
            var _loc_14:* = (_loc_10 + 1) % m_vertexCount;
            var _loc_15:* = -_loc_7[_loc_9] / (_loc_7[_loc_13] - _loc_7[_loc_9]);
            var _loc_16:* = -_loc_7[_loc_10] / (_loc_7[_loc_14] - _loc_7[_loc_10]);
            var _loc_17:* = new b2Vec2(m_vertices[_loc_9].x * (1 - _loc_15) + m_vertices[_loc_13].x * _loc_15, m_vertices[_loc_9].y * (1 - _loc_15) + m_vertices[_loc_13].y * _loc_15);
            var _loc_18:* = new b2Vec2(m_vertices[_loc_10].x * (1 - _loc_16) + m_vertices[_loc_14].x * _loc_16, m_vertices[_loc_10].y * (1 - _loc_16) + m_vertices[_loc_14].y * _loc_16);
            var _loc_19:Number = 0;
            var _loc_20:* = new b2Vec2();
            var _loc_21:* = m_vertices[_loc_13];
            _loc_12 = _loc_13;
            while (_loc_12 != _loc_14)
            {
                
                _loc_12 = (_loc_12 + 1) % m_vertexCount;
                if (_loc_12 == _loc_14)
                {
                    _loc_22 = _loc_18;
                }
                else
                {
                    _loc_22 = m_vertices[_loc_12];
                }
                _loc_25 = 0.5 * ((_loc_21.x - _loc_17.x) * (_loc_22.y - _loc_17.y) - (_loc_21.y - _loc_17.y) * (_loc_22.x - _loc_17.x));
                _loc_19 = _loc_19 + _loc_25;
                _loc_20.x = _loc_20.x + _loc_25 * (_loc_17.x + _loc_21.x + _loc_22.x) / 3;
                _loc_20.y = _loc_20.y + _loc_25 * (_loc_17.y + _loc_21.y + _loc_22.y) / 3;
                _loc_21 = _loc_22;
            }
            _loc_20.Multiply(1 / _loc_19);
            param4.SetV(b2Math.MulX(param3, _loc_20));
            return _loc_19;
        }// end function

        public function GetVertices() : Array
        {
            return m_vertices;
        }// end function

        public function SetAsOrientedBox(param1:Number, param2:Number, param3:b2Vec2 = null, param4:Number = 0) : void
        {
            m_vertexCount = 4;
            Reserve(4);
            m_vertices[0].Set(-param1, -param2);
            m_vertices[1].Set(param1, -param2);
            m_vertices[2].Set(param1, param2);
            m_vertices[3].Set(-param1, param2);
            m_normals[0].Set(0, -1);
            m_normals[1].Set(1, 0);
            m_normals[2].Set(0, 1);
            m_normals[3].Set(-1, 0);
            m_centroid = param3;
            var _loc_5:* = new b2Transform();
            new b2Transform().position = param3;
            _loc_5.R.Set(param4);
            var _loc_6:int = 0;
            while (_loc_6 < m_vertexCount)
            {
                
                m_vertices[_loc_6] = b2Math.MulX(_loc_5, m_vertices[_loc_6]);
                m_normals[_loc_6] = b2Math.MulMV(_loc_5.R, m_normals[_loc_6]);
                _loc_6++;
            }
            return;
        }// end function

        override public function Copy() : b2Shape
        {
            var _loc_1:* = new b2PolygonShape();
            _loc_1.Set(this);
            return _loc_1;
        }// end function

        public function SetAsBox(param1:Number, param2:Number) : void
        {
            m_vertexCount = 4;
            Reserve(4);
            m_vertices[0].Set(-param1, -param2);
            m_vertices[1].Set(param1, -param2);
            m_vertices[2].Set(param1, param2);
            m_vertices[3].Set(-param1, param2);
            m_normals[0].Set(0, -1);
            m_normals[1].Set(1, 0);
            m_normals[2].Set(0, 1);
            m_normals[3].Set(-1, 0);
            m_centroid.SetZero();
            return;
        }// end function

        private function Reserve(param1:int) : void
        {
            var _loc_2:* = m_vertices.length;
            while (_loc_2 < param1)
            {
                
                m_vertices[_loc_2] = new b2Vec2();
                m_normals[_loc_2] = new b2Vec2();
                _loc_2++;
            }
            return;
        }// end function

        public function GetNormals() : Array
        {
            return m_normals;
        }// end function

        public function SetAsArray(param1:Array, param2:Number = 0) : void
        {
            var _loc_4:b2Vec2 = null;
            var _loc_3:* = new Array();
            for each (_loc_4 in param1)
            {
                
                _loc_3.push(_loc_4);
            }
            SetAsVector(_loc_3, param2);
            return;
        }// end function

        override public function RayCast(param1:b2RayCastOutput, param2:b2RayCastInput, param3:b2Transform) : Boolean
        {
            var _loc_6:Number = NaN;
            var _loc_7:Number = NaN;
            var _loc_8:b2Mat22 = null;
            var _loc_9:b2Vec2 = null;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_4:Number = 0;
            var _loc_5:* = param2.maxFraction;
            _loc_6 = param2.p1.x - param3.position.x;
            _loc_7 = param2.p1.y - param3.position.y;
            _loc_8 = param3.R;
            var _loc_10:* = _loc_6 * _loc_8.col1.x + _loc_7 * _loc_8.col1.y;
            var _loc_11:* = _loc_6 * _loc_8.col2.x + _loc_7 * _loc_8.col2.y;
            _loc_6 = param2.p2.x - param3.position.x;
            _loc_7 = param2.p2.y - param3.position.y;
            _loc_8 = param3.R;
            var _loc_12:* = _loc_6 * _loc_8.col1.x + _loc_7 * _loc_8.col1.y;
            var _loc_13:* = _loc_6 * _loc_8.col2.x + _loc_7 * _loc_8.col2.y;
            var _loc_14:* = _loc_12 - _loc_10;
            var _loc_15:* = _loc_13 - _loc_11;
            var _loc_16:int = -1;
            var _loc_17:int = 0;
            while (_loc_17 < m_vertexCount)
            {
                
                _loc_9 = m_vertices[_loc_17];
                _loc_6 = _loc_9.x - _loc_10;
                _loc_7 = _loc_9.y - _loc_11;
                _loc_9 = m_normals[_loc_17];
                _loc_18 = _loc_9.x * _loc_6 + _loc_9.y * _loc_7;
                _loc_19 = _loc_9.x * _loc_14 + _loc_9.y * _loc_15;
                if (_loc_19 == 0)
                {
                    if (_loc_18 < 0)
                    {
                        return false;
                    }
                }
                else if (_loc_19 < 0 && _loc_18 < _loc_4 * _loc_19)
                {
                    _loc_4 = _loc_18 / _loc_19;
                    _loc_16 = _loc_17;
                }
                else if (_loc_19 > 0 && _loc_18 < _loc_5 * _loc_19)
                {
                    _loc_5 = _loc_18 / _loc_19;
                }
                if (_loc_5 < _loc_4 - Number.MIN_VALUE)
                {
                    return false;
                }
                _loc_17++;
            }
            if (_loc_16 >= 0)
            {
                param1.fraction = _loc_4;
                _loc_8 = param3.R;
                _loc_9 = m_normals[_loc_16];
                param1.normal.x = _loc_8.col1.x * _loc_9.x + _loc_8.col2.x * _loc_9.y;
                param1.normal.y = _loc_8.col1.y * _loc_9.x + _loc_8.col2.y * _loc_9.y;
                return true;
            }
            return false;
        }// end function

        override public function ComputeMass(param1:b2MassData, param2:Number) : void
        {
            var _loc_11:b2Vec2 = null;
            var _loc_12:b2Vec2 = null;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:Number = NaN;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_25:Number = NaN;
            var _loc_26:Number = NaN;
            if (m_vertexCount == 2)
            {
                param1.center.x = 0.5 * (m_vertices[0].x + m_vertices[1].x);
                param1.center.y = 0.5 * (m_vertices[0].y + m_vertices[1].y);
                param1.mass = 0;
                param1.I = 0;
                return;
            }
            var _loc_3:Number = 0;
            var _loc_4:Number = 0;
            var _loc_5:Number = 0;
            var _loc_6:Number = 0;
            var _loc_7:Number = 0;
            var _loc_8:Number = 0;
            var _loc_9:* = 1 / 3;
            var _loc_10:int = 0;
            while (_loc_10 < m_vertexCount)
            {
                
                _loc_11 = m_vertices[_loc_10];
                _loc_12 = (_loc_10 + 1) < m_vertexCount ? (m_vertices[int((_loc_10 + 1))]) : (m_vertices[0]);
                _loc_13 = _loc_11.x - _loc_7;
                _loc_14 = _loc_11.y - _loc_8;
                _loc_15 = _loc_12.x - _loc_7;
                _loc_16 = _loc_12.y - _loc_8;
                _loc_17 = _loc_13 * _loc_16 - _loc_14 * _loc_15;
                _loc_18 = 0.5 * _loc_17;
                _loc_5 = _loc_5 + _loc_18;
                _loc_3 = _loc_3 + _loc_18 * _loc_9 * (_loc_7 + _loc_11.x + _loc_12.x);
                _loc_4 = _loc_4 + _loc_18 * _loc_9 * (_loc_8 + _loc_11.y + _loc_12.y);
                _loc_19 = _loc_7;
                _loc_20 = _loc_8;
                _loc_21 = _loc_13;
                _loc_22 = _loc_14;
                _loc_23 = _loc_15;
                _loc_24 = _loc_16;
                _loc_25 = _loc_9 * (0.25 * (_loc_21 * _loc_21 + _loc_23 * _loc_21 + _loc_23 * _loc_23) + (_loc_19 * _loc_21 + _loc_19 * _loc_23)) + 0.5 * _loc_19 * _loc_19;
                _loc_26 = _loc_9 * (0.25 * (_loc_22 * _loc_22 + _loc_24 * _loc_22 + _loc_24 * _loc_24) + (_loc_20 * _loc_22 + _loc_20 * _loc_24)) + 0.5 * _loc_20 * _loc_20;
                _loc_6 = _loc_6 + _loc_17 * (_loc_25 + _loc_26);
                _loc_10++;
            }
            param1.mass = param2 * _loc_5;
            _loc_3 = _loc_3 * (1 / _loc_5);
            _loc_4 = _loc_4 * (1 / _loc_5);
            param1.center.Set(_loc_3, _loc_4);
            param1.I = param2 * _loc_6;
            return;
        }// end function

        public function SetAsEdge(param1:b2Vec2, param2:b2Vec2) : void
        {
            m_vertexCount = 2;
            Reserve(2);
            m_vertices[0].SetV(param1);
            m_vertices[1].SetV(param2);
            m_centroid.x = 0.5 * (param1.x + param2.x);
            m_centroid.y = 0.5 * (param1.y + param2.y);
            m_normals[0] = b2Math.CrossVF(b2Math.SubtractVV(param2, param1), 1);
            m_normals[0].Normalize();
            m_normals[1].x = -m_normals[0].x;
            m_normals[1].y = -m_normals[0].y;
            return;
        }// end function

        public function GetVertexCount() : int
        {
            return m_vertexCount;
        }// end function

        private function Validate() : Boolean
        {
            return false;
        }// end function

        public function SetAsVector(param1:Array, param2:Number = 0) : void
        {
            var _loc_3:int = 0;
            var _loc_4:int = 0;
            var _loc_5:int = 0;
            var _loc_6:b2Vec2 = null;
            if (param2 == 0)
            {
                param2 = param1.length;
            }
            b2Settings.b2Assert(param2 >= 2, "2 <= vertexCount");
            m_vertexCount = param2;
            Reserve(param2);
            _loc_3 = 0;
            while (_loc_3 < m_vertexCount)
            {
                
                m_vertices[_loc_3].SetV(param1[_loc_3]);
                _loc_3++;
            }
            _loc_3 = 0;
            while (_loc_3 < m_vertexCount)
            {
                
                _loc_4 = _loc_3;
                _loc_5 = (_loc_3 + 1) < m_vertexCount ? ((_loc_3 + 1)) : (0);
                _loc_6 = b2Math.SubtractVV(m_vertices[_loc_5], m_vertices[_loc_4]);
                b2Settings.b2Assert(_loc_6.LengthSquared() > Number.MIN_VALUE, "edge.LengthSquared() > Number.MIN_VALUE");
                m_normals[_loc_3].SetV(b2Math.CrossVF(_loc_6, 1));
                m_normals[_loc_3].Normalize();
                _loc_3++;
            }
            m_centroid = ComputeCentroid(m_vertices, m_vertexCount);
            return;
        }// end function

        public function GetSupport(param1:b2Vec2) : int
        {
            var _loc_5:Number = NaN;
            var _loc_2:int = 0;
            var _loc_3:* = m_vertices[0].x * param1.x + m_vertices[0].y * param1.y;
            var _loc_4:int = 1;
            while (_loc_4 < m_vertexCount)
            {
                
                _loc_5 = m_vertices[_loc_4].x * param1.x + m_vertices[_loc_4].y * param1.y;
                if (_loc_5 > _loc_3)
                {
                    _loc_2 = _loc_4;
                    _loc_3 = _loc_5;
                }
                _loc_4++;
            }
            return _loc_2;
        }// end function

        public function GetSupportVertex(param1:b2Vec2) : b2Vec2
        {
            var _loc_5:Number = NaN;
            var _loc_2:int = 0;
            var _loc_3:* = m_vertices[0].x * param1.x + m_vertices[0].y * param1.y;
            var _loc_4:int = 1;
            while (_loc_4 < m_vertexCount)
            {
                
                _loc_5 = m_vertices[_loc_4].x * param1.x + m_vertices[_loc_4].y * param1.y;
                if (_loc_5 > _loc_3)
                {
                    _loc_2 = _loc_4;
                    _loc_3 = _loc_5;
                }
                _loc_4++;
            }
            return m_vertices[_loc_2];
        }// end function

        override public function TestPoint(param1:b2Transform, param2:b2Vec2) : Boolean
        {
            var _loc_3:b2Vec2 = null;
            var _loc_10:Number = NaN;
            var _loc_4:* = param1.R;
            var _loc_5:* = param2.x - param1.position.x;
            var _loc_6:* = param2.y - param1.position.y;
            var _loc_7:* = _loc_5 * _loc_4.col1.x + _loc_6 * _loc_4.col1.y;
            var _loc_8:* = _loc_5 * _loc_4.col2.x + _loc_6 * _loc_4.col2.y;
            var _loc_9:int = 0;
            while (_loc_9 < m_vertexCount)
            {
                
                _loc_3 = m_vertices[_loc_9];
                _loc_5 = _loc_7 - _loc_3.x;
                _loc_6 = _loc_8 - _loc_3.y;
                _loc_3 = m_normals[_loc_9];
                _loc_10 = _loc_3.x * _loc_5 + _loc_3.y * _loc_6;
                if (_loc_10 > 0)
                {
                    return false;
                }
                _loc_9++;
            }
            return true;
        }// end function

        static function ComputeOBB(param1:b2OBB, param2:Array, param3:int) : void
        {
            var _loc_4:int = 0;
            var _loc_7:b2Vec2 = null;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            var _loc_17:int = 0;
            var _loc_18:Number = NaN;
            var _loc_19:Number = NaN;
            var _loc_20:Number = NaN;
            var _loc_21:Number = NaN;
            var _loc_22:Number = NaN;
            var _loc_23:Number = NaN;
            var _loc_24:Number = NaN;
            var _loc_25:b2Mat22 = null;
            var _loc_5:* = new Array((param3 + 1));
            _loc_4 = 0;
            while (_loc_4 < param3)
            {
                
                _loc_5[_loc_4] = param2[_loc_4];
                _loc_4++;
            }
            _loc_5[param3] = _loc_5[0];
            var _loc_6:* = Number.MAX_VALUE;
            _loc_4 = 1;
            while (_loc_4 <= param3)
            {
                
                _loc_7 = _loc_5[int((_loc_4 - 1))];
                _loc_8 = _loc_5[_loc_4].x - _loc_7.x;
                _loc_9 = _loc_5[_loc_4].y - _loc_7.y;
                _loc_10 = Math.sqrt(_loc_8 * _loc_8 + _loc_9 * _loc_9);
                _loc_8 = _loc_8 / _loc_10;
                _loc_9 = _loc_9 / _loc_10;
                _loc_11 = -_loc_9;
                _loc_12 = _loc_8;
                _loc_13 = Number.MAX_VALUE;
                _loc_14 = Number.MAX_VALUE;
                _loc_15 = -Number.MAX_VALUE;
                _loc_16 = -Number.MAX_VALUE;
                _loc_17 = 0;
                while (_loc_17 < param3)
                {
                    
                    _loc_19 = _loc_5[_loc_17].x - _loc_7.x;
                    _loc_20 = _loc_5[_loc_17].y - _loc_7.y;
                    _loc_21 = _loc_8 * _loc_19 + _loc_9 * _loc_20;
                    _loc_22 = _loc_11 * _loc_19 + _loc_12 * _loc_20;
                    if (_loc_21 < _loc_13)
                    {
                        _loc_13 = _loc_21;
                    }
                    if (_loc_22 < _loc_14)
                    {
                        _loc_14 = _loc_22;
                    }
                    if (_loc_21 > _loc_15)
                    {
                        _loc_15 = _loc_21;
                    }
                    if (_loc_22 > _loc_16)
                    {
                        _loc_16 = _loc_22;
                    }
                    _loc_17++;
                }
                _loc_18 = (_loc_15 - _loc_13) * (_loc_16 - _loc_14);
                if (_loc_18 < 0.95 * _loc_6)
                {
                    _loc_6 = _loc_18;
                    param1.R.col1.x = _loc_8;
                    param1.R.col1.y = _loc_9;
                    param1.R.col2.x = _loc_11;
                    param1.R.col2.y = _loc_12;
                    _loc_23 = 0.5 * (_loc_13 + _loc_15);
                    _loc_24 = 0.5 * (_loc_14 + _loc_16);
                    _loc_25 = param1.R;
                    param1.center.x = _loc_7.x + (_loc_25.col1.x * _loc_23 + _loc_25.col2.x * _loc_24);
                    param1.center.y = _loc_7.y + (_loc_25.col1.y * _loc_23 + _loc_25.col2.y * _loc_24);
                    param1.extents.x = 0.5 * (_loc_15 - _loc_13);
                    param1.extents.y = 0.5 * (_loc_16 - _loc_14);
                }
                _loc_4++;
            }
            return;
        }// end function

        public static function AsVector(param1:Array, param2:Number) : b2PolygonShape
        {
            var _loc_3:* = new b2PolygonShape;
            _loc_3.SetAsVector(param1, param2);
            return _loc_3;
        }// end function

        public static function AsArray(param1:Array, param2:Number) : b2PolygonShape
        {
            var _loc_3:* = new b2PolygonShape;
            _loc_3.SetAsArray(param1, param2);
            return _loc_3;
        }// end function

        public static function AsBox(param1:Number, param2:Number) : b2PolygonShape
        {
            var _loc_3:* = new b2PolygonShape;
            _loc_3.SetAsBox(param1, param2);
            return _loc_3;
        }// end function

        public static function AsOrientedBox(param1:Number, param2:Number, param3:b2Vec2 = null, param4:Number = 0) : b2PolygonShape
        {
            var _loc_5:* = new b2PolygonShape;
            new b2PolygonShape.SetAsOrientedBox(param1, param2, param3, param4);
            return _loc_5;
        }// end function

        public static function ComputeCentroid(param1:Array, param2:uint) : b2Vec2
        {
            var _loc_3:b2Vec2 = null;
            var _loc_7:Number = NaN;
            var _loc_9:b2Vec2 = null;
            var _loc_10:b2Vec2 = null;
            var _loc_11:Number = NaN;
            var _loc_12:Number = NaN;
            var _loc_13:Number = NaN;
            var _loc_14:Number = NaN;
            var _loc_15:Number = NaN;
            var _loc_16:Number = NaN;
            _loc_3 = new b2Vec2();
            var _loc_4:Number = 0;
            var _loc_5:Number = 0;
            var _loc_6:Number = 0;
            _loc_7 = 1 / 3;
            var _loc_8:int = 0;
            while (_loc_8 < param2)
            {
                
                _loc_9 = param1[_loc_8];
                _loc_10 = (_loc_8 + 1) < param2 ? (param1[int((_loc_8 + 1))]) : (param1[0]);
                _loc_11 = _loc_9.x - _loc_5;
                _loc_12 = _loc_9.y - _loc_6;
                _loc_13 = _loc_10.x - _loc_5;
                _loc_14 = _loc_10.y - _loc_6;
                _loc_15 = _loc_11 * _loc_14 - _loc_12 * _loc_13;
                _loc_16 = 0.5 * _loc_15;
                _loc_4 = _loc_4 + _loc_16;
                _loc_3.x = _loc_3.x + _loc_16 * _loc_7 * (_loc_5 + _loc_9.x + _loc_10.x);
                _loc_3.y = _loc_3.y + _loc_16 * _loc_7 * (_loc_6 + _loc_9.y + _loc_10.y);
                _loc_8++;
            }
            _loc_3.x = _loc_3.x * (1 / _loc_4);
            _loc_3.y = _loc_3.y * (1 / _loc_4);
            return _loc_3;
        }// end function

        public static function AsEdge(param1:b2Vec2, param2:b2Vec2) : b2PolygonShape
        {
            var _loc_3:* = new b2PolygonShape;
            _loc_3.SetAsEdge(param1, param2);
            return _loc_3;
        }// end function

    }
}
