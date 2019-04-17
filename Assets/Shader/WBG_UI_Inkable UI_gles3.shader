Shader "WBG/UI/Inkable UI" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
[Enum(UnityEngine.Rendering.BlendMode)] HARDWARE_BlendSrc ("Blend Source", Float) = 5
[Enum(UnityEngine.Rendering.BlendMode)] HARDWARE_BlendDest ("Bend Destination", Float) = 10
_InkStartColor ("Ink Starting Color", Color) = (0.5,0,0.5,0)
_InkEndColor ("Ink Color", Color) = (1,0,1,0)
_Ink ("Inking", Range(0, 1)) = 1
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 60064
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_POSITION0.xy;
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _InkStartColor;
uniform 	mediump vec4 _InkEndColor;
uniform 	mediump float _Ink;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
void main()
{
    u_xlat16_0.xy = (-vec2(_Ink)) + vec2(1.0, 0.199999988);
    u_xlat16_4 = u_xlat16_0.y * 5.00000048;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_8;
    u_xlat16_1.xyz = (-_InkStartColor.xyz) + _InkEndColor.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xxx * u_xlat16_1.xyz + _InkStartColor.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_3.x = dot(u_xlat16_2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.x>=0.5);
#else
    u_xlatb2 = u_xlat16_3.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_7.xyz = (-u_xlat16_0.xzw) + u_xlat16_3.xxx;
    u_xlat16_0.xzw = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xzw;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-u_xlat16_0.xzw);
    SV_Target0.xyz = vec3(u_xlat16_4) * u_xlat16_3.xyz + u_xlat16_0.xzw;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_POSITION0.xy;
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _InkStartColor;
uniform 	mediump vec4 _InkEndColor;
uniform 	mediump float _Ink;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
void main()
{
    u_xlat16_0.xy = (-vec2(_Ink)) + vec2(1.0, 0.199999988);
    u_xlat16_4 = u_xlat16_0.y * 5.00000048;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_8;
    u_xlat16_1.xyz = (-_InkStartColor.xyz) + _InkEndColor.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xxx * u_xlat16_1.xyz + _InkStartColor.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_3.x = dot(u_xlat16_2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.x>=0.5);
#else
    u_xlatb2 = u_xlat16_3.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_7.xyz = (-u_xlat16_0.xzw) + u_xlat16_3.xxx;
    u_xlat16_0.xzw = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xzw;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-u_xlat16_0.xzw);
    SV_Target0.xyz = vec3(u_xlat16_4) * u_xlat16_3.xyz + u_xlat16_0.xzw;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_POSITION0.xy;
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _InkStartColor;
uniform 	mediump vec4 _InkEndColor;
uniform 	mediump float _Ink;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
void main()
{
    u_xlat16_0.xy = (-vec2(_Ink)) + vec2(1.0, 0.199999988);
    u_xlat16_4 = u_xlat16_0.y * 5.00000048;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4 * -2.0 + 3.0;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * u_xlat16_8;
    u_xlat16_1.xyz = (-_InkStartColor.xyz) + _InkEndColor.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xxx * u_xlat16_1.xyz + _InkStartColor.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_3.x = dot(u_xlat16_2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    SV_Target0.w = u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_3.x>=0.5);
#else
    u_xlatb2 = u_xlat16_3.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_7.xyz = (-u_xlat16_0.xzw) + u_xlat16_3.xxx;
    u_xlat16_0.xzw = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xzw;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-u_xlat16_0.xzw);
    SV_Target0.xyz = vec3(u_xlat16_4) * u_xlat16_3.xyz + u_xlat16_0.xzw;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_POSITION0.xy;
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _ClipRect;
uniform 	mediump vec4 _InkStartColor;
uniform 	mediump vec4 _InkEndColor;
uniform 	mediump float _Ink;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
void main()
{
    u_xlat16_0.xy = (-vec2(_Ink)) + vec2(1.0, 0.199999988);
    u_xlat16_4.x = u_xlat16_0.y * 5.00000048;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8;
    u_xlat16_1.xyz = (-_InkStartColor.xyz) + _InkEndColor.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xxx * u_xlat16_1.xyz + _InkStartColor.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_3.x = dot(u_xlat16_2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3.x>=0.5);
#else
    u_xlatb2.x = u_xlat16_3.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb2.x) ? 1.0 : 0.0;
    u_xlat16_7.xyz = (-u_xlat16_0.xzw) + u_xlat16_3.xxx;
    u_xlat16_0.xzw = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xzw;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-u_xlat16_0.xzw);
    SV_Target0.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz + u_xlat16_0.xzw;
    u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat16_0.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_0.x = u_xlat16_0.y * u_xlat16_0.x;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat16_4.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_4.y * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_POSITION0.xy;
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _ClipRect;
uniform 	mediump vec4 _InkStartColor;
uniform 	mediump vec4 _InkEndColor;
uniform 	mediump float _Ink;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
void main()
{
    u_xlat16_0.xy = (-vec2(_Ink)) + vec2(1.0, 0.199999988);
    u_xlat16_4.x = u_xlat16_0.y * 5.00000048;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8;
    u_xlat16_1.xyz = (-_InkStartColor.xyz) + _InkEndColor.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xxx * u_xlat16_1.xyz + _InkStartColor.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_3.x = dot(u_xlat16_2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3.x>=0.5);
#else
    u_xlatb2.x = u_xlat16_3.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb2.x) ? 1.0 : 0.0;
    u_xlat16_7.xyz = (-u_xlat16_0.xzw) + u_xlat16_3.xxx;
    u_xlat16_0.xzw = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xzw;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-u_xlat16_0.xzw);
    SV_Target0.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz + u_xlat16_0.xzw;
    u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat16_0.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_0.x = u_xlat16_0.y * u_xlat16_0.x;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat16_4.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_4.y * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_POSITION0.xy;
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _ClipRect;
uniform 	mediump vec4 _InkStartColor;
uniform 	mediump vec4 _InkEndColor;
uniform 	mediump float _Ink;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_4;
mediump vec3 u_xlat16_7;
mediump float u_xlat16_8;
void main()
{
    u_xlat16_0.xy = (-vec2(_Ink)) + vec2(1.0, 0.199999988);
    u_xlat16_4.x = u_xlat16_0.y * 5.00000048;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat16_8 = u_xlat16_4.x * -2.0 + 3.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_8;
    u_xlat16_1.xyz = (-_InkStartColor.xyz) + _InkEndColor.xyz;
    u_xlat16_0.xzw = u_xlat16_0.xxx * u_xlat16_1.xyz + _InkStartColor.xyz;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2 = u_xlat10_1 * vs_COLOR0;
    u_xlat16_3.x = dot(u_xlat16_2.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2.x = !!(u_xlat16_3.x>=0.5);
#else
    u_xlatb2.x = u_xlat16_3.x>=0.5;
#endif
    u_xlat16_3.x = (u_xlatb2.x) ? 1.0 : 0.0;
    u_xlat16_7.xyz = (-u_xlat16_0.xzw) + u_xlat16_3.xxx;
    u_xlat16_0.xzw = u_xlat16_3.xxx * u_xlat16_7.xyz + u_xlat16_0.xzw;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz + (-u_xlat16_0.xzw);
    SV_Target0.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz + u_xlat16_0.xzw;
    u_xlatb2.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlat16_0.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_0.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_0.x = u_xlat16_0.y * u_xlat16_0.x;
    u_xlatb2.xy = greaterThanEqual(_ClipRect.zwzz, vs_TEXCOORD1.xyxx).xy;
    u_xlat16_4.x = (u_xlatb2.x) ? float(1.0) : float(0.0);
    u_xlat16_4.y = (u_xlatb2.y) ? float(1.0) : float(0.0);
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_4.y * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_2.w;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
}