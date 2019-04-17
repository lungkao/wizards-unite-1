Shader "WBG/UI/Transparent Stylized Fade Transition UI" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_DestinationTex ("Destination Texture", 2D) = "black" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
_TransitionProgress ("Transition Progress", Range(0, 1)) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 2584
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _TransitionProgress;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DestinationTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
int u_xlati2;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat16_0.xy = u_xlat16_0.xy * vec2(_TransitionProgress);
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlati2 = 0;
    while(true){
        u_xlat16_6.x = float(u_xlati2);
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat16_6.x>=20.0);
#else
        u_xlatb5 = u_xlat16_6.x>=20.0;
#endif
        if(u_xlatb5){break;}
        u_xlat16_6.xy = u_xlat16_6.xx * u_xlat16_0.xy;
        u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.0500000007, 0.0500000007) + vs_TEXCOORD0.xy;
        u_xlat10_5.xyz = texture(_MainTex, u_xlat16_6.xy).xyz;
        u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_5.xyz;
        u_xlati2 = u_xlati2 + 1;
        u_xlat16_1.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat10_2.xyz = texture(_DestinationTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9 = _TransitionProgress + -0.5;
    u_xlat16_9 = u_xlat16_9 + u_xlat16_9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_9 * -2.0 + 3.0;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_10;
    u_xlat16_1.xyz = (-u_xlat16_1.xyz) * vec3(0.0500000007, 0.0500000007, 0.0500000007) + u_xlat10_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_9) * u_xlat16_1.xyz + u_xlat16_0.xyz;
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
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _TransitionProgress;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DestinationTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
int u_xlati2;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat16_0.xy = u_xlat16_0.xy * vec2(_TransitionProgress);
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlati2 = 0;
    while(true){
        u_xlat16_6.x = float(u_xlati2);
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat16_6.x>=20.0);
#else
        u_xlatb5 = u_xlat16_6.x>=20.0;
#endif
        if(u_xlatb5){break;}
        u_xlat16_6.xy = u_xlat16_6.xx * u_xlat16_0.xy;
        u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.0500000007, 0.0500000007) + vs_TEXCOORD0.xy;
        u_xlat10_5.xyz = texture(_MainTex, u_xlat16_6.xy).xyz;
        u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_5.xyz;
        u_xlati2 = u_xlati2 + 1;
        u_xlat16_1.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat10_2.xyz = texture(_DestinationTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9 = _TransitionProgress + -0.5;
    u_xlat16_9 = u_xlat16_9 + u_xlat16_9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_9 * -2.0 + 3.0;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_10;
    u_xlat16_1.xyz = (-u_xlat16_1.xyz) * vec3(0.0500000007, 0.0500000007, 0.0500000007) + u_xlat10_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_9) * u_xlat16_1.xyz + u_xlat16_0.xyz;
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
uniform 	mediump vec4 _Color;
in mediump vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0 * _Color;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
uniform 	mediump float _TransitionProgress;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DestinationTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
int u_xlati2;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_9;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0.xy = (-vs_TEXCOORD0.xy) + vec2(0.5, 0.5);
    u_xlat16_0.xy = u_xlat16_0.xy * vec2(_TransitionProgress);
    u_xlat16_1.x = float(0.0);
    u_xlat16_1.y = float(0.0);
    u_xlat16_1.z = float(0.0);
    u_xlati2 = 0;
    while(true){
        u_xlat16_6.x = float(u_xlati2);
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(u_xlat16_6.x>=20.0);
#else
        u_xlatb5 = u_xlat16_6.x>=20.0;
#endif
        if(u_xlatb5){break;}
        u_xlat16_6.xy = u_xlat16_6.xx * u_xlat16_0.xy;
        u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.0500000007, 0.0500000007) + vs_TEXCOORD0.xy;
        u_xlat10_5.xyz = texture(_MainTex, u_xlat16_6.xy).xyz;
        u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat10_5.xyz;
        u_xlati2 = u_xlati2 + 1;
        u_xlat16_1.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007);
    u_xlat10_2.xyz = texture(_DestinationTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_9 = _TransitionProgress + -0.5;
    u_xlat16_9 = u_xlat16_9 + u_xlat16_9;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9 = min(max(u_xlat16_9, 0.0), 1.0);
#else
    u_xlat16_9 = clamp(u_xlat16_9, 0.0, 1.0);
#endif
    u_xlat16_10 = u_xlat16_9 * -2.0 + 3.0;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_9;
    u_xlat16_9 = u_xlat16_9 * u_xlat16_10;
    u_xlat16_1.xyz = (-u_xlat16_1.xyz) * vec3(0.0500000007, 0.0500000007, 0.0500000007) + u_xlat10_2.xyz;
    SV_Target0.xyz = vec3(u_xlat16_9) * u_xlat16_1.xyz + u_xlat16_0.xyz;
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