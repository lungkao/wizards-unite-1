Shader "WBG/ImageEffects/YUV2RGB" {
Properties {
}
SubShader {
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 22852
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp mat4 _DisplayTransform;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 uv_1;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_4;
  tmpvar_2.x = (((_DisplayTransform[0].x * uv_1.x) + (_DisplayTransform[0].y * uv_1.y)) + _DisplayTransform[0].z);
  tmpvar_2.y = (((_DisplayTransform[1].x * uv_1.x) + (_DisplayTransform[1].y * uv_1.y)) + _DisplayTransform[1].z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _TextureY;
uniform sampler2D _TextureCbCr;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex0_1;
  highp float y_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_TextureY, xlv_TEXCOORD0).x;
  y_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_TextureCbCr, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.x = y_2;
  tmpvar_5.yz = tmpvar_4.xy;
  highp mat4 tmpvar_6;
  tmpvar_6[0].x = 1.0;
  tmpvar_6[0].y = 1.0;
  tmpvar_6[0].z = 1.0;
  tmpvar_6[0].w = 0.0;
  tmpvar_6[1].x = 0.0;
  tmpvar_6[1].y = -0.3441;
  tmpvar_6[1].z = 1.772;
  tmpvar_6[1].w = 0.0;
  tmpvar_6[2].x = 1.402;
  tmpvar_6[2].y = -0.7141;
  tmpvar_6[2].z = 0.0;
  tmpvar_6[2].w = 0.0;
  tmpvar_6[3].x = -0.701;
  tmpvar_6[3].y = 0.5291;
  tmpvar_6[3].z = -0.886;
  tmpvar_6[3].w = 1.0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * tmpvar_5);
  tex0_1 = tmpvar_7;
  gl_FragData[0] = tex0_1;
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
uniform highp mat4 _DisplayTransform;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 uv_1;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_4;
  tmpvar_2.x = (((_DisplayTransform[0].x * uv_1.x) + (_DisplayTransform[0].y * uv_1.y)) + _DisplayTransform[0].z);
  tmpvar_2.y = (((_DisplayTransform[1].x * uv_1.x) + (_DisplayTransform[1].y * uv_1.y)) + _DisplayTransform[1].z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _TextureY;
uniform sampler2D _TextureCbCr;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex0_1;
  highp float y_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_TextureY, xlv_TEXCOORD0).x;
  y_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_TextureCbCr, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.x = y_2;
  tmpvar_5.yz = tmpvar_4.xy;
  highp mat4 tmpvar_6;
  tmpvar_6[0].x = 1.0;
  tmpvar_6[0].y = 1.0;
  tmpvar_6[0].z = 1.0;
  tmpvar_6[0].w = 0.0;
  tmpvar_6[1].x = 0.0;
  tmpvar_6[1].y = -0.3441;
  tmpvar_6[1].z = 1.772;
  tmpvar_6[1].w = 0.0;
  tmpvar_6[2].x = 1.402;
  tmpvar_6[2].y = -0.7141;
  tmpvar_6[2].z = 0.0;
  tmpvar_6[2].w = 0.0;
  tmpvar_6[3].x = -0.701;
  tmpvar_6[3].y = 0.5291;
  tmpvar_6[3].z = -0.886;
  tmpvar_6[3].w = 1.0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * tmpvar_5);
  tex0_1 = tmpvar_7;
  gl_FragData[0] = tex0_1;
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
uniform highp mat4 _DisplayTransform;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec2 uv_1;
  mediump vec2 tmpvar_2;
  highp vec4 tmpvar_3;
  tmpvar_3.w = 1.0;
  tmpvar_3.xyz = _glesVertex.xyz;
  highp vec2 tmpvar_4;
  tmpvar_4 = (mat4(1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0) * _glesMultiTexCoord0).xy;
  uv_1 = tmpvar_4;
  tmpvar_2.x = (((_DisplayTransform[0].x * uv_1.x) + (_DisplayTransform[0].y * uv_1.y)) + _DisplayTransform[0].z);
  tmpvar_2.y = (((_DisplayTransform[1].x * uv_1.x) + (_DisplayTransform[1].y * uv_1.y)) + _DisplayTransform[1].z);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_3));
  xlv_TEXCOORD0 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _TextureY;
uniform sampler2D _TextureCbCr;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  lowp vec4 tex0_1;
  highp float y_2;
  lowp float tmpvar_3;
  tmpvar_3 = texture2D (_TextureY, xlv_TEXCOORD0).x;
  y_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_TextureCbCr, xlv_TEXCOORD0);
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.x = y_2;
  tmpvar_5.yz = tmpvar_4.xy;
  highp mat4 tmpvar_6;
  tmpvar_6[0].x = 1.0;
  tmpvar_6[0].y = 1.0;
  tmpvar_6[0].z = 1.0;
  tmpvar_6[0].w = 0.0;
  tmpvar_6[1].x = 0.0;
  tmpvar_6[1].y = -0.3441;
  tmpvar_6[1].z = 1.772;
  tmpvar_6[1].w = 0.0;
  tmpvar_6[2].x = 1.402;
  tmpvar_6[2].y = -0.7141;
  tmpvar_6[2].z = 0.0;
  tmpvar_6[2].w = 0.0;
  tmpvar_6[3].x = -0.701;
  tmpvar_6[3].y = 0.5291;
  tmpvar_6[3].z = -0.886;
  tmpvar_6[3].w = 1.0;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_6 * tmpvar_5);
  tex0_1 = tmpvar_7;
  gl_FragData[0] = tex0_1;
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