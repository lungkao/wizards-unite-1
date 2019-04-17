Shader "WBG/ImageEffects/RefractionPostProc" {
Properties {
_ColorBuffer ("Color RGB", 2D) = "white" { }
_DistortionBuffer ("Distortion Buffer", 2D) = "white" { }
_DistortionWeight ("Distortion Weight", Range(0, 5)) = 1
_DistortionTint ("Distortion Tint", Color) = (1,1,1,1)
_LightIntensity ("Light Intensity", Float) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 2300
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _DistortionBuffer_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec4 tmpvar_2;
  lowp vec2 tmpvar_3;
  lowp vec2 tmpvar_4;
  mediump vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_5 = tmpvar_6;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _DistortionBuffer_ST.xy) + _DistortionBuffer_ST.zw);
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_5.xz = -(tmpvar_5.xz);
  tmpvar_5.y = -(tmpvar_5.y);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _ColorBuffer;
uniform sampler2D _DistortionBuffer;
uniform mediump vec4 _DistortionTint;
uniform mediump float _DistortionWeight;
uniform mediump vec4 _LightDirClipSpaceNeg;
uniform highp float _LightIntensity;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  mediump vec4 tmpvar_1;
  lowp vec4 screen_2;
  mediump vec4 distortion_3;
  mediump vec3 posClipSpace_4;
  mediump float depthClipSpace_5;
  highp vec3 clipSpaceNormal_6;
  mediump vec4 n_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_DistortionBuffer, xlv_TEXCOORD0);
  n_7 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = n_7.w;
  n_7.w = 0.0;
  mediump vec3 tmpvar_10;
  tmpvar_10 = ((n_7.xyz * 2.0) - 1.0);
  clipSpaceNormal_6 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = clipSpaceNormal_6.z;
  depthClipSpace_5 = tmpvar_11;
  posClipSpace_4.xy = xlv_TEXCOORD2.xy;
  posClipSpace_4.z = depthClipSpace_5;
  clipSpaceNormal_6.z = sqrt(((1.0 - 
    (clipSpaceNormal_6.x * clipSpaceNormal_6.x)
  ) - (clipSpaceNormal_6.y * clipSpaceNormal_6.y)));
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(_LightDirClipSpaceNeg.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (dot (clipSpaceNormal_6, tmpvar_12), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  mediump vec3 tmpvar_15;
  tmpvar_15 = normalize((normalize(posClipSpace_4) + _LightDirClipSpaceNeg.xyz));
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (dot (clipSpaceNormal_6, tmpvar_15), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (vec3(0.75, 0.75, 0.75) * pow (tmpvar_16, 64.0));
  highp vec4 tmpvar_19;
  tmpvar_19.w = 0.0;
  tmpvar_19.xyz = clipSpaceNormal_6;
  distortion_3 = tmpvar_19;
  mediump vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1 + ((distortion_3.xy * _DistortionWeight) / 50.0));
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_ColorBuffer, tmpvar_20);
  mediump vec3 tmpvar_22;
  tmpvar_22 = mix (tmpvar_21.xyz, _DistortionTint.xyz, vec3((_DistortionTint.w * tmpvar_9)));
  mediump float tmpvar_23;
  tmpvar_23 = max (0.5, tmpvar_13);
  screen_2.xyz = (((tmpvar_22 * tmpvar_23) * _LightIntensity) + tmpvar_18);
  screen_2.w = 1.0;
  tmpvar_1 = screen_2;
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
uniform mediump vec4 _DistortionBuffer_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec4 tmpvar_2;
  lowp vec2 tmpvar_3;
  lowp vec2 tmpvar_4;
  mediump vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_5 = tmpvar_6;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _DistortionBuffer_ST.xy) + _DistortionBuffer_ST.zw);
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_5.xz = -(tmpvar_5.xz);
  tmpvar_5.y = -(tmpvar_5.y);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _ColorBuffer;
