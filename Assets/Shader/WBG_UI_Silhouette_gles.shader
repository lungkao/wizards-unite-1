Shader "WBG/UI/Silhouette" {
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
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "FORCENOSHADOWCASTING" = "true" "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "ShaderType" = "WBGTransparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 20677
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _MainTex_TexelSize.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2.x = -(_MainTex_TexelSize.x);
  tmpvar_2.y = tmpvar_1.y;
  mediump vec2 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD0 + tmpvar_2);
  mediump vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_4.y = -(_MainTex_TexelSize.y);
  mediump vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
  mediump vec2 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0 - _MainTex_TexelSize.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_3);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, tmpvar_5);
  mediump float tmpvar_10;
  tmpvar_10 = (tmpvar_8.w - tmpvar_9.w);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, tmpvar_7);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_6);
  mediump float tmpvar_13;
  tmpvar_13 = (-(tmpvar_11.w) + tmpvar_12.w);
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = vec3(1.0, 1.0, 1.0);
  tmpvar_14.w = sqrt(((tmpvar_10 * tmpvar_10) + (tmpvar_13 * tmpvar_13)));
  gl_FragData[0] = (tmpvar_14 * xlv_COLOR);
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _MainTex_TexelSize.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2.x = -(_MainTex_TexelSize.x);
  tmpvar_2.y = tmpvar_1.y;
  mediump vec2 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD0 + tmpvar_2);
  mediump vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_4.y = -(_MainTex_TexelSize.y);
  mediump vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
  mediump vec2 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0 - _MainTex_TexelSize.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_3);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, tmpvar_5);
  mediump float tmpvar_10;
  tmpvar_10 = (tmpvar_8.w - tmpvar_9.w);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, tmpvar_7);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_6);
  mediump float tmpvar_13;
  tmpvar_13 = (-(tmpvar_11.w) + tmpvar_12.w);
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = vec3(1.0, 1.0, 1.0);
  tmpvar_14.w = sqrt(((tmpvar_10 * tmpvar_10) + (tmpvar_13 * tmpvar_13)));
  gl_FragData[0] = (tmpvar_14 * xlv_COLOR);
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
uniform mediump vec4 _MainTex_TexelSize;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec2 tmpvar_1;
  tmpvar_1 = _MainTex_TexelSize.xy;
  mediump vec2 tmpvar_2;
  tmpvar_2.x = -(_MainTex_TexelSize.x);
  tmpvar_2.y = tmpvar_1.y;
  mediump vec2 tmpvar_3;
  tmpvar_3 = (xlv_TEXCOORD0 + tmpvar_2);
  mediump vec2 tmpvar_4;
  tmpvar_4.x = tmpvar_1.x;
  tmpvar_4.y = -(_MainTex_TexelSize.y);
  mediump vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
  mediump vec2 tmpvar_6;
  tmpvar_6 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0 - _MainTex_TexelSize.xy);
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_MainTex, tmpvar_3);
  lowp vec4 tmpvar_9;
  tmpvar_9 = texture2D (_MainTex, tmpvar_5);
  mediump float tmpvar_10;
  tmpvar_10 = (tmpvar_8.w - tmpvar_9.w);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, tmpvar_7);
  lowp vec4 tmpvar_12;
  tmpvar_12 = texture2D (_MainTex, tmpvar_6);
  mediump float tmpvar_13;
  tmpvar_13 = (-(tmpvar_11.w) + tmpvar_12.w);
  mediump vec4 tmpvar_14;
  tmpvar_14.xyz = vec3(1.0, 1.0, 1.0);
  tmpvar_14.w = sqrt(((tmpvar_10 * tmpvar_10) + (tmpvar_13 * tmpvar_13)));
  gl_FragData[0] = (tmpvar_14 * xlv_COLOR);
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
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _ClipRect;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 clip_1;
  mediump vec4 pixel_2;
  mediump vec2 tmpvar_3;
  tmpvar_3 = _MainTex_TexelSize.xy;
  mediump vec2 tmpvar_4;
  tmpvar_4.x = -(_MainTex_TexelSize.x);
  tmpvar_4.y = tmpvar_3.y;
  mediump vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_3.x;
  tmpvar_6.y = -(_MainTex_TexelSize.y);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0 + tmpvar_6);
  mediump vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  mediump vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0 - _MainTex_TexelSize.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, tmpvar_7);
  mediump float tmpvar_12;
  tmpvar_12 = (tmpvar_10.w - tmpvar_11.w);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MainTex, tmpvar_9);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, tmpvar_8);
  mediump float tmpvar_15;
  tmpvar_15 = (-(tmpvar_13.w) + tmpvar_14.w);
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = vec3(1.0, 1.0, 1.0);
  tmpvar_16.w = sqrt(((tmpvar_12 * tmpvar_12) + (tmpvar_15 * tmpvar_15)));
  mediump vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * xlv_COLOR);
  pixel_2.xyz = tmpvar_17.xyz;
  bvec2 tmpvar_18;
  tmpvar_18 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_19;
  tmpvar_19 = vec2(tmpvar_18);
  clip_1.xy = tmpvar_19;
  bvec2 tmpvar_20;
  tmpvar_20 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_21;
  tmpvar_21 = vec2(tmpvar_20);
  clip_1.zw = tmpvar_21;
  pixel_2.w = ((tmpvar_17.w * clip_1.x) * ((clip_1.y * clip_1.z) * clip_1.w));
  gl_FragData[0] = pixel_2;
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
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _ClipRect;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 clip_1;
  mediump vec4 pixel_2;
  mediump vec2 tmpvar_3;
  tmpvar_3 = _MainTex_TexelSize.xy;
  mediump vec2 tmpvar_4;
  tmpvar_4.x = -(_MainTex_TexelSize.x);
  tmpvar_4.y = tmpvar_3.y;
  mediump vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_3.x;
  tmpvar_6.y = -(_MainTex_TexelSize.y);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0 + tmpvar_6);
  mediump vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  mediump vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0 - _MainTex_TexelSize.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, tmpvar_7);
  mediump float tmpvar_12;
  tmpvar_12 = (tmpvar_10.w - tmpvar_11.w);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MainTex, tmpvar_9);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, tmpvar_8);
  mediump float tmpvar_15;
  tmpvar_15 = (-(tmpvar_13.w) + tmpvar_14.w);
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = vec3(1.0, 1.0, 1.0);
  tmpvar_16.w = sqrt(((tmpvar_12 * tmpvar_12) + (tmpvar_15 * tmpvar_15)));
  mediump vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * xlv_COLOR);
  pixel_2.xyz = tmpvar_17.xyz;
  bvec2 tmpvar_18;
  tmpvar_18 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_19;
  tmpvar_19 = vec2(tmpvar_18);
  clip_1.xy = tmpvar_19;
  bvec2 tmpvar_20;
  tmpvar_20 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_21;
  tmpvar_21 = vec2(tmpvar_20);
  clip_1.zw = tmpvar_21;
  pixel_2.w = ((tmpvar_17.w * clip_1.x) * ((clip_1.y * clip_1.z) * clip_1.w));
  gl_FragData[0] = pixel_2;
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
uniform mediump vec4 _MainTex_TexelSize;
uniform mediump vec4 _ClipRect;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_COLOR;
void main ()
{
  mediump vec4 clip_1;
  mediump vec4 pixel_2;
  mediump vec2 tmpvar_3;
  tmpvar_3 = _MainTex_TexelSize.xy;
  mediump vec2 tmpvar_4;
  tmpvar_4.x = -(_MainTex_TexelSize.x);
  tmpvar_4.y = tmpvar_3.y;
  mediump vec2 tmpvar_5;
  tmpvar_5 = (xlv_TEXCOORD0 + tmpvar_4);
  mediump vec2 tmpvar_6;
  tmpvar_6.x = tmpvar_3.x;
  tmpvar_6.y = -(_MainTex_TexelSize.y);
  mediump vec2 tmpvar_7;
  tmpvar_7 = (xlv_TEXCOORD0 + tmpvar_6);
  mediump vec2 tmpvar_8;
  tmpvar_8 = (xlv_TEXCOORD0 + _MainTex_TexelSize.xy);
  mediump vec2 tmpvar_9;
  tmpvar_9 = (xlv_TEXCOORD0 - _MainTex_TexelSize.xy);
  lowp vec4 tmpvar_10;
  tmpvar_10 = texture2D (_MainTex, tmpvar_5);
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, tmpvar_7);
  mediump float tmpvar_12;
  tmpvar_12 = (tmpvar_10.w - tmpvar_11.w);
  lowp vec4 tmpvar_13;
  tmpvar_13 = texture2D (_MainTex, tmpvar_9);
  lowp vec4 tmpvar_14;
  tmpvar_14 = texture2D (_MainTex, tmpvar_8);
  mediump float tmpvar_15;
  tmpvar_15 = (-(tmpvar_13.w) + tmpvar_14.w);
  mediump vec4 tmpvar_16;
  tmpvar_16.xyz = vec3(1.0, 1.0, 1.0);
  tmpvar_16.w = sqrt(((tmpvar_12 * tmpvar_12) + (tmpvar_15 * tmpvar_15)));
  mediump vec4 tmpvar_17;
  tmpvar_17 = (tmpvar_16 * xlv_COLOR);
  pixel_2.xyz = tmpvar_17.xyz;
  bvec2 tmpvar_18;
  tmpvar_18 = greaterThanEqual (xlv_TEXCOORD1, _ClipRect.xy);
  lowp vec2 tmpvar_19;
  tmpvar_19 = vec2(tmpvar_18);
  clip_1.xy = tmpvar_19;
  bvec2 tmpvar_20;
  tmpvar_20 = greaterThanEqual (_ClipRect.zw, xlv_TEXCOORD1);
  lowp vec2 tmpvar_21;
  tmpvar_21 = vec2(tmpvar_20);
  clip_1.zw = tmpvar_21;
  pixel_2.w = ((tmpvar_17.w * clip_1.x) * ((clip_1.y * clip_1.z) * clip_1.w));
  gl_FragData[0] = pixel_2;
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