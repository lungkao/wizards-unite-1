Shader "WBG/ImageEffects/ImageBlend YUV2RGB" {
Properties {
_TextureY ("Texture Y", 2D) = "white" { }
_TextureCbCr ("Texture CbCr", 2D) = "black" { }
_DetailTex ("Color Buffer RGBA", 2D) = "black" { }
_BlendBias ("Blend Bias", Float) = 0
_ColorGradingTint ("Color Grading", Color) = (1,1,1,1)
}
SubShader {
 Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  GpuProgramID 29602
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 _DisplayTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump float tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2.x = (((_DisplayTransform[0].x * _glesMultiTexCoord0.x) + (_DisplayTransform[0].y * _glesMultiTexCoord0.y)) + _DisplayTransform[0].z);
  tmpvar_2.y = (((_DisplayTransform[1].x * _glesMultiTexCoord0.x) + (_DisplayTransform[1].y * _glesMultiTexCoord0.y)) + _DisplayTransform[1].z);
  tmpvar_1 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = _glesVertex;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _TextureY;
uniform sampler2D _TextureCbCr;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tex0_2;
  highp float y_3;
  lowp float tmpvar_4;
  tmpvar_4 = texture2D (_TextureY, xlv_TEXCOORD1).x;
  y_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_TextureCbCr, xlv_TEXCOORD1);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.x = y_3;
  tmpvar_6.yz = tmpvar_5.xy;
  highp mat4 tmpvar_7;
  tmpvar_7[0].x = 1.0;
  tmpvar_7[0].y = 1.0;
  tmpvar_7[0].z = 1.0;
  tmpvar_7[0].w = 0.0;
  tmpvar_7[1].x = 0.0;
  tmpvar_7[1].y = -0.3441;
  tmpvar_7[1].z = 1.772;
  tmpvar_7[1].w = 0.0;
  tmpvar_7[2].x = 1.402;
  tmpvar_7[2].y = -0.7141;
  tmpvar_7[2].z = 0.0;
  tmpvar_7[2].w = 0.0;
  tmpvar_7[3].x = -0.701;
  tmpvar_7[3].y = 0.5291;
  tmpvar_7[3].z = -0.886;
  tmpvar_7[3].w = 1.0;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * tmpvar_6);
  tex0_2.xyz = tmpvar_8.xyz;
  tex0_2.w = 1.0;
  mediump float tmpvar_9;
  tmpvar_9 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump vec4 tmpvar_10;
  tmpvar_10 = tex0_2;
  pixel_1 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _ColorGradingTint.xyz), _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (pixel_1.xyz, _ColorGradingTint.xyz, vec3((clamp (
    ((tmpvar_9 * (tmpvar_9 * (3.0 - 
      (2.0 * tmpvar_9)
    ))) + _BlendBias)
  , 0.0, 1.0) * _ColorGradingTint.w)));
  pixel_1.xyz = tmpvar_12;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_13;
  tmpvar_13 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_13;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 _DisplayTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump float tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2.x = (((_DisplayTransform[0].x * _glesMultiTexCoord0.x) + (_DisplayTransform[0].y * _glesMultiTexCoord0.y)) + _DisplayTransform[0].z);
  tmpvar_2.y = (((_DisplayTransform[1].x * _glesMultiTexCoord0.x) + (_DisplayTransform[1].y * _glesMultiTexCoord0.y)) + _DisplayTransform[1].z);
  tmpvar_1 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = _glesVertex;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _TextureY;
