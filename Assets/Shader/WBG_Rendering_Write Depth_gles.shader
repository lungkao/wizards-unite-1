Shader "WBG/Rendering/Write Depth" {
Properties {
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 23032
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
varying highp float xlv_COLOR0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR0 = (1.0/(-((
    (unity_MatrixV * (unity_ObjectToWorld * tmpvar_3))
  .z * _ProjectionParams.w))));
}


#endif
#ifdef FRAGMENT
#extension GL_OES_standard_derivatives : enable
varying highp float xlv_COLOR0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp float tmpvar_2;
  tmpvar_2 = (1.0/(xlv_COLOR0));
  highp float tmpvar_3;
  tmpvar_3 = dFdx(tmpvar_2);
  highp float tmpvar_4;
  tmpvar_4 = dFdy(tmpvar_2);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(0.0, 1.0);
  tmpvar_5.x = tmpvar_2;
  tmpvar_5.y = ((tmpvar_2 * tmpvar_2) + (0.25 * (
    (tmpvar_3 * tmpvar_3)
   + 
    (tmpvar_4 * tmpvar_4)
  )));
  tmpvar_1 = tmpvar_5;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
varying highp float xlv_COLOR0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR0 = (1.0/(-((
    (unity_MatrixV * (unity_ObjectToWorld * tmpvar_3))
  .z * _ProjectionParams.w))));
}


#endif
#ifdef FRAGMENT
#extension GL_OES_standard_derivatives : enable
varying highp float xlv_COLOR0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp float tmpvar_2;
  tmpvar_2 = (1.0/(xlv_COLOR0));
  highp float tmpvar_3;
  tmpvar_3 = dFdx(tmpvar_2);
  highp float tmpvar_4;
  tmpvar_4 = dFdy(tmpvar_2);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(0.0, 1.0);
  tmpvar_5.x = tmpvar_2;
  tmpvar_5.y = ((tmpvar_2 * tmpvar_2) + (0.25 * (
    (tmpvar_3 * tmpvar_3)
   + 
    (tmpvar_4 * tmpvar_4)
  )));
  tmpvar_1 = tmpvar_5;
  gl_FragData[0] = tmpvar_1;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixV;
uniform highp mat4 unity_MatrixVP;
varying highp float xlv_COLOR0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesVertex;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = tmpvar_1.xyz;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = tmpvar_1.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  xlv_COLOR0 = (1.0/(-((
    (unity_MatrixV * (unity_ObjectToWorld * tmpvar_3))
  .z * _ProjectionParams.w))));
}


#endif
#ifdef FRAGMENT
#extension GL_OES_standard_derivatives : enable
varying highp float xlv_COLOR0;
void main ()
{
  mediump vec4 tmpvar_1;
  highp float tmpvar_2;
  tmpvar_2 = (1.0/(xlv_COLOR0));
  highp float tmpvar_3;
  tmpvar_3 = dFdx(tmpvar_2);
  highp float tmpvar_4;
  tmpvar_4 = dFdy(tmpvar_2);
  highp vec4 tmpvar_5;
  tmpvar_5.zw = vec2(0.0, 1.0);
  tmpvar_5.x = tmpvar_2;
  tmpvar_5.y = ((tmpvar_2 * tmpvar_2) + (0.25 * (
    (tmpvar_3 * tmpvar_3)
   + 
    (tmpvar_4 * tmpvar_4)
  )));
  tmpvar_1 = tmpvar_5;
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