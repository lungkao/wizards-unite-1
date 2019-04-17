Shader "WBG/UI/Hollow UI" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_FillTex ("Fill Texture", 2D) = "white" { }
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
[Enum(UnityEngine.Rendering.BlendMode)] HARDWARE_BlendSrc ("Blend Source", Float) = 5
[Enum(UnityEngine.Rendering.BlendMode)] HARDWARE_BlendDest ("Bend Destination", Float) = 10
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 11019
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FillTex;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  tex_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tex_1.xyz = texture2D (_FillTex, xlv_TEXCOORD0).xyz;
  gl_FragData[0] = tex_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FillTex;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  tex_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tex_1.xyz = texture2D (_FillTex, xlv_TEXCOORD0).xyz;
  gl_FragData[0] = tex_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FillTex;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex_1;
  tex_1.w = texture2D (_MainTex, xlv_TEXCOORD0).w;
  tex_1.xyz = texture2D (_FillTex, xlv_TEXCOORD0).xyz;
  gl_FragData[0] = tex_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FillTex;
uniform mediump vec4 _ClipRect;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 clip_1;
  lowp vec4 tex_2;
  tex_2.xyz = texture2D (_FillTex, xlv_TEXCOORD0).xyz;
  bvec2 tmpvar_3;
  tmpvar_3 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_4;
  tmpvar_4 = vec2(tmpvar_3);
  clip_1.xy = tmpvar_4;
  bvec2 tmpvar_5;
  tmpvar_5 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_6;
  tmpvar_6 = vec2(tmpvar_5);
  clip_1.zw = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = ((clip_1.x * clip_1.y) * (clip_1.z * clip_1.w));
  tex_2.w = (texture2D (_MainTex, xlv_TEXCOORD0).w * tmpvar_7);
  gl_FragData[0] = tex_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FillTex;
uniform mediump vec4 _ClipRect;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 clip_1;
  lowp vec4 tex_2;
  tex_2.xyz = texture2D (_FillTex, xlv_TEXCOORD0).xyz;
  bvec2 tmpvar_3;
  tmpvar_3 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_4;
  tmpvar_4 = vec2(tmpvar_3);
  clip_1.xy = tmpvar_4;
  bvec2 tmpvar_5;
  tmpvar_5 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_6;
  tmpvar_6 = vec2(tmpvar_5);
  clip_1.zw = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = ((clip_1.x * clip_1.y) * (clip_1.z * clip_1.w));
  tex_2.w = (texture2D (_MainTex, xlv_TEXCOORD0).w * tmpvar_7);
  gl_FragData[0] = tex_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_4;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _FillTex;
uniform mediump vec4 _ClipRect;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 clip_1;
  lowp vec4 tex_2;
  tex_2.xyz = texture2D (_FillTex, xlv_TEXCOORD0).xyz;
  bvec2 tmpvar_3;
  tmpvar_3 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_4;
  tmpvar_4 = vec2(tmpvar_3);
  clip_1.xy = tmpvar_4;
  bvec2 tmpvar_5;
  tmpvar_5 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_6;
  tmpvar_6 = vec2(tmpvar_5);
  clip_1.zw = tmpvar_6;
  mediump float tmpvar_7;
  tmpvar_7 = ((clip_1.x * clip_1.y) * (clip_1.z * clip_1.w));
  tex_2.w = (texture2D (_MainTex, xlv_TEXCOORD0).w * tmpvar_7);
  gl_FragData[0] = tex_2;
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
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
}