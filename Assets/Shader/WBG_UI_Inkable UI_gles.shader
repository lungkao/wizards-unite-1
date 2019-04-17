Shader "WBG/UI/Inkable UI" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
[Enum(UnityEngine.Rendering.BlendMode)] HARDWARE_BlendSrc ("Blend Source", Float) = 5
[Enum(UnityEngine.Rendering.BlendMode)] HARDWARE_BlendDest ("Bend Destination", Float) = 10
_InkStartColor ("Ink Starting Color", Color) = (0.5,0,0.5,0)
_InkEndColor ("Ink Color", Color) = (1,0,1,0)
_Ink ("Inking", Range(0, 1)) = 1
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 60064
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
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  mediump vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_5;
  tmpvar_5 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _InkStartColor;
uniform lowp vec4 _InkEndColor;
uniform mediump float _Ink;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  lowp vec3 desat_1;
  lowp vec4 tex_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * xlv_COLOR);
  tex_2 = tmpvar_4;
  lowp float tmpvar_5;
  tmpvar_5 = dot (tex_2.xyz, vec3(0.3, 0.59, 0.11));
  lowp vec3 tmpvar_6;
  tmpvar_6.x = float((tmpvar_5 >= 0.5));
  tmpvar_6.y = float((tmpvar_5 >= 0.5));
  tmpvar_6.z = float((tmpvar_5 >= 0.5));
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = tmpvar_6;
  lowp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = tmpvar_6;
  mediump vec3 tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = (1.0 - _Ink);
  tmpvar_9 = mix (mix (_InkStartColor, _InkEndColor, vec4(tmpvar_10)), tmpvar_7, tmpvar_8).xyz;
  desat_1 = tmpvar_9;
  mediump float tmpvar_11;
  tmpvar_11 = clamp (((tmpvar_10 - 0.8) / 0.2), 0.0, 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (desat_1, tex_2.xyz, vec3((tmpvar_11 * (tmpvar_11 * 
    (3.0 - (2.0 * tmpvar_11))
  ))));
  tex_2.xyz = tmpvar_12;
  gl_FragData[0] = tex_2;
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
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  mediump vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_5;
  tmpvar_5 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _InkStartColor;
uniform lowp vec4 _InkEndColor;
uniform mediump float _Ink;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  lowp vec3 desat_1;
  lowp vec4 tex_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * xlv_COLOR);
  tex_2 = tmpvar_4;
  lowp float tmpvar_5;
  tmpvar_5 = dot (tex_2.xyz, vec3(0.3, 0.59, 0.11));
  lowp vec3 tmpvar_6;
  tmpvar_6.x = float((tmpvar_5 >= 0.5));
  tmpvar_6.y = float((tmpvar_5 >= 0.5));
  tmpvar_6.z = float((tmpvar_5 >= 0.5));
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = tmpvar_6;
  lowp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = tmpvar_6;
  mediump vec3 tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = (1.0 - _Ink);
  tmpvar_9 = mix (mix (_InkStartColor, _InkEndColor, vec4(tmpvar_10)), tmpvar_7, tmpvar_8).xyz;
  desat_1 = tmpvar_9;
  mediump float tmpvar_11;
  tmpvar_11 = clamp (((tmpvar_10 - 0.8) / 0.2), 0.0, 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (desat_1, tex_2.xyz, vec3((tmpvar_11 * (tmpvar_11 * 
    (3.0 - (2.0 * tmpvar_11))
  ))));
  tex_2.xyz = tmpvar_12;
  gl_FragData[0] = tex_2;
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
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  mediump vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_5;
  tmpvar_5 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform lowp vec4 _InkStartColor;
uniform lowp vec4 _InkEndColor;
uniform mediump float _Ink;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  lowp vec3 desat_1;
  lowp vec4 tex_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 * xlv_COLOR);
  tex_2 = tmpvar_4;
  lowp float tmpvar_5;
  tmpvar_5 = dot (tex_2.xyz, vec3(0.3, 0.59, 0.11));
  lowp vec3 tmpvar_6;
  tmpvar_6.x = float((tmpvar_5 >= 0.5));
  tmpvar_6.y = float((tmpvar_5 >= 0.5));
  tmpvar_6.z = float((tmpvar_5 >= 0.5));
  lowp vec4 tmpvar_7;
  tmpvar_7.w = 0.0;
  tmpvar_7.xyz = tmpvar_6;
  lowp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = tmpvar_6;
  mediump vec3 tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = (1.0 - _Ink);
  tmpvar_9 = mix (mix (_InkStartColor, _InkEndColor, vec4(tmpvar_10)), tmpvar_7, tmpvar_8).xyz;
  desat_1 = tmpvar_9;
  mediump float tmpvar_11;
  tmpvar_11 = clamp (((tmpvar_10 - 0.8) / 0.2), 0.0, 1.0);
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (desat_1, tex_2.xyz, vec3((tmpvar_11 * (tmpvar_11 * 
    (3.0 - (2.0 * tmpvar_11))
  ))));
  tex_2.xyz = tmpvar_12;
  gl_FragData[0] = tex_2;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  mediump vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_5;
  tmpvar_5 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform mediump vec4 _ClipRect;
