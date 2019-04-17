Shader "TextMeshPro/Distance Field (Surface)" {
Properties {
_FaceTex ("Fill Texture", 2D) = "white" { }
_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
_FaceColor ("Fill Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineTex ("Outline Texture", 2D) = "white" { }
_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_Bevel ("Bevel", Range(0, 1)) = 0.5
_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
_BumpMap ("Normalmap", 2D) = "bump" { }
_BumpOutline ("Bump Outline", Range(0, 1)) = 0.5
_BumpFace ("Bump Face", Range(0, 1)) = 0.5
_ReflectFaceColor ("Face Color", Color) = (0,0,0,1)
_ReflectOutlineColor ("Outline Color", Color) = (0,0,0,1)
_Cube ("Reflection Cubemap", Cube) = "black" { }
_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
_SpecColor ("Specular Color", Color) = (0,0,0,1)
_FaceShininess ("Face Shininess", Range(0, 1)) = 0
_OutlineShininess ("Outline Shininess", Range(0, 1)) = 0
_GlowColor ("Color", Color) = (0,1,0,0.5)
_GlowOffset ("Offset", Range(-1, 1)) = 0
_GlowInner ("Inner", Range(0, 1)) = 0.05
_GlowOuter ("Outer", Range(0, 1)) = 0.05
_GlowPower ("Falloff", Range(1, 0)) = 0.75
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 36808
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat16 = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat15 * 0.5;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat16 = u_xlat15 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat16 = u_xlat16 * u_xlat2.x;
    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat17 = dot(u_xlat0.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat17) * u_xlat15 + u_xlat16;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat16_1.y = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.0, 0.0));
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xzw;
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_1.xzw = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xzw * u_xlat16_1.yyy + u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat8.xyz = vec3(u_xlat30) * u_xlat16_8.xyz + _ReflectFaceColor.xyz;
    u_xlat9.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat8.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_6.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat16 = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat15 * 0.5;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat16 = u_xlat15 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat16 = u_xlat16 * u_xlat2.x;
    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat17 = dot(u_xlat0.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat17) * u_xlat15 + u_xlat16;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat16_1.y = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.0, 0.0));
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xzw;
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_1.xzw = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xzw * u_xlat16_1.yyy + u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat8.xyz = vec3(u_xlat30) * u_xlat16_8.xyz + _ReflectFaceColor.xyz;
    u_xlat9.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat8.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_6.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat16 = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat15 * 0.5;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat16 = u_xlat15 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat16 = u_xlat16 * u_xlat2.x;
    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat17 = dot(u_xlat0.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat17) * u_xlat15 + u_xlat16;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat6.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat6.xyz, u_xlat16_1.xyz);
    u_xlat16_1.y = dot(u_xlat6.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(0.0, 0.0));
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xzw;
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_1.xzw = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_1.xzw * u_xlat16_1.yyy + u_xlat16_6.xyz;
    u_xlat16_8.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat8.xyz = vec3(u_xlat30) * u_xlat16_8.xyz + _ReflectFaceColor.xyz;
    u_xlat9.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat9.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat8.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_6.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat2.y * u_xlat2.y;
    u_xlat16_5 = u_xlat2.x * u_xlat2.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
bool u_xlatb15;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat21;
float u_xlat27;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD5.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD5.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat27 = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat27, 9.99999975e-05);
    SV_Target0.w = u_xlat27;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat31 = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = vec4(u_xlat31) + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat31 = _BevelWidth + _OutlineWidth;
    u_xlat31 = max(u_xlat31, 0.00999999978);
    u_xlat2 = u_xlat2 / vec4(u_xlat31);
    u_xlat31 = u_xlat31 * _Bevel;
    u_xlat31 = u_xlat31 * _GradientScale;
    u_xlat31 = u_xlat31 * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb15 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb15) ? u_xlat6.x : (-u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=0.5);
#else
    u_xlatb6 = u_xlat6.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat5.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat5.xxxx);
    u_xlat5.xy = vec2(u_xlat31) * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * vec2(u_xlat31) + (-u_xlat5.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat6.x = u_xlat2.z * u_xlat5.x;
    u_xlat6.yz = u_xlat5.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat31 = (-_BumpFace) + _BumpOutline;
    u_xlat31 = u_xlat9 * u_xlat31 + _BumpFace;
    u_xlat10_6.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(u_xlat31) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_3.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat5.xyz;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat5.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat5.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat5.xyz));
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_7.xyz = vec3(u_xlat16_28) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_31 = log2(u_xlat16_28);
    u_xlat16_32 = (-_FaceShininess) + _OutlineShininess;
    u_xlat32 = u_xlat9 * u_xlat16_32 + _FaceShininess;
    u_xlat16_28 = u_xlat32 * 128.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_28;
    u_xlat16_31 = exp2(u_xlat16_31);
    u_xlat16_7.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_28) + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xzw * u_xlat16_8.xyz + u_xlat16_6.xyz;
    u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
    u_xlat31 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat31)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_5.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat16_5.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat2.y * u_xlat2.y;
    u_xlat16_5 = u_xlat2.x * u_xlat2.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
bool u_xlatb15;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat21;
float u_xlat27;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD5.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD5.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat27 = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat27, 9.99999975e-05);
    SV_Target0.w = u_xlat27;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat31 = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = vec4(u_xlat31) + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat31 = _BevelWidth + _OutlineWidth;
    u_xlat31 = max(u_xlat31, 0.00999999978);
    u_xlat2 = u_xlat2 / vec4(u_xlat31);
    u_xlat31 = u_xlat31 * _Bevel;
    u_xlat31 = u_xlat31 * _GradientScale;
    u_xlat31 = u_xlat31 * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb15 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb15) ? u_xlat6.x : (-u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=0.5);
#else
    u_xlatb6 = u_xlat6.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat5.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat5.xxxx);
    u_xlat5.xy = vec2(u_xlat31) * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * vec2(u_xlat31) + (-u_xlat5.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat6.x = u_xlat2.z * u_xlat5.x;
    u_xlat6.yz = u_xlat5.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat31 = (-_BumpFace) + _BumpOutline;
    u_xlat31 = u_xlat9 * u_xlat31 + _BumpFace;
    u_xlat10_6.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(u_xlat31) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_3.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat5.xyz;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat5.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat5.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat5.xyz));
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_7.xyz = vec3(u_xlat16_28) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_31 = log2(u_xlat16_28);
    u_xlat16_32 = (-_FaceShininess) + _OutlineShininess;
    u_xlat32 = u_xlat9 * u_xlat16_32 + _FaceShininess;
    u_xlat16_28 = u_xlat32 * 128.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_28;
    u_xlat16_31 = exp2(u_xlat16_31);
    u_xlat16_7.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_28) + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xzw * u_xlat16_8.xyz + u_xlat16_6.xyz;
    u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
    u_xlat31 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat31)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_5.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat16_5.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat2.y * u_xlat2.y;
    u_xlat16_5 = u_xlat2.x * u_xlat2.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
bool u_xlatb15;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat21;
float u_xlat27;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD5.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD5.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat27 = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat27, 9.99999975e-05);
    SV_Target0.w = u_xlat27;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat31 = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = vec4(u_xlat31) + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat31 = _BevelWidth + _OutlineWidth;
    u_xlat31 = max(u_xlat31, 0.00999999978);
    u_xlat2 = u_xlat2 / vec4(u_xlat31);
    u_xlat31 = u_xlat31 * _Bevel;
    u_xlat31 = u_xlat31 * _GradientScale;
    u_xlat31 = u_xlat31 * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb15 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb15) ? u_xlat6.x : (-u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=0.5);
#else
    u_xlatb6 = u_xlat6.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat5.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat5.xxxx);
    u_xlat5.xy = vec2(u_xlat31) * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * vec2(u_xlat31) + (-u_xlat5.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat6.x = u_xlat2.z * u_xlat5.x;
    u_xlat6.yz = u_xlat5.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat31 = (-_BumpFace) + _BumpOutline;
    u_xlat31 = u_xlat9 * u_xlat31 + _BumpFace;
    u_xlat10_6.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(u_xlat31) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_3.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat5.xyz;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat5.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat5.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat5.xyz));
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_7.xyz = vec3(u_xlat16_28) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_31 = log2(u_xlat16_28);
    u_xlat16_32 = (-_FaceShininess) + _OutlineShininess;
    u_xlat32 = u_xlat9 * u_xlat16_32 + _FaceShininess;
    u_xlat16_28 = u_xlat32 * 128.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_28;
    u_xlat16_31 = exp2(u_xlat16_31);
    u_xlat16_7.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_28) + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xzw * u_xlat16_8.xyz + u_xlat16_6.xyz;
    u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
    u_xlat31 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat31)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_5.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat16_5.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat2.y * u_xlat2.y;
    u_xlat16_5 = u_xlat2.x * u_xlat2.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_11.xyz = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_9.xyz = exp2(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat2.y * u_xlat2.y;
    u_xlat16_5 = u_xlat2.x * u_xlat2.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_11.xyz = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_9.xyz = exp2(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    vs_TEXCOORD2.w = u_xlat1.x;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat16_5 = u_xlat2.y * u_xlat2.y;
    u_xlat16_5 = u_xlat2.x * u_xlat2.x + (-u_xlat16_5);
    u_xlat16_0 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_0);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_0);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_0);
    vs_TEXCOORD7.xyz = unity_SHC.xyz * vec3(u_xlat16_5) + u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_11.xyz = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_9.xyz = exp2(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat2.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
bool u_xlatb15;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat21;
float u_xlat27;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD5.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD5.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat27 = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat27, 9.99999975e-05);
    SV_Target0.w = u_xlat27;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat31 = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = vec4(u_xlat31) + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat31 = _BevelWidth + _OutlineWidth;
    u_xlat31 = max(u_xlat31, 0.00999999978);
    u_xlat2 = u_xlat2 / vec4(u_xlat31);
    u_xlat31 = u_xlat31 * _Bevel;
    u_xlat31 = u_xlat31 * _GradientScale;
    u_xlat31 = u_xlat31 * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb15 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb15) ? u_xlat6.x : (-u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=0.5);
