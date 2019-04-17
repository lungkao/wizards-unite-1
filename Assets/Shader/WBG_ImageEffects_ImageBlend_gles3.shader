Shader "WBG/ImageEffects/ImageBlend" {
Properties {
_MainTex ("Color Buffer RGBA", 2D) = "white" { }
_DetailTex ("Color Buffer RGBA", 2D) = "black" { }
_BlendBias ("Blend Bias", Float) = 0
_FogColor ("Fog Color (RGB) Alpha (A)", Color) = (1,1,1,1)
_ColorGradingTint ("Color Grading (RGB) Alpha (A)", Color) = (0.1,0.35,0.35,1)
}
SubShader {
 LOD 800
 Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  LOD 800
  Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 26651
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 hlslcc_mtx4x4_ImageTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
mediump float u_xlat16_1;
int u_xlati2;
mediump float u_xlat16_3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati2 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati2 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati2;
    u_xlat0.x = float(u_xlati0);
    gl_Position.y = u_xlat0.x * in_POSITION0.y;
    gl_Position.xzw = in_POSITION0.xzw;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = dot(hlslcc_mtx4x4_ImageTransform[0].xy, u_xlat0.xy);
    u_xlat16_3 = dot(hlslcc_mtx4x4_ImageTransform[1].xy, u_xlat0.xy);
    vs_TEXCOORD1.y = u_xlat16_3 + hlslcc_mtx4x4_ImageTransform[1].z;
    vs_TEXCOORD1.x = u_xlat16_1 + hlslcc_mtx4x4_ImageTransform[0].z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _FogColor;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_1;
bvec3 u_xlatb1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_18;
mediump float u_xlat16_21;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0 + -0.25;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_DetailTex, vs_TEXCOORD1.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz + u_xlat10_2.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = dot(u_xlat16_6.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xyz = u_xlat16_3.xxx * _FogColor.xyz + (-u_xlat16_6.xyz);
    u_xlat16_21 = _FogColor.w * _FogColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_6.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_21;
    u_xlat16_3.xyz = (-u_xlat16_6.xyz) + _FogColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_6.xyz;
    u_xlat16_3.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _ColorGradingTint.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_5.xyz = (-u_xlat16_0.xyz) * u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlatb1.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _ColorGradingTint.xyzx).xyz;
    u_xlat16_5.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_5.z = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_18 = dot(vec3(0.219999999, 0.660000026, 0.109999999), u_xlat16_0.xyz);
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat16_18);
    u_xlat16_0.xyz = _ColorGradingTint.www * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
    SV_Target0.xyz = _ColorGradingTint.www * u_xlat16_3.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 hlslcc_mtx4x4_ImageTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
mediump float u_xlat16_1;
int u_xlati2;
mediump float u_xlat16_3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati2 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati2 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati2;
    u_xlat0.x = float(u_xlati0);
    gl_Position.y = u_xlat0.x * in_POSITION0.y;
    gl_Position.xzw = in_POSITION0.xzw;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = dot(hlslcc_mtx4x4_ImageTransform[0].xy, u_xlat0.xy);
    u_xlat16_3 = dot(hlslcc_mtx4x4_ImageTransform[1].xy, u_xlat0.xy);
    vs_TEXCOORD1.y = u_xlat16_3 + hlslcc_mtx4x4_ImageTransform[1].z;
    vs_TEXCOORD1.x = u_xlat16_1 + hlslcc_mtx4x4_ImageTransform[0].z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _FogColor;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_1;
bvec3 u_xlatb1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_18;
mediump float u_xlat16_21;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0 + -0.25;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_DetailTex, vs_TEXCOORD1.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz + u_xlat10_2.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = dot(u_xlat16_6.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xyz = u_xlat16_3.xxx * _FogColor.xyz + (-u_xlat16_6.xyz);
    u_xlat16_21 = _FogColor.w * _FogColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_6.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_21;
    u_xlat16_3.xyz = (-u_xlat16_6.xyz) + _FogColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_6.xyz;
    u_xlat16_3.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _ColorGradingTint.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_5.xyz = (-u_xlat16_0.xyz) * u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlatb1.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _ColorGradingTint.xyzx).xyz;
    u_xlat16_5.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_5.z = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_18 = dot(vec3(0.219999999, 0.660000026, 0.109999999), u_xlat16_0.xyz);
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat16_18);
    u_xlat16_0.xyz = _ColorGradingTint.www * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
    SV_Target0.xyz = _ColorGradingTint.www * u_xlat16_3.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 hlslcc_mtx4x4_ImageTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