uniform sampler2D _DistortionBuffer;
uniform mediump vec4 _DistortionTint;
uniform mediump float _DistortionWeight;
uniform mediump vec4 _LightDirClipSpaceNeg;
uniform highp float _LightIntensity;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  mediump vec4 tmpvar_1;
  lowp vec4 screen_2;
  mediump vec4 distortion_3;
  mediump vec3 posClipSpace_4;
  mediump float depthClipSpace_5;
  highp vec3 clipSpaceNormal_6;
  mediump vec4 n_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_DistortionBuffer, xlv_TEXCOORD0);
  n_7 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = n_7.w;
  n_7.w = 0.0;
  mediump vec3 tmpvar_10;
  tmpvar_10 = ((n_7.xyz * 2.0) - 1.0);
  clipSpaceNormal_6 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = clipSpaceNormal_6.z;
  depthClipSpace_5 = tmpvar_11;
  posClipSpace_4.xy = xlv_TEXCOORD2.xy;
  posClipSpace_4.z = depthClipSpace_5;
  clipSpaceNormal_6.z = sqrt(((1.0 - 
    (clipSpaceNormal_6.x * clipSpaceNormal_6.x)
  ) - (clipSpaceNormal_6.y * clipSpaceNormal_6.y)));
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(_LightDirClipSpaceNeg.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (dot (clipSpaceNormal_6, tmpvar_12), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  mediump vec3 tmpvar_15;
  tmpvar_15 = normalize((normalize(posClipSpace_4) + _LightDirClipSpaceNeg.xyz));
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (dot (clipSpaceNormal_6, tmpvar_15), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (vec3(0.75, 0.75, 0.75) * pow (tmpvar_16, 64.0));
  highp vec4 tmpvar_19;
  tmpvar_19.w = 0.0;
  tmpvar_19.xyz = clipSpaceNormal_6;
  distortion_3 = tmpvar_19;
  mediump vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1 + ((distortion_3.xy * _DistortionWeight) / 50.0));
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_ColorBuffer, tmpvar_20);
  mediump vec3 tmpvar_22;
  tmpvar_22 = mix (tmpvar_21.xyz, _DistortionTint.xyz, vec3((_DistortionTint.w * tmpvar_9)));
  mediump float tmpvar_23;
  tmpvar_23 = max (0.5, tmpvar_13);
  screen_2.xyz = (((tmpvar_22 * tmpvar_23) * _LightIntensity) + tmpvar_18);
  screen_2.w = 1.0;
  tmpvar_1 = screen_2;
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
uniform mediump vec4 _DistortionBuffer_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec4 tmpvar_2;
  lowp vec2 tmpvar_3;
  lowp vec2 tmpvar_4;
  mediump vec4 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_7.w = 1.0;
  tmpvar_7.xyz = _glesVertex.xyz;
  tmpvar_6 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_7));
  tmpvar_5 = tmpvar_6;
  tmpvar_2 = tmpvar_5;
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _DistortionBuffer_ST.xy) + _DistortionBuffer_ST.zw);
  tmpvar_4 = tmpvar_1.xy;
  tmpvar_5.xz = -(tmpvar_5.xz);
  tmpvar_5.y = -(tmpvar_5.y);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
  xlv_TEXCOORD2 = tmpvar_5;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _ColorBuffer;
uniform sampler2D _DistortionBuffer;
uniform mediump vec4 _DistortionTint;
uniform mediump float _DistortionWeight;
uniform mediump vec4 _LightDirClipSpaceNeg;
uniform highp float _LightIntensity;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec4 xlv_TEXCOORD2;
void main ()
{
  mediump vec4 tmpvar_1;
  lowp vec4 screen_2;
  mediump vec4 distortion_3;
  mediump vec3 posClipSpace_4;
  mediump float depthClipSpace_5;
  highp vec3 clipSpaceNormal_6;
  mediump vec4 n_7;
  lowp vec4 tmpvar_8;
  tmpvar_8 = texture2D (_DistortionBuffer, xlv_TEXCOORD0);
  n_7 = tmpvar_8;
  mediump float tmpvar_9;
  tmpvar_9 = n_7.w;
  n_7.w = 0.0;
  mediump vec3 tmpvar_10;
  tmpvar_10 = ((n_7.xyz * 2.0) - 1.0);
  clipSpaceNormal_6 = tmpvar_10;
  highp float tmpvar_11;
  tmpvar_11 = clipSpaceNormal_6.z;
  depthClipSpace_5 = tmpvar_11;
  posClipSpace_4.xy = xlv_TEXCOORD2.xy;
  posClipSpace_4.z = depthClipSpace_5;
  clipSpaceNormal_6.z = sqrt(((1.0 - 
    (clipSpaceNormal_6.x * clipSpaceNormal_6.x)
  ) - (clipSpaceNormal_6.y * clipSpaceNormal_6.y)));
  mediump vec3 tmpvar_12;
  tmpvar_12 = normalize(_LightDirClipSpaceNeg.xyz);
  mediump float tmpvar_13;
  highp float tmpvar_14;
  tmpvar_14 = clamp (dot (clipSpaceNormal_6, tmpvar_12), 0.0, 1.0);
  tmpvar_13 = tmpvar_14;
  mediump vec3 tmpvar_15;
  tmpvar_15 = normalize((normalize(posClipSpace_4) + _LightDirClipSpaceNeg.xyz));
  mediump float tmpvar_16;
  highp float tmpvar_17;
  tmpvar_17 = clamp (dot (clipSpaceNormal_6, tmpvar_15), 0.0, 1.0);
  tmpvar_16 = tmpvar_17;
  mediump vec3 tmpvar_18;
  tmpvar_18 = (vec3(0.75, 0.75, 0.75) * pow (tmpvar_16, 64.0));
  highp vec4 tmpvar_19;
  tmpvar_19.w = 0.0;
  tmpvar_19.xyz = clipSpaceNormal_6;
  distortion_3 = tmpvar_19;
  mediump vec2 tmpvar_20;
  tmpvar_20 = (xlv_TEXCOORD1 + ((distortion_3.xy * _DistortionWeight) / 50.0));
  lowp vec4 tmpvar_21;
  tmpvar_21 = texture2D (_ColorBuffer, tmpvar_20);
  mediump vec3 tmpvar_22;
  tmpvar_22 = mix (tmpvar_21.xyz, _DistortionTint.xyz, vec3((_DistortionTint.w * tmpvar_9)));
  mediump float tmpvar_23;
  tmpvar_23 = max (0.5, tmpvar_13);
  screen_2.xyz = (((tmpvar_22 * tmpvar_23) * _LightIntensity) + tmpvar_18);
  screen_2.w = 1.0;
  tmpvar_1 = screen_2;
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