#else
    u_xlatb6 = u_xlat6.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat5.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat5.xxxx);
    u_xlat5.xy = vec2(u_xlat31) * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * vec2(u_xlat31) + (-u_xlat5.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat6.x = u_xlat2.z * u_xlat5.x;
    u_xlat6.yz = u_xlat5.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat31 = (-_BumpFace) + _BumpOutline;
    u_xlat31 = u_xlat9 * u_xlat31 + _BumpFace;
    u_xlat10_6.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(u_xlat31) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_3.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat5.xyz;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat5.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat5.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat5.xyz));
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_7.xyz = vec3(u_xlat16_28) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_31 = log2(u_xlat16_28);
    u_xlat16_32 = (-_FaceShininess) + _OutlineShininess;
    u_xlat32 = u_xlat9 * u_xlat16_32 + _FaceShininess;
    u_xlat16_28 = u_xlat32 * 128.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_28;
    u_xlat16_31 = exp2(u_xlat16_31);
    u_xlat16_7.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_28) + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xzw * u_xlat16_8.xyz + u_xlat16_6.xyz;
    u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
    u_xlat31 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat31)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_5.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat16_5.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat2.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
bool u_xlatb15;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat21;
float u_xlat27;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD5.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD5.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat27 = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat27, 9.99999975e-05);
    SV_Target0.w = u_xlat27;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat31 = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = vec4(u_xlat31) + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat31 = _BevelWidth + _OutlineWidth;
    u_xlat31 = max(u_xlat31, 0.00999999978);
    u_xlat2 = u_xlat2 / vec4(u_xlat31);
    u_xlat31 = u_xlat31 * _Bevel;
    u_xlat31 = u_xlat31 * _GradientScale;
    u_xlat31 = u_xlat31 * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb15 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb15) ? u_xlat6.x : (-u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=0.5);
#else
    u_xlatb6 = u_xlat6.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat5.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat5.xxxx);
    u_xlat5.xy = vec2(u_xlat31) * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * vec2(u_xlat31) + (-u_xlat5.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat6.x = u_xlat2.z * u_xlat5.x;
    u_xlat6.yz = u_xlat5.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat31 = (-_BumpFace) + _BumpOutline;
    u_xlat31 = u_xlat9 * u_xlat31 + _BumpFace;
    u_xlat10_6.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(u_xlat31) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_3.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat5.xyz;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat5.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat5.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat5.xyz));
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_7.xyz = vec3(u_xlat16_28) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_31 = log2(u_xlat16_28);
    u_xlat16_32 = (-_FaceShininess) + _OutlineShininess;
    u_xlat32 = u_xlat9 * u_xlat16_32 + _FaceShininess;
    u_xlat16_28 = u_xlat32 * 128.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_28;
    u_xlat16_31 = exp2(u_xlat16_31);
    u_xlat16_7.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_28) + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xzw * u_xlat16_8.xyz + u_xlat16_6.xyz;
    u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
    u_xlat31 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat31)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_5.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat16_5.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat2.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
lowp vec3 u_xlat10_6;
bool u_xlatb6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
bool u_xlatb15;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat21;
float u_xlat27;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
float u_xlat31;
mediump float u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_32;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD5.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD5.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat27 * vs_TEXCOORD5.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat27 = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat27, 9.99999975e-05);
    SV_Target0.w = u_xlat27;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat31 = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = vec4(u_xlat31) + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat31 = _BevelWidth + _OutlineWidth;
    u_xlat31 = max(u_xlat31, 0.00999999978);
    u_xlat2 = u_xlat2 / vec4(u_xlat31);
    u_xlat31 = u_xlat31 * _Bevel;
    u_xlat31 = u_xlat31 * _GradientScale;
    u_xlat31 = u_xlat31 * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat6.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat6.x>=(-u_xlat6.x));
#else
    u_xlatb15 = u_xlat6.x>=(-u_xlat6.x);
#endif
    u_xlat6.x = fract(abs(u_xlat6.x));
    u_xlat6.x = (u_xlatb15) ? u_xlat6.x : (-u_xlat6.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6.x>=0.5);
#else
    u_xlatb6 = u_xlat6.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb6)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat5.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat5.xxxx);
    u_xlat5.xy = vec2(u_xlat31) * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * vec2(u_xlat31) + (-u_xlat5.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat31 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat6.x = u_xlat2.z * u_xlat5.x;
    u_xlat6.yz = u_xlat5.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat5.xyz * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.zxy * u_xlat5.yzx + (-u_xlat8.xyz);
    u_xlat31 = (-_BumpFace) + _BumpOutline;
    u_xlat31 = u_xlat9 * u_xlat31 + _BumpFace;
    u_xlat10_6.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * vec3(u_xlat31) + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_3.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + (-u_xlat6.xyz);
    u_xlat31 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat5.xyz = vec3(u_xlat31) * u_xlat5.xyz;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat5.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat5.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat5.xyz));
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat2.xyz = vec3(u_xlat31) * u_xlat6.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_7.xyz = vec3(u_xlat16_28) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, u_xlat16_7.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_31 = log2(u_xlat16_28);
    u_xlat16_32 = (-_FaceShininess) + _OutlineShininess;
    u_xlat32 = u_xlat9 * u_xlat16_32 + _FaceShininess;
    u_xlat16_28 = u_xlat32 * 128.0;
    u_xlat16_31 = u_xlat16_31 * u_xlat16_28;
    u_xlat16_31 = exp2(u_xlat16_31);
    u_xlat16_7.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_31) * u_xlat16_7.xyz;
    u_xlat16_28 = dot(u_xlat2.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_28 = max(u_xlat16_28, 0.0);
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_28) + u_xlat16_6.xyz;
    u_xlat2.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat2);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat2);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat2);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_8.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_8.xyz = exp2(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xzw * u_xlat16_8.xyz + u_xlat16_6.xyz;
    u_xlat0.xzw = u_xlat5.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat5.xxx + u_xlat0.xzw;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat5.zzz + u_xlat0.xzw;
    u_xlat31 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat31 = u_xlat31 + u_xlat31;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat31)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_5.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat16_5.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat2.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_11.xyz = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_9.xyz = exp2(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat2.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_11.xyz = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_9.xyz = exp2(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	mediump vec4 unity_4LightAtten0;
uniform 	mediump vec4 unity_LightColor[8];
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat21 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat21);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb21 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat22 = (-_WeightNormal) + _WeightBold;
    u_xlat21 = u_xlat21 * u_xlat22 + _WeightNormal;
    u_xlat21 = u_xlat21 * 0.25 + _FaceDilate;
    u_xlat21 = u_xlat21 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat21 * 0.5;
    u_xlat21 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat21;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat21) / u_xlat2.xy;
    u_xlat21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat22 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat22 = u_xlat21 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat22 = u_xlat22 * u_xlat2.x;
    u_xlat21 = u_xlat21 * 1.5 + (-u_xlat22);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati7 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati7 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati7) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2.xyzz;
    u_xlat0.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat3.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xxx;
    u_xlat3.x = dot(u_xlat2.xyw, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat3.x) * u_xlat21 + u_xlat22;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.wxy * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.ywx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat21 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.z = u_xlat2.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.z = u_xlat2.y;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.z = u_xlat2.w;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat3.xyz = u_xlat0.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0 = (-u_xlat1.yyyy) + unity_4LightPosY0;
    u_xlat3 = u_xlat2.yyyy * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat4 = (-u_xlat1.xxxx) + unity_4LightPosX0;
    u_xlat1 = (-u_xlat1.zzzz) + unity_4LightPosZ0;
    u_xlat3 = u_xlat4 * u_xlat2.xxxx + u_xlat3;
    u_xlat0 = u_xlat4 * u_xlat4 + u_xlat0;
    u_xlat0 = u_xlat1 * u_xlat1 + u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat2.wwzw + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat1.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.x = u_xlat2.y * u_xlat2.y;
    u_xlat16_5.x = u_xlat2.x * u_xlat2.x + (-u_xlat16_5.x);
    u_xlat16_2 = u_xlat2.ywzx * u_xlat2;
    u_xlat16_6.x = dot(unity_SHBr, u_xlat16_2);
    u_xlat16_6.y = dot(unity_SHBg, u_xlat16_2);
    u_xlat16_6.z = dot(unity_SHBb, u_xlat16_2);
    u_xlat16_5.xyz = unity_SHC.xyz * u_xlat16_5.xxx + u_xlat16_6.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz * u_xlat1.xyz + u_xlat16_5.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump float u_xlat16_13;
