Shader "WBG/VFX/Unlit Transparent VFX Alpha Blend Scrolling Diffuse Vertex Color" {
Properties {
_MainTex ("Base (RGB) Transparency (A)", 2D) = "white" { }
_DetailTex ("Detail (RGB) Transparency (A)", 2D) = "white" { }
_Velocity ("Base Velocity (XY) Detail Velocity (ZW)", Vector) = (0,0,0,0)
_Brightness ("Brightness", Float) = 1
_Alpha ("Alpha", Range(0, 1)) = 0.5
_TintColor ("Tint Color", Color) = (0,0,0,0)
}
SubShader {
 Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
 Pass {
  LOD 100
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
  ZWrite Off
  GpuProgramID 49379
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_ST;
uniform mediump vec4 _DetailTex_ST;
uniform mediump vec4 _Velocity;
uniform mediump vec4 _TintColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  mediump vec4 offset_1;
  lowp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = fract((_Velocity * _Time.yyyy));
  offset_1 = tmpvar_4;
  tmpvar_2 = (_glesColor + _TintColor);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) + offset_1.xy);
  xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _DetailTex_ST.xy) + _DetailTex_ST.zw) + offset_1.zw);
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump float _Brightness;
uniform mediump float _Alpha;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tex_1;
  tex_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * (texture2D (_DetailTex, xlv_TEXCOORD1) * xlv_COLOR));
  tex_1.xyz = (tex_1.xyz * _Brightness);
  tex_1.w = (tex_1.w * _Alpha);
  lowp vec4 tmpvar_2;
  tmpvar_2 = clamp (tex_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_2;
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
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_ST;
uniform mediump vec4 _DetailTex_ST;
uniform mediump vec4 _Velocity;
uniform mediump vec4 _TintColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  mediump vec4 offset_1;
  lowp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = fract((_Velocity * _Time.yyyy));
  offset_1 = tmpvar_4;
  tmpvar_2 = (_glesColor + _TintColor);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) + offset_1.xy);
  xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _DetailTex_ST.xy) + _DetailTex_ST.zw) + offset_1.zw);
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump float _Brightness;
uniform mediump float _Alpha;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tex_1;
  tex_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * (texture2D (_DetailTex, xlv_TEXCOORD1) * xlv_COLOR));
  tex_1.xyz = (tex_1.xyz * _Brightness);
  tex_1.w = (tex_1.w * _Alpha);
  lowp vec4 tmpvar_2;
  tmpvar_2 = clamp (tex_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_2;
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
uniform highp vec4 _Time;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_ST;
uniform mediump vec4 _DetailTex_ST;
uniform mediump vec4 _Velocity;
uniform mediump vec4 _TintColor;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  mediump vec4 offset_1;
  lowp vec4 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec4 tmpvar_4;
  tmpvar_4 = fract((_Velocity * _Time.yyyy));
  offset_1 = tmpvar_4;
  tmpvar_2 = (_glesColor + _TintColor);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = (((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw) + offset_1.xy);
  xlv_TEXCOORD1 = (((_glesMultiTexCoord0.xy * _DetailTex_ST.xy) + _DetailTex_ST.zw) + offset_1.zw);
  xlv_COLOR = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump float _Brightness;
uniform mediump float _Alpha;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tex_1;
  tex_1 = (texture2D (_MainTex, xlv_TEXCOORD0) * (texture2D (_DetailTex, xlv_TEXCOORD1) * xlv_COLOR));
  tex_1.xyz = (tex_1.xyz * _Brightness);
  tex_1.w = (tex_1.w * _Alpha);
  lowp vec4 tmpvar_2;
  tmpvar_2 = clamp (tex_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_2;
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