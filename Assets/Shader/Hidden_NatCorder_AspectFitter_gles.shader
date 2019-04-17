Shader "Hidden/NatCorder/AspectFitter" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 15047
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec2 aspectCorrection;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (((_glesMultiTexCoord0 - 0.5).xy * aspectCorrection) + 0.5);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  if ((((
    (xlv_TEXCOORD0.x < 0.0)
   || 
    (xlv_TEXCOORD0.x > 1.0)
  ) || (xlv_TEXCOORD0.y < 0.0)) || (xlv_TEXCOORD0.y > 1.0))) {
    tmpvar_1 = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  };
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
uniform highp vec2 aspectCorrection;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (((_glesMultiTexCoord0 - 0.5).xy * aspectCorrection) + 0.5);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  if ((((
    (xlv_TEXCOORD0.x < 0.0)
   || 
    (xlv_TEXCOORD0.x > 1.0)
  ) || (xlv_TEXCOORD0.y < 0.0)) || (xlv_TEXCOORD0.y > 1.0))) {
    tmpvar_1 = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  };
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
uniform highp vec2 aspectCorrection;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD0 = (((_glesMultiTexCoord0 - 0.5).xy * aspectCorrection) + 0.5);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tmpvar_1;
  if ((((
    (xlv_TEXCOORD0.x < 0.0)
   || 
    (xlv_TEXCOORD0.x > 1.0)
  ) || (xlv_TEXCOORD0.y < 0.0)) || (xlv_TEXCOORD0.y > 1.0))) {
    tmpvar_1 = vec4(0.0, 0.0, 0.0, 1.0);
  } else {
    tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD0);
  };
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