float u_xlat16;
mediump float u_xlat16_16;
lowp vec3 u_xlat10_16;
bool u_xlatb22;
float u_xlat30;
mediump float u_xlat16_30;
lowp float u_xlat10_30;
mediump float u_xlat16_31;
float u_xlat36;
mediump float u_xlat16_36;
void main()
{
    u_xlat0.x = vs_TEXCOORD2.w;
    u_xlat0.y = vs_TEXCOORD3.w;
    u_xlat0.z = vs_TEXCOORD4.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(u_xlat30) + _WorldSpaceLightPos0.xyz;
    u_xlat16_31 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_31 = inversesqrt(u_xlat16_31);
    u_xlat16_1.xyz = vec3(u_xlat16_31) * u_xlat16_1.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat2.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat2.z = 0.0;
    u_xlat3 = (-u_xlat2.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat2 = u_xlat2.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat4.x = texture(_MainTex, u_xlat3.xy).w;
    u_xlat4.z = texture(_MainTex, u_xlat3.zw).w;
    u_xlat4.y = texture(_MainTex, u_xlat2.xy).w;
    u_xlat4.w = texture(_MainTex, u_xlat2.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat4;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.x = _BevelWidth + _OutlineWidth;
    u_xlat2.x = max(u_xlat2.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat2.xxxx;
    u_xlat2.x = u_xlat2.x * _Bevel;
    u_xlat2.x = u_xlat2.x * _GradientScale;
    u_xlat2.x = u_xlat2.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat12.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat12.x>=(-u_xlat12.x));
#else
    u_xlatb22 = u_xlat12.x>=(-u_xlat12.x);
#endif
    u_xlat12.x = fract(abs(u_xlat12.x));
    u_xlat12.x = (u_xlatb22) ? u_xlat12.x : (-u_xlat12.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12.x>=0.5);
#else
    u_xlatb12 = u_xlat12.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb12)) ? u_xlat3 : u_xlat0;
    u_xlat3 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat0;
    u_xlat12.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat12.xxxx);
    u_xlat0.xz = u_xlat2.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat2.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat2.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat2.x = inversesqrt(u_xlat2.x);
    u_xlat30 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat3.x = u_xlat30 * u_xlat0.z;
    u_xlat3.yz = vec2(u_xlat30) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat10_30 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_30 = (-u_xlat10_30) + 0.5;
    u_xlat30 = u_xlat16_30 + (-vs_TEXCOORD5.x);
    u_xlat30 = u_xlat30 * vs_TEXCOORD5.y + 0.5;
    u_xlat2.x = _OutlineWidth * _ScaleRatioA;
    u_xlat2.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_31 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_5.x = min(u_xlat2.x, 1.0);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat16_31 = u_xlat16_31 * u_xlat16_5.x;
    u_xlat12.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_3 = texture(_OutlineTex, u_xlat12.xy);
    u_xlat16_12.xyz = u_xlat10_3.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_3.w * u_xlat16_3.x;
    u_xlat4.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat4.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_7.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_12.xyz * vec3(u_xlat16_13) + (-u_xlat16_7.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_3.w + (-u_xlat16_6.w);
    u_xlat16_3 = vec4(u_xlat16_31) * u_xlat16_7;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_3.w;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_3.xyz;
    u_xlat16_31 = (-u_xlat2.x) * 0.5 + u_xlat30;
    u_xlat30 = u_xlat2.x * 0.5 + u_xlat30;
#ifdef UNITY_ADRENO_ES3
    u_xlat30 = min(max(u_xlat30, 0.0), 1.0);
#else
    u_xlat30 = clamp(u_xlat30, 0.0, 1.0);
#endif
    u_xlat2.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat12.x = u_xlat2.x * vs_TEXCOORD5.y;
    u_xlat16_7.x = u_xlat2.x * vs_TEXCOORD5.y + 1.0;
    u_xlat16_31 = u_xlat12.x * 0.5 + u_xlat16_31;
    u_xlat16_31 = u_xlat16_31 / u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31 = min(max(u_xlat16_31, 0.0), 1.0);
#else
    u_xlat16_31 = clamp(u_xlat16_31, 0.0, 1.0);
#endif
    u_xlat16_31 = (-u_xlat16_31) + 1.0;
    u_xlat16_2 = vec4(u_xlat16_31) * u_xlat16_4;
    u_xlat6.x = (-_BumpFace) + _BumpOutline;
    u_xlat6.x = u_xlat30 * u_xlat6.x + _BumpFace;
    u_xlat10_16.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_16.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = u_xlat16_7.xyz * u_xlat6.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat6.xyz = u_xlat16_2.www * u_xlat6.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat6.xyz);
    u_xlat6.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat6.xxx;
    u_xlat6.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat6.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat6.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat36 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat6.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_1.x);
    u_xlat16_16 = (-_FaceShininess) + _OutlineShininess;
    u_xlat16 = u_xlat30 * u_xlat16_16 + _FaceShininess;
    u_xlat16_1.x = u_xlat16 * 128.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_1.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_1.xyz;
    u_xlat16_1.x = dot(u_xlat3.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_36 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_8.xyz = u_xlat16_2.xyz / vec3(u_xlat16_36);
    u_xlat16_11.xyz = u_xlat16_8.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat16_1.xxx + u_xlat16_6.xyz;
    u_xlat3.w = 1.0;
    u_xlat16_1.x = dot(unity_SHAr, u_xlat3);
    u_xlat16_1.y = dot(unity_SHAg, u_xlat3);
    u_xlat16_1.z = dot(unity_SHAb, u_xlat3);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_9.xyz = log2(u_xlat16_1.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_9.xyz = exp2(u_xlat16_9.xyz);
    u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_9.xyz = max(u_xlat16_9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz + u_xlat16_6.xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat30) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat8.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat8.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat30 = dot(vs_TEXCOORD6.xyz, u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xyz = texture(_Cube, u_xlat0.xyz).xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat10_0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_2.www + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat16 = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat15 * 0.5;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat16 = u_xlat15 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat16 = u_xlat16 * u_xlat2.x;
    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat17 = dot(u_xlat0.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat17) * u_xlat15 + u_xlat16;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat19;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump float u_xlat16_25;
float u_xlat28;
mediump float u_xlat16_28;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_8 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_8 = (-u_xlat10_8) + 0.5;
    u_xlat8 = u_xlat16_8 + (-vs_TEXCOORD5.x);
    u_xlat8 = u_xlat8 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb16 = u_xlat0.x>=0.0;
#endif
    u_xlat16.x = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat24 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat16.x = u_xlat16.x * u_xlat24 + _GlowInner;
    u_xlat16.x = u_xlat16.x * vs_TEXCOORD5.y;
    u_xlat24 = u_xlat16.x * 0.5 + 1.0;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat0.x = u_xlat0.x / u_xlat24;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat16.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat24 = _OutlineWidth * _ScaleRatioA;
    u_xlat24 = u_xlat24 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat24 * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = min(u_xlat24, 1.0);
    u_xlat16_9.x = sqrt(u_xlat16_9.x);
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_11 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat19.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat19.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_9.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_11) + (-u_xlat16_9.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat24) * 0.5 + u_xlat8;
    u_xlat8 = u_xlat24 * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat24 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat24 * vs_TEXCOORD5.y;
    u_xlat16_9.x = u_xlat24 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_24 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat24 = u_xlat16_24 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16.xxx * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat24, 9.99999975e-05);
    SV_Target0.w = u_xlat24;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = u_xlat0.xxxx + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0.x = _BevelWidth + _OutlineWidth;
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat0.xxxx;
    u_xlat0.x = u_xlat0.x * _Bevel;
    u_xlat0.x = u_xlat0.x * _GradientScale;
    u_xlat0.x = u_xlat0.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16.x>=(-u_xlat16.x));
#else
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
#endif
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16.x>=0.5);
#else
    u_xlatb16 = u_xlat16.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb16)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat16.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat16.xxxx, u_xlat2);
    u_xlat16.xy = u_xlat0.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat0.xx + (-u_xlat16.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.x = u_xlat16.x * u_xlat2.z;
    u_xlat5.yz = u_xlat16.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat0.xzw * u_xlat5.xyz;
    u_xlat0.xzw = u_xlat5.zxy * u_xlat0.zwx + (-u_xlat6.xyz);
    u_xlat28 = (-_BumpFace) + _BumpOutline;
    u_xlat28 = u_xlat8 * u_xlat28 + _BumpFace;
    u_xlat10_5.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_7.xyz * vec3(u_xlat28) + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xzw = u_xlat0.xzw + (-u_xlat5.xyz);
    u_xlat28 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat28);
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat28) + _WorldSpaceLightPos0.xyz;
    u_xlat16_25 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_7.xyz = vec3(u_xlat16_25) * u_xlat16_7.xyz;
    u_xlat16_25 = dot(u_xlat5.xyz, u_xlat16_7.xyz);
    u_xlat16_7.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_28 = log2(u_xlat16_25);
    u_xlat16_5.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat5.x = u_xlat8 * u_xlat16_5.x + _FaceShininess;
    u_xlat16_25 = u_xlat5.x * 128.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_25;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_15.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat0.zzz * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.www + u_xlat6.xyz;
    u_xlat28 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat28)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat8) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat16 = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat15 * 0.5;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat16 = u_xlat15 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat16 = u_xlat16 * u_xlat2.x;
    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat17 = dot(u_xlat0.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat17) * u_xlat15 + u_xlat16;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat19;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump float u_xlat16_25;
float u_xlat28;
mediump float u_xlat16_28;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_8 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_8 = (-u_xlat10_8) + 0.5;
    u_xlat8 = u_xlat16_8 + (-vs_TEXCOORD5.x);
    u_xlat8 = u_xlat8 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb16 = u_xlat0.x>=0.0;
#endif
    u_xlat16.x = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat24 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat16.x = u_xlat16.x * u_xlat24 + _GlowInner;
    u_xlat16.x = u_xlat16.x * vs_TEXCOORD5.y;
    u_xlat24 = u_xlat16.x * 0.5 + 1.0;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat0.x = u_xlat0.x / u_xlat24;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat16.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat24 = _OutlineWidth * _ScaleRatioA;
    u_xlat24 = u_xlat24 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat24 * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = min(u_xlat24, 1.0);
    u_xlat16_9.x = sqrt(u_xlat16_9.x);
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_11 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat19.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat19.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_9.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_11) + (-u_xlat16_9.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat24) * 0.5 + u_xlat8;
    u_xlat8 = u_xlat24 * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat24 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat24 * vs_TEXCOORD5.y;
    u_xlat16_9.x = u_xlat24 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_24 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat24 = u_xlat16_24 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16.xxx * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat24, 9.99999975e-05);
    SV_Target0.w = u_xlat24;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = u_xlat0.xxxx + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0.x = _BevelWidth + _OutlineWidth;
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat0.xxxx;
    u_xlat0.x = u_xlat0.x * _Bevel;
    u_xlat0.x = u_xlat0.x * _GradientScale;
    u_xlat0.x = u_xlat0.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16.x>=(-u_xlat16.x));