mediump float u_xlat16_1;
int u_xlati2;
mediump float u_xlat16_3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati2 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati2 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati2;
    u_xlat0.x = float(u_xlati0);
    gl_Position.y = u_xlat0.x * in_POSITION0.y;
    gl_Position.xzw = in_POSITION0.xzw;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = dot(hlslcc_mtx4x4_ImageTransform[0].xy, u_xlat0.xy);
    u_xlat16_3 = dot(hlslcc_mtx4x4_ImageTransform[1].xy, u_xlat0.xy);
    vs_TEXCOORD1.y = u_xlat16_3 + hlslcc_mtx4x4_ImageTransform[1].z;
    vs_TEXCOORD1.x = u_xlat16_1 + hlslcc_mtx4x4_ImageTransform[0].z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _FogColor;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_1;
bvec3 u_xlatb1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_18;
mediump float u_xlat16_21;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0 + -0.25;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_DetailTex, vs_TEXCOORD1.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz + u_xlat10_2.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = dot(u_xlat16_6.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xyz = u_xlat16_3.xxx * _FogColor.xyz + (-u_xlat16_6.xyz);
    u_xlat16_21 = _FogColor.w * _FogColor.w;
    u_xlat16_6.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz + u_xlat16_6.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_21;
    u_xlat16_3.xyz = (-u_xlat16_6.xyz) + _FogColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_6.xyz;
    u_xlat16_3.xyz = sqrt(u_xlat16_0.xyz);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _ColorGradingTint.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_5.xyz = (-u_xlat16_0.xyz) * u_xlat16_0.xyz + u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz + (-u_xlat16_4.xyz);
    u_xlatb1.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), _ColorGradingTint.xyzx).xyz;
    u_xlat16_5.x = (u_xlatb1.x) ? float(1.0) : float(0.0);
    u_xlat16_5.y = (u_xlatb1.y) ? float(1.0) : float(0.0);
    u_xlat16_5.z = (u_xlatb1.z) ? float(1.0) : float(0.0);
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_18 = dot(vec3(0.219999999, 0.660000026, 0.109999999), u_xlat16_0.xyz);
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat16_18);
    u_xlat16_0.xyz = _ColorGradingTint.www * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + u_xlat16_3.xyz;
    SV_Target0.xyz = _ColorGradingTint.www * u_xlat16_3.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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