uniform lowp vec4 _InkStartColor;
uniform lowp vec4 _InkEndColor;
uniform mediump float _Ink;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 clip_1;
  lowp vec3 desat_2;
  lowp vec4 tex_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * xlv_COLOR);
  tex_3 = tmpvar_5;
  lowp float tmpvar_6;
  tmpvar_6 = dot (tex_3.xyz, vec3(0.3, 0.59, 0.11));
  lowp vec3 tmpvar_7;
  tmpvar_7.x = float((tmpvar_6 >= 0.5));
  tmpvar_7.y = float((tmpvar_6 >= 0.5));
  tmpvar_7.z = float((tmpvar_6 >= 0.5));
  lowp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = tmpvar_7;
  lowp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = tmpvar_7;
  mediump vec3 tmpvar_10;
  mediump float tmpvar_11;
  tmpvar_11 = (1.0 - _Ink);
  tmpvar_10 = mix (mix (_InkStartColor, _InkEndColor, vec4(tmpvar_11)), tmpvar_8, tmpvar_9).xyz;
  desat_2 = tmpvar_10;
  mediump float tmpvar_12;
  tmpvar_12 = clamp (((tmpvar_11 - 0.8) / 0.2), 0.0, 1.0);
  mediump vec3 tmpvar_13;
  tmpvar_13 = mix (desat_2, tex_3.xyz, vec3((tmpvar_12 * (tmpvar_12 * 
    (3.0 - (2.0 * tmpvar_12))
  ))));
  tex_3.xyz = tmpvar_13;
  bvec2 tmpvar_14;
  tmpvar_14 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_15;
  tmpvar_15 = vec2(tmpvar_14);
  clip_1.xy = tmpvar_15;
  bvec2 tmpvar_16;
  tmpvar_16 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_17;
  tmpvar_17 = vec2(tmpvar_16);
  clip_1.zw = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = ((clip_1.x * clip_1.y) * (clip_1.z * clip_1.w));
  tex_3.w = (tex_3.w * tmpvar_18);
  gl_FragData[0] = tex_3;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  mediump vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_5;
  tmpvar_5 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform mediump vec4 _ClipRect;
