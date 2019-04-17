Shader "Hidden/Internal-DeferredShading" {
Properties {
_LightTexture0 ("", any) = "" { }
_LightTextureB0 ("", 2D) = "" { }
_ShadowMapTexture ("", any) = "" { }
_SrcBlend ("", Float) = 1
_DstBlend ("", Float) = 1
}
SubShader {
 Pass {
  Tags { "SHADOWSUPPORT" = "true" }
  ZWrite Off
  GpuProgramID 293
Program "vp" {
SubProgram "gles3 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat21);
    u_xlat21 = u_xlat21 * _LightPos.w;
    u_xlat21 = texture(_LightTextureB0, vec2(u_xlat21)).w;
    u_xlat4.xyz = vec3(u_xlat21) * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_3.xyz, (-u_xlat0.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = u_xlat21 * u_xlat21;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump float u_xlat16_12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat13 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat19 = inversesqrt(u_xlat13);
    u_xlat13 = u_xlat13 * _LightPos.w;
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat13)).w;
    u_xlat3.xyz = vec3(u_xlat13) * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat19);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot((-u_xlat0.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = max(u_xlat18, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat18 = u_xlat18 * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_12 + 1.00001001;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = u_xlat16_13 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x + -9.99999975e-05;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 100.0);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat6.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump float u_xlat16_12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat13 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat19 = inversesqrt(u_xlat13);
    u_xlat13 = u_xlat13 * _LightPos.w;
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat13)).w;
    u_xlat3.xyz = vec3(u_xlat13) * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat19);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot((-u_xlat0.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = max(u_xlat18, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat18 = u_xlat18 * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_12 + 1.00001001;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = u_xlat16_13 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x + -9.99999975e-05;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 100.0);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat6.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = vec3(u_xlat16_15) * u_xlat16_2.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), u_xlat16_2.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = u_xlat16_2.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat15) * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, (-_LightDir.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat6;
float u_xlat9;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat9 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat9 = _ZBufferParams.x * u_xlat9 + _ZBufferParams.y;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + (-_LightDir.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 0.00100000005);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_9 = inversesqrt(u_xlat16_9);
    u_xlat16_2.xyz = vec3(u_xlat16_9) * u_xlat16_2.xyz;
    u_xlat9 = dot(u_xlat16_2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat0.x = dot((-_LightDir.xyz), u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat3 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat9 * u_xlat9;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_9 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_10 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_9 + 1.5;
    u_xlat0.x = u_xlat16_9 * u_xlat0.x;
    u_xlat16_9 = u_xlat16_10 * u_xlat16_10 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat16_9 + 1.00001001;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat0.xzw = u_xlat0.xzw * _LightColor.xyz;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat6;
float u_xlat9;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat9 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat9 = _ZBufferParams.x * u_xlat9 + _ZBufferParams.y;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + (-_LightDir.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 0.00100000005);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_9 = inversesqrt(u_xlat16_9);
    u_xlat16_2.xyz = vec3(u_xlat16_9) * u_xlat16_2.xyz;
    u_xlat9 = dot(u_xlat16_2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat0.x = dot((-_LightDir.xyz), u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat3 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat9 * u_xlat9;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_9 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_10 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_9 + 1.5;
    u_xlat0.x = u_xlat16_9 * u_xlat0.x;
    u_xlat16_9 = u_xlat16_10 * u_xlat16_10 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat16_9 + 1.00001001;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat0.xzw = u_xlat0.xzw * _LightColor.xyz;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) + _LightPos.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = inversesqrt(u_xlat21);
    u_xlat21 = u_xlat21 * _LightPos.w;
    u_xlat21 = texture(_LightTextureB0, vec2(u_xlat21)).w;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat22 = dot(u_xlat16_3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat2.x = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat2.x = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat10_3.xyz + u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = (-u_xlat0.xyz) + _LightPos.xyz;
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.z<0.0);
#else
    u_xlatb10 = u_xlat0.z<0.0;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat10 * u_xlat0.x;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = (-u_xlat0.xyz) + _LightPos.xyz;
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.z<0.0);
#else
    u_xlatb10 = u_xlat0.z<0.0;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat10 * u_xlat0.x;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat4.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = inversesqrt(u_xlat21);
    u_xlat21 = u_xlat21 * _LightPos.w;
    u_xlat21 = texture(_LightTextureB0, vec2(u_xlat21)).w;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat15 = dot(u_xlat2.xyz, (-u_xlat4.xyz));
    u_xlat22 = dot(u_xlat16_3.xyz, (-u_xlat4.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat2.x = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat2.x = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat10_3.xyz + u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat21;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-u_xlat3.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot((-u_xlat3.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, (-u_xlat3.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-u_xlat3.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot((-u_xlat3.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, (-u_xlat3.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat18 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat18 = u_xlat18 + u_xlat18;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat18)) + (-u_xlat2.xyz);
    u_xlat18 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat13 = dot(u_xlat2.xyz, (-_LightDir.xyz));
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat2.x = u_xlat13 * u_xlat13;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat19 = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat19 = u_xlat19 * 16.0;
    u_xlat16_4.xyz = vec3(u_xlat19) * u_xlat10_3.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_5.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
float u_xlat13;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat12 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat12 = _ZBufferParams.x * u_xlat12 + _ZBufferParams.y;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat12) + (-_LightDir.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_3.xyz = vec3(u_xlat16_12) * u_xlat16_3.xyz;
    u_xlat12 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat9 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = max(u_xlat9, 0.319999993);
    u_xlat13 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_5 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat9;
    u_xlat16_9 = u_xlat16_5 * u_xlat16_5 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_9 + 1.00001001;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = u_xlat16_5 / u_xlat12;
    u_xlat12 = u_xlat12 + -9.99999975e-05;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, 100.0);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
float u_xlat13;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat12 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat12 = _ZBufferParams.x * u_xlat12 + _ZBufferParams.y;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat12) + (-_LightDir.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_3.xyz = vec3(u_xlat16_12) * u_xlat16_3.xyz;
    u_xlat12 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat9 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = max(u_xlat9, 0.319999993);
    u_xlat13 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_5 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat9;
    u_xlat16_9 = u_xlat16_5 * u_xlat16_5 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_9 + 1.00001001;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = u_xlat16_5 / u_xlat12;
    u_xlat12 = u_xlat12 + -9.99999975e-05;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, 100.0);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat22;
void main()
{
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat7.xyz = u_xlat7.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_7 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_0.x = u_xlat10_7 * u_xlat16_0.x + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat7.z) * u_xlat15 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat7.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat7.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat15 = texture(_LightTextureB0, vec2(u_xlat22)).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_5.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_5.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_5.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump float u_xlat16_13;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat6.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat13 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat13 = _ZBufferParams.x * u_xlat13 + _ZBufferParams.y;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_0.x = u_xlat10_6 * u_xlat16_0.x + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = (-u_xlat6.z) * u_xlat13 + u_xlat6.x;
    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat2.z;
    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat6.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat0.z<0.0);
#else
    u_xlatb12 = u_xlat0.z<0.0;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat6.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat13 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19 = u_xlat13 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat19)).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump float u_xlat16_13;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = (-_LightShadowData.x) + 1.0;
    u_xlat6.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat13 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat13 = _ZBufferParams.x * u_xlat13 + _ZBufferParams.y;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_0.x = u_xlat10_6 * u_xlat16_0.x + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = (-u_xlat6.z) * u_xlat13 + u_xlat6.x;
    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat2.z;
    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat6.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat0.z<0.0);
#else
    u_xlatb12 = u_xlat0.z<0.0;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat6.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat13 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19 = u_xlat13 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat19)).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _ShadowOffsets[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat24 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat24 = _ZBufferParams.x * u_xlat24 + _ZBufferParams.y;
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat4.xyz = u_xlat3.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[2].xyz;
    u_xlat3.xyz = u_xlat3.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8 = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_8 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.z) * u_xlat24 + u_xlat8.x;
    u_xlat8.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat2.z;
    u_xlat8.x = u_xlat8.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat8.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.z<0.0);
#else
    u_xlatb16 = u_xlat0.z<0.0;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat16 * u_xlat0.x;
    u_xlat8.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat17 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = u_xlat17 * _LightPos.w;
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat17);
    u_xlat17 = texture(_LightTextureB0, vec2(u_xlat25)).w;
    u_xlat0.x = u_xlat0.x * u_xlat17;
    u_xlat0.x = u_xlat16_6.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_4.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_4.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _ShadowOffsets[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat4.xyz = u_xlat3.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[2].xyz;
    u_xlat3.xyz = u_xlat3.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_7 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat7.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat15 = texture(_LightTextureB0, vec2(u_xlat22)).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat0.x = u_xlat16_6 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _ShadowOffsets[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat4.xyz = u_xlat3.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[2].xyz;
    u_xlat3.xyz = u_xlat3.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_7 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat7.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat15 = texture(_LightTextureB0, vec2(u_xlat22)).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat0.x = u_xlat16_6 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat13 = dot((-u_xlat6.xyz), u_xlat16_2.xyz);
    u_xlat13 = u_xlat13 + u_xlat13;
    u_xlat6.xyz = u_xlat16_2.xyz * (-vec3(u_xlat13)) + (-u_xlat6.xyz);
    u_xlat13 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat6.xyz, (-_LightDir.xyz));
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat2.x = u_xlat6.x * u_xlat6.x;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat6.x = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat6.x = u_xlat6.x * 16.0;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat10_12 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4.x = u_xlat0.x + u_xlat10_12;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat16_4.xxx * _LightColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat13) * u_xlat0.xzw;
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat10_3.xyz + u_xlat10_2.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat10;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xyz = (-u_xlat3.xyz) * u_xlat5.xxx + (-_LightDir.xyz);
    u_xlat11 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat11 = max(u_xlat11, 0.00100000005);
    u_xlat11 = inversesqrt(u_xlat11);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat11);
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    u_xlat16_2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat11 = dot(u_xlat16_2.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat5.x = dot((-_LightDir.xyz), u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = max(u_xlat5.x, 0.319999993);
    u_xlat10 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat11 * u_xlat11;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_11 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11 + 1.5;
    u_xlat5.x = u_xlat5.x * u_xlat16_11;
    u_xlat16_11 = u_xlat16_16 * u_xlat16_16 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat5.x = u_xlat16_16 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x + -9.99999975e-05;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = min(u_xlat5.x, 100.0);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat10_15 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_15;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat16_4) * _LightColor.xyz;
    u_xlat0.xyw = u_xlat5.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat10;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xyz = (-u_xlat3.xyz) * u_xlat5.xxx + (-_LightDir.xyz);
    u_xlat11 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat11 = max(u_xlat11, 0.00100000005);
    u_xlat11 = inversesqrt(u_xlat11);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat11);
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    u_xlat16_2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat11 = dot(u_xlat16_2.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat5.x = dot((-_LightDir.xyz), u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = max(u_xlat5.x, 0.319999993);
    u_xlat10 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat11 * u_xlat11;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_11 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11 + 1.5;
    u_xlat5.x = u_xlat5.x * u_xlat16_11;
    u_xlat16_11 = u_xlat16_16 * u_xlat16_16 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat5.x = u_xlat16_16 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x + -9.99999975e-05;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = min(u_xlat5.x, 100.0);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat10_15 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_15;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat16_4) * _LightColor.xyz;
    u_xlat0.xyw = u_xlat5.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp float u_xlat10_6;
float u_xlat18;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4.x = u_xlat0.x + u_xlat10_6;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat2.ww + u_xlat0.xy;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat18 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat18 = dot((-u_xlat0.xyz), u_xlat16_3.xyz);
    u_xlat18 = u_xlat18 + u_xlat18;
    u_xlat0.xyz = u_xlat16_3.xyz * (-vec3(u_xlat18)) + (-u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, (-_LightDir.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
lowp float u_xlat10_5;
mediump float u_xlat16_6;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat2.ww + u_xlat0.xy;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-_LightDir.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat15 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat11 = max(u_xlat11, 0.319999993);
    u_xlat16 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat11;
    u_xlat16_11 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
lowp float u_xlat10_5;
mediump float u_xlat16_6;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat2.ww + u_xlat0.xy;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-_LightDir.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat15 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat11 = max(u_xlat11, 0.319999993);
    u_xlat16 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat11;
    u_xlat16_11 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat15;
bool u_xlatb15;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat7.xyz);
    u_xlat15 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat23 = sqrt(u_xlat22);
    u_xlat23 = u_xlat23 * _LightPositionRange.w;
    u_xlat23 = u_xlat23 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<u_xlat23);
#else
    u_xlatb15 = u_xlat15<u_xlat23;
#endif
    u_xlat16_4.x = (u_xlatb15) ? _LightShadowData.x : 1.0;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat22 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat22);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_5.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_5.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_5.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat7.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_7;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = (-u_xlat0.z) * u_xlat18 + u_xlat6;
    u_xlat6 = unity_ShadowFadeCenterAndType.w * u_xlat6 + u_xlat2.z;
    u_xlat6 = u_xlat6 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat12 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xyz);
    u_xlat18 = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat0.xxx + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = dot((-u_xlat2.xyz), u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat16_4.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat13 = max(u_xlat13, 0.319999993);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_7 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat13;
    u_xlat16_13 = u_xlat16_7 * u_xlat16_7 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_13 + 1.00001001;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat16_7 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.x = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 * _LightPos.w;
    u_xlat12 = texture(_LightTextureB0, vec2(u_xlat12)).w;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat18<u_xlat0.x);