#else
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
#endif
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16.x>=0.5);
#else
    u_xlatb16 = u_xlat16.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb16)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat16.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat16.xxxx, u_xlat2);
    u_xlat16.xy = u_xlat0.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat0.xx + (-u_xlat16.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.x = u_xlat16.x * u_xlat2.z;
    u_xlat5.yz = u_xlat16.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat0.xzw * u_xlat5.xyz;
    u_xlat0.xzw = u_xlat5.zxy * u_xlat0.zwx + (-u_xlat6.xyz);
    u_xlat28 = (-_BumpFace) + _BumpOutline;
    u_xlat28 = u_xlat8 * u_xlat28 + _BumpFace;
    u_xlat10_5.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_7.xyz * vec3(u_xlat28) + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xzw = u_xlat0.xzw + (-u_xlat5.xyz);
    u_xlat28 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat28);
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat28) + _WorldSpaceLightPos0.xyz;
    u_xlat16_25 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_7.xyz = vec3(u_xlat16_25) * u_xlat16_7.xyz;
    u_xlat16_25 = dot(u_xlat5.xyz, u_xlat16_7.xyz);
    u_xlat16_7.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_28 = log2(u_xlat16_25);
    u_xlat16_5.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat5.x = u_xlat8 * u_xlat16_5.x + _FaceShininess;
    u_xlat16_25 = u_xlat5.x * 128.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_25;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_15.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat0.zzz * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.www + u_xlat6.xyz;
    u_xlat28 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat28)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat8) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD6;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
int u_xlati5;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat17;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat15 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat15);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb15 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat16 = (-_WeightNormal) + _WeightBold;
    u_xlat15 = u_xlat15 * u_xlat16 + _WeightNormal;
    u_xlat15 = u_xlat15 * 0.25 + _FaceDilate;
    u_xlat15 = u_xlat15 * _ScaleRatioA;
    vs_TEXCOORD5.x = u_xlat15 * 0.5;
    u_xlat15 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat15;
    u_xlat15 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat15;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat15) / u_xlat2.xy;
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat16 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat15 = u_xlat15 * u_xlat16;
    u_xlat16 = u_xlat15 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat16 = u_xlat16 * u_xlat2.x;
    u_xlat15 = u_xlat15 * 1.5 + (-u_xlat16);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati5 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati5 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati5) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat3.xyz = vec3(u_xlat17) * u_xlat2.xyz;
    u_xlat17 = dot(u_xlat0.yzx, u_xlat3.xyz);
    vs_TEXCOORD5.y = abs(u_xlat17) * u_xlat15 + u_xlat16;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = vec3(u_xlat15) * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat4.xyz = u_xlat0.zxy * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat5 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat4.xyz = vec3(u_xlat5) * u_xlat4.xyz;
    vs_TEXCOORD2.y = u_xlat4.x;
    vs_TEXCOORD2.w = u_xlat1.x;
    vs_TEXCOORD2.x = u_xlat3.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat3.x;
    vs_TEXCOORD4.x = u_xlat3.y;
    vs_TEXCOORD3.w = u_xlat1.y;
    vs_TEXCOORD4.w = u_xlat1.z;
    vs_TEXCOORD3.y = u_xlat4.y;
    vs_TEXCOORD4.y = u_xlat4.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _ReflectFaceColor;
uniform 	mediump vec4 _ReflectOutlineColor;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform lowp samplerCube _Cube;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
lowp float u_xlat10_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
bool u_xlatb16;
vec2 u_xlat19;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
mediump float u_xlat16_25;
float u_xlat28;
mediump float u_xlat16_28;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD5.y;
    u_xlat10_8 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_8 = (-u_xlat10_8) + 0.5;
    u_xlat8 = u_xlat16_8 + (-vs_TEXCOORD5.x);
    u_xlat8 = u_xlat8 * vs_TEXCOORD5.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb16 = u_xlat0.x>=0.0;
#endif
    u_xlat16.x = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat24 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat16.x = u_xlat16.x * u_xlat24 + _GlowInner;
    u_xlat16.x = u_xlat16.x * vs_TEXCOORD5.y;
    u_xlat24 = u_xlat16.x * 0.5 + 1.0;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat0.x = u_xlat0.x / u_xlat24;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat16.x * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat24 = _OutlineWidth * _ScaleRatioA;
    u_xlat24 = u_xlat24 * vs_TEXCOORD5.y;
    u_xlat16_1.x = u_xlat24 * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9.x = min(u_xlat24, 1.0);
    u_xlat16_9.x = sqrt(u_xlat16_9.x);
    u_xlat16_1.x = u_xlat16_9.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_11 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat19.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat19.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_9.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_11) + (-u_xlat16_9.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat24) * 0.5 + u_xlat8;
    u_xlat8 = u_xlat24 * 0.5 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat24 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat24 * vs_TEXCOORD5.y;
    u_xlat16_9.x = u_xlat24 * vs_TEXCOORD5.y + 1.0;
    u_xlat16_1.x = u_xlat3 * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_24 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat24 = u_xlat16_24 * u_xlat0.x + u_xlat16_3.w;
    u_xlat4.xyz = u_xlat0.xxx * _GlowColor.xyz;
    u_xlat16_0 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_3.xyz / vec3(u_xlat16_0);
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat16.xxx * u_xlat16_5.xyz + u_xlat4.xyz;
    u_xlat0.x = max(u_xlat24, 9.99999975e-05);
    SV_Target0.w = u_xlat24;
    u_xlat0.xzw = u_xlat5.xyz / u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat0.x = vs_TEXCOORD5.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat5 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat6.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat6.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat6.y = texture(_MainTex, u_xlat5.xy).w;
    u_xlat6.w = texture(_MainTex, u_xlat5.zw).w;
    u_xlat2 = u_xlat0.xxxx + u_xlat6;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0.x = _BevelWidth + _OutlineWidth;
    u_xlat0.x = max(u_xlat0.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat0.xxxx;
    u_xlat0.x = u_xlat0.x * _Bevel;
    u_xlat0.x = u_xlat0.x * _GradientScale;
    u_xlat0.x = u_xlat0.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat5 = -abs(u_xlat5) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat16.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat16.x>=(-u_xlat16.x));
#else
    u_xlatb24 = u_xlat16.x>=(-u_xlat16.x);
#endif
    u_xlat16.x = fract(abs(u_xlat16.x));
    u_xlat16.x = (u_xlatb24) ? u_xlat16.x : (-u_xlat16.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16.x>=0.5);
#else
    u_xlatb16 = u_xlat16.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb16)) ? u_xlat5 : u_xlat2;
    u_xlat5 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat5 = sin(u_xlat5);
    u_xlat5 = (-u_xlat2) + u_xlat5;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat5 + u_xlat2;
    u_xlat16.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat16.xxxx, u_xlat2);
    u_xlat16.xy = u_xlat0.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat0.xx + (-u_xlat16.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat0.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat5.x = u_xlat16.x * u_xlat2.z;
    u_xlat5.yz = u_xlat16.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat0.xzw * u_xlat5.xyz;
    u_xlat0.xzw = u_xlat5.zxy * u_xlat0.zwx + (-u_xlat6.xyz);
    u_xlat28 = (-_BumpFace) + _BumpOutline;
    u_xlat28 = u_xlat8 * u_xlat28 + _BumpFace;
    u_xlat10_5.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_7.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_7.xyz * vec3(u_xlat28) + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_3.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xzw = u_xlat0.xzw + (-u_xlat5.xyz);
    u_xlat28 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat28);
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat28 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat6.x = vs_TEXCOORD2.w;
    u_xlat6.y = vs_TEXCOORD3.w;
    u_xlat6.z = vs_TEXCOORD4.w;
    u_xlat6.xyz = (-u_xlat6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat28 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat16_7.xyz = u_xlat6.xyz * vec3(u_xlat28) + _WorldSpaceLightPos0.xyz;
    u_xlat16_25 = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_25 = inversesqrt(u_xlat16_25);
    u_xlat16_7.xyz = vec3(u_xlat16_25) * u_xlat16_7.xyz;
    u_xlat16_25 = dot(u_xlat5.xyz, u_xlat16_7.xyz);
    u_xlat16_7.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_25 = max(u_xlat16_25, 0.0);
    u_xlat16_28 = log2(u_xlat16_25);
    u_xlat16_5.x = (-_FaceShininess) + _OutlineShininess;
    u_xlat5.x = u_xlat8 * u_xlat16_5.x + _FaceShininess;
    u_xlat16_25 = u_xlat5.x * 128.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_25;
    u_xlat16_28 = exp2(u_xlat16_28);
    u_xlat16_15.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_28) * u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_7.xxx + u_xlat16_5.xyz;
    u_xlat6.xyz = u_xlat0.zzz * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xzw = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.www + u_xlat6.xyz;
    u_xlat28 = dot(vs_TEXCOORD6.xyz, u_xlat0.xzw);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat0.xzw = u_xlat0.xzw * (-vec3(u_xlat28)) + vs_TEXCOORD6.xyz;
    u_xlat10_0.xzw = texture(_Cube, u_xlat0.xzw).xyz;
    u_xlat16_6.xyz = (-_ReflectFaceColor.xyz) + _ReflectOutlineColor.xyz;
    u_xlat6.xyz = vec3(u_xlat8) * u_xlat16_6.xyz + _ReflectFaceColor.xyz;
    u_xlat0.xyz = u_xlat10_0.xzw * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.www + u_xlat4.xyz;
    SV_Target0.xyz = u_xlat0.xyz + u_xlat16_5.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
}
}
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 75290
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xx).w;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xx).w;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat8.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xx).w;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
vec2 u_xlat13;
bool u_xlatb13;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
vec2 u_xlat21;
bool u_xlatb22;
float u_xlat27;
mediump float u_xlat16_27;
float u_xlat31;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD6.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD6.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat27 * vs_TEXCOORD6.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_27 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_27);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat16_7.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat9 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_8.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_8.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat13.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb22 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.x = fract(abs(u_xlat13.x));
    u_xlat13.x = (u_xlatb22) ? u_xlat13.x : (-u_xlat13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=0.5);
