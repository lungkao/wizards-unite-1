Shader "WBG/ImageEffects/MaskedReplace" {
Properties {
_MainTex ("Color Buffer RGBA", 2D) = "white" { }
_MaskTex ("Color Mask RGBA", 2D) = "black" { }
_PrimaryColor ("Primary Color", Color) = (0,0,1,1)
_SecondaryColor ("Secondary Color", Color) = (1,0,0,1)
_ColorThreshold ("Color Threshold", Float) = 0
}
SubShader {
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 31255
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
float u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati3 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati3;
    u_xlat0 = float(u_xlati0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position.y = u_xlat0 * u_xlat1.y;
    gl_Position.xzw = u_xlat1.xzw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _PrimaryColor;
uniform 	mediump vec4 _SecondaryColor;
uniform 	mediump float _ColorThreshold;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
lowp float u_xlat10_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
lowp float u_xlat10_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy).w;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy).z;
    u_xlat16_1 = u_xlat10_0 * u_xlat10_3 + (-_ColorThreshold);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4.x;
    u_xlat16_4.xyz = vec3(u_xlat10_3) * _SecondaryColor.xyz;
    u_xlat16_2.xyz = (-vec3(u_xlat10_3)) * _SecondaryColor.xyz + _PrimaryColor.xyz;
    SV_Target0.w = u_xlat10_3;
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz + u_xlat16_4.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
float u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati3 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati3;
    u_xlat0 = float(u_xlati0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position.y = u_xlat0 * u_xlat1.y;
    gl_Position.xzw = u_xlat1.xzw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _PrimaryColor;
uniform 	mediump vec4 _SecondaryColor;
uniform 	mediump float _ColorThreshold;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
lowp float u_xlat10_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
lowp float u_xlat10_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy).w;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy).z;
    u_xlat16_1 = u_xlat10_0 * u_xlat10_3 + (-_ColorThreshold);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4.x;
    u_xlat16_4.xyz = vec3(u_xlat10_3) * _SecondaryColor.xyz;
    u_xlat16_2.xyz = (-vec3(u_xlat10_3)) * _SecondaryColor.xyz + _PrimaryColor.xyz;
    SV_Target0.w = u_xlat10_3;
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz + u_xlat16_4.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
float u_xlat0;
int u_xlati0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati3 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati3 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati3;
    u_xlat0 = float(u_xlati0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position.y = u_xlat0 * u_xlat1.y;
    gl_Position.xzw = u_xlat1.xzw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _PrimaryColor;
uniform 	mediump vec4 _SecondaryColor;
uniform 	mediump float _ColorThreshold;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MaskTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
lowp float u_xlat10_0;
mediump float u_xlat16_1;
mediump vec3 u_xlat16_2;
lowp float u_xlat10_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat10_0 = texture(_MaskTex, vs_TEXCOORD0.xy).w;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy).z;
    u_xlat16_1 = u_xlat10_0 * u_xlat10_3 + (-_ColorThreshold);
    u_xlat16_1 = u_xlat16_1 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4.x;
    u_xlat16_4.xyz = vec3(u_xlat10_3) * _SecondaryColor.xyz;
    u_xlat16_2.xyz = (-vec3(u_xlat10_3)) * _SecondaryColor.xyz + _PrimaryColor.xyz;
    SV_Target0.w = u_xlat10_3;
    SV_Target0.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz + u_xlat16_4.xyz;
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
}
}
}
}