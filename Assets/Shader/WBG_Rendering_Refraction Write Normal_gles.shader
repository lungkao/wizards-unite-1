Shader "WBG/Rendering/Refraction Write Normal" {
Properties {
_DistortionTex ("Distortion Texture", 2D) = "bump" { }
_DistortionParams ("Distortion Params R: alpha", 2D) = "white" { }
_Alpha ("Alpha", Range(0, 1)) = 1
[Header(Fresnel Hole)] [Toggle] _EnableHole ("Enable Fresnel Hole", Float) = 0
_Bias ("Fresnel Hole Bias", Float) = 0
_Scale ("Fresnel Hole Scale", Float) = 1
_Power ("Fresnel Hole Power", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Refractive" "ShaderType" = "WBGTransparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Refractive" "ShaderType" = "WBGTransparent" }
  GpuProgramID 19280
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _DistortionTex_ST;
uniform mediump float _EnableHole;
uniform mediump float _Bias;
uniform mediump float _Scale;
uniform mediump float _Power;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  mediump vec4 tmpvar_2;
  tmpvar_2 = _glesTANGENT;
  mediump vec3 eyeToPos_3;
  lowp vec3 worldBinormal_4;
  lowp vec3 tangentSign_5;
  lowp vec3 worldTangent_6;
  mediump vec3 worldNormal_7;
  mediump vec4 worldPosition_8;
  highp vec4 tmpvar_9;
  mediump vec3 tmpvar_10;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = (unity_ObjectToWorld * _glesVertex);
  worldPosition_8 = tmpvar_13;
  highp vec4 tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = _glesVertex.xyz;
  tmpvar_14 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_15));
  tmpvar_12 = tmpvar_14;
  tmpvar_9 = tmpvar_12;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  worldNormal_7 = tmpvar_18;
  highp vec3 dir_19;
  dir_19 = tmpvar_2.xyz;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_20[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_20[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_20 * dir_19));
  worldTangent_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = vec3((_glesTANGENT.w * unity_WorldTransformParams.w));
  tangentSign_5 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = (((worldNormal_7.yzx * worldTangent_6.zxy) - (worldNormal_7.zxy * worldTangent_6.yzx)) * tangentSign_5);
  worldBinormal_4 = tmpvar_23;
  lowp vec3 tmpvar_24;
  tmpvar_24 = normalize(worldTangent_6);
  tmpvar_10 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = normalize(worldBinormal_4);
  tmpvar_11 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = normalize((worldPosition_8.xyz - _WorldSpaceCameraPos));
  eyeToPos_3 = tmpvar_26;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _DistortionTex_ST.xy) + _DistortionTex_ST.zw);
  xlv_TEXCOORD1 = _glesColor.w;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = normalize(worldNormal_7);
  xlv_TEXCOORD5 = tmpvar_12;
  xlv_TEXCOORD6 = ((_Bias + (_Scale * 
    pow ((1.0 + dot (eyeToPos_3, worldNormal_7)), _Power)
  )) + (1.0 - _EnableHole));
}


#endif
#ifdef FRAGMENT
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixV;
uniform sampler2D _DistortionTex;
uniform sampler2D _DistortionParams;
uniform mediump float _Alpha;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump float xlv_TEXCOORD6;
void main ()
{
  mediump vec4 distortionParams_1;
  mediump vec4 worldNormal_2;
  mediump vec3 normal_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_DistortionTex, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  normal_3 = tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_5.x = xlv_TEXCOORD2.x;
  tmpvar_5.y = xlv_TEXCOORD3.x;
  tmpvar_5.z = xlv_TEXCOORD4.x;
  tmpvar_6.x = xlv_TEXCOORD2.y;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = xlv_TEXCOORD4.y;
  tmpvar_7.x = xlv_TEXCOORD2.z;
  tmpvar_7.y = xlv_TEXCOORD3.z;
  tmpvar_7.z = xlv_TEXCOORD4.z;
  mediump mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_5.x;
  tmpvar_8[0].y = tmpvar_6.x;
  tmpvar_8[0].z = tmpvar_7.x;
  tmpvar_8[1].x = tmpvar_5.y;
  tmpvar_8[1].y = tmpvar_6.y;
  tmpvar_8[1].z = tmpvar_7.y;
  tmpvar_8[2].x = tmpvar_5.z;
  tmpvar_8[2].y = tmpvar_6.z;
  tmpvar_8[2].z = tmpvar_7.z;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * normal_3);
  mediump vec4 tmpvar_10;
  tmpvar_10 = normalize(tmpvar_9);
  worldNormal_2.w = tmpvar_10.w;
  highp vec3 tmpvar_11;
  tmpvar_11 = unity_MatrixV[0].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_MatrixV[1].xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_MatrixV[2].xyz;
  mediump mat3 tmpvar_14;
  tmpvar_14[0] = tmpvar_11;
  tmpvar_14[1] = tmpvar_12;
  tmpvar_14[2] = tmpvar_13;
  worldNormal_2.xyz = (tmpvar_14 * tmpvar_10.xyz);
  worldNormal_2 = (glstate_matrix_projection * worldNormal_2);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_DistortionParams, xlv_TEXCOORD0);
  distortionParams_1 = tmpvar_15;
  worldNormal_2.xyz = mix (vec3(0.0, 0.0, 1.0), worldNormal_2.xyz, vec3(xlv_TEXCOORD6));
  worldNormal_2.xyw = normalize(worldNormal_2).xyw;
  worldNormal_2.z = (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w);
  worldNormal_2.xyz = ((worldNormal_2 + 1.0) / 2.0).xyz;
  worldNormal_2.w = ((xlv_TEXCOORD1 * _Alpha) * distortionParams_1.x);
  gl_FragData[0] = worldNormal_2;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _DistortionTex_ST;
