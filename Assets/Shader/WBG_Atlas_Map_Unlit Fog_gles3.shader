Shader "WBG/Atlas/Map/Unlit Fog" {
Properties {
_MainTex ("Color Buffer (RGB)", 2D) = "black" { }
}
SubShader {
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  GpuProgramID 5869
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
in mediump vec4 in_POSITION0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = u_xlat0.xz * _MainTex_ST.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 _EnvironmentTint;
uniform 	mediump vec4 _FogColorStart;
uniform 	mediump vec4 _FogColorEnd;
uniform 	mediump float _FogBias;
uniform 	mediump float _FogStart;
uniform 	mediump float _FogEnd;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat16_1.x = u_xlat0.x / u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _FogBias;
    u_xlat16_1.x = u_xlat16_1.x + (-_FogStart);
    u_xlat16_5.x = (-_FogStart) + _FogEnd;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_1.x = u_xlat16_5.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5.x;
    u_xlat16_5.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_0 = (-_FogColorStart) + _FogColorEnd;
    u_xlat16_0 = u_xlat16_5.xxxx * u_xlat16_0 + _FogColorStart;
    u_xlat16_1.x = u_xlat16_0.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.xyz) * _EnvironmentTint.xyz + u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _EnvironmentTint.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = sqrt(u_xlat16_1.xyz);
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in mediump vec4 in_POSITION0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = u_xlat0.xz * _MainTex_ST.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 _EnvironmentTint;
uniform 	mediump vec4 _FogColorStart;
uniform 	mediump vec4 _FogColorEnd;
uniform 	mediump float _FogBias;
uniform 	mediump float _FogStart;
uniform 	mediump float _FogEnd;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat16_1.x = u_xlat0.x / u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _FogBias;
    u_xlat16_1.x = u_xlat16_1.x + (-_FogStart);
    u_xlat16_5.x = (-_FogStart) + _FogEnd;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_1.x = u_xlat16_5.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5.x;
    u_xlat16_5.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_0 = (-_FogColorStart) + _FogColorEnd;
    u_xlat16_0 = u_xlat16_5.xxxx * u_xlat16_0 + _FogColorStart;
    u_xlat16_1.x = u_xlat16_0.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.xyz) * _EnvironmentTint.xyz + u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _EnvironmentTint.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = sqrt(u_xlat16_1.xyz);
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
in mediump vec4 in_POSITION0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = u_xlat0.xz * _MainTex_ST.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	mediump vec4 _EnvironmentTint;
uniform 	mediump vec4 _FogColorStart;
uniform 	mediump vec4 _FogColorEnd;
uniform 	mediump float _FogBias;
uniform 	mediump float _FogStart;
uniform 	mediump float _FogEnd;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat16_1.x = u_xlat0.x / u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + _FogBias;
    u_xlat16_1.x = u_xlat16_1.x + (-_FogStart);
    u_xlat16_5.x = (-_FogStart) + _FogEnd;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_1.x = u_xlat16_5.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_5.x;
    u_xlat16_5.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_0 = (-_FogColorStart) + _FogColorEnd;
    u_xlat16_0 = u_xlat16_5.xxxx * u_xlat16_0 + _FogColorStart;
    u_xlat16_1.x = u_xlat16_0.w * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_2.xyz * u_xlat10_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_5.xyz) * _EnvironmentTint.xyz + u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _EnvironmentTint.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = sqrt(u_xlat16_1.xyz);
    SV_Target0.w = 1.0;
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