#else
    u_xlatb0 = u_xlat18<u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? _LightShadowData.x : 1.0;
    u_xlat16_5 = u_xlat6 + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat12 * u_xlat16_5;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat19) * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_7;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = (-u_xlat0.z) * u_xlat18 + u_xlat6;
    u_xlat6 = unity_ShadowFadeCenterAndType.w * u_xlat6 + u_xlat2.z;
    u_xlat6 = u_xlat6 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat12 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xyz);
    u_xlat18 = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat0.xxx + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = dot((-u_xlat2.xyz), u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat16_4.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat13 = max(u_xlat13, 0.319999993);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_7 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat13;
    u_xlat16_13 = u_xlat16_7 * u_xlat16_7 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_13 + 1.00001001;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat16_7 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.x = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 * _LightPos.w;
    u_xlat12 = texture(_LightTextureB0, vec2(u_xlat12)).w;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat18<u_xlat0.x);
#else
    u_xlatb0 = u_xlat18<u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? _LightShadowData.x : 1.0;
    u_xlat16_5 = u_xlat6 + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat12 * u_xlat16_5;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat19) * u_xlat0.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat15;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_3 = textureLod(_ShadowMapTexture, u_xlat3.xyz, 0.0);
    u_xlat3.x = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.y = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.z = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.w = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = sqrt(u_xlat15);
    u_xlat22 = u_xlat22 * _LightPositionRange.w;
    u_xlat22 = u_xlat22 * _LightProjectionParams.w;
    u_xlatb3 = lessThan(u_xlat3, vec4(u_xlat22));
    u_xlat3.x = (u_xlatb3.x) ? _LightShadowData.x : float(1.0);
    u_xlat3.y = (u_xlatb3.y) ? _LightShadowData.x : float(1.0);
    u_xlat3.z = (u_xlatb3.z) ? _LightShadowData.x : float(1.0);
    u_xlat3.w = (u_xlatb3.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_5.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_5.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_4.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_4.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat7.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_3 = textureLod(_ShadowMapTexture, u_xlat3.xyz, 0.0);
    u_xlat3.x = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.y = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.z = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.w = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = sqrt(u_xlat15);
    u_xlat22 = u_xlat22 * _LightPositionRange.w;
    u_xlat22 = u_xlat22 * _LightProjectionParams.w;
    u_xlatb3 = lessThan(u_xlat3, vec4(u_xlat22));
    u_xlat3.x = (u_xlatb3.x) ? _LightShadowData.x : float(1.0);
    u_xlat3.y = (u_xlatb3.y) ? _LightShadowData.x : float(1.0);
    u_xlat3.z = (u_xlatb3.z) ? _LightShadowData.x : float(1.0);
    u_xlat3.w = (u_xlatb3.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_5 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5 = u_xlat0.x + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_5 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_6.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_6.xyz = vec3(u_xlat16_23) * u_xlat16_6.xyz;
    u_xlat2.x = dot(u_xlat16_6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_6.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_3 = textureLod(_ShadowMapTexture, u_xlat3.xyz, 0.0);
    u_xlat3.x = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.y = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.z = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.w = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = sqrt(u_xlat15);
    u_xlat22 = u_xlat22 * _LightPositionRange.w;
    u_xlat22 = u_xlat22 * _LightProjectionParams.w;
    u_xlatb3 = lessThan(u_xlat3, vec4(u_xlat22));
    u_xlat3.x = (u_xlatb3.x) ? _LightShadowData.x : float(1.0);
    u_xlat3.y = (u_xlatb3.y) ? _LightShadowData.x : float(1.0);
    u_xlat3.z = (u_xlatb3.z) ? _LightShadowData.x : float(1.0);
    u_xlat3.w = (u_xlatb3.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_5 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5 = u_xlat0.x + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_5 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_6.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_6.xyz = vec3(u_xlat16_23) * u_xlat16_6.xyz;
    u_xlat2.x = dot(u_xlat16_6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_6.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat7.xyz);
    u_xlat15 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16 = sqrt(u_xlat22);
    u_xlat16 = u_xlat16 * _LightPositionRange.w;
    u_xlat16 = u_xlat16 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<u_xlat16);
#else
    u_xlatb15 = u_xlat15<u_xlat16;
#endif
    u_xlat16_4.x = (u_xlatb15) ? _LightShadowData.x : 1.0;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat22 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat22);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat15 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_5.xyz = u_xlat16_0.xxx * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_5.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_5.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat7.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat13 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat19 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14 = sqrt(u_xlat19);
    u_xlat14 = u_xlat14 * _LightPositionRange.w;
    u_xlat14 = u_xlat14 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13<u_xlat14);
#else
    u_xlatb13 = u_xlat13<u_xlat14;
#endif
    u_xlat16_4 = (u_xlatb13) ? _LightShadowData.x : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat19 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat19);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat13 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat6.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, (-u_xlat6.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat13 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat19 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14 = sqrt(u_xlat19);
    u_xlat14 = u_xlat14 * _LightPositionRange.w;
    u_xlat14 = u_xlat14 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13<u_xlat14);
