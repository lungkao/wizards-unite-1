Shader "WBG/Rendering/Refraction Write Normal" {
Properties {
_DistortionTex ("Distortion Texture", 2D) = "bump" { }
_DistortionParams ("Distortion Params R: alpha", 2D) = "white" { }
_Alpha ("Alpha", Range(0, 1)) = 1
[Header(Fresnel Hole)] [Toggle] _EnableHole ("Enable Fresnel Hole", Float) = 0
_Bias ("Fresnel Hole Bias", Float) = 0
_Scale ("Fresnel Hole Scale", Float) = 1
_Power ("Fresnel Hole Power", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Refractive" "ShaderType" = "WBGTransparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Refractive" "ShaderType" = "WBGTransparent" }
  GpuProgramID 19280
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _DistortionTex_ST;
uniform 	mediump float _EnableHole;
uniform 	mediump float _Bias;
uniform 	mediump float _Scale;
uniform 	mediump float _Power;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
out mediump float vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Power;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = _Scale * u_xlat16_2.x + _Bias;
    u_xlat16_2.x = u_xlat16_2.x + (-_EnableHole);
    vs_TEXCOORD6 = u_xlat16_2.x + 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
    vs_TEXCOORD1 = in_COLOR0.w;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat16_2.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat16_2.xyz);
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _Alpha;
uniform lowp sampler2D _DistortionTex;
uniform lowp sampler2D _DistortionParams;
in mediump vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
in mediump float vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
void main()
{
    u_xlat10_0.xyz = texture(_DistortionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
    u_xlat16_0.xyz = vs_TEXCOORD4.xyz * u_xlat16_1.zzz + u_xlat16_1.xyw;
    u_xlat16_0.w = 1.0;
    u_xlat16_1.x = dot(u_xlat16_0, u_xlat16_0);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.xxxx;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = u_xlat16_1.xxxx * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat16_2.xxxx + u_xlat1;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat16_2.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[3] * u_xlat16_0.wwww + u_xlat1;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_0.xyz = vec3(vs_TEXCOORD6) * u_xlat16_2.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz;
    u_xlat16_2.x = dot(u_xlat0, u_xlat0);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xy = u_xlat0.xy * u_xlat16_2.xx;
    u_xlat16_2.z = vs_TEXCOORD5.z / vs_TEXCOORD5.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_3 = texture(_DistortionParams, vs_TEXCOORD0.xy).x;
    u_xlat16_2.x = vs_TEXCOORD1 * _Alpha;
    SV_Target0.w = u_xlat10_3 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _DistortionTex_ST;
uniform 	mediump float _EnableHole;
uniform 	mediump float _Bias;
uniform 	mediump float _Scale;
uniform 	mediump float _Power;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
out mediump float vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Power;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = _Scale * u_xlat16_2.x + _Bias;
    u_xlat16_2.x = u_xlat16_2.x + (-_EnableHole);
    vs_TEXCOORD6 = u_xlat16_2.x + 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
    vs_TEXCOORD1 = in_COLOR0.w;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat16_2.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat16_2.xyz);
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _Alpha;
uniform lowp sampler2D _DistortionTex;
uniform lowp sampler2D _DistortionParams;
in mediump vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
in mediump float vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
void main()
{
    u_xlat10_0.xyz = texture(_DistortionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
    u_xlat16_0.xyz = vs_TEXCOORD4.xyz * u_xlat16_1.zzz + u_xlat16_1.xyw;
    u_xlat16_0.w = 1.0;
    u_xlat16_1.x = dot(u_xlat16_0, u_xlat16_0);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.xxxx;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = u_xlat16_1.xxxx * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat16_2.xxxx + u_xlat1;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat16_2.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[3] * u_xlat16_0.wwww + u_xlat1;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_0.xyz = vec3(vs_TEXCOORD6) * u_xlat16_2.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz;
    u_xlat16_2.x = dot(u_xlat0, u_xlat0);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xy = u_xlat0.xy * u_xlat16_2.xx;
    u_xlat16_2.z = vs_TEXCOORD5.z / vs_TEXCOORD5.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_3 = texture(_DistortionParams, vs_TEXCOORD0.xy).x;
    u_xlat16_2.x = vs_TEXCOORD1 * _Alpha;
    SV_Target0.w = u_xlat10_3 * u_xlat16_2.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _DistortionTex_ST;
uniform 	mediump float _EnableHole;
uniform 	mediump float _Bias;
uniform 	mediump float _Scale;
uniform 	mediump float _Power;
in mediump vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
out mediump float vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD2;
out mediump vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
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
    gl_Position = u_xlat0;
    vs_TEXCOORD5 = u_xlat0;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = log2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x * _Power;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = _Scale * u_xlat16_2.x + _Bias;
    u_xlat16_2.x = u_xlat16_2.x + (-_EnableHole);
    vs_TEXCOORD6 = u_xlat16_2.x + 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _DistortionTex_ST.xy + _DistortionTex_ST.zw;
    vs_TEXCOORD1 = in_COLOR0.w;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat16_2.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat16_2.xyz);
    vs_TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat0.x = in_TANGENT0.w * unity_WorldTransformParams.w;
    u_xlat16_2.xyz = u_xlat0.xxx * u_xlat16_2.xyz;
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    vs_TEXCOORD3.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _Alpha;
uniform lowp sampler2D _DistortionTex;
uniform lowp sampler2D _DistortionParams;
in mediump vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
in mediump float vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD2;
in mediump vec3 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
void main()
{
    u_xlat10_0.xyz = texture(_DistortionTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = u_xlat16_1.yyy * vs_TEXCOORD3.xyz;
    u_xlat16_1.xyw = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
    u_xlat16_0.xyz = vs_TEXCOORD4.xyz * u_xlat16_1.zzz + u_xlat16_1.xyw;
    u_xlat16_0.w = 1.0;
    u_xlat16_1.x = dot(u_xlat16_0, u_xlat16_0);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1.xxxx;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].y;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].y;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].y;
    u_xlat16_1.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = u_xlat16_1.xxxx * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].x;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].x;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].x;
    u_xlat16_2.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat16_2.xxxx + u_xlat1;
    u_xlat3.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat3.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat3.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat16_2.x = dot(u_xlat3.xyz, u_xlat16_0.xyz);
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat16_2.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[3] * u_xlat16_0.wwww + u_xlat1;
    u_xlat16_2.xyz = u_xlat0.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_0.xyz = vec3(vs_TEXCOORD6) * u_xlat16_2.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz;
    u_xlat16_2.x = dot(u_xlat0, u_xlat0);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xy = u_xlat0.xy * u_xlat16_2.xx;
    u_xlat16_2.z = vs_TEXCOORD5.z / vs_TEXCOORD5.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat10_3 = texture(_DistortionParams, vs_TEXCOORD0.xy).x;
    u_xlat16_2.x = vs_TEXCOORD1 * _Alpha;
    SV_Target0.w = u_xlat10_3 * u_xlat16_2.x;
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