Shader "WBG/ImageEffects/ImageBlend YUV2RGB" {
Properties {
_TextureY ("Texture Y", 2D) = "white" { }
_TextureCbCr ("Texture CbCr", 2D) = "black" { }
_DetailTex ("Color Buffer RGBA", 2D) = "black" { }
_BlendBias ("Blend Bias", Float) = 0
_ColorGradingTint ("Color Grading", Color) = (1,1,1,1)
}
SubShader {
 Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  GpuProgramID 29602
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4_DisplayTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec3 u_xlat0;
float u_xlat3;
void main()
{
    gl_Position = in_POSITION0;
    u_xlat0.x = dot(hlslcc_mtx4x4_DisplayTransform[0].xy, in_TEXCOORD0.xy);
    u_xlat0.y = u_xlat0.x + hlslcc_mtx4x4_DisplayTransform[0].z;
    u_xlat3 = dot(hlslcc_mtx4x4_DisplayTransform[1].xy, in_TEXCOORD0.xy);
    u_xlat0.z = u_xlat3 + hlslcc_mtx4x4_DisplayTransform[1].z;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    phase0_Output0_1.xyz = u_xlat0.xyz;
vs_TEXCOORD0 = phase0_Output0_1.x;
vs_TEXCOORD1 = phase0_Output0_1.yz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _TextureY;
uniform lowp sampler2D _TextureCbCr;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0 + -0.25;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0 * -2.0 + 3.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
    u_xlat16_0 = u_xlat16_4.x * u_xlat16_0 + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 * _ColorGradingTint.w;
    u_xlat1.x = texture(_TextureY, vs_TEXCOORD1.xy).x;
    u_xlat1.yz = texture(_TextureCbCr, vs_TEXCOORD1.xy).xy;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(vec3(1.0, 1.40199995, -0.700999975), u_xlat1.xzw);
    u_xlat2.y = dot(vec4(1.0, -0.344099998, -0.714100003, 0.529100001), u_xlat1);
    u_xlat2.z = dot(vec3(1.0, 1.77199996, -0.885999978), u_xlat1.xyw);
    u_xlat16_4.x = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_4.xyz = u_xlat16_4.xxx * _ColorGradingTint.xyz + (-u_xlat2.xyz);
    u_xlat16_4.xyz = _ColorGradingTint.www * u_xlat16_4.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + _ColorGradingTint.xyz;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_3.xyz + u_xlat16_4.xyz;
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

uniform 	vec4 hlslcc_mtx4x4_DisplayTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec3 u_xlat0;
float u_xlat3;
void main()
{
    gl_Position = in_POSITION0;
    u_xlat0.x = dot(hlslcc_mtx4x4_DisplayTransform[0].xy, in_TEXCOORD0.xy);
    u_xlat0.y = u_xlat0.x + hlslcc_mtx4x4_DisplayTransform[0].z;
    u_xlat3 = dot(hlslcc_mtx4x4_DisplayTransform[1].xy, in_TEXCOORD0.xy);
    u_xlat0.z = u_xlat3 + hlslcc_mtx4x4_DisplayTransform[1].z;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    phase0_Output0_1.xyz = u_xlat0.xyz;
vs_TEXCOORD0 = phase0_Output0_1.x;
vs_TEXCOORD1 = phase0_Output0_1.yz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _TextureY;
uniform lowp sampler2D _TextureCbCr;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0 + -0.25;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0 * -2.0 + 3.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
    u_xlat16_0 = u_xlat16_4.x * u_xlat16_0 + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 * _ColorGradingTint.w;
    u_xlat1.x = texture(_TextureY, vs_TEXCOORD1.xy).x;
    u_xlat1.yz = texture(_TextureCbCr, vs_TEXCOORD1.xy).xy;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(vec3(1.0, 1.40199995, -0.700999975), u_xlat1.xzw);
    u_xlat2.y = dot(vec4(1.0, -0.344099998, -0.714100003, 0.529100001), u_xlat1);
    u_xlat2.z = dot(vec3(1.0, 1.77199996, -0.885999978), u_xlat1.xyw);
    u_xlat16_4.x = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_4.xyz = u_xlat16_4.xxx * _ColorGradingTint.xyz + (-u_xlat2.xyz);
    u_xlat16_4.xyz = _ColorGradingTint.www * u_xlat16_4.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + _ColorGradingTint.xyz;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_3.xyz + u_xlat16_4.xyz;
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

uniform 	vec4 hlslcc_mtx4x4_DisplayTransform[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump float vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
vec3 u_xlat0;
float u_xlat3;
void main()
{
    gl_Position = in_POSITION0;
    u_xlat0.x = dot(hlslcc_mtx4x4_DisplayTransform[0].xy, in_TEXCOORD0.xy);
    u_xlat0.y = u_xlat0.x + hlslcc_mtx4x4_DisplayTransform[0].z;
    u_xlat3 = dot(hlslcc_mtx4x4_DisplayTransform[1].xy, in_TEXCOORD0.xy);
    u_xlat0.z = u_xlat3 + hlslcc_mtx4x4_DisplayTransform[1].z;
    u_xlat0.x = in_POSITION0.y * 0.5 + 0.5;
    phase0_Output0_1.xyz = u_xlat0.xyz;
vs_TEXCOORD0 = phase0_Output0_1.x;
vs_TEXCOORD1 = phase0_Output0_1.yz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump vec4 _ColorGradingTint;
uniform 	mediump float _BlendBias;
uniform lowp sampler2D _TextureY;
uniform lowp sampler2D _TextureCbCr;
in mediump float vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0 = vs_TEXCOORD0 + -0.25;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_4.x = u_xlat16_0 * -2.0 + 3.0;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_0;
    u_xlat16_0 = u_xlat16_4.x * u_xlat16_0 + _BlendBias;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 * _ColorGradingTint.w;
    u_xlat1.x = texture(_TextureY, vs_TEXCOORD1.xy).x;
    u_xlat1.yz = texture(_TextureCbCr, vs_TEXCOORD1.xy).xy;
    u_xlat1.w = 1.0;
    u_xlat2.x = dot(vec3(1.0, 1.40199995, -0.700999975), u_xlat1.xzw);
    u_xlat2.y = dot(vec4(1.0, -0.344099998, -0.714100003, 0.529100001), u_xlat1);
    u_xlat2.z = dot(vec3(1.0, 1.77199996, -0.885999978), u_xlat1.xyw);
    u_xlat16_4.x = dot(u_xlat2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_4.xyz = u_xlat16_4.xxx * _ColorGradingTint.xyz + (-u_xlat2.xyz);
    u_xlat16_4.xyz = _ColorGradingTint.www * u_xlat16_4.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_4.xyz) + _ColorGradingTint.xyz;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_3.xyz + u_xlat16_4.xyz;
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