SubShader {
 LOD 200
 Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  LOD 200
  Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 105561
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 hlslcc_mtx4x4_ImageTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
mediump float u_xlat16_1;
int u_xlati2;
mediump float u_xlat16_3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati2 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati2 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati2;
    u_xlat0.x = float(u_xlati0);
    gl_Position.y = u_xlat0.x * in_POSITION0.y;
    gl_Position.xzw = in_POSITION0.xzw;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = dot(hlslcc_mtx4x4_ImageTransform[0].xy, u_xlat0.xy);
    u_xlat16_3 = dot(hlslcc_mtx4x4_ImageTransform[1].xy, u_xlat0.xy);
    vs_TEXCOORD1.y = u_xlat16_3 + hlslcc_mtx4x4_ImageTransform[1].z;
    vs_TEXCOORD1.x = u_xlat16_1 + hlslcc_mtx4x4_ImageTransform[0].z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _FogColor;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0 + -0.25;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_DetailTex, vs_TEXCOORD1.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat10_2.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = dot(u_xlat16_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xyz = u_xlat16_3.xxx * _FogColor.xyz + (-u_xlat16_4.xyz);
    u_xlat16_15 = _FogColor.w * _FogColor.w;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + _FogColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_12 = dot(vec3(0.219999999, 0.660000026, 0.109999999), u_xlat16_0.xyz);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat16_12);
    u_xlat16_3.xyz = _ColorGradingTint.www * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = _ColorGradingTint.xyz * u_xlat16_0.xyz + (-u_xlat16_3.xyz);
    SV_Target0.xyz = _ColorGradingTint.www * u_xlat16_0.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 hlslcc_mtx4x4_ImageTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
mediump float u_xlat16_1;
int u_xlati2;
mediump float u_xlat16_3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati2 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati2 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati2;
    u_xlat0.x = float(u_xlati0);
    gl_Position.y = u_xlat0.x * in_POSITION0.y;
    gl_Position.xzw = in_POSITION0.xzw;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = dot(hlslcc_mtx4x4_ImageTransform[0].xy, u_xlat0.xy);
    u_xlat16_3 = dot(hlslcc_mtx4x4_ImageTransform[1].xy, u_xlat0.xy);
    vs_TEXCOORD1.y = u_xlat16_3 + hlslcc_mtx4x4_ImageTransform[1].z;
    vs_TEXCOORD1.x = u_xlat16_1 + hlslcc_mtx4x4_ImageTransform[0].z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _FogColor;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0 + -0.25;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_DetailTex, vs_TEXCOORD1.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat10_2.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = dot(u_xlat16_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xyz = u_xlat16_3.xxx * _FogColor.xyz + (-u_xlat16_4.xyz);
    u_xlat16_15 = _FogColor.w * _FogColor.w;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + _FogColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_12 = dot(vec3(0.219999999, 0.660000026, 0.109999999), u_xlat16_0.xyz);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat16_12);
    u_xlat16_3.xyz = _ColorGradingTint.www * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = _ColorGradingTint.xyz * u_xlat16_0.xyz + (-u_xlat16_3.xyz);
    SV_Target0.xyz = _ColorGradingTint.www * u_xlat16_0.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 hlslcc_mtx4x4_ImageTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec2 u_xlat0;
int u_xlati0;
mediump float u_xlat16_1;
int u_xlati2;
mediump float u_xlat16_3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    { bool cond = 0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y; u_xlati0 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati0 = int((0.0<hlslcc_mtx4x4glstate_matrix_projection[1].y) ? 0xFFFFFFFFu : uint(0u));
#endif
#ifdef UNITY_ADRENO_ES3
    { bool cond = hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0; u_xlati2 = int(!!cond ? 0xFFFFFFFFu : uint(0u)); }
#else
    u_xlati2 = int((hlslcc_mtx4x4glstate_matrix_projection[1].y<0.0) ? 0xFFFFFFFFu : uint(0u));
#endif
    u_xlati0 = (-u_xlati0) + u_xlati2;
    u_xlat0.x = float(u_xlati0);
    gl_Position.y = u_xlat0.x * in_POSITION0.y;
    gl_Position.xzw = in_POSITION0.xzw;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    vs_TEXCOORD0 = u_xlat0.x;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = dot(hlslcc_mtx4x4_ImageTransform[0].xy, u_xlat0.xy);
    u_xlat16_3 = dot(hlslcc_mtx4x4_ImageTransform[1].xy, u_xlat0.xy);
    vs_TEXCOORD1.y = u_xlat16_3 + hlslcc_mtx4x4_ImageTransform[1].z;
    vs_TEXCOORD1.x = u_xlat16_1 + hlslcc_mtx4x4_ImageTransform[0].z;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _FogColor;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DetailTex;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_12;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.x = vs_TEXCOORD0 + -0.25;
    u_xlat16_0.x = u_xlat16_0.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0.x * -2.0 + 3.0;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_4.x * u_xlat16_0.x + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat10_1.xyz = texture(_DetailTex, vs_TEXCOORD1.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat10_2.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_0.x;
    u_xlat16_3.x = dot(u_xlat16_4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_3.xyz = u_xlat16_3.xxx * _FogColor.xyz + (-u_xlat16_4.xyz);
    u_xlat16_15 = _FogColor.w * _FogColor.w;
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + _FogColor.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_12 = dot(vec3(0.219999999, 0.660000026, 0.109999999), u_xlat16_0.xyz);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(u_xlat16_12);
    u_xlat16_3.xyz = _ColorGradingTint.www * u_xlat16_3.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = _ColorGradingTint.xyz * u_xlat16_0.xyz + (-u_xlat16_3.xyz);
    SV_Target0.xyz = _ColorGradingTint.www * u_xlat16_0.xyz + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
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