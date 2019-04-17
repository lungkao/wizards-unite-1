Shader "Hidden/NatCorder/AspectFitter" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 15047
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec2 aspectCorrection;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy * aspectCorrection.xy + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
bvec2 u_xlatb2;
void main()
{
    u_xlatb0.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
    u_xlatb0.x = u_xlatb2.x || u_xlatb0.x;
    u_xlatb0.x = u_xlatb0.y || u_xlatb0.x;
    u_xlatb0.x = u_xlatb2.y || u_xlatb0.x;
    if(u_xlatb0.x){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    } else {
        u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat10_0;
        return;
    //ENDIF
    }
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
uniform 	vec2 aspectCorrection;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy * aspectCorrection.xy + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
bvec2 u_xlatb2;
void main()
{
    u_xlatb0.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
    u_xlatb0.x = u_xlatb2.x || u_xlatb0.x;
    u_xlatb0.x = u_xlatb0.y || u_xlatb0.x;
    u_xlatb0.x = u_xlatb2.y || u_xlatb0.x;
    if(u_xlatb0.x){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    } else {
        u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat10_0;
        return;
    //ENDIF
    }
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
uniform 	vec2 aspectCorrection;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
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
    u_xlat0.xy = in_TEXCOORD0.xy + vec2(-0.5, -0.5);
    vs_TEXCOORD0.xy = u_xlat0.xy * aspectCorrection.xy + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform lowp sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
lowp vec4 u_xlat10_0;
bvec2 u_xlatb0;
bvec2 u_xlatb2;
void main()
{
    u_xlatb0.xy = lessThan(vs_TEXCOORD0.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb2.xy = lessThan(vec4(1.0, 1.0, 1.0, 1.0), vs_TEXCOORD0.xyxy).xy;
    u_xlatb0.x = u_xlatb2.x || u_xlatb0.x;
    u_xlatb0.x = u_xlatb0.y || u_xlatb0.x;
    u_xlatb0.x = u_xlatb2.y || u_xlatb0.x;
    if(u_xlatb0.x){
        SV_Target0 = vec4(0.0, 0.0, 0.0, 1.0);
        return;
    } else {
        u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
        SV_Target0 = u_xlat10_0;
        return;
    //ENDIF
    }
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