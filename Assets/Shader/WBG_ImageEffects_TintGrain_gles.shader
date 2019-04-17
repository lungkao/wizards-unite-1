Shader "WBG/ImageEffects/TintGrain" {
Properties {
_intensityMultiplier ("Noise Multiplier", Float) = 1
_noiseStrength ("Noise Strength", Float) = 1
_VignetteRadius ("Vignette Radius (32 - 512)", Float) = 64
_VignetteStrength ("Vignette Strength (0 - 1)", Float) = 1
_ToneColor ("Tone Mapping Color", Color) = (1,1,1,1)
_Contrast ("Contrast", Float) = 1
_NoiseTex ("Noise (RGB)", 2D) = "white" { }
_ColorBuffer ("Color (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 7502
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _NoiseTex_ST;
uniform mediump vec4 _ColorBuffer_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
void main ()
{
  mediump vec4 s_1;
  lowp vec2 tmpvar_2;
  lowp vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _NoiseTex_ST.xy) + _NoiseTex_ST.zw);
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _ColorBuffer_ST.xy) + _ColorBuffer_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  s_1 = o_6;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = (s_1.xy / s_1.w);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _NoiseTex;
uniform sampler2D _ColorBuffer;
uniform mediump float _intensityMultiplier;
uniform mediump float _noiseStrength;
uniform mediump float _VignetteRadius;
uniform mediump float _VignetteStrength;
uniform lowp vec4 _ToneColor;
uniform mediump float _Contrast;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 noisePix_1;
  lowp vec3 noise_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD1);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_NoiseTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(1.0, 1.0, 1.0), tmpvar_4.xyz, vec3(_noiseStrength));
  noise_2 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((tmpvar_3.xyz * noise_2) * _intensityMultiplier);
  noisePix_1 = tmpvar_6;
  noisePix_1 = (noisePix_1 * _ToneColor.xyz);
  mediump float tmpvar_7;
  tmpvar_7 = clamp (((
    ((0.4 * _VignetteRadius) * (xlv_TEXCOORD2.x * xlv_TEXCOORD2.y))
   * 
    (1.0 - xlv_TEXCOORD2.x)
  ) * (1.0 - xlv_TEXCOORD2.y)), 0.0, 1.0);
  lowp vec3 tmpvar_8;
  tmpvar_8 = (noisePix_1 * tmpvar_7);
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (noisePix_1, tmpvar_8, vec3(_VignetteStrength));
  noisePix_1 = tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (_Contrast, 0.0);
  noisePix_1 = (((noisePix_1 - 0.5) * tmpvar_10) + 0.5);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = noisePix_1;
  gl_FragData[0] = tmpvar_11;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _NoiseTex_ST;
uniform mediump vec4 _ColorBuffer_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
void main ()
{
  mediump vec4 s_1;
  lowp vec2 tmpvar_2;
  lowp vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _NoiseTex_ST.xy) + _NoiseTex_ST.zw);
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _ColorBuffer_ST.xy) + _ColorBuffer_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  s_1 = o_6;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = (s_1.xy / s_1.w);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _NoiseTex;
uniform sampler2D _ColorBuffer;
uniform mediump float _intensityMultiplier;
uniform mediump float _noiseStrength;
uniform mediump float _VignetteRadius;
uniform mediump float _VignetteStrength;
uniform lowp vec4 _ToneColor;
uniform mediump float _Contrast;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 noisePix_1;
  lowp vec3 noise_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD1);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_NoiseTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(1.0, 1.0, 1.0), tmpvar_4.xyz, vec3(_noiseStrength));
  noise_2 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((tmpvar_3.xyz * noise_2) * _intensityMultiplier);
  noisePix_1 = tmpvar_6;
  noisePix_1 = (noisePix_1 * _ToneColor.xyz);
  mediump float tmpvar_7;
  tmpvar_7 = clamp (((
    ((0.4 * _VignetteRadius) * (xlv_TEXCOORD2.x * xlv_TEXCOORD2.y))
   * 
    (1.0 - xlv_TEXCOORD2.x)
  ) * (1.0 - xlv_TEXCOORD2.y)), 0.0, 1.0);
  lowp vec3 tmpvar_8;
  tmpvar_8 = (noisePix_1 * tmpvar_7);
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (noisePix_1, tmpvar_8, vec3(_VignetteStrength));
  noisePix_1 = tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (_Contrast, 0.0);
  noisePix_1 = (((noisePix_1 - 0.5) * tmpvar_10) + 0.5);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = noisePix_1;
  gl_FragData[0] = tmpvar_11;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _ProjectionParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform mediump vec4 _NoiseTex_ST;