uniform mediump float _EnableHole;
uniform mediump float _Bias;
uniform mediump float _Scale;
uniform mediump float _Power;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  mediump vec4 tmpvar_2;
  tmpvar_2 = _glesTANGENT;
  mediump vec3 eyeToPos_3;
  lowp vec3 worldBinormal_4;
  lowp vec3 tangentSign_5;
  lowp vec3 worldTangent_6;
  mediump vec3 worldNormal_7;
  mediump vec4 worldPosition_8;
  highp vec4 tmpvar_9;
  mediump vec3 tmpvar_10;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = (unity_ObjectToWorld * _glesVertex);
  worldPosition_8 = tmpvar_13;
  highp vec4 tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = _glesVertex.xyz;
  tmpvar_14 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_15));
  tmpvar_12 = tmpvar_14;
  tmpvar_9 = tmpvar_12;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  worldNormal_7 = tmpvar_18;
  highp vec3 dir_19;
  dir_19 = tmpvar_2.xyz;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_20[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_20[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_20 * dir_19));
  worldTangent_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = vec3((_glesTANGENT.w * unity_WorldTransformParams.w));
  tangentSign_5 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = (((worldNormal_7.yzx * worldTangent_6.zxy) - (worldNormal_7.zxy * worldTangent_6.yzx)) * tangentSign_5);
  worldBinormal_4 = tmpvar_23;
  lowp vec3 tmpvar_24;
  tmpvar_24 = normalize(worldTangent_6);
  tmpvar_10 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = normalize(worldBinormal_4);
  tmpvar_11 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = normalize((worldPosition_8.xyz - _WorldSpaceCameraPos));
  eyeToPos_3 = tmpvar_26;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _DistortionTex_ST.xy) + _DistortionTex_ST.zw);
  xlv_TEXCOORD1 = _glesColor.w;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = normalize(worldNormal_7);
  xlv_TEXCOORD5 = tmpvar_12;
  xlv_TEXCOORD6 = ((_Bias + (_Scale * 
    pow ((1.0 + dot (eyeToPos_3, worldNormal_7)), _Power)
  )) + (1.0 - _EnableHole));
}