#else
    u_xlatb13 = u_xlat13.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat13.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat13.xxxx);
    u_xlat13.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat13.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat13.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat13.x = inversesqrt(u_xlat13.x);
    u_xlat5.x = u_xlat2.z * u_xlat13.x;
    u_xlat5.yz = u_xlat13.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_8.xyz = u_xlat4.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_34 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
    u_xlat16_34 = dot(u_xlat0.xzw, u_xlat16_8.xyz);
    u_xlat16_8.x = dot(u_xlat0.xzw, _WorldSpaceLightPos0.xyz);
    u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
    u_xlat16_34 = max(u_xlat16_34, 0.0);
    u_xlat16_0.x = log2(u_xlat16_34);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat9 = u_xlat9 * u_xlat16_18 + _FaceShininess;
    u_xlat16_34 = u_xlat9 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_34;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_17.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat16_7.xyz * u_xlat16_8.xxx + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
vec2 u_xlat13;
bool u_xlatb13;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
vec2 u_xlat21;
bool u_xlatb22;
float u_xlat27;
mediump float u_xlat16_27;
float u_xlat31;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD6.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD6.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat27 * vs_TEXCOORD6.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_27 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_27);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat16_7.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat9 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_8.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_8.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat13.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb22 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.x = fract(abs(u_xlat13.x));
    u_xlat13.x = (u_xlatb22) ? u_xlat13.x : (-u_xlat13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=0.5);
#else
    u_xlatb13 = u_xlat13.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat13.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat13.xxxx);
    u_xlat13.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat13.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat13.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat13.x = inversesqrt(u_xlat13.x);
    u_xlat5.x = u_xlat2.z * u_xlat13.x;
    u_xlat5.yz = u_xlat13.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_8.xyz = u_xlat4.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_34 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
    u_xlat16_34 = dot(u_xlat0.xzw, u_xlat16_8.xyz);
    u_xlat16_8.x = dot(u_xlat0.xzw, _WorldSpaceLightPos0.xyz);
    u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
    u_xlat16_34 = max(u_xlat16_34, 0.0);
    u_xlat16_0.x = log2(u_xlat16_34);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat9 = u_xlat9 * u_xlat16_18 + _FaceShininess;
    u_xlat16_34 = u_xlat9 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_34;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_17.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat16_7.xyz * u_xlat16_8.xxx + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_9;
lowp float u_xlat10_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_12;
vec2 u_xlat13;
bool u_xlatb13;
mediump vec3 u_xlat16_17;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
vec2 u_xlat21;
bool u_xlatb22;
float u_xlat27;
mediump float u_xlat16_27;
float u_xlat31;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_9 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_9 = (-u_xlat10_9) + 0.5;
    u_xlat9 = u_xlat16_9 + (-vs_TEXCOORD6.x);
    u_xlat9 = u_xlat9 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb18 = u_xlat0.x>=0.0;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat27 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat18 = u_xlat18 * u_xlat27 + _GlowInner;
    u_xlat18 = u_xlat18 * vs_TEXCOORD6.y;
    u_xlat27 = u_xlat18 * 0.5 + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat0.x = u_xlat0.x / u_xlat27;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat18 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat27 = _OutlineWidth * _ScaleRatioA;
    u_xlat27 = u_xlat27 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = min(u_xlat27, 1.0);
    u_xlat16_10.x = sqrt(u_xlat16_10.x);
    u_xlat16_1.x = u_xlat16_10.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_12 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat21.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat21.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_10.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_12) + (-u_xlat16_10.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat27) * 0.5 + u_xlat9;
    u_xlat9 = u_xlat27 * 0.5 + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat27 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat27 * vs_TEXCOORD6.y;
    u_xlat16_10.x = u_xlat27 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_27 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_27 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_27 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_27);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat16_7.xyz = u_xlat0.xzw * _LightColor0.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat9 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_8.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_8.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat13.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb22 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.x = fract(abs(u_xlat13.x));
    u_xlat13.x = (u_xlatb22) ? u_xlat13.x : (-u_xlat13.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=0.5);
#else
    u_xlatb13 = u_xlat13.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb13)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat13.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat13.xxxx);
    u_xlat13.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat13.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat13.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat13.x = inversesqrt(u_xlat13.x);
    u_xlat5.x = u_xlat2.z * u_xlat13.x;
    u_xlat5.yz = u_xlat13.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat31 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat16_8.xyz = u_xlat4.xyz * vec3(u_xlat31) + _WorldSpaceLightPos0.xyz;
    u_xlat16_34 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat16_34 = inversesqrt(u_xlat16_34);
    u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
    u_xlat16_34 = dot(u_xlat0.xzw, u_xlat16_8.xyz);
    u_xlat16_8.x = dot(u_xlat0.xzw, _WorldSpaceLightPos0.xyz);
    u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
    u_xlat16_34 = max(u_xlat16_34, 0.0);
    u_xlat16_0.x = log2(u_xlat16_34);
    u_xlat16_18 = (-_FaceShininess) + _OutlineShininess;
    u_xlat9 = u_xlat9 * u_xlat16_18 + _FaceShininess;
    u_xlat16_34 = u_xlat9 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_34;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_17.xyz = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat16_7.xyz * u_xlat16_8.xxx + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8 = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_4.xzw;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8 = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_4.xzw;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8 = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_4.xzw = _LightColor0.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_4.xzw;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_5.xyz * _LightColor0.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
float u_xlat24;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<u_xlat2.z);
#else
    u_xlatb14 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).w;
    u_xlat16_7.x = (u_xlatb14) ? 1.0 : 0.0;
    u_xlat16_7.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat24 * u_xlat16_7.x;
    u_xlat16_7.xyz = u_xlat16_7.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
float u_xlat24;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<u_xlat2.z);
#else
    u_xlatb14 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).w;
    u_xlat16_7.x = (u_xlatb14) ? 1.0 : 0.0;
    u_xlat16_7.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat24 * u_xlat16_7.x;
    u_xlat16_7.xyz = u_xlat16_7.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
float u_xlat24;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat4.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.0<u_xlat2.z);
#else
    u_xlatb14 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).w;
    u_xlat16_7.x = (u_xlatb14) ? 1.0 : 0.0;
    u_xlat16_7.x = u_xlat4.x * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat24 * u_xlat16_7.x;
    u_xlat16_7.xyz = u_xlat16_7.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<u_xlat2.z);
#else
    u_xlatb16 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).w;
    u_xlat16_4.x = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat24 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<u_xlat2.z);
#else
    u_xlatb16 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).w;
    u_xlat16_4.x = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat24 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat2 = vs_TEXCOORD5.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD5.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD5.zzzz + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat8.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat8.xy = u_xlat8.xy + vec2(0.5, 0.5);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0<u_xlat2.z);
#else
    u_xlatb16 = 0.0<u_xlat2.z;
#endif
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = texture(_LightTextureB0, vec2(u_xlat24)).w;
    u_xlat16_4.x = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat16_4.x = u_xlat8.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat24 * u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_4.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xyz).w;
    u_xlat14.x = texture(_LightTextureB0, vec2(u_xlat34)).w;
    u_xlat4.x = u_xlat4.x * u_xlat14.x;
    u_xlat16_7.xyz = u_xlat4.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xyz).w;
    u_xlat14.x = texture(_LightTextureB0, vec2(u_xlat34)).w;
    u_xlat4.x = u_xlat4.x * u_xlat14.x;
    u_xlat16_7.xyz = u_xlat4.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xyz).w;
    u_xlat14.x = texture(_LightTextureB0, vec2(u_xlat34)).w;
    u_xlat4.x = u_xlat4.x * u_xlat14.x;
    u_xlat16_7.xyz = u_xlat4.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
float u_xlat16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xyz).w;
    u_xlat16 = texture(_LightTextureB0, u_xlat5.xx).w;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
float u_xlat16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xyz).w;
    u_xlat16 = texture(_LightTextureB0, u_xlat5.xx).w;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
float u_xlat16;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat5.xyz = vec3(u_xlat29) * u_xlat5.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat6.xyz * vec3(u_xlat29) + u_xlat5.xyz;
    u_xlat16_4.w = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat16_7.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_7.x = inversesqrt(u_xlat16_7.x);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_7.xxx;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.xw = max(u_xlat16_4.xw, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat8.xyz;
    u_xlat8.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat8.xyz;
    u_xlat8.xyz = u_xlat8.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xyz).w;
    u_xlat16 = texture(_LightTextureB0, u_xlat5.xx).w;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16_4.xyz = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xyz * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_4.www + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat24 = _OutlineWidth * _ScaleRatioA;
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y;
    u_xlat16_4.x = min(u_xlat24, 1.0);
    u_xlat16_4.x = sqrt(u_xlat16_4.x);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = (-u_xlat10_1) + 0.5;
    u_xlat1.x = u_xlat16_1 + (-vs_TEXCOORD6.x);
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y + 0.5;
    u_xlat16_12.x = u_xlat24 * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_12.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_7.x = (-u_xlat24) * 0.5 + u_xlat1.x;
    u_xlat24 = u_xlat24 * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat9.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat17 = u_xlat9.x * vs_TEXCOORD6.y;
    u_xlat16_15 = u_xlat9.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_7.x = u_xlat17 * 0.5 + u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_15;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_7.xxxx;
    u_xlat16_9.x = (-u_xlat16_4.w) * u_xlat16_7.x + 1.0;
    u_xlat17 = (-_BumpFace) + _BumpOutline;
    u_xlat17 = u_xlat24 * u_xlat17 + _BumpFace;
    u_xlat10_3.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_4.xyz * vec3(u_xlat17) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = u_xlat16_2.www * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat3.xyz);
    u_xlat17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat17);
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat17) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_2.xyz / vec3(u_xlat16_24);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat24 = _GlowOffset * _ScaleRatioB;
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y;
    u_xlat24 = (-u_xlat24) * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat24>=0.0);
