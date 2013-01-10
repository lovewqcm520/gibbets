package Box2D.Collision
{
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.*;
    import Box2D.Common.Math.*;

    public class b2Collision extends Object
    {
        public static const b2_nullFeature:uint = 255;
        private static var b2CollidePolyTempVec:b2Vec2 = new b2Vec2();
        private static var s_v12:b2Vec2 = new b2Vec2();
        private static var s_v11:b2Vec2 = new b2Vec2();
        private static var s_edgeBO:Array = new Array(1);
        private static var s_tangent2:b2Vec2 = new b2Vec2();
        private static var s_planePoint:b2Vec2 = new b2Vec2();
        private static var s_localTangent:b2Vec2 = new b2Vec2();
        private static var s_clipPoints1:Array = MakeClipPointVector();
        private static var s_clipPoints2:Array = MakeClipPointVector();
        private static var s_localNormal:b2Vec2 = new b2Vec2();
        private static var s_edgeAO:Array = new Array(1);
        private static var s_tangent:b2Vec2 = new b2Vec2();
        private static var s_normal:b2Vec2 = new b2Vec2();
        private static var s_incidentEdge:Array = MakeClipPointVector();

        public function b2Collision()
        {
            return;
        }// end function

        public static function EdgeSeparation(param1:b2PolygonShape, param2:b2Transform, param3:int, param4:b2PolygonShape, param5:b2Transform) : Number
        {
            var _loc_11:b2Mat22 = null;
            var _loc_12:b2Vec2 = null;
            var _loc_25:Number = NaN;
            var _loc_6:* = param1.m_vertexCount;
            var _loc_7:* = param1.m_vertices;
            var _loc_8:* = param1.m_normals;
            var _loc_9:* = param4.m_vertexCount;
            var _loc_10:* = param4.m_vertices;
            _loc_11 = param2.R;
            _loc_12 = _loc_8[param3];
            var _loc_13:* = _loc_11.col1.x * _loc_12.x + _loc_11.col2.x * _loc_12.y;
            var _loc_14:* = _loc_11.col1.y * _loc_12.x + _loc_11.col2.y * _loc_12.y;
            _loc_11 = param5.R;
            var _loc_15:* = _loc_11.col1.x * _loc_13 + _loc_11.col1.y * _loc_14;
            var _loc_16:* = _loc_11.col2.x * _loc_13 + _loc_11.col2.y * _loc_14;
            var _loc_17:int = 0;
            var _loc_18:* = Number.MAX_VALUE;
            var _loc_19:int = 0;
            while (_loc_19 < _loc_9)
            {
                
                _loc_12 = _loc_10[_loc_19];
                _loc_25 = _loc_12.x * _loc_15 + _loc_12.y * _loc_16;
                if (_loc_25 < _loc_18)
                {
                    _loc_18 = _loc_25;
                    _loc_17 = _loc_19;
                }
                _loc_19++;
            }
            _loc_12 = _loc_7[param3];
            _loc_11 = param2.R;
            var _loc_20:* = param2.position.x + (_loc_11.col1.x * _loc_12.x + _loc_11.col2.x * _loc_12.y);
            var _loc_21:* = param2.position.y + (_loc_11.col1.y * _loc_12.x + _loc_11.col2.y * _loc_12.y);
            _loc_12 = _loc_10[_loc_17];
            _loc_11 = param5.R;
            var _loc_22:* = param5.position.x + (_loc_11.col1.x * _loc_12.x + _loc_11.col2.x * _loc_12.y);
            var _loc_23:* = param5.position.y + (_loc_11.col1.y * _loc_12.x + _loc_11.col2.y * _loc_12.y);
            _loc_22 = _loc_22 - _loc_20;
            _loc_23 = _loc_23 - _loc_21;
            var _loc_24:* = _loc_22 * _loc_13 + _loc_23 * _loc_14;
            return _loc_22 * _loc_13 + _loc_23 * _loc_14;
        }// end function

        public static function ClipSegmentToLine(param1:Array, param2:Array, param3:b2Vec2, param4:Number) : int
        {
            var _loc_5:ClipVertex = null;
            var _loc_6:int = 0;
            var _loc_7:b2Vec2 = null;
            var _loc_9:Number = NaN;
            var _loc_11:Number = NaN;
            var _loc_12:b2Vec2 = null;
            var _loc_13:ClipVertex = null;
            _loc_6 = 0;
            _loc_5 = param2[0];
            _loc_7 = _loc_5.v;
            _loc_5 = param2[1];
            var _loc_8:* = _loc_5.v;
            _loc_9 = param3.x * _loc_7.x + param3.y * _loc_7.y - param4;
            var _loc_10:* = param3.x * _loc_8.x + param3.y * _loc_8.y - param4;
            if (_loc_9 <= 0)
            {
                param1[_loc_6++].Set(param2[0]);
            }
            if (_loc_10 <= 0)
            {
                param1[_loc_6++].Set(param2[1]);
            }
            if (_loc_9 * _loc_10 < 0)
            {
                _loc_11 = _loc_9 / (_loc_9 - _loc_10);
                _loc_5 = param1[_loc_6];
                _loc_12 = _loc_5.v;
                _loc_12.x = _loc_7.x + _loc_11 * (_loc_8.x - _loc_7.x);
                _loc_12.y = _loc_7.y + _loc_11 * (_loc_8.y - _loc_7.y);
                _loc_5 = param1[_loc_6];
                if (_loc_9 > 0)
                {
                    _loc_13 = param2[0];
                    _loc_5.id = _loc_13.id;
                }
                else
                {
                    _loc_13 = param2[1];
                    _loc_5.id = _loc_13.id;
                }
                _loc_6++;
            }
            return _loc_6;
        }// end function

        private static function MakeClipPointVector() : Array
        {
            var _loc_1:* = new Array(2);
            _loc_1[0] = new ClipVertex();
            _loc_1[1] = new ClipVertex();
            return _loc_1;
        }// end function

        public static function CollideCircles(param1:b2Manifold, param2:b2CircleShape, param3:b2Transform, param4:b2CircleShape, param5:b2Transform) : void
        {
            var _loc_6:b2Mat22 = null;
            var _loc_7:b2Vec2 = null;
            param1.m_pointCount = 0;
            _loc_6 = param3.R;
            _loc_7 = param2.m_p;
            var _loc_8:* = param3.position.x + (_loc_6.col1.x * _loc_7.x + _loc_6.col2.x * _loc_7.y);
            var _loc_9:* = param3.position.y + (_loc_6.col1.y * _loc_7.x + _loc_6.col2.y * _loc_7.y);
            _loc_6 = param5.R;
            _loc_7 = param4.m_p;
            var _loc_10:* = param5.position.x + (_loc_6.col1.x * _loc_7.x + _loc_6.col2.x * _loc_7.y);
            var _loc_11:* = param5.position.y + (_loc_6.col1.y * _loc_7.x + _loc_6.col2.y * _loc_7.y);
            var _loc_12:* = _loc_10 - _loc_8;
            var _loc_13:* = _loc_11 - _loc_9;
            var _loc_14:* = _loc_12 * _loc_12 + _loc_13 * _loc_13;
            var _loc_15:* = param2.m_radius + param4.m_radius;
            if (_loc_14 > _loc_15 * _loc_15)
            {
                return;
            }
            param1.m_type = b2Manifold.e_circles;
            param1.m_localPoint.SetV(param2.m_p);
            param1.m_localPlaneNormal.SetZero();
            param1.m_pointCount = 1;
            param1.m_points[0].m_localPoint.SetV(param4.m_p);
            param1.m_points[0].m_id.key = 0;
            return;
        }// end function

        public static function FindIncidentEdge(param1:Array, param2:b2PolygonShape, param3:b2Transform, param4:int, param5:b2PolygonShape, param6:b2Transform) : void
        {
            var _loc_12:b2Mat22 = null;
            var _loc_13:b2Vec2 = null;
            var _loc_20:ClipVertex = null;
            var _loc_23:Number = NaN;
            var _loc_7:* = param2.m_vertexCount;
            var _loc_8:* = param2.m_normals;
            var _loc_9:* = param5.m_vertexCount;
            var _loc_10:* = param5.m_vertices;
            var _loc_11:* = param5.m_normals;
            _loc_12 = param3.R;
            _loc_13 = _loc_8[param4];
            var _loc_14:* = _loc_12.col1.x * _loc_13.x + _loc_12.col2.x * _loc_13.y;
            var _loc_15:* = _loc_12.col1.y * _loc_13.x + _loc_12.col2.y * _loc_13.y;
            _loc_12 = param6.R;
            var _loc_16:* = _loc_12.col1.x * _loc_14 + _loc_12.col1.y * _loc_15;
            _loc_15 = _loc_12.col2.x * _loc_14 + _loc_12.col2.y * _loc_15;
            _loc_14 = _loc_16;
            var _loc_17:int = 0;
            var _loc_18:* = Number.MAX_VALUE;
            var _loc_19:int = 0;
            while (_loc_19 < _loc_9)
            {
                
                _loc_13 = _loc_11[_loc_19];
                _loc_23 = _loc_14 * _loc_13.x + _loc_15 * _loc_13.y;
                if (_loc_23 < _loc_18)
                {
                    _loc_18 = _loc_23;
                    _loc_17 = _loc_19;
                }
                _loc_19++;
            }
            var _loc_21:* = _loc_17;
            var _loc_22:* = (_loc_17 + 1) < _loc_9 ? ((_loc_21 + 1)) : (0);
            _loc_20 = param1[0];
            _loc_13 = _loc_10[_loc_21];
            _loc_12 = param6.R;
            _loc_20.v.x = param6.position.x + (_loc_12.col1.x * _loc_13.x + _loc_12.col2.x * _loc_13.y);
            _loc_20.v.y = param6.position.y + (_loc_12.col1.y * _loc_13.x + _loc_12.col2.y * _loc_13.y);
            _loc_20.id.features.referenceEdge = param4;
            _loc_20.id.features.incidentEdge = _loc_21;
            _loc_20.id.features.incidentVertex = 0;
            _loc_20 = param1[1];
            _loc_13 = _loc_10[_loc_22];
            _loc_12 = param6.R;
            _loc_20.v.x = param6.position.x + (_loc_12.col1.x * _loc_13.x + _loc_12.col2.x * _loc_13.y);
            _loc_20.v.y = param6.position.y + (_loc_12.col1.y * _loc_13.x + _loc_12.col2.y * _loc_13.y);
            _loc_20.id.features.referenceEdge = param4;
            _loc_20.id.features.incidentEdge = _loc_22;
            _loc_20.id.features.incidentVertex = 1;
            return;
        }// end function

        public static function CollidePolygonAndCircle(param1:b2Manifold, param2:b2PolygonShape, param3:b2Transform, param4:b2CircleShape, param5:b2Transform) : void
        {
            var _loc_6:b2ManifoldPoint = null;
            var _loc_7:Number = NaN;
            var _loc_8:Number = NaN;
            var _loc_9:Number = NaN;
            var _loc_10:Number = NaN;
            var _loc_11:b2Vec2 = null;
            var _loc_12:b2Mat22 = null;
            var _loc_17:Number = NaN;
            var _loc_31:Number = NaN;
            var _loc_32:Number = NaN;
            var _loc_33:Number = NaN;
            param1.m_pointCount = 0;
            _loc_12 = param5.R;
            _loc_11 = param4.m_p;
            var _loc_13:* = param5.position.x + (_loc_12.col1.x * _loc_11.x + _loc_12.col2.x * _loc_11.y);
            var _loc_14:* = param5.position.y + (_loc_12.col1.y * _loc_11.x + _loc_12.col2.y * _loc_11.y);
            _loc_7 = _loc_13 - param3.position.x;
            _loc_8 = _loc_14 - param3.position.y;
            _loc_12 = param3.R;
            var _loc_15:* = _loc_7 * _loc_12.col1.x + _loc_8 * _loc_12.col1.y;
            var _loc_16:* = _loc_7 * _loc_12.col2.x + _loc_8 * _loc_12.col2.y;
            var _loc_18:int = 0;
            var _loc_19:* = -Number.MAX_VALUE;
            var _loc_20:* = param2.m_radius + param4.m_radius;
            var _loc_21:* = param2.m_vertexCount;
            var _loc_22:* = param2.m_vertices;
            var _loc_23:* = param2.m_normals;
            var _loc_24:int = 0;
            while (_loc_24 < _loc_21)
            {
                
                _loc_11 = _loc_22[_loc_24];
                _loc_7 = _loc_15 - _loc_11.x;
                _loc_8 = _loc_16 - _loc_11.y;
                _loc_11 = _loc_23[_loc_24];
                _loc_31 = _loc_11.x * _loc_7 + _loc_11.y * _loc_8;
                if (_loc_31 > _loc_20)
                {
                    return;
                }
                if (_loc_31 > _loc_19)
                {
                    _loc_19 = _loc_31;
                    _loc_18 = _loc_24;
                }
                _loc_24++;
            }
            var _loc_25:* = _loc_18;
            var _loc_26:* = (_loc_18 + 1) < _loc_21 ? ((_loc_25 + 1)) : (0);
            var _loc_27:* = _loc_22[_loc_25];
            var _loc_28:* = _loc_22[_loc_26];
            if (_loc_19 < Number.MIN_VALUE)
            {
                param1.m_pointCount = 1;
                param1.m_type = b2Manifold.e_faceA;
                param1.m_localPlaneNormal.SetV(_loc_23[_loc_18]);
                param1.m_localPoint.x = 0.5 * (_loc_27.x + _loc_28.x);
                param1.m_localPoint.y = 0.5 * (_loc_27.y + _loc_28.y);
                param1.m_points[0].m_localPoint.SetV(param4.m_p);
                param1.m_points[0].m_id.key = 0;
                return;
            }
            var _loc_29:* = (_loc_15 - _loc_27.x) * (_loc_28.x - _loc_27.x) + (_loc_16 - _loc_27.y) * (_loc_28.y - _loc_27.y);
            var _loc_30:* = (_loc_15 - _loc_28.x) * (_loc_27.x - _loc_28.x) + (_loc_16 - _loc_28.y) * (_loc_27.y - _loc_28.y);
            if (_loc_29 <= 0)
            {
                if ((_loc_15 - _loc_27.x) * (_loc_15 - _loc_27.x) + (_loc_16 - _loc_27.y) * (_loc_16 - _loc_27.y) > _loc_20 * _loc_20)
                {
                    return;
                }
                param1.m_pointCount = 1;
                param1.m_type = b2Manifold.e_faceA;
                param1.m_localPlaneNormal.x = _loc_15 - _loc_27.x;
                param1.m_localPlaneNormal.y = _loc_16 - _loc_27.y;
                param1.m_localPlaneNormal.Normalize();
                param1.m_localPoint.SetV(_loc_27);
                param1.m_points[0].m_localPoint.SetV(param4.m_p);
                param1.m_points[0].m_id.key = 0;
            }
            else if (_loc_30 <= 0)
            {
                if ((_loc_15 - _loc_28.x) * (_loc_15 - _loc_28.x) + (_loc_16 - _loc_28.y) * (_loc_16 - _loc_28.y) > _loc_20 * _loc_20)
                {
                    return;
                }
                param1.m_pointCount = 1;
                param1.m_type = b2Manifold.e_faceA;
                param1.m_localPlaneNormal.x = _loc_15 - _loc_28.x;
                param1.m_localPlaneNormal.y = _loc_16 - _loc_28.y;
                param1.m_localPlaneNormal.Normalize();
                param1.m_localPoint.SetV(_loc_28);
                param1.m_points[0].m_localPoint.SetV(param4.m_p);
                param1.m_points[0].m_id.key = 0;
            }
            else
            {
                _loc_32 = 0.5 * (_loc_27.x + _loc_28.x);
                _loc_33 = 0.5 * (_loc_27.y + _loc_28.y);
                _loc_19 = (_loc_15 - _loc_32) * _loc_23[_loc_25].x + (_loc_16 - _loc_33) * _loc_23[_loc_25].y;
                if (_loc_19 > _loc_20)
                {
                    return;
                }
                param1.m_pointCount = 1;
                param1.m_type = b2Manifold.e_faceA;
                param1.m_localPlaneNormal.x = _loc_23[_loc_25].x;
                param1.m_localPlaneNormal.y = _loc_23[_loc_25].y;
                param1.m_localPlaneNormal.Normalize();
                param1.m_localPoint.Set(_loc_32, _loc_33);
                param1.m_points[0].m_localPoint.SetV(param4.m_p);
                param1.m_points[0].m_id.key = 0;
            }
            return;
        }// end function

        public static function CollidePolygons(param1:b2Manifold, param2:b2PolygonShape, param3:b2Transform, param4:b2PolygonShape, param5:b2Transform) : void
        {
            var _loc_6:ClipVertex = null;
            var _loc_12:b2PolygonShape = null;
            var _loc_13:b2PolygonShape = null;
            var _loc_14:b2Transform = null;
            var _loc_15:b2Transform = null;
            var _loc_16:int = 0;
            var _loc_17:uint = 0;
            var _loc_20:b2Mat22 = null;
            var _loc_25:b2Vec2 = null;
            var _loc_39:int = 0;
            var _loc_42:Number = NaN;
            var _loc_43:b2ManifoldPoint = null;
            var _loc_44:Number = NaN;
            var _loc_45:Number = NaN;
            param1.m_pointCount = 0;
            var _loc_7:* = param2.m_radius + param4.m_radius;
            var _loc_8:int = 0;
            s_edgeAO[0] = _loc_8;
            var _loc_9:* = FindMaxSeparation(s_edgeAO, param2, param3, param4, param5);
            _loc_8 = s_edgeAO[0];
            if (_loc_9 > _loc_7)
            {
                return;
            }
            var _loc_10:int = 0;
            s_edgeBO[0] = _loc_10;
            var _loc_11:* = FindMaxSeparation(s_edgeBO, param4, param5, param2, param3);
            _loc_10 = s_edgeBO[0];
            if (_loc_11 > _loc_7)
            {
                return;
            }
            var _loc_18:Number = 0.98;
            var _loc_19:Number = 0.001;
            if (_loc_11 > _loc_18 * _loc_9 + _loc_19)
            {
                _loc_12 = param4;
                _loc_13 = param2;
                _loc_14 = param5;
                _loc_15 = param3;
                _loc_16 = _loc_10;
                param1.m_type = b2Manifold.e_faceB;
                _loc_17 = 1;
            }
            else
            {
                _loc_12 = param2;
                _loc_13 = param4;
                _loc_14 = param3;
                _loc_15 = param5;
                _loc_16 = _loc_8;
                param1.m_type = b2Manifold.e_faceA;
                _loc_17 = 0;
            }
            var _loc_21:* = s_incidentEdge;
            FindIncidentEdge(_loc_21, _loc_12, _loc_14, _loc_16, _loc_13, _loc_15);
            var _loc_22:* = _loc_12.m_vertexCount;
            var _loc_23:* = _loc_12.m_vertices;
            var _loc_24:* = _loc_12.m_vertices[_loc_16];
            if ((_loc_16 + 1) < _loc_22)
            {
                _loc_25 = _loc_23[int((_loc_16 + 1))];
            }
            else
            {
                _loc_25 = _loc_23[0];
            }
            var _loc_26:* = s_localTangent;
            s_localTangent.Set(_loc_25.x - _loc_24.x, _loc_25.y - _loc_24.y);
            _loc_26.Normalize();
            var _loc_27:* = s_localNormal;
            s_localNormal.x = _loc_26.y;
            _loc_27.y = -_loc_26.x;
            var _loc_28:* = s_planePoint;
            s_planePoint.Set(0.5 * (_loc_24.x + _loc_25.x), 0.5 * (_loc_24.y + _loc_25.y));
            var _loc_29:* = s_tangent;
            _loc_20 = _loc_14.R;
            _loc_29.x = _loc_20.col1.x * _loc_26.x + _loc_20.col2.x * _loc_26.y;
            _loc_29.y = _loc_20.col1.y * _loc_26.x + _loc_20.col2.y * _loc_26.y;
            var _loc_30:* = s_tangent2;
            s_tangent2.x = -_loc_29.x;
            _loc_30.y = -_loc_29.y;
            var _loc_31:* = s_normal;
            s_normal.x = _loc_29.y;
            _loc_31.y = -_loc_29.x;
            var _loc_32:* = s_v11;
            var _loc_33:* = s_v12;
            _loc_32.x = _loc_14.position.x + (_loc_20.col1.x * _loc_24.x + _loc_20.col2.x * _loc_24.y);
            _loc_32.y = _loc_14.position.y + (_loc_20.col1.y * _loc_24.x + _loc_20.col2.y * _loc_24.y);
            _loc_33.x = _loc_14.position.x + (_loc_20.col1.x * _loc_25.x + _loc_20.col2.x * _loc_25.y);
            _loc_33.y = _loc_14.position.y + (_loc_20.col1.y * _loc_25.x + _loc_20.col2.y * _loc_25.y);
            var _loc_34:* = _loc_31.x * _loc_32.x + _loc_31.y * _loc_32.y;
            var _loc_35:* = (-_loc_29.x) * _loc_32.x - _loc_29.y * _loc_32.y + _loc_7;
            var _loc_36:* = _loc_29.x * _loc_33.x + _loc_29.y * _loc_33.y + _loc_7;
            var _loc_37:* = s_clipPoints1;
            var _loc_38:* = s_clipPoints2;
            _loc_39 = ClipSegmentToLine(_loc_37, _loc_21, _loc_30, _loc_35);
            if (_loc_39 < 2)
            {
                return;
            }
            _loc_39 = ClipSegmentToLine(_loc_38, _loc_37, _loc_29, _loc_36);
            if (_loc_39 < 2)
            {
                return;
            }
            param1.m_localPlaneNormal.SetV(_loc_27);
            param1.m_localPoint.SetV(_loc_28);
            var _loc_40:int = 0;
            var _loc_41:int = 0;
            while (_loc_41 < b2Settings.b2_maxManifoldPoints)
            {
                
                _loc_6 = _loc_38[_loc_41];
                _loc_42 = _loc_31.x * _loc_6.v.x + _loc_31.y * _loc_6.v.y - _loc_34;
                if (_loc_42 <= _loc_7)
                {
                    _loc_43 = param1.m_points[_loc_40];
                    _loc_20 = _loc_15.R;
                    _loc_44 = _loc_6.v.x - _loc_15.position.x;
                    _loc_45 = _loc_6.v.y - _loc_15.position.y;
                    _loc_43.m_localPoint.x = _loc_44 * _loc_20.col1.x + _loc_45 * _loc_20.col1.y;
                    _loc_43.m_localPoint.y = _loc_44 * _loc_20.col2.x + _loc_45 * _loc_20.col2.y;
                    _loc_43.m_id.Set(_loc_6.id);
                    _loc_43.m_id.features.flip = _loc_17;
                    _loc_40++;
                }
                _loc_41++;
            }
            param1.m_pointCount = _loc_40;
            return;
        }// end function

        public static function FindMaxSeparation(param1:Array, param2:b2PolygonShape, param3:b2Transform, param4:b2PolygonShape, param5:b2Transform) : Number
        {
            var _loc_8:b2Vec2 = null;
            var _loc_9:b2Mat22 = null;
            var _loc_22:int = 0;
            var _loc_23:Number = NaN;
            var _loc_24:int = 0;
            var _loc_25:Number = NaN;
            var _loc_6:* = param2.m_vertexCount;
            var _loc_7:* = param2.m_normals;
            _loc_9 = param5.R;
            _loc_8 = param4.m_centroid;
            var _loc_10:* = param5.position.x + (_loc_9.col1.x * _loc_8.x + _loc_9.col2.x * _loc_8.y);
            var _loc_11:* = param5.position.y + (_loc_9.col1.y * _loc_8.x + _loc_9.col2.y * _loc_8.y);
            _loc_9 = param3.R;
            _loc_8 = param2.m_centroid;
            _loc_10 = _loc_10 - (param3.position.x + (_loc_9.col1.x * _loc_8.x + _loc_9.col2.x * _loc_8.y));
            _loc_11 = _loc_11 - (param3.position.y + (_loc_9.col1.y * _loc_8.x + _loc_9.col2.y * _loc_8.y));
            var _loc_12:* = _loc_10 * param3.R.col1.x + _loc_11 * param3.R.col1.y;
            var _loc_13:* = _loc_10 * param3.R.col2.x + _loc_11 * param3.R.col2.y;
            var _loc_14:int = 0;
            var _loc_15:* = -Number.MAX_VALUE;
            var _loc_16:int = 0;
            while (_loc_16 < _loc_6)
            {
                
                _loc_8 = _loc_7[_loc_16];
                _loc_25 = _loc_8.x * _loc_12 + _loc_8.y * _loc_13;
                if (_loc_25 > _loc_15)
                {
                    _loc_15 = _loc_25;
                    _loc_14 = _loc_16;
                }
                _loc_16++;
            }
            var _loc_17:* = EdgeSeparation(param2, param3, _loc_14, param4, param5);
            var _loc_18:* = (_loc_14 - 1) >= 0 ? ((_loc_14 - 1)) : ((_loc_6 - 1));
            var _loc_19:* = EdgeSeparation(param2, param3, _loc_18, param4, param5);
            var _loc_20:* = (_loc_14 + 1) < _loc_6 ? ((_loc_14 + 1)) : (0);
            var _loc_21:* = EdgeSeparation(param2, param3, _loc_20, param4, param5);
            if (_loc_19 > _loc_17 && _loc_19 > _loc_21)
            {
                _loc_24 = -1;
                _loc_22 = _loc_18;
                _loc_23 = _loc_19;
            }
            else if (_loc_21 > _loc_17)
            {
                _loc_24 = 1;
                _loc_22 = _loc_20;
                _loc_23 = _loc_21;
            }
            else
            {
                param1[0] = _loc_14;
                return _loc_17;
            }
            while (true)
            {
                
                if (_loc_24 == -1)
                {
                    _loc_14 = (_loc_22 - 1) >= 0 ? ((_loc_22 - 1)) : ((_loc_6 - 1));
                }
                else
                {
                    _loc_14 = (_loc_22 + 1) < _loc_6 ? ((_loc_22 + 1)) : (0);
                }
                _loc_17 = EdgeSeparation(param2, param3, _loc_14, param4, param5);
                if (_loc_17 > _loc_23)
                {
                    _loc_22 = _loc_14;
                    _loc_23 = _loc_17;
                    continue;
                }
                break;
            }
            param1[0] = _loc_22;
            return _loc_23;
        }// end function

        public static function TestOverlap(param1:b2AABB, param2:b2AABB) : Boolean
        {
            var _loc_3:* = param2.lowerBound;
            var _loc_4:* = param1.upperBound;
            var _loc_5:* = _loc_3.x - _loc_4.x;
            var _loc_6:* = _loc_3.y - _loc_4.y;
            _loc_3 = param1.lowerBound;
            _loc_4 = param2.upperBound;
            var _loc_7:* = _loc_3.x - _loc_4.x;
            var _loc_8:* = _loc_3.y - _loc_4.y;
            if (_loc_5 > 0 || _loc_6 > 0)
            {
                return false;
            }
            if (_loc_7 > 0 || _loc_8 > 0)
            {
                return false;
            }
            return true;
        }// end function

    }
}
