Shader "WBG/Atlas/Map/Unlit Fog" {
Properties {
_MainTex ("Color Buffer (RGB)", 2D) = "black" { }
}
SubShader {
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  GpuProgramID 5869
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 worldPos_1;
  mediump vec4 pos_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  pos_2 = tmpvar_4;
  tmpvar_3 = pos_2;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPos_1 = tmpvar_6;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = (worldPos_1.xz * _MainTex_ST.xy);
  xlv_TEXCOORD1 = worldPos_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform sampler2D _MainTex;
uniform mediump vec4 _EnvironmentTint;
uniform mediump vec4 _FogColorStart;
uniform mediump vec4 _FogColorEnd;
uniform mediump float _FogBias;
uniform mediump float _FogStart;
uniform mediump float _FogEnd;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 color_1;
  mediump float fog_2;
  mediump float far_3;
  mediump float near_4;
  highp float tmpvar_5;
  tmpvar_5 = _ProjectionParams.y;
  near_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = _ProjectionParams.z;
  far_3 = tmpvar_6;
  highp float tmpvar_7;
  highp vec3 x_8;
  x_8 = (xlv_TEXCOORD1 - _WorldSpaceCameraPos);
  tmpvar_7 = sqrt(dot (x_8, x_8));
  fog_2 = tmpvar_7;
  fog_2 = (fog_2 / (far_3 - near_4));
  mediump float tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = clamp (((
    (fog_2 + _FogBias)
   - _FogStart) / (_FogEnd - _FogStart)), 0.0, 1.0);
  tmpvar_9 = (tmpvar_10 * (tmpvar_10 * (3.0 - 
    (2.0 * tmpvar_10)
  )));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  mediump vec4 tmpvar_14;
  tmpvar_14 = mix (_FogColorStart, _FogColorEnd, vec4(clamp (tmpvar_9, 0.0, 1.0)));
  color_1.xyz = mix ((tmpvar_13 * _EnvironmentTint).xyz, tmpvar_14.xyz, vec3(clamp ((tmpvar_9 * tmpvar_14.w), 0.0, 1.0)));
  color_1.w = 1.0;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = sqrt(color_1.xyz);
  tmpvar_15.w = color_1.w;
  gl_FragData[0] = tmpvar_15;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 worldPos_1;
  mediump vec4 pos_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  pos_2 = tmpvar_4;
  tmpvar_3 = pos_2;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPos_1 = tmpvar_6;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = (worldPos_1.xz * _MainTex_ST.xy);
  xlv_TEXCOORD1 = worldPos_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform sampler2D _MainTex;
uniform mediump vec4 _EnvironmentTint;
uniform mediump vec4 _FogColorStart;
uniform mediump vec4 _FogColorEnd;
uniform mediump float _FogBias;
uniform mediump float _FogStart;
uniform mediump float _FogEnd;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 color_1;
  mediump float fog_2;
  mediump float far_3;
  mediump float near_4;
  highp float tmpvar_5;
  tmpvar_5 = _ProjectionParams.y;
  near_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = _ProjectionParams.z;
  far_3 = tmpvar_6;
  highp float tmpvar_7;
  highp vec3 x_8;
  x_8 = (xlv_TEXCOORD1 - _WorldSpaceCameraPos);
  tmpvar_7 = sqrt(dot (x_8, x_8));
  fog_2 = tmpvar_7;
  fog_2 = (fog_2 / (far_3 - near_4));
  mediump float tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = clamp (((
    (fog_2 + _FogBias)
   - _FogStart) / (_FogEnd - _FogStart)), 0.0, 1.0);
  tmpvar_9 = (tmpvar_10 * (tmpvar_10 * (3.0 - 
    (2.0 * tmpvar_10)
  )));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  mediump vec4 tmpvar_14;
  tmpvar_14 = mix (_FogColorStart, _FogColorEnd, vec4(clamp (tmpvar_9, 0.0, 1.0)));
  color_1.xyz = mix ((tmpvar_13 * _EnvironmentTint).xyz, tmpvar_14.xyz, vec3(clamp ((tmpvar_9 * tmpvar_14.w), 0.0, 1.0)));
  color_1.w = 1.0;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = sqrt(color_1.xyz);
  tmpvar_15.w = color_1.w;
  gl_FragData[0] = tmpvar_15;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _MainTex_ST;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec3 worldPos_1;
  mediump vec4 pos_2;
  highp vec4 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  pos_2 = tmpvar_4;
  tmpvar_3 = pos_2;
  highp vec3 tmpvar_6;
  tmpvar_6 = (unity_ObjectToWorld * _glesVertex).xyz;
  worldPos_1 = tmpvar_6;
  gl_Position = tmpvar_3;
  xlv_TEXCOORD0 = (worldPos_1.xz * _MainTex_ST.xy);
  xlv_TEXCOORD1 = worldPos_1;
}


#endif
#ifdef FRAGMENT
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ProjectionParams;
uniform sampler2D _MainTex;
uniform mediump vec4 _EnvironmentTint;
uniform mediump vec4 _FogColorStart;
uniform mediump vec4 _FogColorEnd;
uniform mediump float _FogBias;
uniform mediump float _FogStart;
uniform mediump float _FogEnd;
varying mediump vec2 xlv_TEXCOORD0;
varying mediump vec3 xlv_TEXCOORD1;
void main ()
{
  mediump vec4 color_1;
  mediump float fog_2;
  mediump float far_3;
  mediump float near_4;
  highp float tmpvar_5;
  tmpvar_5 = _ProjectionParams.y;
  near_4 = tmpvar_5;
  highp float tmpvar_6;
  tmpvar_6 = _ProjectionParams.z;
  far_3 = tmpvar_6;
  highp float tmpvar_7;
  highp vec3 x_8;
  x_8 = (xlv_TEXCOORD1 - _WorldSpaceCameraPos);
  tmpvar_7 = sqrt(dot (x_8, x_8));
  fog_2 = tmpvar_7;
  fog_2 = (fog_2 / (far_3 - near_4));
  mediump float tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = clamp (((
    (fog_2 + _FogBias)
   - _FogStart) / (_FogEnd - _FogStart)), 0.0, 1.0);
  tmpvar_9 = (tmpvar_10 * (tmpvar_10 * (3.0 - 
    (2.0 * tmpvar_10)
  )));
  lowp vec4 tmpvar_11;
  tmpvar_11 = texture2D (_MainTex, xlv_TEXCOORD0);
  mediump vec4 color_12;
  color_12 = tmpvar_11;
  mediump vec4 tmpvar_13;
  tmpvar_13.xyz = (color_12.xyz * color_12.xyz);
  tmpvar_13.w = color_12.w;
  mediump vec4 tmpvar_14;
  tmpvar_14 = mix (_FogColorStart, _FogColorEnd, vec4(clamp (tmpvar_9, 0.0, 1.0)));
  color_1.xyz = mix ((tmpvar_13 * _EnvironmentTint).xyz, tmpvar_14.xyz, vec3(clamp ((tmpvar_9 * tmpvar_14.w), 0.0, 1.0)));
  color_1.w = 1.0;
  mediump vec4 tmpvar_15;
  tmpvar_15.xyz = sqrt(color_1.xyz);
  tmpvar_15.w = color_1.w;
  gl_FragData[0] = tmpvar_15;
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