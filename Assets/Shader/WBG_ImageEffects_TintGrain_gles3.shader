Shader "WBG/ImageEffects/TintGrain" {
Properties {
_intensityMultiplier ("Noise Multiplier", Float) = 1
_noiseStrength ("Noise Strength", Float) = 1
_VignetteRadius ("Vignette Radius (32 - 512)", Float) = 64
_VignetteStrength ("Vignette Strength (0 - 1)", Float) = 1
_ToneColor ("Tone Mapping Color", Color) = (1,1,1,1)
_Contrast ("Contrast", Float) = 1
_NoiseTex ("Noise (RGB)", 2D) = "white" { }
_ColorBuffer ("Color (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 7502
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec4 _ColorBuffer_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
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
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _ColorBuffer_ST.xy + _ColorBuffer_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = u_xlat0.xy / u_xlat0.ww;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _intensityMultiplier;
uniform 	mediump float _noiseStrength;
uniform 	mediump float _VignetteRadius;
uniform 	mediump float _VignetteStrength;
uniform 	mediump vec4 _ToneColor;
uniform 	mediump float _Contrast;
uniform lowp sampler2D _ColorBuffer;
uniform lowp sampler2D _NoiseTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.x * _VignetteRadius;
    u_xlat16_0.x = u_xlat16_0.x * vs_TEXCOORD2.y;
    u_xlat16_0.x = u_xlat16_0.x * 0.400000006;
    u_xlat16_3.xy = (-vs_TEXCOORD2.xy) + vec2(1.0, 1.0);
    u_xlat16_0.x = u_xlat16_3.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_3.y * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_NoiseTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = vec3(vec3(_noiseStrength, _noiseStrength, _noiseStrength)) * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_1.xyz = texture(_ColorBuffer, vs_TEXCOORD1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_intensityMultiplier);
    u_xlat16_3.xyz = u_xlat16_3.xyz * _ToneColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = vec3(vec3(_VignetteStrength, _VignetteStrength, _VignetteStrength)) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.x = max(_Contrast, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + vec3(0.5, 0.5, 0.5);
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec4 _ColorBuffer_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
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
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _ColorBuffer_ST.xy + _ColorBuffer_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = u_xlat0.xy / u_xlat0.ww;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _intensityMultiplier;
uniform 	mediump float _noiseStrength;
uniform 	mediump float _VignetteRadius;
uniform 	mediump float _VignetteStrength;
uniform 	mediump vec4 _ToneColor;
uniform 	mediump float _Contrast;
uniform lowp sampler2D _ColorBuffer;
uniform lowp sampler2D _NoiseTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.x * _VignetteRadius;
    u_xlat16_0.x = u_xlat16_0.x * vs_TEXCOORD2.y;
    u_xlat16_0.x = u_xlat16_0.x * 0.400000006;
    u_xlat16_3.xy = (-vs_TEXCOORD2.xy) + vec2(1.0, 1.0);
    u_xlat16_0.x = u_xlat16_3.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_3.y * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_NoiseTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = vec3(vec3(_noiseStrength, _noiseStrength, _noiseStrength)) * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_1.xyz = texture(_ColorBuffer, vs_TEXCOORD1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_intensityMultiplier);
    u_xlat16_3.xyz = u_xlat16_3.xyz * _ToneColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = vec3(vec3(_VignetteStrength, _VignetteStrength, _VignetteStrength)) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.x = max(_Contrast, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + vec3(0.5, 0.5, 0.5);
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec4 _ColorBuffer_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
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
    u_xlat1.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.zw = in_TEXCOORD0.xy * _ColorBuffer_ST.xy + _ColorBuffer_ST.zw;
    phase0_Output0_1 = u_xlat1;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = u_xlat0.xy / u_xlat0.ww;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _intensityMultiplier;
uniform 	mediump float _noiseStrength;
uniform 	mediump float _VignetteRadius;
uniform 	mediump float _VignetteStrength;
uniform 	mediump vec4 _ToneColor;
uniform 	mediump float _Contrast;
uniform lowp sampler2D _ColorBuffer;
uniform lowp sampler2D _NoiseTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD2.x * _VignetteRadius;
    u_xlat16_0.x = u_xlat16_0.x * vs_TEXCOORD2.y;
    u_xlat16_0.x = u_xlat16_0.x * 0.400000006;
    u_xlat16_3.xy = (-vs_TEXCOORD2.xy) + vec2(1.0, 1.0);
    u_xlat16_0.x = u_xlat16_3.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_3.y * u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_NoiseTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = vec3(vec3(_noiseStrength, _noiseStrength, _noiseStrength)) * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat10_1.xyz = texture(_ColorBuffer, vs_TEXCOORD1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_intensityMultiplier);
    u_xlat16_3.xyz = u_xlat16_3.xyz * _ToneColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + (-u_xlat16_3.xyz);
    u_xlat16_0.xyz = vec3(vec3(_VignetteStrength, _VignetteStrength, _VignetteStrength)) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_0.x = max(_Contrast, 0.0);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + vec3(0.5, 0.5, 0.5);
    SV_Target0.xyz = u_xlat16_1.xyz;
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