uniform sampler2D _TextureCbCr;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tex0_2;
  highp float y_3;
  lowp float tmpvar_4;
  tmpvar_4 = texture2D (_TextureY, xlv_TEXCOORD1).x;
  y_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_TextureCbCr, xlv_TEXCOORD1);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.x = y_3;
  tmpvar_6.yz = tmpvar_5.xy;
  highp mat4 tmpvar_7;
  tmpvar_7[0].x = 1.0;
  tmpvar_7[0].y = 1.0;
  tmpvar_7[0].z = 1.0;
  tmpvar_7[0].w = 0.0;
  tmpvar_7[1].x = 0.0;
  tmpvar_7[1].y = -0.3441;
  tmpvar_7[1].z = 1.772;
  tmpvar_7[1].w = 0.0;
  tmpvar_7[2].x = 1.402;
  tmpvar_7[2].y = -0.7141;
  tmpvar_7[2].z = 0.0;
  tmpvar_7[2].w = 0.0;
  tmpvar_7[3].x = -0.701;
  tmpvar_7[3].y = 0.5291;
  tmpvar_7[3].z = -0.886;
  tmpvar_7[3].w = 1.0;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * tmpvar_6);
  tex0_2.xyz = tmpvar_8.xyz;
  tex0_2.w = 1.0;
  mediump float tmpvar_9;
  tmpvar_9 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump vec4 tmpvar_10;
  tmpvar_10 = tex0_2;
  pixel_1 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _ColorGradingTint.xyz), _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (pixel_1.xyz, _ColorGradingTint.xyz, vec3((clamp (
    ((tmpvar_9 * (tmpvar_9 * (3.0 - 
      (2.0 * tmpvar_9)
    ))) + _BlendBias)
  , 0.0, 1.0) * _ColorGradingTint.w)));
  pixel_1.xyz = tmpvar_12;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_13;
  tmpvar_13 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_13;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 _DisplayTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump float tmpvar_1;
  mediump vec2 tmpvar_2;
  tmpvar_2.x = (((_DisplayTransform[0].x * _glesMultiTexCoord0.x) + (_DisplayTransform[0].y * _glesMultiTexCoord0.y)) + _DisplayTransform[0].z);
  tmpvar_2.y = (((_DisplayTransform[1].x * _glesMultiTexCoord0.x) + (_DisplayTransform[1].y * _glesMultiTexCoord0.y)) + _DisplayTransform[1].z);
  tmpvar_1 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = _glesVertex;
  xlv_TEXCOORD0 = tmpvar_1;
  xlv_TEXCOORD1 = tmpvar_2;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _TextureY;
uniform sampler2D _TextureCbCr;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tex0_2;
  highp float y_3;
  lowp float tmpvar_4;
  tmpvar_4 = texture2D (_TextureY, xlv_TEXCOORD1).x;
  y_3 = tmpvar_4;
  lowp vec4 tmpvar_5;
  tmpvar_5 = texture2D (_TextureCbCr, xlv_TEXCOORD1);
  highp vec4 tmpvar_6;
  tmpvar_6.w = 1.0;
  tmpvar_6.x = y_3;
  tmpvar_6.yz = tmpvar_5.xy;
  highp mat4 tmpvar_7;
  tmpvar_7[0].x = 1.0;
  tmpvar_7[0].y = 1.0;
  tmpvar_7[0].z = 1.0;
  tmpvar_7[0].w = 0.0;
  tmpvar_7[1].x = 0.0;
  tmpvar_7[1].y = -0.3441;
  tmpvar_7[1].z = 1.772;
  tmpvar_7[1].w = 0.0;
  tmpvar_7[2].x = 1.402;
  tmpvar_7[2].y = -0.7141;
  tmpvar_7[2].z = 0.0;
  tmpvar_7[2].w = 0.0;
  tmpvar_7[3].x = -0.701;
  tmpvar_7[3].y = 0.5291;
  tmpvar_7[3].z = -0.886;
  tmpvar_7[3].w = 1.0;
  highp vec4 tmpvar_8;
  tmpvar_8 = (tmpvar_7 * tmpvar_6);
  tex0_2.xyz = tmpvar_8.xyz;
  tex0_2.w = 1.0;
  mediump float tmpvar_9;
  tmpvar_9 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump vec4 tmpvar_10;
  tmpvar_10 = tex0_2;
  pixel_1 = tmpvar_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _ColorGradingTint.xyz), _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (pixel_1.xyz, _ColorGradingTint.xyz, vec3((clamp (
    ((tmpvar_9 * (tmpvar_9 * (3.0 - 
      (2.0 * tmpvar_9)
    ))) + _BlendBias)
  , 0.0, 1.0) * _ColorGradingTint.w)));
  pixel_1.xyz = tmpvar_12;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_13;
  tmpvar_13 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_13;
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