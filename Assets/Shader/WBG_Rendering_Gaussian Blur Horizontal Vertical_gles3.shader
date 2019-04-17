Shader "WBG/Rendering/Gaussian Blur Horizontal Vertical" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 29750
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(-4.30908012, 0.0, -2.37531996, 0.0) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.0, 1.37531996, 0.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(3.30907989, 0.0) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.401870012, 0.401870012, 0.401870012, 0.401870012) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(-4.30908012, 0.0, -2.37531996, 0.0) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.0, 1.37531996, 0.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(3.30907989, 0.0) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.401870012, 0.401870012, 0.401870012, 0.401870012) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(-4.30908012, 0.0, -2.37531996, 0.0) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.0, 1.37531996, 0.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(3.30907989, 0.0) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.401870012, 0.401870012, 0.401870012, 0.401870012) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
 Pass {
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 104681
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(0.0, -4.30908012, 0.0, -2.37531996) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(0.0, -0.5, 0.0, 1.37531996) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(0.0, 3.30907989) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.401870012, 0.401870012, 0.401870012, 0.401870012) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(0.0, -4.30908012, 0.0, -2.37531996) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(0.0, -0.5, 0.0, 1.37531996) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(0.0, 3.30907989) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.401870012, 0.401870012, 0.401870012, 0.401870012) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(0.0, -4.30908012, 0.0, -2.37531996) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(0.0, -0.5, 0.0, 1.37531996) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(0.0, 3.30907989) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
lowp vec4 u_xlat10_1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_0 = u_xlat10_0 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.401870012, 0.401870012, 0.401870012, 0.401870012) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.244038001, 0.244038001, 0.244038001, 0.244038001) + u_xlat16_0;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_0 = u_xlat10_1 * vec4(0.055027999, 0.055027999, 0.055027999, 0.055027999) + u_xlat16_0;
    SV_Target0 = u_xlat16_0;
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
 Pass {
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 140084
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(-4.30908012, 0.0, -2.37531996, 0.0) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.0, 1.37531996, 0.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(3.30907989, 0.0) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_0.w = u_xlat10_0.w * 0.055027999;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.401870012;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.401870012, 0.401870012, 0.401870012);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.055027999;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    SV_Target0.xyz = sqrt(u_xlat16_0.xyz);
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(-4.30908012, 0.0, -2.37531996, 0.0) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.0, 1.37531996, 0.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(3.30907989, 0.0) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_0.w = u_xlat10_0.w * 0.055027999;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.401870012;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.401870012, 0.401870012, 0.401870012);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.055027999;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    SV_Target0.xyz = sqrt(u_xlat16_0.xyz);
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(-4.30908012, 0.0, -2.37531996, 0.0) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.0, 1.37531996, 0.0) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(3.30907989, 0.0) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_0.w = u_xlat10_0.w * 0.055027999;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.401870012;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.401870012, 0.401870012, 0.401870012);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.055027999;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    SV_Target0.xyz = sqrt(u_xlat16_0.xyz);
    SV_Target0.w = u_xlat16_0.w;
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
 Pass {
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 208079
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(0.0, -4.30908012, 0.0, -2.37531996) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(0.0, -0.5, 0.0, 1.37531996) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(0.0, 3.30907989) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_0.w = u_xlat10_0.w * 0.055027999;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.401870012;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.401870012, 0.401870012, 0.401870012);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.055027999;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    SV_Target0.xyz = sqrt(u_xlat16_0.xyz);
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(0.0, -4.30908012, 0.0, -2.37531996) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(0.0, -0.5, 0.0, 1.37531996) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(0.0, 3.30907989) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_0.w = u_xlat10_0.w * 0.055027999;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.401870012;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.401870012, 0.401870012, 0.401870012);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.055027999;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    SV_Target0.xyz = sqrt(u_xlat16_0.xyz);
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	mediump vec4 _MainTex_TexelSize;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
mediump  vec4 phase0_Output0_1;
out mediump vec2 vs_TEXCOORD1;
out mediump vec2 vs_TEXCOORD2;
mediump  vec4 phase0_Output0_2;
out mediump vec2 vs_TEXCOORD3;
out mediump vec2 vs_TEXCOORD4;
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
    phase0_Output0_1 = _MainTex_TexelSize.xyxy * vec4(0.0, -4.30908012, 0.0, -2.37531996) + in_TEXCOORD0.xyxy;
    phase0_Output0_2 = _MainTex_TexelSize.xyxy * vec4(0.0, -0.5, 0.0, 1.37531996) + in_TEXCOORD0.xyxy;
    vs_TEXCOORD4.xy = _MainTex_TexelSize.xy * vec2(0.0, 3.30907989) + in_TEXCOORD0.xy;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
vs_TEXCOORD2 = phase0_Output0_2.xy;
vs_TEXCOORD3 = phase0_Output0_2.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec2 vs_TEXCOORD2;
in mediump vec2 vs_TEXCOORD3;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat10_0.xyz;
    u_xlat16_0.w = u_xlat10_0.w * 0.055027999;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD2.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.401870012;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.401870012, 0.401870012, 0.401870012);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.244038001;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.244038001, 0.244038001, 0.244038001);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD4.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat10_1.xyz;
    u_xlat16_1.w = u_xlat10_1.w * 0.055027999;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.055027999, 0.055027999, 0.055027999);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    SV_Target0.xyz = sqrt(u_xlat16_0.xyz);
    SV_Target0.w = u_xlat16_0.w;
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