Shader "WBG/ImageEffects/RefractionPostProc" {
Properties {
_ColorBuffer ("Color RGB", 2D) = "white" { }
_DistortionBuffer ("Distortion Buffer", 2D) = "white" { }
_DistortionWeight ("Distortion Weight", Range(0, 5)) = 1
_DistortionTint ("Distortion Tint", Color) = (1,1,1,1)
_LightIntensity ("Light Intensity", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 2300
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _DistortionBuffer_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.xy = in_TEXCOORD0.xy * _DistortionBuffer_ST.xy + _DistortionBuffer_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_TEXCOORD2.xyz = (-u_xlat0.xyz);
    vs_TEXCOORD2.w = u_xlat0.w;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _DistortionTint;
uniform 	mediump float _DistortionWeight;
uniform 	mediump vec4 _LightDirClipSpaceNeg;
uniform 	float _LightIntensity;
uniform lowp sampler2D _DistortionBuffer;
uniform lowp sampler2D _ColorBuffer;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_15;
float u_xlat16;
void main()
{
    u_xlat16_0.x = dot(_LightDirClipSpaceNeg.xyz, _LightDirClipSpaceNeg.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDirClipSpaceNeg.xyz;
    u_xlat10_1 = texture(_DistortionBuffer, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = u_xlat10_1.w * _DistortionTint.w;
    u_xlat16_1 = (-u_xlat16_2.x) * u_xlat16_2.x + 1.0;
    u_xlat16_1 = (-u_xlat16_2.y) * u_xlat16_2.y + u_xlat16_1;
    u_xlat1.z = sqrt(u_xlat16_1);
    u_xlat1.xy = u_xlat16_2.xy;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat16_0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16_0.x = max(u_xlat16, 0.5);
    u_xlat16_5.xy = u_xlat1.xy * vec2(_DistortionWeight);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD1.xy;
    u_xlat10_3.xyz = texture(_ColorBuffer, u_xlat16_5.xy).xyz;
    u_xlat16_4.xyz = (-u_xlat10_3.xyz) + _DistortionTint.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz + u_xlat10_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz;
    u_xlat16_2.xy = vs_TEXCOORD2.xy;
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + _LightDirClipSpaceNeg.xyz;
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = vec3(u_xlat16_15) * u_xlat16_2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_15 = log2(u_xlat1.x);
    u_xlat16_15 = u_xlat16_15 * 64.0;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_15 = u_xlat16_15 * 0.75;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_LightIntensity) + vec3(u_xlat16_15);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _DistortionBuffer_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.xy = in_TEXCOORD0.xy * _DistortionBuffer_ST.xy + _DistortionBuffer_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_TEXCOORD2.xyz = (-u_xlat0.xyz);
    vs_TEXCOORD2.w = u_xlat0.w;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _DistortionTint;
uniform 	mediump float _DistortionWeight;
uniform 	mediump vec4 _LightDirClipSpaceNeg;
uniform 	float _LightIntensity;
uniform lowp sampler2D _DistortionBuffer;
uniform lowp sampler2D _ColorBuffer;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_15;
float u_xlat16;
void main()
{
    u_xlat16_0.x = dot(_LightDirClipSpaceNeg.xyz, _LightDirClipSpaceNeg.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDirClipSpaceNeg.xyz;
    u_xlat10_1 = texture(_DistortionBuffer, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = u_xlat10_1.w * _DistortionTint.w;
    u_xlat16_1 = (-u_xlat16_2.x) * u_xlat16_2.x + 1.0;
    u_xlat16_1 = (-u_xlat16_2.y) * u_xlat16_2.y + u_xlat16_1;
    u_xlat1.z = sqrt(u_xlat16_1);
    u_xlat1.xy = u_xlat16_2.xy;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat16_0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16_0.x = max(u_xlat16, 0.5);
    u_xlat16_5.xy = u_xlat1.xy * vec2(_DistortionWeight);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD1.xy;
    u_xlat10_3.xyz = texture(_ColorBuffer, u_xlat16_5.xy).xyz;
    u_xlat16_4.xyz = (-u_xlat10_3.xyz) + _DistortionTint.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz + u_xlat10_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz;
    u_xlat16_2.xy = vs_TEXCOORD2.xy;
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + _LightDirClipSpaceNeg.xyz;
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = vec3(u_xlat16_15) * u_xlat16_2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_15 = log2(u_xlat1.x);
    u_xlat16_15 = u_xlat16_15 * 64.0;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_15 = u_xlat16_15 * 0.75;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_LightIntensity) + vec3(u_xlat16_15);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _DistortionBuffer_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1.xy = in_TEXCOORD0.xy * _DistortionBuffer_ST.xy + _DistortionBuffer_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy;
    phase0_Output0_1 = u_xlat1;
    vs_TEXCOORD2.xyz = (-u_xlat0.xyz);
    vs_TEXCOORD2.w = u_xlat0.w;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _DistortionTint;
uniform 	mediump float _DistortionWeight;
uniform 	mediump vec4 _LightDirClipSpaceNeg;
uniform 	float _LightIntensity;
uniform lowp sampler2D _DistortionBuffer;
uniform lowp sampler2D _ColorBuffer;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_15;
float u_xlat16;
void main()
{
    u_xlat16_0.x = dot(_LightDirClipSpaceNeg.xyz, _LightDirClipSpaceNeg.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDirClipSpaceNeg.xyz;
    u_xlat10_1 = texture(_DistortionBuffer, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = u_xlat10_1.w * _DistortionTint.w;
    u_xlat16_1 = (-u_xlat16_2.x) * u_xlat16_2.x + 1.0;
    u_xlat16_1 = (-u_xlat16_2.y) * u_xlat16_2.y + u_xlat16_1;
    u_xlat1.z = sqrt(u_xlat16_1);
    u_xlat1.xy = u_xlat16_2.xy;
    u_xlat16 = dot(u_xlat1.xyz, u_xlat16_0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat16_0.x = max(u_xlat16, 0.5);
    u_xlat16_5.xy = u_xlat1.xy * vec2(_DistortionWeight);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(0.0199999996, 0.0199999996) + vs_TEXCOORD1.xy;
    u_xlat10_3.xyz = texture(_ColorBuffer, u_xlat16_5.xy).xyz;
    u_xlat16_4.xyz = (-u_xlat10_3.xyz) + _DistortionTint.xyz;
    u_xlat16_5.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz + u_xlat10_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz;
    u_xlat16_2.xy = vs_TEXCOORD2.xy;
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_15) + _LightDirClipSpaceNeg.xyz;
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = vec3(u_xlat16_15) * u_xlat16_2.xyz;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_15 = log2(u_xlat1.x);
    u_xlat16_15 = u_xlat16_15 * 64.0;
    u_xlat16_15 = exp2(u_xlat16_15);
    u_xlat16_15 = u_xlat16_15 * 0.75;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_LightIntensity) + vec3(u_xlat16_15);
    SV_Target0.xyz = u_xlat1.xyz;
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