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
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DestinationTex;
uniform mediump float _TransitionProgress;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD0;
  mediump vec4 destColor_3;
  mediump vec4 tex_5;
  mediump vec2 vec_6;
  vec_6 = ((vec2(0.5, 0.5) - xlv_TEXCOORD0) * _TransitionProgress);
  tex_5 = vec4(0.0, 0.0, 0.0, 0.0);
  for (highp int i_4 = 0; float(i_4) < 20.0; i_4++) {
    lowp vec4 tmpvar_7;
    highp vec2 P_8;
    P_8 = (tmpvar_2 + ((vec_6 * 
      float(i_4)
    ) * 0.05));
    tmpvar_7 = texture2D (_MainTex, P_8);
    tex_5 = (tex_5 + tmpvar_7);
  };
  tex_5 = (tex_5 * 0.05);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DestinationTex, xlv_TEXCOORD0);
  destColor_3 = tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = clamp (((_TransitionProgress - 0.5) / 0.5), 0.0, 1.0);
  tex_5.xyz = mix (tex_5, destColor_3, vec4((tmpvar_10 * (tmpvar_10 * 
    (3.0 - (2.0 * tmpvar_10))
  )))).xyz;
  tex_5.w = 1.0;
  tmpvar_1 = tex_5;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DestinationTex;
uniform mediump float _TransitionProgress;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD0;
  mediump vec4 destColor_3;
  mediump vec4 tex_5;
  mediump vec2 vec_6;
  vec_6 = ((vec2(0.5, 0.5) - xlv_TEXCOORD0) * _TransitionProgress);
  tex_5 = vec4(0.0, 0.0, 0.0, 0.0);
  for (highp int i_4 = 0; float(i_4) < 20.0; i_4++) {
    lowp vec4 tmpvar_7;
    highp vec2 P_8;
    P_8 = (tmpvar_2 + ((vec_6 * 
      float(i_4)
    ) * 0.05));
    tmpvar_7 = texture2D (_MainTex, P_8);
    tex_5 = (tex_5 + tmpvar_7);
  };
  tex_5 = (tex_5 * 0.05);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DestinationTex, xlv_TEXCOORD0);
  destColor_3 = tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = clamp (((_TransitionProgress - 0.5) / 0.5), 0.0, 1.0);
  tex_5.xyz = mix (tex_5, destColor_3, vec4((tmpvar_10 * (tmpvar_10 * 
    (3.0 - (2.0 * tmpvar_10))
  )))).xyz;
  tex_5.w = 1.0;
  tmpvar_1 = tex_5;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_COLOR = tmpvar_1;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DestinationTex;
uniform mediump float _TransitionProgress;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2 = xlv_TEXCOORD0;
  mediump vec4 destColor_3;
  mediump vec4 tex_5;
  mediump vec2 vec_6;
  vec_6 = ((vec2(0.5, 0.5) - xlv_TEXCOORD0) * _TransitionProgress);
  tex_5 = vec4(0.0, 0.0, 0.0, 0.0);
  for (highp int i_4 = 0; float(i_4) < 20.0; i_4++) {
    lowp vec4 tmpvar_7;
    highp vec2 P_8;
    P_8 = (tmpvar_2 + ((vec_6 * 
      float(i_4)
    ) * 0.05));
    tmpvar_7 = texture2D (_MainTex, P_8);
    tex_5 = (tex_5 + tmpvar_7);
  };
  tex_5 = (tex_5 * 0.05);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_DestinationTex, xlv_TEXCOORD0);
  destColor_3 = tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = clamp (((_TransitionProgress - 0.5) / 0.5), 0.0, 1.0);
  tex_5.xyz = mix (tex_5, destColor_3, vec4((tmpvar_10 * (tmpvar_10 * 
    (3.0 - (2.0 * tmpvar_10))
  )))).xyz;
  tex_5.w = 1.0;
  tmpvar_1 = tex_5;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
}
}
}
}