#else
    u_xlatb13 = u_xlat13<u_xlat14;
#endif
    u_xlat16_4 = (u_xlatb13) ? _LightShadowData.x : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat19 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat19);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat13 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat6.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, (-u_xlat6.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
bvec4 u_xlatb4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
float u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat24 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat24 = _ZBufferParams.x * u_xlat24 + _ZBufferParams.y;
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat4.xyz = u_xlat3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat4.x = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.y = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.z = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.w = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat8 = sqrt(u_xlat0.x);
    u_xlat8 = u_xlat8 * _LightPositionRange.w;
    u_xlat8 = u_xlat8 * _LightProjectionParams.w;
    u_xlatb4 = lessThan(u_xlat4, vec4(u_xlat8));
    u_xlat4.x = (u_xlatb4.x) ? _LightShadowData.x : float(1.0);
    u_xlat4.y = (u_xlatb4.y) ? _LightShadowData.x : float(1.0);
    u_xlat4.z = (u_xlatb4.z) ? _LightShadowData.x : float(1.0);
    u_xlat4.w = (u_xlatb4.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_6.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat4.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = (-u_xlat0.z) * u_xlat24 + u_xlat8;
    u_xlat8 = unity_ShadowFadeCenterAndType.w * u_xlat8 + u_xlat2.z;
    u_xlat8 = u_xlat8 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat8 + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat0.x * _LightPos.w;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat8 = texture(_LightTextureB0, vec2(u_xlat8)).w;
    u_xlat8 = u_xlat16_6.x * u_xlat8;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat17 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat8 = u_xlat8 * u_xlat17;
    u_xlat3.xyz = vec3(u_xlat8) * _LightColor.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_8 = inversesqrt(u_xlat16_8);
    u_xlat16_4.xyz = vec3(u_xlat16_8) * u_xlat16_4.xyz;
    u_xlat8 = dot(u_xlat16_4.xyz, (-u_xlat0.xzw));
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat8) * u_xlat3.xyz;
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    u_xlat8 = dot((-u_xlat2.xyz), u_xlat16_4.xyz);
    u_xlat8 = u_xlat8 + u_xlat8;
    u_xlat2.xyz = u_xlat16_4.xyz * (-vec3(u_xlat8)) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat0.xzw));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_0.w = 1.0;
    SV_Target0 = exp2((-u_xlat16_0));
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
bvec4 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat4.xyz = u_xlat3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat4.x = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.y = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.z = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.w = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat0.x);
    u_xlat7.x = u_xlat7.x * _LightPositionRange.w;
    u_xlat7.x = u_xlat7.x * _LightProjectionParams.w;
    u_xlatb4 = lessThan(u_xlat4, u_xlat7.xxxx);
    u_xlat4.x = (u_xlatb4.x) ? _LightShadowData.x : float(1.0);
    u_xlat4.y = (u_xlatb4.y) ? _LightShadowData.x : float(1.0);
    u_xlat4.z = (u_xlatb4.z) ? _LightShadowData.x : float(1.0);
    u_xlat4.w = (u_xlatb4.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_6 = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat4.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * _LightPos.w;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat7.x = texture(_LightTextureB0, u_xlat7.xx).w;
    u_xlat7.x = u_xlat16_6 * u_xlat7.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat15 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat7.x = u_xlat7.x * u_xlat15;
    u_xlat3.xyz = u_xlat7.xxx * _LightColor.xyz;
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat7.x = dot((-u_xlat0.xzw), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = max(u_xlat7.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat7.x = u_xlat7.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xzw));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = u_xlat16_15 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x + -9.99999975e-05;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = min(u_xlat7.x, 100.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
bvec4 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat4.xyz = u_xlat3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat4.x = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.y = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.z = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.w = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat0.x);
    u_xlat7.x = u_xlat7.x * _LightPositionRange.w;
    u_xlat7.x = u_xlat7.x * _LightProjectionParams.w;
    u_xlatb4 = lessThan(u_xlat4, u_xlat7.xxxx);
    u_xlat4.x = (u_xlatb4.x) ? _LightShadowData.x : float(1.0);
    u_xlat4.y = (u_xlatb4.y) ? _LightShadowData.x : float(1.0);
    u_xlat4.z = (u_xlatb4.z) ? _LightShadowData.x : float(1.0);
    u_xlat4.w = (u_xlatb4.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_6 = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat4.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * _LightPos.w;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat7.x = texture(_LightTextureB0, u_xlat7.xx).w;
    u_xlat7.x = u_xlat16_6 * u_xlat7.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat15 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat7.x = u_xlat7.x * u_xlat15;
    u_xlat3.xyz = u_xlat7.xxx * _LightColor.xyz;
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat7.x = dot((-u_xlat0.xzw), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = max(u_xlat7.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat7.x = u_xlat7.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xzw));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = u_xlat16_15 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x + -9.99999975e-05;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = min(u_xlat7.x, 100.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat16_0.xyz = (-u_xlat0.xyz);
    u_xlat16_0.w = -1.0;
    SV_Target0 = exp2(u_xlat16_0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat21);
    u_xlat21 = u_xlat21 * _LightPos.w;
    u_xlat21 = texture(_LightTextureB0, vec2(u_xlat21)).w;
    u_xlat4.xyz = vec3(u_xlat21) * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat0.xyz));
    u_xlat0.x = dot(u_xlat16_3.xyz, (-u_xlat0.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.x = u_xlat21 * u_xlat21;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump float u_xlat16_12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat13 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat19 = inversesqrt(u_xlat13);
    u_xlat13 = u_xlat13 * _LightPos.w;
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat13)).w;
    u_xlat3.xyz = vec3(u_xlat13) * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat19);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot((-u_xlat0.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = max(u_xlat18, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat18 = u_xlat18 * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_12 + 1.00001001;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = u_xlat16_13 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x + -9.99999975e-05;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 100.0);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat6.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
mediump float u_xlat16_12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat13 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat19 = inversesqrt(u_xlat13);
    u_xlat13 = u_xlat13 * _LightPos.w;
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat13)).w;
    u_xlat3.xyz = vec3(u_xlat13) * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat19);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat18) + (-u_xlat0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat18 = dot((-u_xlat0.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = max(u_xlat18, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat18 = u_xlat18 * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_12 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat16_12 + 1.00001001;
    u_xlat6.x = u_xlat6.x * u_xlat18;
    u_xlat6.x = u_xlat16_13 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x + -9.99999975e-05;
    u_xlat6.x = max(u_xlat6.x, 0.0);
    u_xlat6.x = min(u_xlat6.x, 100.0);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat6.xyz = u_xlat3.xyz * u_xlat6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_2.xyz = vec3(u_xlat16_15) * u_xlat16_2.xyz;
    u_xlat15 = dot((-u_xlat0.xyz), u_xlat16_2.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat0.xyz = u_xlat16_2.xyz * (-vec3(u_xlat15)) + (-u_xlat0.xyz);
    u_xlat15 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = vec3(u_xlat15) * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, (-_LightDir.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat6;
float u_xlat9;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat9 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat9 = _ZBufferParams.x * u_xlat9 + _ZBufferParams.y;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + (-_LightDir.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 0.00100000005);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_9 = inversesqrt(u_xlat16_9);
    u_xlat16_2.xyz = vec3(u_xlat16_9) * u_xlat16_2.xyz;
    u_xlat9 = dot(u_xlat16_2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat0.x = dot((-_LightDir.xyz), u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat3 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat9 * u_xlat9;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_9 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_10 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_9 + 1.5;
    u_xlat0.x = u_xlat16_9 * u_xlat0.x;
    u_xlat16_9 = u_xlat16_10 * u_xlat16_10 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat16_9 + 1.00001001;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat0.xzw = u_xlat0.xzw * _LightColor.xyz;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
float u_xlat3;
float u_xlat6;
float u_xlat9;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat9 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat9 = _ZBufferParams.x * u_xlat9 + _ZBufferParams.y;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + (-_LightDir.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 0.00100000005);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_9 = inversesqrt(u_xlat16_9);
    u_xlat16_2.xyz = vec3(u_xlat16_9) * u_xlat16_2.xyz;
    u_xlat9 = dot(u_xlat16_2.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat0.x = dot((-_LightDir.xyz), u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat3 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat3 = min(max(u_xlat3, 0.0), 1.0);
#else
    u_xlat3 = clamp(u_xlat3, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat9 * u_xlat9;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_9 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_10 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_9 + 1.5;
    u_xlat0.x = u_xlat16_9 * u_xlat0.x;
    u_xlat16_9 = u_xlat16_10 * u_xlat16_10 + -1.0;
    u_xlat6 = u_xlat6 * u_xlat16_9 + 1.00001001;
    u_xlat0.x = u_xlat6 * u_xlat0.x;
    u_xlat0.x = u_xlat16_10 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    u_xlat0.xzw = u_xlat0.xzw * _LightColor.xyz;
    u_xlat0.xyz = vec3(u_xlat3) * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat4.xyz = (-u_xlat0.xyz) + _LightPos.xyz;
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = inversesqrt(u_xlat21);
    u_xlat21 = u_xlat21 * _LightPos.w;
    u_xlat21 = texture(_LightTextureB0, vec2(u_xlat21)).w;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat22 = dot(u_xlat16_3.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat2.x = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat2.x = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat10_3.xyz + u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat21 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = (-u_xlat0.xyz) + _LightPos.xyz;
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.z<0.0);
#else
    u_xlatb10 = u_xlat0.z<0.0;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat10 * u_xlat0.x;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat10;
bool u_xlatb10;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = (-u_xlat0.xyz) + _LightPos.xyz;
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + u_xlat3.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot(u_xlat3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.z<0.0);
#else
    u_xlatb10 = u_xlat0.z<0.0;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat10 * u_xlat0.x;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz;
    u_xlat21 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat21)) + (-u_xlat2.xyz);
    u_xlat4.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat21 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat15 = inversesqrt(u_xlat21);
    u_xlat21 = u_xlat21 * _LightPos.w;
    u_xlat21 = texture(_LightTextureB0, vec2(u_xlat21)).w;
    u_xlat4.xyz = vec3(u_xlat15) * u_xlat4.xyz;
    u_xlat15 = dot(u_xlat2.xyz, (-u_xlat4.xyz));
    u_xlat22 = dot(u_xlat16_3.xyz, (-u_xlat4.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat2.x = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat2.x = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat16_5.xyz = u_xlat2.xxx * u_xlat10_3.xyz + u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat21;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-u_xlat3.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot((-u_xlat3.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, (-u_xlat3.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat3.xyz = u_xlat0.xyz + (-_LightPos.xyz);
    u_xlat11 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16 = inversesqrt(u_xlat11);
    u_xlat11 = u_xlat11 * _LightPos.w;
    u_xlat11 = texture(_LightTextureB0, vec2(u_xlat11)).w;
    u_xlat3.xyz = vec3(u_xlat16) * u_xlat3.xyz;
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-u_xlat3.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_4.xyz = vec3(u_xlat16_15) * u_xlat16_4.xyz;
    u_xlat15 = dot(u_xlat16_4.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat16 = dot((-u_xlat3.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat16_4.xyz, (-u_xlat3.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16 = max(u_xlat16, 0.319999993);
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_7.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_3.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat16;
    u_xlat16_16 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_16 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyw = vec3(u_xlat15) * u_xlat10_3.xyz + u_xlat10_7.xyz;
    u_xlat7.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat11;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyw;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat13;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat18 = dot((-u_xlat2.xyz), u_xlat16_3.xyz);
    u_xlat18 = u_xlat18 + u_xlat18;
    u_xlat2.xyz = u_xlat16_3.xyz * (-vec3(u_xlat18)) + (-u_xlat2.xyz);
    u_xlat18 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat13 = dot(u_xlat2.xyz, (-_LightDir.xyz));
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat2.x = u_xlat13 * u_xlat13;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat19 = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat19 = u_xlat19 * 16.0;
    u_xlat16_4.xyz = vec3(u_xlat19) * u_xlat10_3.xyz + u_xlat10_1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat16_5.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
float u_xlat13;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat12 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat12 = _ZBufferParams.x * u_xlat12 + _ZBufferParams.y;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat12) + (-_LightDir.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_3.xyz = vec3(u_xlat16_12) * u_xlat16_3.xyz;
    u_xlat12 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat9 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = max(u_xlat9, 0.319999993);
    u_xlat13 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_5 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat9;
    u_xlat16_9 = u_xlat16_5 * u_xlat16_5 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_9 + 1.00001001;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = u_xlat16_5 / u_xlat12;
    u_xlat12 = u_xlat12 + -9.99999975e-05;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, 100.0);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
float u_xlat9;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_12;
float u_xlat13;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat12 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat12 = _ZBufferParams.x * u_xlat12 + _ZBufferParams.y;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat12) + (-_LightDir.xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = max(u_xlat12, 0.00100000005);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_12 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_3.xyz = vec3(u_xlat16_12) * u_xlat16_3.xyz;
    u_xlat12 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat9 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat9 = max(u_xlat9, 0.319999993);
    u_xlat13 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_5 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat9;
    u_xlat16_9 = u_xlat16_5 * u_xlat16_5 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_9 + 1.00001001;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat12 = u_xlat16_5 / u_xlat12;
    u_xlat12 = u_xlat12 + -9.99999975e-05;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, 100.0);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat4.xz = u_xlat0.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat0.xx + u_xlat4.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat13) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
float u_xlat22;
void main()
{
    u_xlat16_0 = (-_LightShadowData.x) + 1.0;
    u_xlat7.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat7.xyz = u_xlat7.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_7 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_0 = u_xlat10_7 * u_xlat16_0 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat7.z) * u_xlat15 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat7.x + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat7.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat15 = texture(_LightTextureB0, vec2(u_xlat22)).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_0 = inversesqrt(u_xlat16_0);
    u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_5.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_5.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump float u_xlat16_13;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0 = (-_LightShadowData.x) + 1.0;
    u_xlat6.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat13 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat13 = _ZBufferParams.x * u_xlat13 + _ZBufferParams.y;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_0 = u_xlat10_6 * u_xlat16_0 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = (-u_xlat6.z) * u_xlat13 + u_xlat6.x;
    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat2.z;
    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat6.x + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat0.z<0.0);
#else
    u_xlatb12 = u_xlat0.z<0.0;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat6.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat13 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19 = u_xlat13 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat19)).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump float u_xlat16_13;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0 = (-_LightShadowData.x) + 1.0;
    u_xlat6.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat6.xyz = u_xlat6.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat13 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat13 = _ZBufferParams.x * u_xlat13 + _ZBufferParams.y;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat2.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat10_6 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat16_0 = u_xlat10_6 * u_xlat16_0 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat6.x = (-u_xlat6.z) * u_xlat13 + u_xlat6.x;
    u_xlat6.x = unity_ShadowFadeCenterAndType.w * u_xlat6.x + u_xlat2.z;
    u_xlat6.x = u_xlat6.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat6.x + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat0.z<0.0);
#else
    u_xlatb12 = u_xlat0.z<0.0;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat6.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat13 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat19 = u_xlat13 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat13 = texture(_LightTextureB0, vec2(u_xlat19)).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _ShadowOffsets[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump float u_xlat16_8;
float u_xlat16;
bool u_xlatb16;
float u_xlat17;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat24 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat24 = _ZBufferParams.x * u_xlat24 + _ZBufferParams.y;
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat4.xyz = u_xlat3.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[2].xyz;
    u_xlat3.xyz = u_xlat3.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_8 = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_8 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat8.x = sqrt(u_xlat8.x);
    u_xlat8.x = (-u_xlat0.z) * u_xlat24 + u_xlat8.x;
    u_xlat8.x = unity_ShadowFadeCenterAndType.w * u_xlat8.x + u_xlat2.z;
    u_xlat8.x = u_xlat8.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat8.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat0.z<0.0);
#else
    u_xlatb16 = u_xlat0.z<0.0;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat16 * u_xlat0.x;
    u_xlat8.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat17 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat25 = u_xlat17 * _LightPos.w;
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat17);
    u_xlat17 = texture(_LightTextureB0, vec2(u_xlat25)).w;
    u_xlat0.x = u_xlat0.x * u_xlat17;
    u_xlat0.x = u_xlat16_6.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0 = inversesqrt(u_xlat16_0);
    u_xlat16_4.xyz = vec3(u_xlat16_0) * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_4.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_4.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _ShadowOffsets[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat4.xyz = u_xlat3.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[2].xyz;
    u_xlat3.xyz = u_xlat3.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_7 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat7.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat15 = texture(_LightTextureB0, vec2(u_xlat22)).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat0.x = u_xlat16_6 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	vec4 _ShadowOffsets[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTexture0;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform lowp sampler2D _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3 = u_xlat2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[0] * u_xlat2.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_WorldToShadow[2] * u_xlat2.wwww + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat4.xyz = u_xlat3.xyz + _ShadowOffsets[0].xyz;
    vec3 txVec0 = vec3(u_xlat4.xy,u_xlat4.z);
    u_xlat4.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[1].xyz;
    vec3 txVec1 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat5.xyz = u_xlat3.xyz + _ShadowOffsets[2].xyz;
    u_xlat3.xyz = u_xlat3.xyz + _ShadowOffsets[3].xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat4.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    vec3 txVec3 = vec3(u_xlat5.xy,u_xlat5.z);
    u_xlat4.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_7 = (-_LightShadowData.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_7 + _LightShadowData.x;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyw * u_xlat2.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyw * u_xlat2.www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat0.z<0.0);
#else
    u_xlatb14 = u_xlat0.z<0.0;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat7.xyz = (-u_xlat2.xyw) + _LightPos.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat15 = texture(_LightTextureB0, vec2(u_xlat22)).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat0.x = u_xlat16_6 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_5.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat6.x = inversesqrt(u_xlat6.x);
    u_xlat6.xyz = u_xlat6.xxx * u_xlat3.xyz;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat13 = dot((-u_xlat6.xyz), u_xlat16_2.xyz);
    u_xlat13 = u_xlat13 + u_xlat13;
    u_xlat6.xyz = u_xlat16_2.xyz * (-vec3(u_xlat13)) + (-u_xlat6.xyz);
    u_xlat13 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat6.xyz, (-_LightDir.xyz));
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat2.x = u_xlat6.x * u_xlat6.x;
    u_xlat10_3 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat2.y = (-u_xlat10_3.w) + 1.0;
    u_xlat6.x = texture(unity_NHxRoughness, u_xlat2.xy).w;
    u_xlat6.x = u_xlat6.x * 16.0;
    u_xlat10_2.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat10_12 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4.x = u_xlat0.x + u_xlat10_12;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat16_4.xxx * _LightColor.xyz;
    u_xlat16_4.xyz = vec3(u_xlat13) * u_xlat0.xzw;
    u_xlat16_5.xyz = u_xlat6.xxx * u_xlat10_3.xyz + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat10;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xyz = (-u_xlat3.xyz) * u_xlat5.xxx + (-_LightDir.xyz);
    u_xlat11 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat11 = max(u_xlat11, 0.00100000005);
    u_xlat11 = inversesqrt(u_xlat11);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat11);
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    u_xlat16_2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat11 = dot(u_xlat16_2.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat5.x = dot((-_LightDir.xyz), u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = max(u_xlat5.x, 0.319999993);
    u_xlat10 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat11 * u_xlat11;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_11 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11 + 1.5;
    u_xlat5.x = u_xlat5.x * u_xlat16_11;
    u_xlat16_11 = u_xlat16_16 * u_xlat16_16 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat5.x = u_xlat16_16 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x + -9.99999975e-05;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = min(u_xlat5.x, 100.0);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat10_15 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_15;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat16_4) * _LightColor.xyz;
    u_xlat0.xyw = u_xlat5.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
float u_xlat10;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat5.xyz = (-u_xlat3.xyz) * u_xlat5.xxx + (-_LightDir.xyz);
    u_xlat11 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat11 = max(u_xlat11, 0.00100000005);
    u_xlat11 = inversesqrt(u_xlat11);
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat11);
    u_xlat10_2.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_11 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_11 = inversesqrt(u_xlat16_11);
    u_xlat16_2.xyz = vec3(u_xlat16_11) * u_xlat16_2.xyz;
    u_xlat11 = dot(u_xlat16_2.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat5.x = dot((-_LightDir.xyz), u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = max(u_xlat5.x, 0.319999993);
    u_xlat10 = dot(u_xlat16_2.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat11 * u_xlat11;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_11 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_11;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11 + 1.5;
    u_xlat5.x = u_xlat5.x * u_xlat16_11;
    u_xlat16_11 = u_xlat16_16 * u_xlat16_16 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat5.x = u_xlat16_16 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x + -9.99999975e-05;
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = min(u_xlat5.x, 100.0);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat10_15 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_15;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat16_4) * _LightColor.xyz;
    u_xlat0.xyw = u_xlat5.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyw = u_xlat1.xyz * u_xlat0.xyw;
    u_xlat0.xyz = vec3(u_xlat10) * u_xlat0.xyw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp float u_xlat10_6;
float u_xlat18;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10_6 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4.x = u_xlat0.x + u_xlat10_6;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat2.ww + u_xlat0.xy;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat16_4.x;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat18 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat18 = dot((-u_xlat0.xyz), u_xlat16_3.xyz);
    u_xlat18 = u_xlat18 + u_xlat18;
    u_xlat0.xyz = u_xlat16_3.xyz * (-vec3(u_xlat18)) + (-u_xlat0.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, (-_LightDir.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
lowp float u_xlat10_5;
mediump float u_xlat16_6;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat2.ww + u_xlat0.xy;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-_LightDir.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat15 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat11 = max(u_xlat11, 0.319999993);
    u_xlat16 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat11;
    u_xlat16_11 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightDir;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _ShadowMapTexture;
uniform highp sampler2D _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_3;
mediump float u_xlat16_4;
lowp float u_xlat10_5;
mediump float u_xlat16_6;
float u_xlat11;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat16;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat15 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat15 = _ZBufferParams.x * u_xlat15 + _ZBufferParams.y;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat15 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat1.xy).x;
    u_xlat16_4 = u_xlat0.x + u_xlat10_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * u_xlat2.xx + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * u_xlat2.ww + u_xlat0.xy;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.xy = u_xlat0.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat0.x = texture(_LightTexture0, u_xlat0.xy, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat16_4;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = (-u_xlat2.xyz) * vec3(u_xlat15) + (-_LightDir.xyz);
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 0.00100000005);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat10_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_3.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz;
    u_xlat15 = dot(u_xlat16_3.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat11 = dot((-_LightDir.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11 = min(max(u_xlat11, 0.0), 1.0);
#else
    u_xlat11 = clamp(u_xlat11, 0.0, 1.0);
#endif
    u_xlat11 = max(u_xlat11, 0.319999993);
    u_xlat16 = dot(u_xlat16_3.xyz, (-_LightDir.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat16 = min(max(u_xlat16, 0.0), 1.0);
#else
    u_xlat16 = clamp(u_xlat16, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_6 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat11;
    u_xlat16_11 = u_xlat16_6 * u_xlat16_6 + -1.0;
    u_xlat15 = u_xlat15 * u_xlat16_11 + 1.00001001;
    u_xlat15 = u_xlat15 * u_xlat1.x;
    u_xlat15 = u_xlat16_6 / u_xlat15;
    u_xlat15 = u_xlat15 + -9.99999975e-05;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat15 = min(u_xlat15, 100.0);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat15;
bool u_xlatb15;
float u_xlat21;
float u_xlat22;
float u_xlat23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat7.xyz);
    u_xlat15 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat23 = sqrt(u_xlat22);
    u_xlat23 = u_xlat23 * _LightPositionRange.w;
    u_xlat23 = u_xlat23 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<u_xlat23);
#else
    u_xlatb15 = u_xlat15<u_xlat23;
#endif
    u_xlat16_4.x = (u_xlatb15) ? _LightShadowData.x : 1.0;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat22 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat22);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_0 = inversesqrt(u_xlat16_0);
    u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_5.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_5.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat7.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_7;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = (-u_xlat0.z) * u_xlat18 + u_xlat6;
    u_xlat6 = unity_ShadowFadeCenterAndType.w * u_xlat6 + u_xlat2.z;
    u_xlat6 = u_xlat6 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat12 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xyz);
    u_xlat18 = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat0.xxx + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0 = inversesqrt(u_xlat16_0);
    u_xlat16_4.xyz = vec3(u_xlat16_0) * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = dot((-u_xlat2.xyz), u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat16_4.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat13 = max(u_xlat13, 0.319999993);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_7 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat13;
    u_xlat16_13 = u_xlat16_7 * u_xlat16_7 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_13 + 1.00001001;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat16_7 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.x = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 * _LightPos.w;
    u_xlat12 = texture(_LightTextureB0, vec2(u_xlat12)).w;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat18<u_xlat0.x);
#else
    u_xlatb0 = u_xlat18<u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? _LightShadowData.x : 1.0;
    u_xlat16_5 = u_xlat6 + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat12 * u_xlat16_5;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat19) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec3 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
float u_xlat6;
mediump float u_xlat16_7;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
float u_xlat18;
float u_xlat19;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyw = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat6 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat6 = sqrt(u_xlat6);
    u_xlat6 = (-u_xlat0.z) * u_xlat18 + u_xlat6;
    u_xlat6 = unity_ShadowFadeCenterAndType.w * u_xlat6 + u_xlat2.z;
    u_xlat6 = u_xlat6 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat12 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat18 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat4.xyz;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xyz);
    u_xlat18 = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat3.xyz = (-u_xlat3.xyz) * u_xlat0.xxx + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0 = inversesqrt(u_xlat16_0);
    u_xlat16_4.xyz = vec3(u_xlat16_0) * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat13 = dot((-u_xlat2.xyz), u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat19 = dot(u_xlat16_4.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat19 = min(max(u_xlat19, 0.0), 1.0);
#else
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
#endif
    u_xlat13 = max(u_xlat13, 0.319999993);
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_3.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_1 = (-u_xlat10_2.w) + 1.0;
    u_xlat16_7 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1 + 1.5;
    u_xlat1.x = u_xlat16_1 * u_xlat13;
    u_xlat16_13 = u_xlat16_7 * u_xlat16_7 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat16_13 + 1.00001001;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = u_xlat16_7 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat0.x = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 * _LightPos.w;
    u_xlat12 = texture(_LightTextureB0, vec2(u_xlat12)).w;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = u_xlat0.x * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat18<u_xlat0.x);
#else
    u_xlatb0 = u_xlat18<u_xlat0.x;
#endif
    u_xlat16_5 = (u_xlatb0) ? _LightShadowData.x : 1.0;
    u_xlat16_5 = u_xlat6 + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat12 * u_xlat16_5;
    u_xlat0.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = vec3(u_xlat19) * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat15;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_3 = textureLod(_ShadowMapTexture, u_xlat3.xyz, 0.0);
    u_xlat3.x = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.y = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.z = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.w = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = sqrt(u_xlat15);
    u_xlat22 = u_xlat22 * _LightPositionRange.w;
    u_xlat22 = u_xlat22 * _LightProjectionParams.w;
    u_xlatb3 = lessThan(u_xlat3, vec4(u_xlat22));
    u_xlat3.x = (u_xlatb3.x) ? _LightShadowData.x : float(1.0);
    u_xlat3.y = (u_xlatb3.y) ? _LightShadowData.x : float(1.0);
    u_xlat3.z = (u_xlatb3.z) ? _LightShadowData.x : float(1.0);
    u_xlat3.w = (u_xlatb3.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_5.x = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5.x = u_xlat0.x + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_5.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_0 = inversesqrt(u_xlat16_0);
    u_xlat16_4.xyz = vec3(u_xlat16_0) * u_xlat16_4.xyz;
    u_xlat0.x = dot(u_xlat16_4.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_4.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_4.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat7.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_3 = textureLod(_ShadowMapTexture, u_xlat3.xyz, 0.0);
    u_xlat3.x = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.y = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.z = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.w = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = sqrt(u_xlat15);
    u_xlat22 = u_xlat22 * _LightPositionRange.w;
    u_xlat22 = u_xlat22 * _LightProjectionParams.w;
    u_xlatb3 = lessThan(u_xlat3, vec4(u_xlat22));
    u_xlat3.x = (u_xlatb3.x) ? _LightShadowData.x : float(1.0);
    u_xlat3.y = (u_xlatb3.y) ? _LightShadowData.x : float(1.0);
    u_xlat3.z = (u_xlatb3.z) ? _LightShadowData.x : float(1.0);
    u_xlat3.w = (u_xlatb3.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_5 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5 = u_xlat0.x + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_5 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_6.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_6.xyz = vec3(u_xlat16_23) * u_xlat16_6.xyz;
    u_xlat2.x = dot(u_xlat16_6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_6.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
bvec4 u_xlatb3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_3 = textureLod(_ShadowMapTexture, u_xlat3.xyz, 0.0);
    u_xlat3.x = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.y = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.z = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat4.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat3.w = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat15 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat22 = sqrt(u_xlat15);
    u_xlat22 = u_xlat22 * _LightPositionRange.w;
    u_xlat22 = u_xlat22 * _LightProjectionParams.w;
    u_xlatb3 = lessThan(u_xlat3, vec4(u_xlat22));
    u_xlat3.x = (u_xlatb3.x) ? _LightShadowData.x : float(1.0);
    u_xlat3.y = (u_xlatb3.y) ? _LightShadowData.x : float(1.0);
    u_xlat3.z = (u_xlatb3.z) ? _LightShadowData.x : float(1.0);
    u_xlat3.w = (u_xlatb3.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_5 = dot(u_xlat3, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_5 = u_xlat0.x + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat15 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_5 * u_xlat0.x;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat7.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat0.x = u_xlat0.x * u_xlat16_22;
    u_xlat10_6.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_6.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_6.xyz = vec3(u_xlat16_23) * u_xlat16_6.xyz;
    u_xlat2.x = dot(u_xlat16_6.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat7.x = dot(u_xlat16_6.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat0.x = u_xlat14 * u_xlat0.x;
    u_xlat0.x = u_xlat16_15 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat7.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat21 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat7.xyz);
    u_xlat15 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16 = sqrt(u_xlat22);
    u_xlat16 = u_xlat16 * _LightPositionRange.w;
    u_xlat16 = u_xlat16 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<u_xlat16);
#else
    u_xlatb15 = u_xlat15<u_xlat16;
#endif
    u_xlat16_4.x = (u_xlatb15) ? _LightShadowData.x : 1.0;
    u_xlat16_4.x = u_xlat0.x + u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.x = min(max(u_xlat16_4.x, 0.0), 1.0);
#else
    u_xlat16_4.x = clamp(u_xlat16_4.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat22 * _LightPos.w;
    u_xlat15 = inversesqrt(u_xlat22);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat15);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4.x * u_xlat0.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat15 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat15;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_0 = inversesqrt(u_xlat16_0);
    u_xlat16_5.xyz = vec3(u_xlat16_0) * u_xlat16_5.xyz;
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat7.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat2.xyz), u_xlat16_5.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat2.xyz = u_xlat16_5.xyz * (-u_xlat0.xxx) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat7.xyz));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat13 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat19 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14 = sqrt(u_xlat19);
    u_xlat14 = u_xlat14 * _LightPositionRange.w;
    u_xlat14 = u_xlat14 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13<u_xlat14);
#else
    u_xlatb13 = u_xlat13<u_xlat14;
#endif
    u_xlat16_4 = (u_xlatb13) ? _LightShadowData.x : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat19 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat19);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat13 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat6.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, (-u_xlat6.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
mediump float u_xlat16_4;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
float u_xlat19;
mediump float u_xlat16_19;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.z) * u_xlat18 + u_xlat0.x;
    u_xlat0.x = unity_ShadowFadeCenterAndType.w * u_xlat0.x + u_xlat2.z;
    u_xlat0.x = u_xlat0.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat10_3 = texture(_ShadowMapTexture, u_xlat6.xyz);
    u_xlat13 = dot(u_xlat10_3, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat19 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14 = sqrt(u_xlat19);
    u_xlat14 = u_xlat14 * _LightPositionRange.w;
    u_xlat14 = u_xlat14 * _LightProjectionParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13<u_xlat14);
#else
    u_xlatb13 = u_xlat13<u_xlat14;
#endif
    u_xlat16_4 = (u_xlatb13) ? _LightShadowData.x : 1.0;
    u_xlat16_4 = u_xlat0.x + u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4 = min(max(u_xlat16_4, 0.0), 1.0);
#else
    u_xlat16_4 = clamp(u_xlat16_4, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat19 * _LightPos.w;
    u_xlat13 = inversesqrt(u_xlat19);
    u_xlat6.xyz = u_xlat6.xyz * vec3(u_xlat13);
    u_xlat0.x = texture(_LightTextureB0, u_xlat0.xx).w;
    u_xlat0.x = u_xlat16_4 * u_xlat0.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat13 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat0.x = u_xlat0.x * u_xlat13;
    u_xlat3.xyz = u_xlat0.xxx * _LightColor.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat0.xxx + (-u_xlat6.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.x = dot((-u_xlat6.xyz), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_13 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_19 = u_xlat16_13 * u_xlat16_13 + 1.5;
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat0.x = u_xlat0.x * u_xlat16_19;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_20 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_20 = inversesqrt(u_xlat16_20);
    u_xlat16_5.xyz = vec3(u_xlat16_20) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat16_5.xyz, (-u_xlat6.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat2.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_13 * u_xlat16_13 + -1.0;
    u_xlat12 = u_xlat12 * u_xlat16_18 + 1.00001001;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = u_xlat16_13 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + -9.99999975e-05;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = min(u_xlat0.x, 100.0);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat0.xzw = u_xlat3.xyz * u_xlat0.xzw;
    u_xlat0.xyz = u_xlat6.xxx * u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform highp sampler2D unity_NHxRoughness;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
lowp vec4 u_xlat10_4;
bvec4 u_xlatb4;
vec3 u_xlat5;
lowp vec4 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat8;
mediump float u_xlat16_8;
float u_xlat17;
float u_xlat24;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat24 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat24 = _ZBufferParams.x * u_xlat24 + _ZBufferParams.y;
    u_xlat24 = float(1.0) / u_xlat24;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat4.xyz = u_xlat3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat4.x = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.y = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.z = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.w = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat8 = sqrt(u_xlat0.x);
    u_xlat8 = u_xlat8 * _LightPositionRange.w;
    u_xlat8 = u_xlat8 * _LightProjectionParams.w;
    u_xlatb4 = lessThan(u_xlat4, vec4(u_xlat8));
    u_xlat4.x = (u_xlatb4.x) ? _LightShadowData.x : float(1.0);
    u_xlat4.y = (u_xlatb4.y) ? _LightShadowData.x : float(1.0);
    u_xlat4.z = (u_xlatb4.z) ? _LightShadowData.x : float(1.0);
    u_xlat4.w = (u_xlatb4.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_6.x = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat4.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat8 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat8 = sqrt(u_xlat8);
    u_xlat8 = (-u_xlat0.z) * u_xlat24 + u_xlat8;
    u_xlat8 = unity_ShadowFadeCenterAndType.w * u_xlat8 + u_xlat2.z;
    u_xlat8 = u_xlat8 * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat8 + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat8 = u_xlat0.x * _LightPos.w;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat8 = texture(_LightTextureB0, vec2(u_xlat8)).w;
    u_xlat8 = u_xlat16_6.x * u_xlat8;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat17 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat8 = u_xlat8 * u_xlat17;
    u_xlat3.xyz = vec3(u_xlat8) * _LightColor.xyz;
    u_xlat10_4.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_4.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_8 = inversesqrt(u_xlat16_8);
    u_xlat16_4.xyz = vec3(u_xlat16_8) * u_xlat16_4.xyz;
    u_xlat8 = dot(u_xlat16_4.xyz, (-u_xlat0.xzw));
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = vec3(u_xlat8) * u_xlat3.xyz;
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    u_xlat8 = dot((-u_xlat2.xyz), u_xlat16_4.xyz);
    u_xlat8 = u_xlat8 + u_xlat8;
    u_xlat2.xyz = u_xlat16_4.xyz * (-vec3(u_xlat8)) + (-u_xlat2.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, (-u_xlat0.xzw));
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat10_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat10_1.xyz = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat0.y = (-u_xlat10_2.w) + 1.0;
    u_xlat0.x = texture(unity_NHxRoughness, u_xlat0.xy).w;
    u_xlat0.x = u_xlat0.x * 16.0;
    u_xlat16_7.xyz = u_xlat0.xxx * u_xlat10_2.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
bvec4 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat4.xyz = u_xlat3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat4.x = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.y = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.z = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.w = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat0.x);
    u_xlat7.x = u_xlat7.x * _LightPositionRange.w;
    u_xlat7.x = u_xlat7.x * _LightProjectionParams.w;
    u_xlatb4 = lessThan(u_xlat4, u_xlat7.xxxx);
    u_xlat4.x = (u_xlatb4.x) ? _LightShadowData.x : float(1.0);
    u_xlat4.y = (u_xlatb4.y) ? _LightShadowData.x : float(1.0);
    u_xlat4.z = (u_xlatb4.z) ? _LightShadowData.x : float(1.0);
    u_xlat4.w = (u_xlatb4.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_6 = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat4.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * _LightPos.w;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat7.x = texture(_LightTextureB0, u_xlat7.xx).w;
    u_xlat7.x = u_xlat16_6 * u_xlat7.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat15 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat7.x = u_xlat7.x * u_xlat15;
    u_xlat3.xyz = u_xlat7.xxx * _LightColor.xyz;
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat7.x = dot((-u_xlat0.xzw), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = max(u_xlat7.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat7.x = u_xlat7.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xzw));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = u_xlat16_15 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x + -9.99999975e-05;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = min(u_xlat7.x, 100.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _LightPositionRange;
uniform 	vec4 _LightProjectionParams;
uniform 	mediump vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 _LightPos;
uniform 	vec4 _LightColor;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform highp sampler2D _CameraDepthTexture;
uniform highp sampler2D _LightTextureB0;
uniform highp samplerCube _LightTexture0;
uniform lowp sampler2D _CameraGBufferTexture0;
uniform lowp sampler2D _CameraGBufferTexture1;
uniform lowp sampler2D _CameraGBufferTexture2;
uniform lowp samplerCube _ShadowMapTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
bvec4 u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
float u_xlat14;
float u_xlat15;
mediump float u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat2.xyw = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat2.zzz + u_xlat2.xyw;
    u_xlat2.xyw = u_xlat2.xyw + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat3.xyz = u_xlat2.xyw + (-_LightPos.xyz);
    u_xlat4.xyz = u_xlat3.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
    u_xlat10_4 = textureLod(_ShadowMapTexture, u_xlat4.xyz, 0.0);
    u_xlat4.x = dot(u_xlat10_4, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.y = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.z = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat5.xyz = u_xlat3.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
    u_xlat10_5 = textureLod(_ShadowMapTexture, u_xlat5.xyz, 0.0);
    u_xlat4.w = dot(u_xlat10_5, vec4(1.0, 0.00392156886, 1.53787005e-05, 6.03086292e-08));
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat7.x = sqrt(u_xlat0.x);
    u_xlat7.x = u_xlat7.x * _LightPositionRange.w;
    u_xlat7.x = u_xlat7.x * _LightProjectionParams.w;
    u_xlatb4 = lessThan(u_xlat4, u_xlat7.xxxx);
    u_xlat4.x = (u_xlatb4.x) ? _LightShadowData.x : float(1.0);
    u_xlat4.y = (u_xlatb4.y) ? _LightShadowData.x : float(1.0);
    u_xlat4.z = (u_xlatb4.z) ? _LightShadowData.x : float(1.0);
    u_xlat4.w = (u_xlatb4.w) ? _LightShadowData.x : float(1.0);
    u_xlat16_6 = dot(u_xlat4, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat4.xyz = u_xlat2.xyw + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) * u_xlat21 + u_xlat7.x;
    u_xlat7.x = unity_ShadowFadeCenterAndType.w * u_xlat7.x + u_xlat2.z;
    u_xlat7.x = u_xlat7.x * _LightShadowData.z + _LightShadowData.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat16_6 = u_xlat7.x + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * _LightPos.w;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xzw = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat7.x = texture(_LightTextureB0, u_xlat7.xx).w;
    u_xlat7.x = u_xlat16_6 * u_xlat7.x;
    u_xlat3.xyz = u_xlat2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * u_xlat2.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * u_xlat2.www + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyw + (-_WorldSpaceCameraPos.xyz);
    u_xlat3.xyz = u_xlat3.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat15 = texture(_LightTexture0, u_xlat3.xyz, -8.0).w;
    u_xlat7.x = u_xlat7.x * u_xlat15;
    u_xlat3.xyz = u_xlat7.xxx * _LightColor.xyz;
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = (-u_xlat2.xyz) * u_xlat7.xxx + (-u_xlat0.xzw);
    u_xlat7.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat7.x = max(u_xlat7.x, 0.00100000005);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat2.xyz = u_xlat7.xxx * u_xlat2.xyz;
    u_xlat7.x = dot((-u_xlat0.xzw), u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat7.x = max(u_xlat7.x, 0.319999993);
    u_xlat10_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_15 = (-u_xlat10_4.w) + 1.0;
    u_xlat16_22 = u_xlat16_15 * u_xlat16_15 + 1.5;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat7.x = u_xlat7.x * u_xlat16_22;
    u_xlat10_5.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat10_1.xyw = texture(_CameraGBufferTexture0, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_23 = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_23 = inversesqrt(u_xlat16_23);
    u_xlat16_5.xyz = vec3(u_xlat16_23) * u_xlat16_5.xyz;
    u_xlat2.x = dot(u_xlat16_5.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat16_5.xyz, (-u_xlat0.xzw));
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat14 = u_xlat2.x * u_xlat2.x;
    u_xlat16_21 = u_xlat16_15 * u_xlat16_15 + -1.0;
    u_xlat14 = u_xlat14 * u_xlat16_21 + 1.00001001;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat7.x = u_xlat16_15 / u_xlat7.x;
    u_xlat7.x = u_xlat7.x + -9.99999975e-05;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat7.x = min(u_xlat7.x, 100.0);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat10_4.xyz + u_xlat10_1.xyw;
    u_xlat7.xyz = u_xlat3.xyz * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
Keywords { "SPOT" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" "SHADOWS_DEPTH" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "SHADOWS_SCREEN" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT_COOKIE" "SHADOWS_CUBE" "SHADOWS_SOFT" "UNITY_HDR_ON" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 66195
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _LightBuffer;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_LightBuffer, vs_TEXCOORD0.xy);
    u_xlat16_0 = log2(u_xlat10_0);
    SV_Target0 = (-u_xlat16_0);
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _LightBuffer;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_LightBuffer, vs_TEXCOORD0.xy);
    u_xlat16_0 = log2(u_xlat10_0);
    SV_Target0 = (-u_xlat16_0);
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _LightBuffer;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture(_LightBuffer, vs_TEXCOORD0.xy);
    u_xlat16_0 = log2(u_xlat10_0);
    SV_Target0 = (-u_xlat16_0);
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