#else
    u_xlatb1 = u_xlat24>=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat17 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat1.x = u_xlat1.x * u_xlat17 + _GlowInner;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat17 = u_xlat1.x * 0.5 + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat24 = u_xlat24 / u_xlat17;
    u_xlat24 = min(abs(u_xlat24), 1.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _GlowPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = dot(_GlowColor.ww, vec2(u_xlat24));
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat24) * vs_COLOR0.w + 1.0;
    u_xlat24 = u_xlat24 * vs_COLOR0.w;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.xxx;
    u_xlat1.xzw = _GlowColor.xyz * vec3(u_xlat24) + u_xlat1.xzw;
    u_xlat2.w = u_xlat16_9.x * u_xlat24 + u_xlat16_2.w;
    u_xlat24 = max(u_xlat2.w, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xzw / vec3(u_xlat24);
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat24 = _OutlineWidth * _ScaleRatioA;
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y;
    u_xlat16_4.x = min(u_xlat24, 1.0);
    u_xlat16_4.x = sqrt(u_xlat16_4.x);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = (-u_xlat10_1) + 0.5;
    u_xlat1.x = u_xlat16_1 + (-vs_TEXCOORD6.x);
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y + 0.5;
    u_xlat16_12.x = u_xlat24 * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_12.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_7.x = (-u_xlat24) * 0.5 + u_xlat1.x;
    u_xlat24 = u_xlat24 * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat9.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat17 = u_xlat9.x * vs_TEXCOORD6.y;
    u_xlat16_15 = u_xlat9.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_7.x = u_xlat17 * 0.5 + u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_15;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_7.xxxx;
    u_xlat16_9.x = (-u_xlat16_4.w) * u_xlat16_7.x + 1.0;
    u_xlat17 = (-_BumpFace) + _BumpOutline;
    u_xlat17 = u_xlat24 * u_xlat17 + _BumpFace;
    u_xlat10_3.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_4.xyz * vec3(u_xlat17) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = u_xlat16_2.www * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat3.xyz);
    u_xlat17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat17);
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat17) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_2.xyz / vec3(u_xlat16_24);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat24 = _GlowOffset * _ScaleRatioB;
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y;
    u_xlat24 = (-u_xlat24) * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat24>=0.0);
#else
    u_xlatb1 = u_xlat24>=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat17 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat1.x = u_xlat1.x * u_xlat17 + _GlowInner;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat17 = u_xlat1.x * 0.5 + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat24 = u_xlat24 / u_xlat17;
    u_xlat24 = min(abs(u_xlat24), 1.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _GlowPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = dot(_GlowColor.ww, vec2(u_xlat24));
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat24) * vs_COLOR0.w + 1.0;
    u_xlat24 = u_xlat24 * vs_COLOR0.w;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.xxx;
    u_xlat1.xzw = _GlowColor.xyz * vec3(u_xlat24) + u_xlat1.xzw;
    u_xlat2.w = u_xlat16_9.x * u_xlat24 + u_xlat16_2.w;
    u_xlat24 = max(u_xlat2.w, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xzw / vec3(u_xlat24);
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
lowp float u_xlat10_1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
mediump float u_xlat16_15;
float u_xlat17;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
mediump float u_xlat16_28;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat24 = _OutlineWidth * _ScaleRatioA;
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y;
    u_xlat16_4.x = min(u_xlat24, 1.0);
    u_xlat16_4.x = sqrt(u_xlat16_4.x);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = (-u_xlat10_1) + 0.5;
    u_xlat1.x = u_xlat16_1 + (-vs_TEXCOORD6.x);
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y + 0.5;
    u_xlat16_12.x = u_xlat24 * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_12.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_4.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_7.x = (-u_xlat24) * 0.5 + u_xlat1.x;
    u_xlat24 = u_xlat24 * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat9.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat17 = u_xlat9.x * vs_TEXCOORD6.y;
    u_xlat16_15 = u_xlat9.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_7.x = u_xlat17 * 0.5 + u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_15;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.x = min(max(u_xlat16_7.x, 0.0), 1.0);
#else
    u_xlat16_7.x = clamp(u_xlat16_7.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = (-u_xlat16_7.x) + 1.0;
    u_xlat16_2 = u_xlat16_4 * u_xlat16_7.xxxx;
    u_xlat16_9.x = (-u_xlat16_4.w) * u_xlat16_7.x + 1.0;
    u_xlat17 = (-_BumpFace) + _BumpOutline;
    u_xlat17 = u_xlat24 * u_xlat17 + _BumpFace;
    u_xlat10_3.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = u_xlat16_4.xyz * vec3(u_xlat17) + vec3(-0.0, -0.0, -1.0);
    u_xlat3.xyz = u_xlat16_2.www * u_xlat3.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat3.xyz);
    u_xlat17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat17);
    u_xlat3.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat3.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat3.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat17 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat17) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_2.w, 9.99999975e-05);
    u_xlat16_3.xyz = u_xlat16_2.xyz / vec3(u_xlat16_24);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz;
    u_xlat24 = _GlowOffset * _ScaleRatioB;
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y;
    u_xlat24 = (-u_xlat24) * 0.5 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat24>=0.0);
#else
    u_xlatb1 = u_xlat24>=0.0;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat17 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat1.x = u_xlat1.x * u_xlat17 + _GlowInner;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat17 = u_xlat1.x * 0.5 + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat24 = u_xlat24 / u_xlat17;
    u_xlat24 = min(abs(u_xlat24), 1.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _GlowPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat1.x * u_xlat24;
    u_xlat24 = dot(_GlowColor.ww, vec2(u_xlat24));
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = (-u_xlat24) * vs_COLOR0.w + 1.0;
    u_xlat24 = u_xlat24 * vs_COLOR0.w;
    u_xlat1.xzw = u_xlat16_3.xyz * u_xlat1.xxx;
    u_xlat1.xzw = _GlowColor.xyz * vec3(u_xlat24) + u_xlat1.xzw;
    u_xlat2.w = u_xlat16_9.x * u_xlat24 + u_xlat16_2.w;
    u_xlat24 = max(u_xlat2.w, 9.99999975e-05);
    u_xlat1.xyz = u_xlat1.xzw / vec3(u_xlat24);
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0 = u_xlat2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
vec2 u_xlat8;
mediump float u_xlat16_8;
vec2 u_xlat9;
mediump vec3 u_xlat16_9;
bool u_xlatb9;
mediump float u_xlat16_10;
mediump vec3 u_xlat16_12;
lowp vec3 u_xlat10_13;
bool u_xlatb17;
float u_xlat24;
mediump float u_xlat16_24;
lowp float u_xlat10_24;
mediump float u_xlat16_28;
float u_xlat29;
void main()
{
    u_xlat0.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat1.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat1.z = 0.0;
    u_xlat2 = (-u_xlat1.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat1 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat3.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat3.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat3.y = texture(_MainTex, u_xlat1.xy).w;
    u_xlat3.w = texture(_MainTex, u_xlat1.zw).w;
    u_xlat0 = u_xlat0.xxxx + u_xlat3;
    u_xlat0 = u_xlat0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = _BevelWidth + _OutlineWidth;
    u_xlat1.x = max(u_xlat1.x, 0.00999999978);
    u_xlat0 = u_xlat0 / u_xlat1.xxxx;
    u_xlat1.x = u_xlat1.x * _Bevel;
    u_xlat1.x = u_xlat1.x * _GradientScale;
    u_xlat1.x = u_xlat1.x * -2.0;
    u_xlat0 = u_xlat0 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat2 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = -abs(u_xlat2) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat9.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat9.x>=(-u_xlat9.x));
#else
    u_xlatb17 = u_xlat9.x>=(-u_xlat9.x);
#endif
    u_xlat9.x = fract(abs(u_xlat9.x));
    u_xlat9.x = (u_xlatb17) ? u_xlat9.x : (-u_xlat9.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9.x>=0.5);
#else
    u_xlatb9 = u_xlat9.x>=0.5;
#endif
    u_xlat0 = (bool(u_xlatb9)) ? u_xlat2 : u_xlat0;
    u_xlat2 = u_xlat0 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat2 = sin(u_xlat2);
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat2 + u_xlat0;
    u_xlat9.x = (-_BevelClamp) + 1.0;
    u_xlat0 = min(u_xlat0, u_xlat9.xxxx);
    u_xlat0.xz = u_xlat1.xx * u_xlat0.xz;
    u_xlat0.yz = u_xlat0.wy * u_xlat1.xx + (-u_xlat0.zx);
    u_xlat0.x = float(-1.0);
    u_xlat0.w = float(1.0);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat24 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.x = u_xlat24 * u_xlat0.z;
    u_xlat2.yz = vec2(u_xlat24) * vec2(1.0, 0.0);
    u_xlat0.z = 0.0;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat0.yzx + (-u_xlat1.xyz);
    u_xlat10_24 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_24 = (-u_xlat10_24) + 0.5;
    u_xlat24 = u_xlat16_24 + (-vs_TEXCOORD6.x);
    u_xlat24 = u_xlat24 * vs_TEXCOORD6.y + 0.5;
    u_xlat1.x = _OutlineWidth * _ScaleRatioA;
    u_xlat1.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_4.x = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = min(u_xlat1.x, 1.0);
    u_xlat16_12.x = sqrt(u_xlat16_12.x);
    u_xlat16_4.x = u_xlat16_12.x * u_xlat16_4.x;
    u_xlat9.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat9.xy);
    u_xlat16_9.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_2.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_10 = u_xlat10_2.w * u_xlat16_2.x;
    u_xlat3.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_3 = texture(_FaceTex, u_xlat3.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_3 * u_xlat16_5;
    u_xlat16_12.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_9.xyz * vec3(u_xlat16_10) + (-u_xlat16_12.xyz);
    u_xlat16_7.w = u_xlat16_2.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_2 = u_xlat16_4.xxxx * u_xlat16_7;
    u_xlat16_3.w = u_xlat16_5.w * u_xlat10_3.w + u_xlat16_2.w;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_2.xyz;
    u_xlat16_4.x = (-u_xlat1.x) * 0.5 + u_xlat24;
    u_xlat24 = u_xlat1.x * 0.5 + u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = _OutlineSoftness * _ScaleRatioA;
    u_xlat9.x = u_xlat1.x * vs_TEXCOORD6.y;
    u_xlat16_12.x = u_xlat1.x * vs_TEXCOORD6.y + 1.0;
    u_xlat16_4.x = u_xlat9.x * 0.5 + u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    u_xlat16_1 = u_xlat16_3 * u_xlat16_4.xxxx;
    u_xlat5.x = (-_BumpFace) + _BumpOutline;
    u_xlat5.x = u_xlat24 * u_xlat5.x + _BumpFace;
    u_xlat10_13.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat5.xyz = u_xlat16_1.www * u_xlat5.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat5.xyz);
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
    u_xlat5.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xyz));
    u_xlat5.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xyz));
    u_xlat5.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat29 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat16_4.xyz = u_xlat5.xyz * vec3(u_xlat29) + _WorldSpaceLightPos0.xyz;
    u_xlat16_28 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_28 = inversesqrt(u_xlat16_28);
    u_xlat16_4.xyz = vec3(u_xlat16_28) * u_xlat16_4.xyz;
    u_xlat16_4.x = dot(u_xlat0.xyz, u_xlat16_4.xyz);
    u_xlat16_4.y = dot(u_xlat0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_4.xy = max(u_xlat16_4.xy, vec2(0.0, 0.0));
    u_xlat16_0.x = log2(u_xlat16_4.x);
    u_xlat16_8 = (-_FaceShininess) + _OutlineShininess;
    u_xlat8.x = u_xlat24 * u_xlat16_8 + _FaceShininess;
    u_xlat16_4.x = u_xlat8.x * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_4.x;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat8.xy = vs_TEXCOORD5.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD5.xx + u_xlat8.xy;
    u_xlat8.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD5.zz + u_xlat8.xy;
    u_xlat8.xy = u_xlat8.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat8.x = texture(_LightTexture0, u_xlat8.xy).w;
    u_xlat16_4.xzw = u_xlat8.xxx * _LightColor0.xyz;
    u_xlat16_7.xyz = u_xlat16_4.xzw * _SpecColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat16_24 = max(u_xlat16_1.w, 9.99999975e-05);
    u_xlat16_5.xyz = u_xlat16_1.xyz / vec3(u_xlat16_24);
    SV_Target0.w = u_xlat16_1.w;
    u_xlat16_4.xzw = u_xlat16_4.xzw * u_xlat16_5.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xzw * u_xlat16_4.yyy + u_xlat16_0.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xx).w;
    u_xlat16_7.xyz = u_xlat4.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xx).w;
    u_xlat16_7.xyz = u_xlat4.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "GLOW_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _FaceDilate;