uniform lowp vec4 _InkStartColor;
uniform lowp vec4 _InkEndColor;
uniform mediump float _Ink;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 clip_1;
  lowp vec3 desat_2;
  lowp vec4 tex_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * xlv_COLOR);
  tex_3 = tmpvar_5;
  lowp float tmpvar_6;
  tmpvar_6 = dot (tex_3.xyz, vec3(0.3, 0.59, 0.11));
  lowp vec3 tmpvar_7;
  tmpvar_7.x = float((tmpvar_6 >= 0.5));
  tmpvar_7.y = float((tmpvar_6 >= 0.5));
  tmpvar_7.z = float((tmpvar_6 >= 0.5));
  lowp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = tmpvar_7;
  lowp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = tmpvar_7;
  mediump vec3 tmpvar_10;
  mediump float tmpvar_11;
  tmpvar_11 = (1.0 - _Ink);
  tmpvar_10 = mix (mix (_InkStartColor, _InkEndColor, vec4(tmpvar_11)), tmpvar_8, tmpvar_9).xyz;
  desat_2 = tmpvar_10;
  mediump float tmpvar_12;
  tmpvar_12 = clamp (((tmpvar_11 - 0.8) / 0.2), 0.0, 1.0);
  mediump vec3 tmpvar_13;
  tmpvar_13 = mix (desat_2, tex_3.xyz, vec3((tmpvar_12 * (tmpvar_12 * 
    (3.0 - (2.0 * tmpvar_12))
  ))));
  tex_3.xyz = tmpvar_13;
  bvec2 tmpvar_14;
  tmpvar_14 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_15;
  tmpvar_15 = vec2(tmpvar_14);
  clip_1.xy = tmpvar_15;
  bvec2 tmpvar_16;
  tmpvar_16 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_17;
  tmpvar_17 = vec2(tmpvar_16);
  clip_1.zw = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = ((clip_1.x * clip_1.y) * (clip_1.z * clip_1.w));
  tex_3.w = (tex_3.w * tmpvar_18);
  gl_FragData[0] = tex_3;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform lowp vec4 _Color;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  mediump vec2 tmpvar_2;
  mediump vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  tmpvar_4.w = 1.0;
  tmpvar_4.xyz = tmpvar_1.xyz;
  highp vec2 tmpvar_5;
  tmpvar_5 = tmpvar_1.xy;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = (_glesColor * _Color);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_4));
  xlv_TEXCOORD0 = _glesMultiTexCoord0.xy;
  xlv_TEXCOORD1 = tmpvar_2;
  xlv_COLOR = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform mediump vec4 _ClipRect;
uniform lowp vec4 _InkStartColor;
uniform lowp vec4 _InkEndColor;
uniform mediump float _Ink;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 clip_1;
  lowp vec3 desat_2;
  lowp vec4 tex_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 tmpvar_5;
  tmpvar_5 = (tmpvar_4 * xlv_COLOR);
  tex_3 = tmpvar_5;
  lowp float tmpvar_6;
  tmpvar_6 = dot (tex_3.xyz, vec3(0.3, 0.59, 0.11));
  lowp vec3 tmpvar_7;
  tmpvar_7.x = float((tmpvar_6 >= 0.5));
  tmpvar_7.y = float((tmpvar_6 >= 0.5));
  tmpvar_7.z = float((tmpvar_6 >= 0.5));
  lowp vec4 tmpvar_8;
  tmpvar_8.w = 0.0;
  tmpvar_8.xyz = tmpvar_7;
  lowp vec4 tmpvar_9;
  tmpvar_9.w = 0.0;
  tmpvar_9.xyz = tmpvar_7;
  mediump vec3 tmpvar_10;
  mediump float tmpvar_11;
  tmpvar_11 = (1.0 - _Ink);
  tmpvar_10 = mix (mix (_InkStartColor, _InkEndColor, vec4(tmpvar_11)), tmpvar_8, tmpvar_9).xyz;
  desat_2 = tmpvar_10;
  mediump float tmpvar_12;
  tmpvar_12 = clamp (((tmpvar_11 - 0.8) / 0.2), 0.0, 1.0);
  mediump vec3 tmpvar_13;
  tmpvar_13 = mix (desat_2, tex_3.xyz, vec3((tmpvar_12 * (tmpvar_12 * 
    (3.0 - (2.0 * tmpvar_12))
  ))));
  tex_3.xyz = tmpvar_13;
  bvec2 tmpvar_14;
  tmpvar_14 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_15;
  tmpvar_15 = vec2(tmpvar_14);
  clip_1.xy = tmpvar_15;
  bvec2 tmpvar_16;
  tmpvar_16 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_17;
  tmpvar_17 = vec2(tmpvar_16);
  clip_1.zw = tmpvar_17;
  mediump float tmpvar_18;
  tmpvar_18 = ((clip_1.x * clip_1.y) * (clip_1.z * clip_1.w));
  tex_3.w = (tex_3.w * tmpvar_18);
  gl_FragData[0] = tex_3;
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