#endif
#ifdef FRAGMENT
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixV;
uniform sampler2D _DistortionTex;
uniform sampler2D _DistortionParams;
uniform mediump float _Alpha;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump float xlv_TEXCOORD6;
void main ()
{
  mediump vec4 distortionParams_1;
  mediump vec4 worldNormal_2;
  mediump vec3 normal_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_DistortionTex, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  normal_3 = tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_5.x = xlv_TEXCOORD2.x;
  tmpvar_5.y = xlv_TEXCOORD3.x;
  tmpvar_5.z = xlv_TEXCOORD4.x;
  tmpvar_6.x = xlv_TEXCOORD2.y;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = xlv_TEXCOORD4.y;
  tmpvar_7.x = xlv_TEXCOORD2.z;
  tmpvar_7.y = xlv_TEXCOORD3.z;
  tmpvar_7.z = xlv_TEXCOORD4.z;
  mediump mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_5.x;
  tmpvar_8[0].y = tmpvar_6.x;
  tmpvar_8[0].z = tmpvar_7.x;
  tmpvar_8[1].x = tmpvar_5.y;
  tmpvar_8[1].y = tmpvar_6.y;
  tmpvar_8[1].z = tmpvar_7.y;
  tmpvar_8[2].x = tmpvar_5.z;
  tmpvar_8[2].y = tmpvar_6.z;
  tmpvar_8[2].z = tmpvar_7.z;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * normal_3);
  mediump vec4 tmpvar_10;
  tmpvar_10 = normalize(tmpvar_9);
  worldNormal_2.w = tmpvar_10.w;
  highp vec3 tmpvar_11;
  tmpvar_11 = unity_MatrixV[0].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_MatrixV[1].xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_MatrixV[2].xyz;
  mediump mat3 tmpvar_14;
  tmpvar_14[0] = tmpvar_11;
  tmpvar_14[1] = tmpvar_12;
  tmpvar_14[2] = tmpvar_13;
  worldNormal_2.xyz = (tmpvar_14 * tmpvar_10.xyz);
  worldNormal_2 = (glstate_matrix_projection * worldNormal_2);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_DistortionParams, xlv_TEXCOORD0);
  distortionParams_1 = tmpvar_15;
  worldNormal_2.xyz = mix (vec3(0.0, 0.0, 1.0), worldNormal_2.xyz, vec3(xlv_TEXCOORD6));
  worldNormal_2.xyw = normalize(worldNormal_2).xyw;
  worldNormal_2.z = (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w);
  worldNormal_2.xyz = ((worldNormal_2 + 1.0) / 2.0).xyz;
  worldNormal_2.w = ((xlv_TEXCOORD1 * _Alpha) * distortionParams_1.x);
  gl_FragData[0] = worldNormal_2;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _DistortionTex_ST;
uniform mediump float _EnableHole;
uniform mediump float _Bias;
uniform mediump float _Scale;
uniform mediump float _Power;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump float xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  tmpvar_1 = _glesNormal;
  mediump vec4 tmpvar_2;
  tmpvar_2 = _glesTANGENT;
  mediump vec3 eyeToPos_3;
  lowp vec3 worldBinormal_4;
  lowp vec3 tangentSign_5;
  lowp vec3 worldTangent_6;
  mediump vec3 worldNormal_7;
  mediump vec4 worldPosition_8;
  highp vec4 tmpvar_9;
  mediump vec3 tmpvar_10;
  mediump vec3 tmpvar_11;
  mediump vec4 tmpvar_12;
  highp vec4 tmpvar_13;
  tmpvar_13 = (unity_ObjectToWorld * _glesVertex);
  worldPosition_8 = tmpvar_13;
  highp vec4 tmpvar_14;
  highp vec4 tmpvar_15;
  tmpvar_15.w = 1.0;
  tmpvar_15.xyz = _glesVertex.xyz;
  tmpvar_14 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_15));
  tmpvar_12 = tmpvar_14;
  tmpvar_9 = tmpvar_12;
  highp vec3 norm_16;
  norm_16 = tmpvar_1;
  highp mat3 tmpvar_17;
  tmpvar_17[0] = unity_WorldToObject[0].xyz;
  tmpvar_17[1] = unity_WorldToObject[1].xyz;
  tmpvar_17[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_18;
  tmpvar_18 = normalize((norm_16 * tmpvar_17));
  worldNormal_7 = tmpvar_18;
  highp vec3 dir_19;
  dir_19 = tmpvar_2.xyz;
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_20[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_20[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_20 * dir_19));
  worldTangent_6 = tmpvar_21;
  highp vec3 tmpvar_22;
  tmpvar_22 = vec3((_glesTANGENT.w * unity_WorldTransformParams.w));
  tangentSign_5 = tmpvar_22;
  mediump vec3 tmpvar_23;
  tmpvar_23 = (((worldNormal_7.yzx * worldTangent_6.zxy) - (worldNormal_7.zxy * worldTangent_6.yzx)) * tangentSign_5);
  worldBinormal_4 = tmpvar_23;
  lowp vec3 tmpvar_24;
  tmpvar_24 = normalize(worldTangent_6);
  tmpvar_10 = tmpvar_24;
  lowp vec3 tmpvar_25;
  tmpvar_25 = normalize(worldBinormal_4);
  tmpvar_11 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = normalize((worldPosition_8.xyz - _WorldSpaceCameraPos));
  eyeToPos_3 = tmpvar_26;
  gl_Position = tmpvar_9;
  xlv_TEXCOORD0 = ((_glesMultiTexCoord0.xy * _DistortionTex_ST.xy) + _DistortionTex_ST.zw);
  xlv_TEXCOORD1 = _glesColor.w;
  xlv_TEXCOORD2 = tmpvar_10;
  xlv_TEXCOORD3 = tmpvar_11;
  xlv_TEXCOORD4 = normalize(worldNormal_7);
  xlv_TEXCOORD5 = tmpvar_12;
  xlv_TEXCOORD6 = ((_Bias + (_Scale * 
    pow ((1.0 + dot (eyeToPos_3, worldNormal_7)), _Power)
  )) + (1.0 - _EnableHole));
}