uniform 	vec4 hlslcc_mtx4x4_EnvMatrix[4];
uniform 	float _WeightNormal;
uniform 	float _WeightBold;
uniform 	float _ScaleRatioA;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	float _GradientScale;
uniform 	float _ScaleX;
uniform 	float _ScaleY;
uniform 	float _PerspectiveFilter;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FaceTex_ST;
uniform 	vec4 _OutlineTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD6;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD7;
vec3 u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
int u_xlati4;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.xy = vec2(in_POSITION0.x + float(_VertexOffsetX), in_POSITION0.y + float(_VertexOffsetY));
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat3;
    u_xlat12 = in_TEXCOORD1.x * 0.000244140625;
    u_xlat3.x = floor(u_xlat12);
    u_xlat3.y = (-u_xlat3.x) * 4096.0 + in_TEXCOORD1.x;
    u_xlat3.xy = u_xlat3.xy * vec2(0.001953125, 0.001953125);
    vs_TEXCOORD0.zw = u_xlat3.xy * _FaceTex_ST.xy + _FaceTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat3.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat12 = u_xlat2.y * hlslcc_mtx4x4unity_MatrixVP[1].w;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[0].w * u_xlat2.x + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[2].w * u_xlat2.z + u_xlat12;
    u_xlat12 = hlslcc_mtx4x4unity_MatrixVP[3].w * u_xlat2.w + u_xlat12;
    u_xlat2.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat2.xy;
    u_xlat2.xy = vec2(u_xlat2.x * float(_ScaleX), u_xlat2.y * float(_ScaleY));
    u_xlat2.xy = vec2(u_xlat12) / u_xlat2.xy;
    u_xlat12 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat13 = abs(in_TEXCOORD1.y) * _GradientScale;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat13 = u_xlat12 * 1.5;
    u_xlat2.x = (-_PerspectiveFilter) + 1.0;
    u_xlat13 = u_xlat13 * u_xlat2.x;
    u_xlat12 = u_xlat12 * 1.5 + (-u_xlat13);
    u_xlat2.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat0.z = in_POSITION0.z;
    u_xlat0.xyz = (-u_xlat0.xyz) + u_xlat2.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<u_xlat0.x; u_xlati4 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati4 = int((0.0<u_xlat0.x) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = u_xlat0.x<0.0; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((u_xlat0.x<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati4) + u_xlati0;
    u_xlat0.x = float(u_xlati0);
    u_xlat0.xyz = u_xlat0.xxx * in_NORMAL0.xyz;
    u_xlat2.y = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.z = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.x = dot(u_xlat0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _WorldSpaceCameraPos.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.x = dot(u_xlat0.yzx, u_xlat1.xyz);
    vs_TEXCOORD6.y = abs(u_xlat1.x) * u_xlat12 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=in_TEXCOORD1.y);
#else
    u_xlatb12 = 0.0>=in_TEXCOORD1.y;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = (-_WeightNormal) + _WeightBold;
    u_xlat12 = u_xlat12 * u_xlat1.x + _WeightNormal;
    u_xlat12 = u_xlat12 * 0.25 + _FaceDilate;
    u_xlat12 = u_xlat12 * _ScaleRatioA;
    vs_TEXCOORD6.x = u_xlat12 * 0.5;
    vs_TEXCOORD2.z = u_xlat0.y;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yzx;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yzx * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yzx * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx + (-u_xlat3.xyz);
    u_xlat4 = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat3.xyz = vec3(u_xlat4) * u_xlat3.xyz;
    vs_TEXCOORD2.y = u_xlat3.x;
    vs_TEXCOORD2.x = u_xlat1.z;
    vs_TEXCOORD3.z = u_xlat0.z;
    vs_TEXCOORD4.z = u_xlat0.x;
    vs_TEXCOORD3.x = u_xlat1.x;
    vs_TEXCOORD4.x = u_xlat1.y;
    vs_TEXCOORD3.y = u_xlat3.y;
    vs_TEXCOORD4.y = u_xlat3.z;
    vs_COLOR0 = in_COLOR0;
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4_EnvMatrix[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_EnvMatrix[0].xyz * u_xlat2.xxx + u_xlat0.xyz;
    vs_TEXCOORD7.xyz = hlslcc_mtx4x4_EnvMatrix[2].xyz * u_xlat2.zzz + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _SpecColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _FaceUVSpeedX;
uniform 	float _FaceUVSpeedY;
uniform 	mediump vec4 _FaceColor;
uniform 	float _OutlineSoftness;
uniform 	float _OutlineUVSpeedX;
uniform 	float _OutlineUVSpeedY;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _OutlineWidth;
uniform 	float _Bevel;
uniform 	float _BevelOffset;
uniform 	float _BevelWidth;
uniform 	float _BevelClamp;
uniform 	float _BevelRoundness;
uniform 	float _BumpOutline;
uniform 	float _BumpFace;
uniform 	mediump vec4 _GlowColor;
uniform 	float _GlowOffset;
uniform 	float _GlowOuter;
uniform 	float _GlowInner;
uniform 	float _GlowPower;
uniform 	float _ShaderFlags;
uniform 	float _ScaleRatioA;
uniform 	float _ScaleRatioB;
uniform 	float _TextureWidth;
uniform 	float _TextureHeight;
uniform 	float _GradientScale;
uniform 	mediump float _FaceShininess;
uniform 	mediump float _OutlineShininess;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FaceTex;
uniform lowp sampler2D _OutlineTex;
uniform lowp sampler2D _BumpMap;
uniform highp sampler2D _LightTexture0;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD6;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
float u_xlat10;
mediump float u_xlat16_10;
lowp float u_xlat10_10;
mediump vec3 u_xlat16_11;
mediump float u_xlat16_13;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat20;
mediump float u_xlat16_20;
bool u_xlatb20;
vec2 u_xlat23;
bool u_xlatb24;
float u_xlat30;
mediump float u_xlat16_30;
float u_xlat34;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.x = _GlowOffset * _ScaleRatioB;
    u_xlat0.x = u_xlat0.x * vs_TEXCOORD6.y;
    u_xlat10_10 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_10 = (-u_xlat10_10) + 0.5;
    u_xlat10 = u_xlat16_10 + (-vs_TEXCOORD6.x);
    u_xlat10 = u_xlat10 * vs_TEXCOORD6.y + 0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat0.x>=0.0);
#else
    u_xlatb20 = u_xlat0.x>=0.0;
#endif
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat30 = _GlowOuter * _ScaleRatioB + (-_GlowInner);
    u_xlat20 = u_xlat20 * u_xlat30 + _GlowInner;
    u_xlat20 = u_xlat20 * vs_TEXCOORD6.y;
    u_xlat30 = u_xlat20 * 0.5 + 1.0;
    u_xlat20 = u_xlat20 * 0.5;
    u_xlat20 = min(u_xlat20, 1.0);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat0.x = u_xlat0.x / u_xlat30;
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _GlowPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = u_xlat20 * u_xlat0.x;
    u_xlat0.x = dot(_GlowColor.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat20 = (-u_xlat0.x) * vs_COLOR0.w + 1.0;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat30 = _OutlineWidth * _ScaleRatioA;
    u_xlat30 = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_1.x = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_11.x = min(u_xlat30, 1.0);
    u_xlat16_11.x = sqrt(u_xlat16_11.x);
    u_xlat16_1.x = u_xlat16_11.x * u_xlat16_1.x;
    u_xlat2.xy = vec2(_OutlineUVSpeedX, _OutlineUVSpeedY) * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_2 = texture(_OutlineTex, u_xlat2.xy);
    u_xlat16_2.xyz = u_xlat10_2.xyz * _OutlineColor.xyz;
    u_xlat16_3.x = vs_COLOR0.w * _OutlineColor.w;
    u_xlat16_13 = u_xlat10_2.w * u_xlat16_3.x;
    u_xlat23.xy = vec2(_FaceUVSpeedX, _FaceUVSpeedY) * _Time.yy + vs_TEXCOORD0.zw;
    u_xlat10_4 = texture(_FaceTex, u_xlat23.xy);
    u_xlat16_5 = vs_COLOR0 * _FaceColor;
    u_xlat16_6 = u_xlat10_4 * u_xlat16_5;
    u_xlat16_11.xyz = u_xlat16_6.www * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_2.xyz * vec3(u_xlat16_13) + (-u_xlat16_11.xyz);
    u_xlat16_7.w = u_xlat16_3.x * u_xlat10_2.w + (-u_xlat16_6.w);
    u_xlat16_1 = u_xlat16_1.xxxx * u_xlat16_7;
    u_xlat16_2.xyz = u_xlat16_6.xyz * u_xlat16_6.www + u_xlat16_1.xyz;
    u_xlat16_2.w = u_xlat16_5.w * u_xlat10_4.w + u_xlat16_1.w;
    u_xlat16_1.x = (-u_xlat30) * 0.5 + u_xlat10;
    u_xlat10 = u_xlat30 * 0.5 + u_xlat10;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat30 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3.x = u_xlat30 * vs_TEXCOORD6.y;
    u_xlat16_11.x = u_xlat30 * vs_TEXCOORD6.y + 1.0;
    u_xlat16_1.x = u_xlat3.x * 0.5 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_3 = u_xlat16_1.xxxx * u_xlat16_2;
    u_xlat16_30 = (-u_xlat16_2.w) * u_xlat16_1.x + 1.0;
    u_xlat1.w = u_xlat16_30 * u_xlat0.x + u_xlat16_3.w;
    u_xlat16_30 = max(u_xlat16_3.w, 9.99999975e-05);
    u_xlat16_4.xyz = u_xlat16_3.xyz / vec3(u_xlat16_30);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz;
    u_xlat4.xyz = vec3(u_xlat20) * u_xlat16_4.xyz;
    u_xlat0.xzw = _GlowColor.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.x = max(u_xlat1.w, 9.99999975e-05);
    u_xlat0.xzw = u_xlat0.xzw / u_xlat4.xxx;
    u_xlat4.xyz = vs_TEXCOORD5.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD5.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD5.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat4.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat4.x = texture(_LightTexture0, u_xlat4.xx).w;
    u_xlat16_7.xyz = u_xlat4.xxx * _LightColor0.xyz;
    u_xlat16_8.xyz = u_xlat0.xzw * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * _SpecColor.xyz;
    u_xlat0.x = (-_BumpFace) + _BumpOutline;
    u_xlat0.x = u_xlat10 * u_xlat0.x + _BumpFace;
    u_xlat10_4.xyz = texture(_BumpMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_9.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xzw = u_xlat16_9.xyz * u_xlat0.xxx + vec3(-0.0, -0.0, -1.0);
    u_xlat0.xzw = u_xlat16_3.www * u_xlat0.xzw + vec3(0.0, 0.0, 1.0);
    u_xlat4.x = vs_TEXCOORD6.x + _BevelOffset;
    u_xlat5.xy = vec2(float(1.0) / float(_TextureWidth), float(1.0) / float(_TextureHeight));
    u_xlat5.z = 0.0;
    u_xlat2 = (-u_xlat5.xzzy) + vs_TEXCOORD0.xyxy;
    u_xlat3 = u_xlat5.xzzy + vs_TEXCOORD0.xyxy;
    u_xlat5.x = texture(_MainTex, u_xlat2.xy).w;
    u_xlat5.z = texture(_MainTex, u_xlat2.zw).w;
    u_xlat5.y = texture(_MainTex, u_xlat3.xy).w;
    u_xlat5.w = texture(_MainTex, u_xlat3.zw).w;
    u_xlat2 = u_xlat4.xxxx + u_xlat5;
    u_xlat2 = u_xlat2 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat4.x = _BevelWidth + _OutlineWidth;
    u_xlat4.x = max(u_xlat4.x, 0.00999999978);
    u_xlat2 = u_xlat2 / u_xlat4.xxxx;
    u_xlat4.x = u_xlat4.x * _Bevel;
    u_xlat4.x = u_xlat4.x * _GradientScale;
    u_xlat4.x = u_xlat4.x * -2.0;
    u_xlat2 = u_xlat2 + vec4(0.5, 0.5, 0.5, 0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = -abs(u_xlat3) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = _ShaderFlags * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb24 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb24) ? u_xlat14.x : (-u_xlat14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.5);
#else
    u_xlatb14 = u_xlat14.x>=0.5;
#endif
    u_xlat2 = (bool(u_xlatb14)) ? u_xlat3 : u_xlat2;
    u_xlat3 = u_xlat2 * vec4(1.57079601, 1.57079601, 1.57079601, 1.57079601);
    u_xlat3 = sin(u_xlat3);
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(vec4(_BevelRoundness, _BevelRoundness, _BevelRoundness, _BevelRoundness)) * u_xlat3 + u_xlat2;
    u_xlat14.x = (-_BevelClamp) + 1.0;
    u_xlat2 = min(u_xlat2, u_xlat14.xxxx);
    u_xlat14.xy = u_xlat4.xx * u_xlat2.xz;
    u_xlat2.yz = u_xlat2.wy * u_xlat4.xx + (-u_xlat14.yx);
    u_xlat2.x = float(-1.0);
    u_xlat2.w = float(1.0);
    u_xlat4.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat14.x = dot(u_xlat2.zw, u_xlat2.zw);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat5.x = u_xlat2.z * u_xlat14.x;
    u_xlat5.yz = u_xlat14.xx * vec2(1.0, 0.0);
    u_xlat2.z = 0.0;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat4.xyz = u_xlat5.zxy * u_xlat4.yzx + (-u_xlat6.xyz);
    u_xlat0.xzw = (-u_xlat0.xzw) + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat4.xxx;
    u_xlat4.x = dot(vs_TEXCOORD2.xyz, (-u_xlat0.xzw));
    u_xlat4.y = dot(vs_TEXCOORD3.xyz, (-u_xlat0.xzw));
    u_xlat4.z = dot(vs_TEXCOORD4.xyz, (-u_xlat0.xzw));
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat4.xyz = vec3(u_xlat34) * u_xlat4.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat16_9.xyz = u_xlat5.xyz * vec3(u_xlat34) + u_xlat4.xyz;
    u_xlat16_37 = dot(u_xlat0.xzw, u_xlat4.xyz);
    u_xlat16_37 = max(u_xlat16_37, 0.0);
    u_xlat16_38 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_38 = dot(u_xlat0.xzw, u_xlat16_9.xyz);
    u_xlat16_38 = max(u_xlat16_38, 0.0);
    u_xlat16_0.x = log2(u_xlat16_38);
    u_xlat16_20 = (-_FaceShininess) + _OutlineShininess;
    u_xlat10 = u_xlat10 * u_xlat16_20 + _FaceShininess;
    u_xlat16_38 = u_xlat10 * 128.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_38;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.xyz = u_xlat16_8.xyz * vec3(u_xlat16_37) + u_xlat16_0.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "GLOW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "GLOW_ON" }
""
}
}
}
 Pass {
  Name "CASTER"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  Cull Off
  Offset 1, 1
  GpuProgramID 136638
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform lowp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
in highp float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform lowp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
in highp float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _OutlineTex_ST;
uniform 	float _OutlineWidth;
uniform 	float _FaceDilate;
uniform 	float _ScaleRatioA;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
out highp float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0.x = (-_OutlineWidth) * _ScaleRatioA + 1.0;
    u_xlat0.x = (-_FaceDilate) * _ScaleRatioA + u_xlat0.x;
    vs_TEXCOORD2 = u_xlat0.x * 0.5;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy * _OutlineTex_ST.xy + _OutlineTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform lowp sampler2D _MainTex;
in highp vec3 vs_TEXCOORD0;
in highp float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 + (-vs_TEXCOORD2);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x<0.0);
#else
    u_xlatb0 = u_xlat0.x<0.0;
#endif
    if((int(u_xlatb0) * int(0xffffffffu))!=0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}