uniform mediump vec4 _ColorBuffer_ST;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
void main ()
{
  mediump vec4 s_1;
  lowp vec2 tmpvar_2;
  lowp vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2 = ((_glesMultiTexCoord0.xy * _NoiseTex_ST.xy) + _NoiseTex_ST.zw);
  tmpvar_3 = ((_glesMultiTexCoord0.xy * _ColorBuffer_ST.xy) + _ColorBuffer_ST.zw);
  highp vec4 o_6;
  highp vec4 tmpvar_7;
  tmpvar_7 = (tmpvar_4 * 0.5);
  highp vec2 tmpvar_8;
  tmpvar_8.x = tmpvar_7.x;
  tmpvar_8.y = (tmpvar_7.y * _ProjectionParams.x);
  o_6.xy = (tmpvar_8 + tmpvar_7.w);
  o_6.zw = tmpvar_4.zw;
  s_1 = o_6;
  gl_Position = tmpvar_4;
  xlv_TEXCOORD0 = tmpvar_2;
  xlv_TEXCOORD1 = tmpvar_3;
  xlv_TEXCOORD2 = (s_1.xy / s_1.w);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _NoiseTex;
uniform sampler2D _ColorBuffer;
uniform mediump float _intensityMultiplier;
uniform mediump float _noiseStrength;
uniform mediump float _VignetteRadius;
uniform mediump float _VignetteStrength;
uniform lowp vec4 _ToneColor;
uniform mediump float _Contrast;
varying lowp vec2 xlv_TEXCOORD0;
varying lowp vec2 xlv_TEXCOORD1;
varying mediump vec2 xlv_TEXCOORD2;
void main ()
{
  lowp vec3 noisePix_1;
  lowp vec3 noise_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_ColorBuffer, xlv_TEXCOORD1);
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_NoiseTex, xlv_TEXCOORD0);
  mediump vec3 tmpvar_5;
  tmpvar_5 = mix (vec3(1.0, 1.0, 1.0), tmpvar_4.xyz, vec3(_noiseStrength));
  noise_2 = tmpvar_5;
  mediump vec3 tmpvar_6;
  tmpvar_6 = ((tmpvar_3.xyz * noise_2) * _intensityMultiplier);
  noisePix_1 = tmpvar_6;
  noisePix_1 = (noisePix_1 * _ToneColor.xyz);
  mediump float tmpvar_7;
  tmpvar_7 = clamp (((
    ((0.4 * _VignetteRadius) * (xlv_TEXCOORD2.x * xlv_TEXCOORD2.y))
   * 
    (1.0 - xlv_TEXCOORD2.x)
  ) * (1.0 - xlv_TEXCOORD2.y)), 0.0, 1.0);
  lowp vec3 tmpvar_8;
  tmpvar_8 = (noisePix_1 * tmpvar_7);
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (noisePix_1, tmpvar_8, vec3(_VignetteStrength));
  noisePix_1 = tmpvar_9;
  mediump float tmpvar_10;
  tmpvar_10 = max (_Contrast, 0.0);
  noisePix_1 = (((noisePix_1 - 0.5) * tmpvar_10) + 0.5);
  lowp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = noisePix_1;
  gl_FragData[0] = tmpvar_11;
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