#endif
#ifdef FRAGMENT
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixV;
uniform sampler2D _DistortionTex;
uniform sampler2D _DistortionParams;
uniform mediump float _Alpha;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump float xlv_TEXCOORD1;
varying mediump vec3 xlv_TEXCOORD2;
varying mediump vec3 xlv_TEXCOORD3;
varying mediump vec3 xlv_TEXCOORD4;
varying mediump vec4 xlv_TEXCOORD5;
varying mediump float xlv_TEXCOORD6;
void main ()
{
  mediump vec4 distortionParams_1;
  mediump vec4 worldNormal_2;
  mediump vec3 normal_3;
  lowp vec3 tmpvar_4;
  tmpvar_4 = ((texture2D (_DistortionTex, xlv_TEXCOORD0).xyz * 2.0) - 1.0);
  normal_3 = tmpvar_4;
  mediump vec3 tmpvar_5;
  mediump vec3 tmpvar_6;
  mediump vec3 tmpvar_7;
  tmpvar_5.x = xlv_TEXCOORD2.x;
  tmpvar_5.y = xlv_TEXCOORD3.x;
  tmpvar_5.z = xlv_TEXCOORD4.x;
  tmpvar_6.x = xlv_TEXCOORD2.y;
  tmpvar_6.y = xlv_TEXCOORD3.y;
  tmpvar_6.z = xlv_TEXCOORD4.y;
  tmpvar_7.x = xlv_TEXCOORD2.z;
  tmpvar_7.y = xlv_TEXCOORD3.z;
  tmpvar_7.z = xlv_TEXCOORD4.z;
  mediump mat3 tmpvar_8;
  tmpvar_8[0].x = tmpvar_5.x;
  tmpvar_8[0].y = tmpvar_6.x;
  tmpvar_8[0].z = tmpvar_7.x;
  tmpvar_8[1].x = tmpvar_5.y;
  tmpvar_8[1].y = tmpvar_6.y;
  tmpvar_8[1].z = tmpvar_7.y;
  tmpvar_8[2].x = tmpvar_5.z;
  tmpvar_8[2].y = tmpvar_6.z;
  tmpvar_8[2].z = tmpvar_7.z;
  mediump vec4 tmpvar_9;
  tmpvar_9.w = 1.0;
  tmpvar_9.xyz = (tmpvar_8 * normal_3);
  mediump vec4 tmpvar_10;
  tmpvar_10 = normalize(tmpvar_9);
  worldNormal_2.w = tmpvar_10.w;
  highp vec3 tmpvar_11;
  tmpvar_11 = unity_MatrixV[0].xyz;
  highp vec3 tmpvar_12;
  tmpvar_12 = unity_MatrixV[1].xyz;
  highp vec3 tmpvar_13;
  tmpvar_13 = unity_MatrixV[2].xyz;
  mediump mat3 tmpvar_14;
  tmpvar_14[0] = tmpvar_11;
  tmpvar_14[1] = tmpvar_12;
  tmpvar_14[2] = tmpvar_13;
  worldNormal_2.xyz = (tmpvar_14 * tmpvar_10.xyz);
  worldNormal_2 = (glstate_matrix_projection * worldNormal_2);
  lowp vec4 tmpvar_15;
  tmpvar_15 = texture2D (_DistortionParams, xlv_TEXCOORD0);
  distortionParams_1 = tmpvar_15;
  worldNormal_2.xyz = mix (vec3(0.0, 0.0, 1.0), worldNormal_2.xyz, vec3(xlv_TEXCOORD6));
  worldNormal_2.xyw = normalize(worldNormal_2).xyw;
  worldNormal_2.z = (xlv_TEXCOORD5.z / xlv_TEXCOORD5.w);
  worldNormal_2.xyz = ((worldNormal_2 + 1.0) / 2.0).xyz;
  worldNormal_2.w = ((xlv_TEXCOORD1 * _Alpha) * distortionParams_1.x);
  gl_FragData[0] = worldNormal_2;
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