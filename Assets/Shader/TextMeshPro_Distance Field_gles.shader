Shader "TextMeshPro/Distance Field" {
Properties {
_FaceTex ("Face Texture", 2D) = "white" { }
_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
_FaceColor ("Face Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineTex ("Outline Texture", 2D) = "white" { }
_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_Bevel ("Bevel", Range(0, 1)) = 0.5
_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
_LightAngle ("Light Angle", Range(0, 6.283185)) = 3.1416
_SpecularColor ("Specular", Color) = (1,1,1,1)
_SpecularPower ("Specular", Range(0, 4)) = 2
_Reflectivity ("Reflectivity", Range(5, 15)) = 10
_Diffuse ("Diffuse", Range(0, 1)) = 0.5
_Ambient ("Ambient", Range(1, 0)) = 0.5
_BumpMap ("Normal map", 2D) = "bump" { }
_BumpOutline ("Bump Outline", Range(0, 1)) = 0
_BumpFace ("Bump Face", Range(0, 1)) = 0
_ReflectFaceColor ("Reflection Color", Color) = (0,0,0,1)
_ReflectOutlineColor ("Reflection Color", Color) = (0,0,0,1)
_Cube ("Reflection Cubemap", Cube) = "black" { }
_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
_UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
_GlowColor ("Color", Color) = (0,1,0,0.5)
_GlowOffset ("Offset", Range(-1, 1)) = 0
_GlowInner ("Inner", Range(0, 1)) = 0.05
_GlowOuter ("Outer", Range(0, 1)) = 0.05
_GlowPower ("Falloff", Range(1, 0)) = 0.75
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
_MaskCoord ("Mask Coordinates", Vector) = (0,0,32767,32767)
_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
_MaskSoftnessX ("Mask SoftnessX", Float) = 0
_MaskSoftnessY ("Mask SoftnessY", Float) = 0
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 42434
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float weight_3;
  highp float scale_4;
  highp vec2 pixelSize_5;
  highp vec4 vert_6;
  highp float tmpvar_7;
  tmpvar_7 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_6.zw = _glesVertex.zw;
  vert_6.x = (_glesVertex.x + _VertexOffsetX);
  vert_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = vert_6.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp vec2 tmpvar_10;
  tmpvar_10.x = _ScaleX;
  tmpvar_10.y = _ScaleY;
  highp mat2 tmpvar_11;
  tmpvar_11[0] = glstate_matrix_projection[0].xy;
  tmpvar_11[1] = glstate_matrix_projection[1].xy;
  pixelSize_5 = (tmpvar_8.ww / (tmpvar_10 * abs(
    (tmpvar_11 * _ScreenParams.xy)
  )));
  scale_4 = (inversesqrt(dot (pixelSize_5, pixelSize_5)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_12;
    tmpvar_12[0] = unity_WorldToObject[0].xyz;
    tmpvar_12[1] = unity_WorldToObject[1].xyz;
    tmpvar_12[2] = unity_WorldToObject[2].xyz;
    scale_4 = mix ((abs(scale_4) * (1.0 - _PerspectiveFilter)), scale_4, abs(dot (
      normalize((_glesNormal * tmpvar_12))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz))
    )));
  };
  weight_3 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_7) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec4 tmpvar_13;
  tmpvar_13 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_14;
  highp vec2 xlat_varoutput_15;
  xlat_varoutput_15.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_15.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_15.x));
  tmpvar_14 = (xlat_varoutput_15 * 0.001953125);
  highp vec4 tmpvar_16;
  tmpvar_16.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_4)) - weight_3);
  tmpvar_16.y = scale_4;
  tmpvar_16.z = ((0.5 - weight_3) + (0.5 / scale_4));
  tmpvar_16.w = weight_3;
  highp vec2 tmpvar_17;
  tmpvar_17.x = _MaskSoftnessX;
  tmpvar_17.y = _MaskSoftnessY;
  highp vec4 tmpvar_18;
  tmpvar_18.xy = (((vert_6.xy * 2.0) - tmpvar_13.xy) - tmpvar_13.zw);
  tmpvar_18.zw = (0.25 / ((0.25 * tmpvar_17) + pixelSize_5));
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.xy = ((tmpvar_14 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_20.zw = ((tmpvar_14 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  gl_Position = tmpvar_8;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_18;
  xlv_TEXCOORD3 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz));
  xlv_TEXCOORD5 = tmpvar_20;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_2 = (outlineColor_2 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_3;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_2;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_3 = faceColor_17;
  mediump vec2 tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  faceColor_3 = (faceColor_3 * (tmpvar_23.x * tmpvar_23.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float weight_3;
  highp float scale_4;
  highp vec2 pixelSize_5;
  highp vec4 vert_6;
  highp float tmpvar_7;
  tmpvar_7 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_6.zw = _glesVertex.zw;
  vert_6.x = (_glesVertex.x + _VertexOffsetX);
  vert_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = vert_6.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp vec2 tmpvar_10;
  tmpvar_10.x = _ScaleX;
  tmpvar_10.y = _ScaleY;
  highp mat2 tmpvar_11;
  tmpvar_11[0] = glstate_matrix_projection[0].xy;
  tmpvar_11[1] = glstate_matrix_projection[1].xy;
  pixelSize_5 = (tmpvar_8.ww / (tmpvar_10 * abs(
    (tmpvar_11 * _ScreenParams.xy)
  )));
  scale_4 = (inversesqrt(dot (pixelSize_5, pixelSize_5)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_12;
    tmpvar_12[0] = unity_WorldToObject[0].xyz;
    tmpvar_12[1] = unity_WorldToObject[1].xyz;
    tmpvar_12[2] = unity_WorldToObject[2].xyz;
    scale_4 = mix ((abs(scale_4) * (1.0 - _PerspectiveFilter)), scale_4, abs(dot (
      normalize((_glesNormal * tmpvar_12))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz))
    )));
  };
  weight_3 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_7) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec4 tmpvar_13;
  tmpvar_13 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_14;
  highp vec2 xlat_varoutput_15;
  xlat_varoutput_15.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_15.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_15.x));
  tmpvar_14 = (xlat_varoutput_15 * 0.001953125);
  highp vec4 tmpvar_16;
  tmpvar_16.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_4)) - weight_3);
  tmpvar_16.y = scale_4;
  tmpvar_16.z = ((0.5 - weight_3) + (0.5 / scale_4));
  tmpvar_16.w = weight_3;
  highp vec2 tmpvar_17;
  tmpvar_17.x = _MaskSoftnessX;
  tmpvar_17.y = _MaskSoftnessY;
  highp vec4 tmpvar_18;
  tmpvar_18.xy = (((vert_6.xy * 2.0) - tmpvar_13.xy) - tmpvar_13.zw);
  tmpvar_18.zw = (0.25 / ((0.25 * tmpvar_17) + pixelSize_5));
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.xy = ((tmpvar_14 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_20.zw = ((tmpvar_14 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  gl_Position = tmpvar_8;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_18;
  xlv_TEXCOORD3 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz));
  xlv_TEXCOORD5 = tmpvar_20;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_2 = (outlineColor_2 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_3;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_2;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_3 = faceColor_17;
  mediump vec2 tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  faceColor_3 = (faceColor_3 * (tmpvar_23.x * tmpvar_23.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
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
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float weight_3;
  highp float scale_4;
  highp vec2 pixelSize_5;
  highp vec4 vert_6;
  highp float tmpvar_7;
  tmpvar_7 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_6.zw = _glesVertex.zw;
  vert_6.x = (_glesVertex.x + _VertexOffsetX);
  vert_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = vert_6.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp vec2 tmpvar_10;
  tmpvar_10.x = _ScaleX;
  tmpvar_10.y = _ScaleY;
  highp mat2 tmpvar_11;
  tmpvar_11[0] = glstate_matrix_projection[0].xy;
  tmpvar_11[1] = glstate_matrix_projection[1].xy;
  pixelSize_5 = (tmpvar_8.ww / (tmpvar_10 * abs(
    (tmpvar_11 * _ScreenParams.xy)
  )));
  scale_4 = (inversesqrt(dot (pixelSize_5, pixelSize_5)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_12;
    tmpvar_12[0] = unity_WorldToObject[0].xyz;
    tmpvar_12[1] = unity_WorldToObject[1].xyz;
    tmpvar_12[2] = unity_WorldToObject[2].xyz;
    scale_4 = mix ((abs(scale_4) * (1.0 - _PerspectiveFilter)), scale_4, abs(dot (
      normalize((_glesNormal * tmpvar_12))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz))
    )));
  };
  weight_3 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_7) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec4 tmpvar_13;
  tmpvar_13 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_14;
  highp vec2 xlat_varoutput_15;
  xlat_varoutput_15.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_15.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_15.x));
  tmpvar_14 = (xlat_varoutput_15 * 0.001953125);
  highp vec4 tmpvar_16;
  tmpvar_16.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_4)) - weight_3);
  tmpvar_16.y = scale_4;
  tmpvar_16.z = ((0.5 - weight_3) + (0.5 / scale_4));
  tmpvar_16.w = weight_3;
  highp vec2 tmpvar_17;
  tmpvar_17.x = _MaskSoftnessX;
  tmpvar_17.y = _MaskSoftnessY;
  highp vec4 tmpvar_18;
  tmpvar_18.xy = (((vert_6.xy * 2.0) - tmpvar_13.xy) - tmpvar_13.zw);
  tmpvar_18.zw = (0.25 / ((0.25 * tmpvar_17) + pixelSize_5));
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.xy = ((tmpvar_14 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_20.zw = ((tmpvar_14 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  gl_Position = tmpvar_8;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_18;
  xlv_TEXCOORD3 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz));
  xlv_TEXCOORD5 = tmpvar_20;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_2 = (outlineColor_2 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_3;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_2;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_3 = faceColor_17;
  mediump vec2 tmpvar_23;
  highp vec2 tmpvar_24;
  tmpvar_24 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_23 = tmpvar_24;
  faceColor_3 = (faceColor_3 * (tmpvar_23.x * tmpvar_23.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNDERLAY_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_7;
  tmpvar_7 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_9;
  tmpvar_9.x = _FaceUVSpeedX;
  tmpvar_9.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD5.xy + (tmpvar_9 * _Time.y));
  tmpvar_10 = texture2D (_FaceTex, P_11);
  faceColor_3 = (faceColor_3 * tmpvar_10);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _OutlineUVSpeedX;
  tmpvar_12.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = (xlv_TEXCOORD5.zw + (tmpvar_12 * _Time.y));
  tmpvar_13 = texture2D (_OutlineTex, P_14);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_15;
  d_15 = tmpvar_6;
  lowp vec4 faceColor_16;
  faceColor_16 = faceColor_3;
  lowp vec4 outlineColor_17;
  outlineColor_17 = outlineColor_2;
  mediump float outline_18;
  outline_18 = tmpvar_7;
  mediump float softness_19;
  softness_19 = tmpvar_8;
  mediump float tmpvar_20;
  tmpvar_20 = (1.0 - clamp ((
    ((d_15 - (outline_18 * 0.5)) + (softness_19 * 0.5))
   / 
    (1.0 + softness_19)
  ), 0.0, 1.0));
  faceColor_16.xyz = (faceColor_16.xyz * faceColor_16.w);
  outlineColor_17.xyz = (outlineColor_17.xyz * outlineColor_17.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_16, outlineColor_17, vec4((clamp (
    (d_15 + (outline_18 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_18)
  ))));
  faceColor_16 = tmpvar_21;
  faceColor_16 = (faceColor_16 * tmpvar_20);
  faceColor_3 = faceColor_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((tmpvar_22.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_3 = (faceColor_3 + ((xlv_COLOR1 * tmpvar_23) * (1.0 - faceColor_3.w)));
  mediump vec2 tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  faceColor_3 = (faceColor_3 * (tmpvar_24.x * tmpvar_24.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNDERLAY_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_7;
  tmpvar_7 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_9;
  tmpvar_9.x = _FaceUVSpeedX;
  tmpvar_9.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD5.xy + (tmpvar_9 * _Time.y));
  tmpvar_10 = texture2D (_FaceTex, P_11);
  faceColor_3 = (faceColor_3 * tmpvar_10);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _OutlineUVSpeedX;
  tmpvar_12.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = (xlv_TEXCOORD5.zw + (tmpvar_12 * _Time.y));
  tmpvar_13 = texture2D (_OutlineTex, P_14);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_15;
  d_15 = tmpvar_6;
  lowp vec4 faceColor_16;
  faceColor_16 = faceColor_3;
  lowp vec4 outlineColor_17;
  outlineColor_17 = outlineColor_2;
  mediump float outline_18;
  outline_18 = tmpvar_7;
  mediump float softness_19;
  softness_19 = tmpvar_8;
  mediump float tmpvar_20;
  tmpvar_20 = (1.0 - clamp ((
    ((d_15 - (outline_18 * 0.5)) + (softness_19 * 0.5))
   / 
    (1.0 + softness_19)
  ), 0.0, 1.0));
  faceColor_16.xyz = (faceColor_16.xyz * faceColor_16.w);
  outlineColor_17.xyz = (outlineColor_17.xyz * outlineColor_17.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_16, outlineColor_17, vec4((clamp (
    (d_15 + (outline_18 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_18)
  ))));
  faceColor_16 = tmpvar_21;
  faceColor_16 = (faceColor_16 * tmpvar_20);
  faceColor_3 = faceColor_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((tmpvar_22.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_3 = (faceColor_3 + ((xlv_COLOR1 * tmpvar_23) * (1.0 - faceColor_3.w)));
  mediump vec2 tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  faceColor_3 = (faceColor_3 * (tmpvar_24.x * tmpvar_24.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNDERLAY_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    ((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _ScaleRatioA;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_7;
  tmpvar_7 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_9;
  tmpvar_9.x = _FaceUVSpeedX;
  tmpvar_9.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD5.xy + (tmpvar_9 * _Time.y));
  tmpvar_10 = texture2D (_FaceTex, P_11);
  faceColor_3 = (faceColor_3 * tmpvar_10);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _OutlineUVSpeedX;
  tmpvar_12.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = (xlv_TEXCOORD5.zw + (tmpvar_12 * _Time.y));
  tmpvar_13 = texture2D (_OutlineTex, P_14);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_15;
  d_15 = tmpvar_6;
  lowp vec4 faceColor_16;
  faceColor_16 = faceColor_3;
  lowp vec4 outlineColor_17;
  outlineColor_17 = outlineColor_2;
  mediump float outline_18;
  outline_18 = tmpvar_7;
  mediump float softness_19;
  softness_19 = tmpvar_8;
  mediump float tmpvar_20;
  tmpvar_20 = (1.0 - clamp ((
    ((d_15 - (outline_18 * 0.5)) + (softness_19 * 0.5))
   / 
    (1.0 + softness_19)
  ), 0.0, 1.0));
  faceColor_16.xyz = (faceColor_16.xyz * faceColor_16.w);
  outlineColor_17.xyz = (outlineColor_17.xyz * outlineColor_17.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_16, outlineColor_17, vec4((clamp (
    (d_15 + (outline_18 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_18)
  ))));
  faceColor_16 = tmpvar_21;
  faceColor_16 = (faceColor_16 * tmpvar_20);
  faceColor_3 = faceColor_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((tmpvar_22.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_3 = (faceColor_3 + ((xlv_COLOR1 * tmpvar_23) * (1.0 - faceColor_3.w)));
  mediump vec2 tmpvar_24;
  highp vec2 tmpvar_25;
  tmpvar_25 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_24 = tmpvar_25;
  faceColor_3 = (faceColor_3 * (tmpvar_24.x * tmpvar_24.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float weight_3;
  highp float scale_4;
  highp vec2 pixelSize_5;
  highp vec4 vert_6;
  highp float tmpvar_7;
  tmpvar_7 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_6.zw = _glesVertex.zw;
  vert_6.x = (_glesVertex.x + _VertexOffsetX);
  vert_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = vert_6.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp vec2 tmpvar_10;
  tmpvar_10.x = _ScaleX;
  tmpvar_10.y = _ScaleY;
  highp mat2 tmpvar_11;
  tmpvar_11[0] = glstate_matrix_projection[0].xy;
  tmpvar_11[1] = glstate_matrix_projection[1].xy;
  pixelSize_5 = (tmpvar_8.ww / (tmpvar_10 * abs(
    (tmpvar_11 * _ScreenParams.xy)
  )));
  scale_4 = (inversesqrt(dot (pixelSize_5, pixelSize_5)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_12;
    tmpvar_12[0] = unity_WorldToObject[0].xyz;
    tmpvar_12[1] = unity_WorldToObject[1].xyz;
    tmpvar_12[2] = unity_WorldToObject[2].xyz;
    scale_4 = mix ((abs(scale_4) * (1.0 - _PerspectiveFilter)), scale_4, abs(dot (
      normalize((_glesNormal * tmpvar_12))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz))
    )));
  };
  weight_3 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_7) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec4 tmpvar_13;
  tmpvar_13 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_14;
  highp vec2 xlat_varoutput_15;
  xlat_varoutput_15.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_15.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_15.x));
  tmpvar_14 = (xlat_varoutput_15 * 0.001953125);
  highp vec4 tmpvar_16;
  tmpvar_16.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_4)) - weight_3);
  tmpvar_16.y = scale_4;
  tmpvar_16.z = ((0.5 - weight_3) + (0.5 / scale_4));
  tmpvar_16.w = weight_3;
  highp vec2 tmpvar_17;
  tmpvar_17.x = _MaskSoftnessX;
  tmpvar_17.y = _MaskSoftnessY;
  highp vec4 tmpvar_18;
  tmpvar_18.xy = (((vert_6.xy * 2.0) - tmpvar_13.xy) - tmpvar_13.zw);
  tmpvar_18.zw = (0.25 / ((0.25 * tmpvar_17) + pixelSize_5));
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.xy = ((tmpvar_14 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_20.zw = ((tmpvar_14 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  gl_Position = tmpvar_8;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_18;
  xlv_TEXCOORD3 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz));
  xlv_TEXCOORD5 = tmpvar_20;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_2 = (outlineColor_2 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_3;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_2;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_3 = faceColor_17;
  highp vec4 tmpvar_23;
  highp float glow_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_7 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_26;
  tmpvar_26 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_25 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_24 = (1.0 - pow (clamp (
    abs((tmpvar_25 / (1.0 + tmpvar_26)))
  , 0.0, 1.0), _GlowPower));
  glow_24 = (glow_24 * sqrt(min (1.0, tmpvar_26)));
  highp float tmpvar_27;
  tmpvar_27 = clamp (((_GlowColor.w * glow_24) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_28;
  tmpvar_28.xyz = _GlowColor.xyz;
  tmpvar_28.w = tmpvar_27;
  tmpvar_23 = tmpvar_28;
  faceColor_3.xyz = (faceColor_3.xyz + (tmpvar_23.xyz * tmpvar_23.w));
  mediump vec2 tmpvar_29;
  highp vec2 tmpvar_30;
  tmpvar_30 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  faceColor_3 = (faceColor_3 * (tmpvar_29.x * tmpvar_29.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float weight_3;
  highp float scale_4;
  highp vec2 pixelSize_5;
  highp vec4 vert_6;
  highp float tmpvar_7;
  tmpvar_7 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_6.zw = _glesVertex.zw;
  vert_6.x = (_glesVertex.x + _VertexOffsetX);
  vert_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = vert_6.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp vec2 tmpvar_10;
  tmpvar_10.x = _ScaleX;
  tmpvar_10.y = _ScaleY;
  highp mat2 tmpvar_11;
  tmpvar_11[0] = glstate_matrix_projection[0].xy;
  tmpvar_11[1] = glstate_matrix_projection[1].xy;
  pixelSize_5 = (tmpvar_8.ww / (tmpvar_10 * abs(
    (tmpvar_11 * _ScreenParams.xy)
  )));
  scale_4 = (inversesqrt(dot (pixelSize_5, pixelSize_5)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_12;
    tmpvar_12[0] = unity_WorldToObject[0].xyz;
    tmpvar_12[1] = unity_WorldToObject[1].xyz;
    tmpvar_12[2] = unity_WorldToObject[2].xyz;
    scale_4 = mix ((abs(scale_4) * (1.0 - _PerspectiveFilter)), scale_4, abs(dot (
      normalize((_glesNormal * tmpvar_12))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz))
    )));
  };
  weight_3 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_7) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec4 tmpvar_13;
  tmpvar_13 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_14;
  highp vec2 xlat_varoutput_15;
  xlat_varoutput_15.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_15.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_15.x));
  tmpvar_14 = (xlat_varoutput_15 * 0.001953125);
  highp vec4 tmpvar_16;
  tmpvar_16.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_4)) - weight_3);
  tmpvar_16.y = scale_4;
  tmpvar_16.z = ((0.5 - weight_3) + (0.5 / scale_4));
  tmpvar_16.w = weight_3;
  highp vec2 tmpvar_17;
  tmpvar_17.x = _MaskSoftnessX;
  tmpvar_17.y = _MaskSoftnessY;
  highp vec4 tmpvar_18;
  tmpvar_18.xy = (((vert_6.xy * 2.0) - tmpvar_13.xy) - tmpvar_13.zw);
  tmpvar_18.zw = (0.25 / ((0.25 * tmpvar_17) + pixelSize_5));
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.xy = ((tmpvar_14 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_20.zw = ((tmpvar_14 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  gl_Position = tmpvar_8;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_18;
  xlv_TEXCOORD3 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz));
  xlv_TEXCOORD5 = tmpvar_20;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_2 = (outlineColor_2 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_3;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_2;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_3 = faceColor_17;
  highp vec4 tmpvar_23;
  highp float glow_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_7 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_26;
  tmpvar_26 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_25 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_24 = (1.0 - pow (clamp (
    abs((tmpvar_25 / (1.0 + tmpvar_26)))
  , 0.0, 1.0), _GlowPower));
  glow_24 = (glow_24 * sqrt(min (1.0, tmpvar_26)));
  highp float tmpvar_27;
  tmpvar_27 = clamp (((_GlowColor.w * glow_24) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_28;
  tmpvar_28.xyz = _GlowColor.xyz;
  tmpvar_28.w = tmpvar_27;
  tmpvar_23 = tmpvar_28;
  faceColor_3.xyz = (faceColor_3.xyz + (tmpvar_23.xyz * tmpvar_23.w));
  mediump vec2 tmpvar_29;
  highp vec2 tmpvar_30;
  tmpvar_30 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  faceColor_3 = (faceColor_3 * (tmpvar_29.x * tmpvar_29.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float weight_3;
  highp float scale_4;
  highp vec2 pixelSize_5;
  highp vec4 vert_6;
  highp float tmpvar_7;
  tmpvar_7 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_6.zw = _glesVertex.zw;
  vert_6.x = (_glesVertex.x + _VertexOffsetX);
  vert_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_8;
  highp vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = vert_6.xyz;
  tmpvar_8 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_9));
  highp vec2 tmpvar_10;
  tmpvar_10.x = _ScaleX;
  tmpvar_10.y = _ScaleY;
  highp mat2 tmpvar_11;
  tmpvar_11[0] = glstate_matrix_projection[0].xy;
  tmpvar_11[1] = glstate_matrix_projection[1].xy;
  pixelSize_5 = (tmpvar_8.ww / (tmpvar_10 * abs(
    (tmpvar_11 * _ScreenParams.xy)
  )));
  scale_4 = (inversesqrt(dot (pixelSize_5, pixelSize_5)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_12;
    tmpvar_12[0] = unity_WorldToObject[0].xyz;
    tmpvar_12[1] = unity_WorldToObject[1].xyz;
    tmpvar_12[2] = unity_WorldToObject[2].xyz;
    scale_4 = mix ((abs(scale_4) * (1.0 - _PerspectiveFilter)), scale_4, abs(dot (
      normalize((_glesNormal * tmpvar_12))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz))
    )));
  };
  weight_3 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_7) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec4 tmpvar_13;
  tmpvar_13 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_14;
  highp vec2 xlat_varoutput_15;
  xlat_varoutput_15.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_15.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_15.x));
  tmpvar_14 = (xlat_varoutput_15 * 0.001953125);
  highp vec4 tmpvar_16;
  tmpvar_16.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_4)) - weight_3);
  tmpvar_16.y = scale_4;
  tmpvar_16.z = ((0.5 - weight_3) + (0.5 / scale_4));
  tmpvar_16.w = weight_3;
  highp vec2 tmpvar_17;
  tmpvar_17.x = _MaskSoftnessX;
  tmpvar_17.y = _MaskSoftnessY;
  highp vec4 tmpvar_18;
  tmpvar_18.xy = (((vert_6.xy * 2.0) - tmpvar_13.xy) - tmpvar_13.zw);
  tmpvar_18.zw = (0.25 / ((0.25 * tmpvar_17) + pixelSize_5));
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.xy = ((tmpvar_14 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_20.zw = ((tmpvar_14 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  gl_Position = tmpvar_8;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_16;
  xlv_TEXCOORD2 = tmpvar_18;
  xlv_TEXCOORD3 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_6).xyz));
  xlv_TEXCOORD5 = tmpvar_20;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float x_6;
  x_6 = (c_4 - xlv_TEXCOORD1.x);
  if ((x_6 < 0.0)) {
    discard;
  };
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_3 = (faceColor_3 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_2 = (outlineColor_2 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_3;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_2;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_3 = faceColor_17;
  highp vec4 tmpvar_23;
  highp float glow_24;
  highp float tmpvar_25;
  tmpvar_25 = (tmpvar_7 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_26;
  tmpvar_26 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_25 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_24 = (1.0 - pow (clamp (
    abs((tmpvar_25 / (1.0 + tmpvar_26)))
  , 0.0, 1.0), _GlowPower));
  glow_24 = (glow_24 * sqrt(min (1.0, tmpvar_26)));
  highp float tmpvar_27;
  tmpvar_27 = clamp (((_GlowColor.w * glow_24) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_28;
  tmpvar_28.xyz = _GlowColor.xyz;
  tmpvar_28.w = tmpvar_27;
  tmpvar_23 = tmpvar_28;
  faceColor_3.xyz = (faceColor_3.xyz + (tmpvar_23.xyz * tmpvar_23.w));
  mediump vec2 tmpvar_29;
  highp vec2 tmpvar_30;
  tmpvar_30 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_29 = tmpvar_30;
  faceColor_3 = (faceColor_3 * (tmpvar_29.x * tmpvar_29.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNDERLAY_ON" "BEVEL_ON" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _SpecularColor;
uniform highp float _LightAngle;
uniform highp float _SpecularPower;
uniform highp float _Reflectivity;
uniform highp float _Diffuse;
uniform highp float _Ambient;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec3 bump_2;
  mediump vec4 outlineColor_3;
  mediump vec4 faceColor_4;
  highp float c_5;
  lowp float tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_5) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_4 = _FaceColor;
  outlineColor_3 = _OutlineColor;
  faceColor_4.xyz = (faceColor_4.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_4 = (faceColor_4 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_3 = (outlineColor_3 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_4;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_3;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_4 = faceColor_17;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (0.5 / _TextureWidth);
  tmpvar_23.y = (0.5 / _TextureHeight);
  highp vec4 h_24;
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0 - tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0 + tmpvar_23.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0 - tmpvar_23.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0 + tmpvar_23.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  h_24 = tmpvar_29;
  highp vec4 h_30;
  h_30 = h_24;
  highp float tmpvar_31;
  tmpvar_31 = (_ShaderFlags / 2.0);
  highp float tmpvar_32;
  tmpvar_32 = (fract(abs(tmpvar_31)) * 2.0);
  highp float tmpvar_33;
  if ((tmpvar_31 >= 0.0)) {
    tmpvar_33 = tmpvar_32;
  } else {
    tmpvar_33 = -(tmpvar_32);
  };
  h_30 = (h_24 + (xlv_TEXCOORD1.w + _BevelOffset));
  highp float tmpvar_34;
  tmpvar_34 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_30 = (h_30 - 0.5);
  h_30 = (h_30 / tmpvar_34);
  highp vec4 tmpvar_35;
  tmpvar_35 = clamp ((h_30 + 0.5), 0.0, 1.0);
  h_30 = tmpvar_35;
  if (bool(float((tmpvar_33 >= 1.0)))) {
    h_30 = (1.0 - abs((
      (tmpvar_35 * 2.0)
     - 1.0)));
  };
  h_30 = (min (mix (h_30, 
    sin(((h_30 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_34) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_36;
  tmpvar_36.xy = vec2(1.0, 0.0);
  tmpvar_36.z = (h_30.y - h_30.x);
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(tmpvar_36);
  highp vec3 tmpvar_38;
  tmpvar_38.xy = vec2(0.0, -1.0);
  tmpvar_38.z = (h_30.w - h_30.z);
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize(tmpvar_38);
  highp vec2 tmpvar_40;
  tmpvar_40.x = _FaceUVSpeedX;
  tmpvar_40.y = _FaceUVSpeedY;
  highp vec2 P_41;
  P_41 = (xlv_TEXCOORD5.xy + (tmpvar_40 * _Time.y));
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((texture2D (_BumpMap, P_41).xyz * 2.0) - 1.0);
  bump_2 = tmpvar_42;
  bump_2 = (bump_2 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_7 + (tmpvar_8 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_43;
  tmpvar_43 = normalize(((
    (tmpvar_37.yzx * tmpvar_39.zxy)
   - 
    (tmpvar_37.zxy * tmpvar_39.yzx)
  ) - bump_2));
  highp vec3 tmpvar_44;
  tmpvar_44.z = -1.0;
  tmpvar_44.x = sin(_LightAngle);
  tmpvar_44.y = cos(_LightAngle);
  highp vec3 tmpvar_45;
  tmpvar_45 = normalize(tmpvar_44);
  highp vec3 tmpvar_46;
  tmpvar_46 = ((_SpecularColor.xyz * pow (
    max (0.0, dot (tmpvar_43, tmpvar_45))
  , _Reflectivity)) * _SpecularPower);
  faceColor_4.xyz = (faceColor_4.xyz + (tmpvar_46 * faceColor_4.w));
  highp float tmpvar_47;
  tmpvar_47 = dot (tmpvar_43, tmpvar_45);
  faceColor_4.xyz = (faceColor_4.xyz * (1.0 - (tmpvar_47 * _Diffuse)));
  highp float tmpvar_48;
  tmpvar_48 = mix (_Ambient, 1.0, (tmpvar_43.z * tmpvar_43.z));
  faceColor_4.xyz = (faceColor_4.xyz * tmpvar_48);
  highp vec3 tmpvar_49;
  highp vec3 N_50;
  N_50 = -(tmpvar_43);
  tmpvar_49 = (xlv_TEXCOORD3 - (2.0 * (
    dot (N_50, xlv_TEXCOORD3)
   * N_50)));
  lowp vec4 tmpvar_51;
  tmpvar_51 = textureCube (_Cube, tmpvar_49);
  highp float tmpvar_52;
  tmpvar_52 = clamp ((tmpvar_7 + (tmpvar_8 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_53;
  tmpvar_53 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_52));
  faceColor_4.xyz = (faceColor_4.xyz + ((tmpvar_51.xyz * tmpvar_53) * faceColor_4.w));
  lowp vec4 tmpvar_54;
  tmpvar_54 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_55;
  tmpvar_55 = clamp (((tmpvar_54.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_4 = (faceColor_4 + ((xlv_COLOR1 * tmpvar_55) * (1.0 - faceColor_4.w)));
  highp vec4 tmpvar_56;
  highp float glow_57;
  highp float tmpvar_58;
  tmpvar_58 = (tmpvar_7 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_59;
  tmpvar_59 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_58 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_57 = (1.0 - pow (clamp (
    abs((tmpvar_58 / (1.0 + tmpvar_59)))
  , 0.0, 1.0), _GlowPower));
  glow_57 = (glow_57 * sqrt(min (1.0, tmpvar_59)));
  highp float tmpvar_60;
  tmpvar_60 = clamp (((_GlowColor.w * glow_57) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_61;
  tmpvar_61.xyz = _GlowColor.xyz;
  tmpvar_61.w = tmpvar_60;
  tmpvar_56 = tmpvar_61;
  faceColor_4.xyz = (faceColor_4.xyz + (tmpvar_56.xyz * tmpvar_56.w));
  mediump vec2 tmpvar_62;
  highp vec2 tmpvar_63;
  tmpvar_63 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_62 = tmpvar_63;
  faceColor_4 = (faceColor_4 * (tmpvar_62.x * tmpvar_62.y));
  tmpvar_1 = (faceColor_4 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNDERLAY_ON" "BEVEL_ON" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _SpecularColor;
uniform highp float _LightAngle;
uniform highp float _SpecularPower;
uniform highp float _Reflectivity;
uniform highp float _Diffuse;
uniform highp float _Ambient;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec3 bump_2;
  mediump vec4 outlineColor_3;
  mediump vec4 faceColor_4;
  highp float c_5;
  lowp float tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_5) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_4 = _FaceColor;
  outlineColor_3 = _OutlineColor;
  faceColor_4.xyz = (faceColor_4.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_4 = (faceColor_4 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_3 = (outlineColor_3 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_4;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_3;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_4 = faceColor_17;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (0.5 / _TextureWidth);
  tmpvar_23.y = (0.5 / _TextureHeight);
  highp vec4 h_24;
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0 - tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0 + tmpvar_23.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0 - tmpvar_23.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0 + tmpvar_23.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  h_24 = tmpvar_29;
  highp vec4 h_30;
  h_30 = h_24;
  highp float tmpvar_31;
  tmpvar_31 = (_ShaderFlags / 2.0);
  highp float tmpvar_32;
  tmpvar_32 = (fract(abs(tmpvar_31)) * 2.0);
  highp float tmpvar_33;
  if ((tmpvar_31 >= 0.0)) {
    tmpvar_33 = tmpvar_32;
  } else {
    tmpvar_33 = -(tmpvar_32);
  };
  h_30 = (h_24 + (xlv_TEXCOORD1.w + _BevelOffset));
  highp float tmpvar_34;
  tmpvar_34 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_30 = (h_30 - 0.5);
  h_30 = (h_30 / tmpvar_34);
  highp vec4 tmpvar_35;
  tmpvar_35 = clamp ((h_30 + 0.5), 0.0, 1.0);
  h_30 = tmpvar_35;
  if (bool(float((tmpvar_33 >= 1.0)))) {
    h_30 = (1.0 - abs((
      (tmpvar_35 * 2.0)
     - 1.0)));
  };
  h_30 = (min (mix (h_30, 
    sin(((h_30 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_34) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_36;
  tmpvar_36.xy = vec2(1.0, 0.0);
  tmpvar_36.z = (h_30.y - h_30.x);
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(tmpvar_36);
  highp vec3 tmpvar_38;
  tmpvar_38.xy = vec2(0.0, -1.0);
  tmpvar_38.z = (h_30.w - h_30.z);
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize(tmpvar_38);
  highp vec2 tmpvar_40;
  tmpvar_40.x = _FaceUVSpeedX;
  tmpvar_40.y = _FaceUVSpeedY;
  highp vec2 P_41;
  P_41 = (xlv_TEXCOORD5.xy + (tmpvar_40 * _Time.y));
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((texture2D (_BumpMap, P_41).xyz * 2.0) - 1.0);
  bump_2 = tmpvar_42;
  bump_2 = (bump_2 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_7 + (tmpvar_8 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_43;
  tmpvar_43 = normalize(((
    (tmpvar_37.yzx * tmpvar_39.zxy)
   - 
    (tmpvar_37.zxy * tmpvar_39.yzx)
  ) - bump_2));
  highp vec3 tmpvar_44;
  tmpvar_44.z = -1.0;
  tmpvar_44.x = sin(_LightAngle);
  tmpvar_44.y = cos(_LightAngle);
  highp vec3 tmpvar_45;
  tmpvar_45 = normalize(tmpvar_44);
  highp vec3 tmpvar_46;
  tmpvar_46 = ((_SpecularColor.xyz * pow (
    max (0.0, dot (tmpvar_43, tmpvar_45))
  , _Reflectivity)) * _SpecularPower);
  faceColor_4.xyz = (faceColor_4.xyz + (tmpvar_46 * faceColor_4.w));
  highp float tmpvar_47;
  tmpvar_47 = dot (tmpvar_43, tmpvar_45);
  faceColor_4.xyz = (faceColor_4.xyz * (1.0 - (tmpvar_47 * _Diffuse)));
  highp float tmpvar_48;
  tmpvar_48 = mix (_Ambient, 1.0, (tmpvar_43.z * tmpvar_43.z));
  faceColor_4.xyz = (faceColor_4.xyz * tmpvar_48);
  highp vec3 tmpvar_49;
  highp vec3 N_50;
  N_50 = -(tmpvar_43);
  tmpvar_49 = (xlv_TEXCOORD3 - (2.0 * (
    dot (N_50, xlv_TEXCOORD3)
   * N_50)));
  lowp vec4 tmpvar_51;
  tmpvar_51 = textureCube (_Cube, tmpvar_49);
  highp float tmpvar_52;
  tmpvar_52 = clamp ((tmpvar_7 + (tmpvar_8 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_53;
  tmpvar_53 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_52));
  faceColor_4.xyz = (faceColor_4.xyz + ((tmpvar_51.xyz * tmpvar_53) * faceColor_4.w));
  lowp vec4 tmpvar_54;
  tmpvar_54 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_55;
  tmpvar_55 = clamp (((tmpvar_54.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_4 = (faceColor_4 + ((xlv_COLOR1 * tmpvar_55) * (1.0 - faceColor_4.w)));
  highp vec4 tmpvar_56;
  highp float glow_57;
  highp float tmpvar_58;
  tmpvar_58 = (tmpvar_7 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_59;
  tmpvar_59 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_58 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_57 = (1.0 - pow (clamp (
    abs((tmpvar_58 / (1.0 + tmpvar_59)))
  , 0.0, 1.0), _GlowPower));
  glow_57 = (glow_57 * sqrt(min (1.0, tmpvar_59)));
  highp float tmpvar_60;
  tmpvar_60 = clamp (((_GlowColor.w * glow_57) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_61;
  tmpvar_61.xyz = _GlowColor.xyz;
  tmpvar_61.w = tmpvar_60;
  tmpvar_56 = tmpvar_61;
  faceColor_4.xyz = (faceColor_4.xyz + (tmpvar_56.xyz * tmpvar_56.w));
  mediump vec2 tmpvar_62;
  highp vec2 tmpvar_63;
  tmpvar_63 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_62 = tmpvar_63;
  faceColor_4 = (faceColor_4 * (tmpvar_62.x * tmpvar_62.y));
  tmpvar_1 = (faceColor_4 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNDERLAY_ON" "BEVEL_ON" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _SpecularColor;
uniform highp float _LightAngle;
uniform highp float _SpecularPower;
uniform highp float _Reflectivity;
uniform highp float _Diffuse;
uniform highp float _Ambient;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec3 bump_2;
  mediump vec4 outlineColor_3;
  mediump vec4 faceColor_4;
  highp float c_5;
  lowp float tmpvar_6;
  tmpvar_6 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_5 = tmpvar_6;
  highp float tmpvar_7;
  tmpvar_7 = ((xlv_TEXCOORD1.z - c_5) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_9;
  tmpvar_9 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_4 = _FaceColor;
  outlineColor_3 = _OutlineColor;
  faceColor_4.xyz = (faceColor_4.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_10;
  tmpvar_10.x = _FaceUVSpeedX;
  tmpvar_10.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_11;
  highp vec2 P_12;
  P_12 = (xlv_TEXCOORD5.xy + (tmpvar_10 * _Time.y));
  tmpvar_11 = texture2D (_FaceTex, P_12);
  faceColor_4 = (faceColor_4 * tmpvar_11);
  highp vec2 tmpvar_13;
  tmpvar_13.x = _OutlineUVSpeedX;
  tmpvar_13.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_14;
  highp vec2 P_15;
  P_15 = (xlv_TEXCOORD5.zw + (tmpvar_13 * _Time.y));
  tmpvar_14 = texture2D (_OutlineTex, P_15);
  outlineColor_3 = (outlineColor_3 * tmpvar_14);
  mediump float d_16;
  d_16 = tmpvar_7;
  lowp vec4 faceColor_17;
  faceColor_17 = faceColor_4;
  lowp vec4 outlineColor_18;
  outlineColor_18 = outlineColor_3;
  mediump float outline_19;
  outline_19 = tmpvar_8;
  mediump float softness_20;
  softness_20 = tmpvar_9;
  mediump float tmpvar_21;
  tmpvar_21 = (1.0 - clamp ((
    ((d_16 - (outline_19 * 0.5)) + (softness_20 * 0.5))
   / 
    (1.0 + softness_20)
  ), 0.0, 1.0));
  faceColor_17.xyz = (faceColor_17.xyz * faceColor_17.w);
  outlineColor_18.xyz = (outlineColor_18.xyz * outlineColor_18.w);
  mediump vec4 tmpvar_22;
  tmpvar_22 = mix (faceColor_17, outlineColor_18, vec4((clamp (
    (d_16 + (outline_19 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_19)
  ))));
  faceColor_17 = tmpvar_22;
  faceColor_17 = (faceColor_17 * tmpvar_21);
  faceColor_4 = faceColor_17;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (0.5 / _TextureWidth);
  tmpvar_23.y = (0.5 / _TextureHeight);
  highp vec4 h_24;
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0 - tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0 + tmpvar_23.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0 - tmpvar_23.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0 + tmpvar_23.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  h_24 = tmpvar_29;
  highp vec4 h_30;
  h_30 = h_24;
  highp float tmpvar_31;
  tmpvar_31 = (_ShaderFlags / 2.0);
  highp float tmpvar_32;
  tmpvar_32 = (fract(abs(tmpvar_31)) * 2.0);
  highp float tmpvar_33;
  if ((tmpvar_31 >= 0.0)) {
    tmpvar_33 = tmpvar_32;
  } else {
    tmpvar_33 = -(tmpvar_32);
  };
  h_30 = (h_24 + (xlv_TEXCOORD1.w + _BevelOffset));
  highp float tmpvar_34;
  tmpvar_34 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_30 = (h_30 - 0.5);
  h_30 = (h_30 / tmpvar_34);
  highp vec4 tmpvar_35;
  tmpvar_35 = clamp ((h_30 + 0.5), 0.0, 1.0);
  h_30 = tmpvar_35;
  if (bool(float((tmpvar_33 >= 1.0)))) {
    h_30 = (1.0 - abs((
      (tmpvar_35 * 2.0)
     - 1.0)));
  };
  h_30 = (min (mix (h_30, 
    sin(((h_30 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_34) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_36;
  tmpvar_36.xy = vec2(1.0, 0.0);
  tmpvar_36.z = (h_30.y - h_30.x);
  highp vec3 tmpvar_37;
  tmpvar_37 = normalize(tmpvar_36);
  highp vec3 tmpvar_38;
  tmpvar_38.xy = vec2(0.0, -1.0);
  tmpvar_38.z = (h_30.w - h_30.z);
  highp vec3 tmpvar_39;
  tmpvar_39 = normalize(tmpvar_38);
  highp vec2 tmpvar_40;
  tmpvar_40.x = _FaceUVSpeedX;
  tmpvar_40.y = _FaceUVSpeedY;
  highp vec2 P_41;
  P_41 = (xlv_TEXCOORD5.xy + (tmpvar_40 * _Time.y));
  lowp vec3 tmpvar_42;
  tmpvar_42 = ((texture2D (_BumpMap, P_41).xyz * 2.0) - 1.0);
  bump_2 = tmpvar_42;
  bump_2 = (bump_2 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_7 + (tmpvar_8 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_43;
  tmpvar_43 = normalize(((
    (tmpvar_37.yzx * tmpvar_39.zxy)
   - 
    (tmpvar_37.zxy * tmpvar_39.yzx)
  ) - bump_2));
  highp vec3 tmpvar_44;
  tmpvar_44.z = -1.0;
  tmpvar_44.x = sin(_LightAngle);
  tmpvar_44.y = cos(_LightAngle);
  highp vec3 tmpvar_45;
  tmpvar_45 = normalize(tmpvar_44);
  highp vec3 tmpvar_46;
  tmpvar_46 = ((_SpecularColor.xyz * pow (
    max (0.0, dot (tmpvar_43, tmpvar_45))
  , _Reflectivity)) * _SpecularPower);
  faceColor_4.xyz = (faceColor_4.xyz + (tmpvar_46 * faceColor_4.w));
  highp float tmpvar_47;
  tmpvar_47 = dot (tmpvar_43, tmpvar_45);
  faceColor_4.xyz = (faceColor_4.xyz * (1.0 - (tmpvar_47 * _Diffuse)));
  highp float tmpvar_48;
  tmpvar_48 = mix (_Ambient, 1.0, (tmpvar_43.z * tmpvar_43.z));
  faceColor_4.xyz = (faceColor_4.xyz * tmpvar_48);
  highp vec3 tmpvar_49;
  highp vec3 N_50;
  N_50 = -(tmpvar_43);
  tmpvar_49 = (xlv_TEXCOORD3 - (2.0 * (
    dot (N_50, xlv_TEXCOORD3)
   * N_50)));
  lowp vec4 tmpvar_51;
  tmpvar_51 = textureCube (_Cube, tmpvar_49);
  highp float tmpvar_52;
  tmpvar_52 = clamp ((tmpvar_7 + (tmpvar_8 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_53;
  tmpvar_53 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_52));
  faceColor_4.xyz = (faceColor_4.xyz + ((tmpvar_51.xyz * tmpvar_53) * faceColor_4.w));
  lowp vec4 tmpvar_54;
  tmpvar_54 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_55;
  tmpvar_55 = clamp (((tmpvar_54.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_4 = (faceColor_4 + ((xlv_COLOR1 * tmpvar_55) * (1.0 - faceColor_4.w)));
  highp vec4 tmpvar_56;
  highp float glow_57;
  highp float tmpvar_58;
  tmpvar_58 = (tmpvar_7 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_59;
  tmpvar_59 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_58 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_57 = (1.0 - pow (clamp (
    abs((tmpvar_58 / (1.0 + tmpvar_59)))
  , 0.0, 1.0), _GlowPower));
  glow_57 = (glow_57 * sqrt(min (1.0, tmpvar_59)));
  highp float tmpvar_60;
  tmpvar_60 = clamp (((_GlowColor.w * glow_57) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_61;
  tmpvar_61.xyz = _GlowColor.xyz;
  tmpvar_61.w = tmpvar_60;
  tmpvar_56 = tmpvar_61;
  faceColor_4.xyz = (faceColor_4.xyz + (tmpvar_56.xyz * tmpvar_56.w));
  mediump vec2 tmpvar_62;
  highp vec2 tmpvar_63;
  tmpvar_63 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_62 = tmpvar_63;
  faceColor_4 = (faceColor_4 * (tmpvar_62.x * tmpvar_62.y));
  tmpvar_1 = (faceColor_4 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNDERLAY_ON" "GLOW_ON" "MASK_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_7;
  tmpvar_7 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_9;
  tmpvar_9.x = _FaceUVSpeedX;
  tmpvar_9.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD5.xy + (tmpvar_9 * _Time.y));
  tmpvar_10 = texture2D (_FaceTex, P_11);
  faceColor_3 = (faceColor_3 * tmpvar_10);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _OutlineUVSpeedX;
  tmpvar_12.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = (xlv_TEXCOORD5.zw + (tmpvar_12 * _Time.y));
  tmpvar_13 = texture2D (_OutlineTex, P_14);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_15;
  d_15 = tmpvar_6;
  lowp vec4 faceColor_16;
  faceColor_16 = faceColor_3;
  lowp vec4 outlineColor_17;
  outlineColor_17 = outlineColor_2;
  mediump float outline_18;
  outline_18 = tmpvar_7;
  mediump float softness_19;
  softness_19 = tmpvar_8;
  mediump float tmpvar_20;
  tmpvar_20 = (1.0 - clamp ((
    ((d_15 - (outline_18 * 0.5)) + (softness_19 * 0.5))
   / 
    (1.0 + softness_19)
  ), 0.0, 1.0));
  faceColor_16.xyz = (faceColor_16.xyz * faceColor_16.w);
  outlineColor_17.xyz = (outlineColor_17.xyz * outlineColor_17.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_16, outlineColor_17, vec4((clamp (
    (d_15 + (outline_18 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_18)
  ))));
  faceColor_16 = tmpvar_21;
  faceColor_16 = (faceColor_16 * tmpvar_20);
  faceColor_3 = faceColor_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((tmpvar_22.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_3 = (faceColor_3 + ((xlv_COLOR1 * tmpvar_23) * (1.0 - faceColor_3.w)));
  highp vec4 tmpvar_24;
  highp float glow_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_6 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_27;
  tmpvar_27 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_26 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_25 = (1.0 - pow (clamp (
    abs((tmpvar_26 / (1.0 + tmpvar_27)))
  , 0.0, 1.0), _GlowPower));
  glow_25 = (glow_25 * sqrt(min (1.0, tmpvar_27)));
  highp float tmpvar_28;
  tmpvar_28 = clamp (((_GlowColor.w * glow_25) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_29;
  tmpvar_29.xyz = _GlowColor.xyz;
  tmpvar_29.w = tmpvar_28;
  tmpvar_24 = tmpvar_29;
  faceColor_3.xyz = (faceColor_3.xyz + (tmpvar_24.xyz * tmpvar_24.w));
  mediump vec2 tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  faceColor_3 = (faceColor_3 * (tmpvar_30.x * tmpvar_30.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNDERLAY_ON" "GLOW_ON" "MASK_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_7;
  tmpvar_7 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_9;
  tmpvar_9.x = _FaceUVSpeedX;
  tmpvar_9.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD5.xy + (tmpvar_9 * _Time.y));
  tmpvar_10 = texture2D (_FaceTex, P_11);
  faceColor_3 = (faceColor_3 * tmpvar_10);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _OutlineUVSpeedX;
  tmpvar_12.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = (xlv_TEXCOORD5.zw + (tmpvar_12 * _Time.y));
  tmpvar_13 = texture2D (_OutlineTex, P_14);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_15;
  d_15 = tmpvar_6;
  lowp vec4 faceColor_16;
  faceColor_16 = faceColor_3;
  lowp vec4 outlineColor_17;
  outlineColor_17 = outlineColor_2;
  mediump float outline_18;
  outline_18 = tmpvar_7;
  mediump float softness_19;
  softness_19 = tmpvar_8;
  mediump float tmpvar_20;
  tmpvar_20 = (1.0 - clamp ((
    ((d_15 - (outline_18 * 0.5)) + (softness_19 * 0.5))
   / 
    (1.0 + softness_19)
  ), 0.0, 1.0));
  faceColor_16.xyz = (faceColor_16.xyz * faceColor_16.w);
  outlineColor_17.xyz = (outlineColor_17.xyz * outlineColor_17.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_16, outlineColor_17, vec4((clamp (
    (d_15 + (outline_18 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_18)
  ))));
  faceColor_16 = tmpvar_21;
  faceColor_16 = (faceColor_16 * tmpvar_20);
  faceColor_3 = faceColor_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((tmpvar_22.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_3 = (faceColor_3 + ((xlv_COLOR1 * tmpvar_23) * (1.0 - faceColor_3.w)));
  highp vec4 tmpvar_24;
  highp float glow_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_6 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_27;
  tmpvar_27 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_26 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_25 = (1.0 - pow (clamp (
    abs((tmpvar_26 / (1.0 + tmpvar_27)))
  , 0.0, 1.0), _GlowPower));
  glow_25 = (glow_25 * sqrt(min (1.0, tmpvar_27)));
  highp float tmpvar_28;
  tmpvar_28 = clamp (((_GlowColor.w * glow_25) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_29;
  tmpvar_29.xyz = _GlowColor.xyz;
  tmpvar_29.w = tmpvar_28;
  tmpvar_24 = tmpvar_29;
  faceColor_3.xyz = (faceColor_3.xyz + (tmpvar_24.xyz * tmpvar_24.w));
  mediump vec2 tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  faceColor_3 = (faceColor_3 * (tmpvar_30.x * tmpvar_30.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNDERLAY_ON" "GLOW_ON" "MASK_OFF" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp float _OutlineSoftness;
uniform highp float _OutlineWidth;
uniform highp mat4 _EnvMatrix;
uniform lowp vec4 _UnderlayColor;
uniform highp float _UnderlayOffsetX;
uniform highp float _UnderlayOffsetY;
uniform highp float _UnderlayDilate;
uniform highp float _UnderlaySoftness;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp float _ScaleRatioC;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp vec4 _ClipRect;
uniform highp float _MaskSoftnessX;
uniform highp float _MaskSoftnessY;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = _glesColor;
  highp vec2 tmpvar_2;
  tmpvar_2 = _glesMultiTexCoord0.xy;
  highp float bScale_3;
  highp vec4 underlayColor_4;
  highp float weight_5;
  highp float scale_6;
  highp vec2 pixelSize_7;
  highp vec4 vert_8;
  highp float tmpvar_9;
  tmpvar_9 = float((0.0 >= _glesMultiTexCoord1.y));
  vert_8.zw = _glesVertex.zw;
  vert_8.x = (_glesVertex.x + _VertexOffsetX);
  vert_8.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_10;
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = vert_8.xyz;
  tmpvar_10 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_11));
  highp vec2 tmpvar_12;
  tmpvar_12.x = _ScaleX;
  tmpvar_12.y = _ScaleY;
  highp mat2 tmpvar_13;
  tmpvar_13[0] = glstate_matrix_projection[0].xy;
  tmpvar_13[1] = glstate_matrix_projection[1].xy;
  pixelSize_7 = (tmpvar_10.ww / (tmpvar_12 * abs(
    (tmpvar_13 * _ScreenParams.xy)
  )));
  scale_6 = (inversesqrt(dot (pixelSize_7, pixelSize_7)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  if ((glstate_matrix_projection[3].w == 0.0)) {
    highp mat3 tmpvar_14;
    tmpvar_14[0] = unity_WorldToObject[0].xyz;
    tmpvar_14[1] = unity_WorldToObject[1].xyz;
    tmpvar_14[2] = unity_WorldToObject[2].xyz;
    scale_6 = mix ((abs(scale_6) * (1.0 - _PerspectiveFilter)), scale_6, abs(dot (
      normalize((_glesNormal * tmpvar_14))
    , 
      normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz))
    )));
  };
  weight_5 = (((
    (mix (_WeightNormal, _WeightBold, tmpvar_9) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  underlayColor_4 = _UnderlayColor;
  underlayColor_4.xyz = (underlayColor_4.xyz * underlayColor_4.w);
  bScale_3 = (scale_6 / (1.0 + (
    (_UnderlaySoftness * _ScaleRatioC)
   * scale_6)));
  highp vec2 tmpvar_15;
  tmpvar_15.x = ((-(
    (_UnderlayOffsetX * _ScaleRatioC)
  ) * _GradientScale) / _TextureWidth);
  tmpvar_15.y = ((-(
    (_UnderlayOffsetY * _ScaleRatioC)
  ) * _GradientScale) / _TextureHeight);
  highp vec4 tmpvar_16;
  tmpvar_16 = clamp (_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10), vec4(2e+10, 2e+10, 2e+10, 2e+10));
  highp vec2 tmpvar_17;
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_17 = (xlat_varoutput_18 * 0.001953125);
  highp vec4 tmpvar_19;
  tmpvar_19.x = (((
    min (((1.0 - (_OutlineWidth * _ScaleRatioA)) - (_OutlineSoftness * _ScaleRatioA)), ((1.0 - (_GlowOffset * _ScaleRatioB)) - (_GlowOuter * _ScaleRatioB)))
   / 2.0) - (0.5 / scale_6)) - weight_5);
  tmpvar_19.y = scale_6;
  tmpvar_19.z = ((0.5 - weight_5) + (0.5 / scale_6));
  tmpvar_19.w = weight_5;
  highp vec2 tmpvar_20;
  tmpvar_20.x = _MaskSoftnessX;
  tmpvar_20.y = _MaskSoftnessY;
  highp vec4 tmpvar_21;
  tmpvar_21.xy = (((vert_8.xy * 2.0) - tmpvar_16.xy) - tmpvar_16.zw);
  tmpvar_21.zw = (0.25 / ((0.25 * tmpvar_20) + pixelSize_7));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = _EnvMatrix[0].xyz;
  tmpvar_22[1] = _EnvMatrix[1].xyz;
  tmpvar_22[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_23;
  tmpvar_23.xy = (_glesMultiTexCoord0.xy + tmpvar_15);
  tmpvar_23.z = bScale_3;
  tmpvar_23.w = (((
    (0.5 - weight_5)
   * bScale_3) - 0.5) - ((_UnderlayDilate * _ScaleRatioC) * (0.5 * bScale_3)));
  highp vec4 tmpvar_24;
  tmpvar_24.xy = ((tmpvar_17 * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  tmpvar_24.zw = ((tmpvar_17 * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  lowp vec4 tmpvar_25;
  tmpvar_25 = underlayColor_4;
  gl_Position = tmpvar_10;
  xlv_COLOR = tmpvar_1;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_19;
  xlv_TEXCOORD2 = tmpvar_21;
  xlv_TEXCOORD3 = (tmpvar_22 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * vert_8).xyz));
  xlv_TEXCOORD4 = tmpvar_23;
  xlv_COLOR1 = tmpvar_25;
  xlv_TEXCOORD5 = tmpvar_24;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform highp vec4 _ClipRect;
uniform sampler2D _MainTex;
varying lowp vec4 xlv_COLOR;
varying highp vec2 xlv_TEXCOORD0;
varying highp vec4 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR1;
varying highp vec4 xlv_TEXCOORD5;
void main ()
{
  lowp vec4 tmpvar_1;
  mediump vec4 outlineColor_2;
  mediump vec4 faceColor_3;
  highp float c_4;
  lowp float tmpvar_5;
  tmpvar_5 = texture2D (_MainTex, xlv_TEXCOORD0).w;
  c_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = ((xlv_TEXCOORD1.z - c_4) * xlv_TEXCOORD1.y);
  highp float tmpvar_7;
  tmpvar_7 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD1.y);
  highp float tmpvar_8;
  tmpvar_8 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD1.y);
  faceColor_3 = _FaceColor;
  outlineColor_2 = _OutlineColor;
  faceColor_3.xyz = (faceColor_3.xyz * xlv_COLOR.xyz);
  highp vec2 tmpvar_9;
  tmpvar_9.x = _FaceUVSpeedX;
  tmpvar_9.y = _FaceUVSpeedY;
  lowp vec4 tmpvar_10;
  highp vec2 P_11;
  P_11 = (xlv_TEXCOORD5.xy + (tmpvar_9 * _Time.y));
  tmpvar_10 = texture2D (_FaceTex, P_11);
  faceColor_3 = (faceColor_3 * tmpvar_10);
  highp vec2 tmpvar_12;
  tmpvar_12.x = _OutlineUVSpeedX;
  tmpvar_12.y = _OutlineUVSpeedY;
  lowp vec4 tmpvar_13;
  highp vec2 P_14;
  P_14 = (xlv_TEXCOORD5.zw + (tmpvar_12 * _Time.y));
  tmpvar_13 = texture2D (_OutlineTex, P_14);
  outlineColor_2 = (outlineColor_2 * tmpvar_13);
  mediump float d_15;
  d_15 = tmpvar_6;
  lowp vec4 faceColor_16;
  faceColor_16 = faceColor_3;
  lowp vec4 outlineColor_17;
  outlineColor_17 = outlineColor_2;
  mediump float outline_18;
  outline_18 = tmpvar_7;
  mediump float softness_19;
  softness_19 = tmpvar_8;
  mediump float tmpvar_20;
  tmpvar_20 = (1.0 - clamp ((
    ((d_15 - (outline_18 * 0.5)) + (softness_19 * 0.5))
   / 
    (1.0 + softness_19)
  ), 0.0, 1.0));
  faceColor_16.xyz = (faceColor_16.xyz * faceColor_16.w);
  outlineColor_17.xyz = (outlineColor_17.xyz * outlineColor_17.w);
  mediump vec4 tmpvar_21;
  tmpvar_21 = mix (faceColor_16, outlineColor_17, vec4((clamp (
    (d_15 + (outline_18 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_18)
  ))));
  faceColor_16 = tmpvar_21;
  faceColor_16 = (faceColor_16 * tmpvar_20);
  faceColor_3 = faceColor_16;
  lowp vec4 tmpvar_22;
  tmpvar_22 = texture2D (_MainTex, xlv_TEXCOORD4.xy);
  highp float tmpvar_23;
  tmpvar_23 = clamp (((tmpvar_22.w * xlv_TEXCOORD4.z) - xlv_TEXCOORD4.w), 0.0, 1.0);
  faceColor_3 = (faceColor_3 + ((xlv_COLOR1 * tmpvar_23) * (1.0 - faceColor_3.w)));
  highp vec4 tmpvar_24;
  highp float glow_25;
  highp float tmpvar_26;
  tmpvar_26 = (tmpvar_6 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD1.y)));
  highp float tmpvar_27;
  tmpvar_27 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_26 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD1.y);
  glow_25 = (1.0 - pow (clamp (
    abs((tmpvar_26 / (1.0 + tmpvar_27)))
  , 0.0, 1.0), _GlowPower));
  glow_25 = (glow_25 * sqrt(min (1.0, tmpvar_27)));
  highp float tmpvar_28;
  tmpvar_28 = clamp (((_GlowColor.w * glow_25) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_29;
  tmpvar_29.xyz = _GlowColor.xyz;
  tmpvar_29.w = tmpvar_28;
  tmpvar_24 = tmpvar_29;
  faceColor_3.xyz = (faceColor_3.xyz + (tmpvar_24.xyz * tmpvar_24.w));
  mediump vec2 tmpvar_30;
  highp vec2 tmpvar_31;
  tmpvar_31 = clamp (((
    (_ClipRect.zw - _ClipRect.xy)
   - 
    abs(xlv_TEXCOORD2.xy)
  ) * xlv_TEXCOORD2.zw), 0.0, 1.0);
  tmpvar_30 = tmpvar_31;
  faceColor_3 = (faceColor_3 * (tmpvar_30.x * tmpvar_30.y));
  tmpvar_1 = (faceColor_3 * xlv_COLOR.w);
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
SubProgram "gles hw_tier00 " {
Keywords { "UNDERLAY_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNDERLAY_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNDERLAY_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "GLOW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "UNDERLAY_ON" "BEVEL_ON" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNDERLAY_ON" "BEVEL_ON" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNDERLAY_ON" "BEVEL_ON" "GLOW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "UNDERLAY_ON" "GLOW_ON" "MASK_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNDERLAY_ON" "GLOW_ON" "MASK_OFF" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNDERLAY_ON" "GLOW_ON" "MASK_OFF" }
""
}
}
}
}
Fallback "TextMeshPro/Mobile/Distance Field"
CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}