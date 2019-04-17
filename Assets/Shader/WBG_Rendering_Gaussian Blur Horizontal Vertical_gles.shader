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
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-4.30908, 0.0)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-2.37532, 0.0)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-0.5, 0.0)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(1.37532, 0.0)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(3.30908, 0.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 o_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  o_2 = (tmpvar_3 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  o_2 = (o_2 + (tmpvar_4 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2);
  o_2 = (o_2 + (tmpvar_5 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD3);
  o_2 = (o_2 + (tmpvar_6 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD4);
  o_2 = (o_2 + (tmpvar_7 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  tmpvar_1 = o_2;
  gl_FragData[0] = tmpvar_1;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-4.30908, 0.0)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-2.37532, 0.0)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-0.5, 0.0)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(1.37532, 0.0)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(3.30908, 0.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 o_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  o_2 = (tmpvar_3 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  o_2 = (o_2 + (tmpvar_4 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2);
  o_2 = (o_2 + (tmpvar_5 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD3);
  o_2 = (o_2 + (tmpvar_6 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD4);
  o_2 = (o_2 + (tmpvar_7 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  tmpvar_1 = o_2;
  gl_FragData[0] = tmpvar_1;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-4.30908, 0.0)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-2.37532, 0.0)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-0.5, 0.0)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(1.37532, 0.0)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(3.30908, 0.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 o_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  o_2 = (tmpvar_3 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  o_2 = (o_2 + (tmpvar_4 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2);
  o_2 = (o_2 + (tmpvar_5 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD3);
  o_2 = (o_2 + (tmpvar_6 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD4);
  o_2 = (o_2 + (tmpvar_7 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  tmpvar_1 = o_2;
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
 Pass {
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 104681
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -4.30908)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -2.37532)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -0.5)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 1.37532)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 3.30908)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 o_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  o_2 = (tmpvar_3 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  o_2 = (o_2 + (tmpvar_4 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2);
  o_2 = (o_2 + (tmpvar_5 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD3);
  o_2 = (o_2 + (tmpvar_6 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD4);
  o_2 = (o_2 + (tmpvar_7 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  tmpvar_1 = o_2;
  gl_FragData[0] = tmpvar_1;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -4.30908)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -2.37532)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -0.5)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 1.37532)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 3.30908)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 o_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  o_2 = (tmpvar_3 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  o_2 = (o_2 + (tmpvar_4 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2);
  o_2 = (o_2 + (tmpvar_5 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD3);
  o_2 = (o_2 + (tmpvar_6 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD4);
  o_2 = (o_2 + (tmpvar_7 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  tmpvar_1 = o_2;
  gl_FragData[0] = tmpvar_1;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -4.30908)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -2.37532)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -0.5)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 1.37532)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 3.30908)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 o_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  o_2 = (tmpvar_3 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD1);
  o_2 = (o_2 + (tmpvar_4 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD2);
  o_2 = (o_2 + (tmpvar_5 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD3);
  o_2 = (o_2 + (tmpvar_6 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_7;
  tmpvar_7 = texture2D (_MainTex, xlv_TEXCOORD4);
  o_2 = (o_2 + (tmpvar_7 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  tmpvar_1 = o_2;
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
 Pass {
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 140084
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-4.30908, 0.0)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-2.37532, 0.0)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-0.5, 0.0)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(1.37532, 0.0)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(3.30908, 0.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 o_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_3;
  color_3 = tmpvar_2;
  mediump vec4 tmpvar_4;
  tmpvar_4.xyz = (color_3.xyz * color_3.xyz);
  tmpvar_4.w = color_3.w;
  o_1 = (tmpvar_4 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  mediump vec4 color_6;
  color_6 = tmpvar_5;
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = (color_6.xyz * color_6.xyz);
  tmpvar_7.w = color_6.w;
  o_1 = (o_1 + (tmpvar_7 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD2);
  mediump vec4 color_9;
  color_9 = tmpvar_8;
  mediump vec4 tmpvar_10;
  tmpvar_10.xyz = (color_9.xyz * color_9.xyz);
  tmpvar_10.w = color_9.w;
  o_1 = (o_1 + (tmpvar_10 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD3);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  o_1 = (o_1 + (tmpvar_13 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD4);
  mediump vec4 color_15;
  color_15 = tmpvar_14;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = (color_15.xyz * color_15.xyz);
  tmpvar_16.w = color_15.w;
  o_1 = (o_1 + (tmpvar_16 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = sqrt(o_1.xyz);
  tmpvar_17.w = o_1.w;
  gl_FragData[0] = tmpvar_17;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-4.30908, 0.0)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-2.37532, 0.0)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-0.5, 0.0)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(1.37532, 0.0)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(3.30908, 0.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 o_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_3;
  color_3 = tmpvar_2;
  mediump vec4 tmpvar_4;
  tmpvar_4.xyz = (color_3.xyz * color_3.xyz);
  tmpvar_4.w = color_3.w;
  o_1 = (tmpvar_4 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  mediump vec4 color_6;
  color_6 = tmpvar_5;
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = (color_6.xyz * color_6.xyz);
  tmpvar_7.w = color_6.w;
  o_1 = (o_1 + (tmpvar_7 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD2);
  mediump vec4 color_9;
  color_9 = tmpvar_8;
  mediump vec4 tmpvar_10;
  tmpvar_10.xyz = (color_9.xyz * color_9.xyz);
  tmpvar_10.w = color_9.w;
  o_1 = (o_1 + (tmpvar_10 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD3);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  o_1 = (o_1 + (tmpvar_13 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD4);
  mediump vec4 color_15;
  color_15 = tmpvar_14;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = (color_15.xyz * color_15.xyz);
  tmpvar_16.w = color_15.w;
  o_1 = (o_1 + (tmpvar_16 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = sqrt(o_1.xyz);
  tmpvar_17.w = o_1.w;
  gl_FragData[0] = tmpvar_17;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-4.30908, 0.0)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-2.37532, 0.0)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(-0.5, 0.0)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(1.37532, 0.0)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(3.30908, 0.0)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 o_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_3;
  color_3 = tmpvar_2;
  mediump vec4 tmpvar_4;
  tmpvar_4.xyz = (color_3.xyz * color_3.xyz);
  tmpvar_4.w = color_3.w;
  o_1 = (tmpvar_4 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  mediump vec4 color_6;
  color_6 = tmpvar_5;
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = (color_6.xyz * color_6.xyz);
  tmpvar_7.w = color_6.w;
  o_1 = (o_1 + (tmpvar_7 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD2);
  mediump vec4 color_9;
  color_9 = tmpvar_8;
  mediump vec4 tmpvar_10;
  tmpvar_10.xyz = (color_9.xyz * color_9.xyz);
  tmpvar_10.w = color_9.w;
  o_1 = (o_1 + (tmpvar_10 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD3);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  o_1 = (o_1 + (tmpvar_13 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD4);
  mediump vec4 color_15;
  color_15 = tmpvar_14;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = (color_15.xyz * color_15.xyz);
  tmpvar_16.w = color_15.w;
  o_1 = (o_1 + (tmpvar_16 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = sqrt(o_1.xyz);
  tmpvar_17.w = o_1.w;
  gl_FragData[0] = tmpvar_17;
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
 Pass {
  Tags { "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 208079
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -4.30908)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -2.37532)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -0.5)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 1.37532)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 3.30908)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 o_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_3;
  color_3 = tmpvar_2;
  mediump vec4 tmpvar_4;
  tmpvar_4.xyz = (color_3.xyz * color_3.xyz);
  tmpvar_4.w = color_3.w;
  o_1 = (tmpvar_4 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  mediump vec4 color_6;
  color_6 = tmpvar_5;
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = (color_6.xyz * color_6.xyz);
  tmpvar_7.w = color_6.w;
  o_1 = (o_1 + (tmpvar_7 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD2);
  mediump vec4 color_9;
  color_9 = tmpvar_8;
  mediump vec4 tmpvar_10;
  tmpvar_10.xyz = (color_9.xyz * color_9.xyz);
  tmpvar_10.w = color_9.w;
  o_1 = (o_1 + (tmpvar_10 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD3);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  o_1 = (o_1 + (tmpvar_13 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD4);
  mediump vec4 color_15;
  color_15 = tmpvar_14;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = (color_15.xyz * color_15.xyz);
  tmpvar_16.w = color_15.w;
  o_1 = (o_1 + (tmpvar_16 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = sqrt(o_1.xyz);
  tmpvar_17.w = o_1.w;
  gl_FragData[0] = tmpvar_17;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -4.30908)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -2.37532)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -0.5)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 1.37532)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 3.30908)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 o_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_3;
  color_3 = tmpvar_2;
  mediump vec4 tmpvar_4;
  tmpvar_4.xyz = (color_3.xyz * color_3.xyz);
  tmpvar_4.w = color_3.w;
  o_1 = (tmpvar_4 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  mediump vec4 color_6;
  color_6 = tmpvar_5;
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = (color_6.xyz * color_6.xyz);
  tmpvar_7.w = color_6.w;
  o_1 = (o_1 + (tmpvar_7 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD2);
  mediump vec4 color_9;
  color_9 = tmpvar_8;
  mediump vec4 tmpvar_10;
  tmpvar_10.xyz = (color_9.xyz * color_9.xyz);
  tmpvar_10.w = color_9.w;
  o_1 = (o_1 + (tmpvar_10 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD3);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  o_1 = (o_1 + (tmpvar_13 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD4);
  mediump vec4 color_15;
  color_15 = tmpvar_14;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = (color_15.xyz * color_15.xyz);
  tmpvar_16.w = color_15.w;
  o_1 = (o_1 + (tmpvar_16 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = sqrt(o_1.xyz);
  tmpvar_17.w = o_1.w;
  gl_FragData[0] = tmpvar_17;
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec2 uv_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_3;
  tmpvar_3 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_3;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_TEXCOORD0 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -4.30908)));
  xlv_TEXCOORD1 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -2.37532)));
  xlv_TEXCOORD2 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, -0.5)));
  xlv_TEXCOORD3 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 1.37532)));
  xlv_TEXCOORD4 = (uv_1 + (_MainTex_TexelSize.xy * vec2(0.0, 3.30908)));
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
varying mediump vec2 xlv_TEXCOORD3;
varying mediump vec2 xlv_TEXCOORD4;
void main ()
{
  mediump vec4 o_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_3;
  color_3 = tmpvar_2;
  mediump vec4 tmpvar_4;
  tmpvar_4.xyz = (color_3.xyz * color_3.xyz);
  tmpvar_4.w = color_3.w;
  o_1 = (tmpvar_4 * vec4(0.055028, 0.055028, 0.055028, 0.055028));
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD1);
  mediump vec4 color_6;
  color_6 = tmpvar_5;
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = (color_6.xyz * color_6.xyz);
  tmpvar_7.w = color_6.w;
  o_1 = (o_1 + (tmpvar_7 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, xlv_TEXCOORD2);
  mediump vec4 color_9;
  color_9 = tmpvar_8;
  mediump vec4 tmpvar_10;
  tmpvar_10.xyz = (color_9.xyz * color_9.xyz);
  tmpvar_10.w = color_9.w;
  o_1 = (o_1 + (tmpvar_10 * vec4(0.40187, 0.40187, 0.40187, 0.40187)));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD3);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  o_1 = (o_1 + (tmpvar_13 * vec4(0.244038, 0.244038, 0.244038, 0.244038)));
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, xlv_TEXCOORD4);
  mediump vec4 color_15;
  color_15 = tmpvar_14;
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = (color_15.xyz * color_15.xyz);
  tmpvar_16.w = color_15.w;
  o_1 = (o_1 + (tmpvar_16 * vec4(0.055028, 0.055028, 0.055028, 0.055028)));
  mediump vec4 tmpvar_17;
  tmpvar_17.xyz = sqrt(o_1.xyz);
  tmpvar_17.w = o_1.w;
  gl_FragData[0] = tmpvar_17;
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