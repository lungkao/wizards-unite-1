Shader "WBG/ImageEffects/ImageBlend" {
Properties {
_MainTex ("Color Buffer RGBA", 2D) = "white" { }
_DetailTex ("Color Buffer RGBA", 2D) = "black" { }
_BlendBias ("Blend Bias", Float) = 0
_FogColor ("Fog Color (RGB) Alpha (A)", Color) = (1,1,1,1)
_ColorGradingTint ("Color Grading (RGB) Alpha (A)", Color) = (0.1,0.35,0.35,1)
}
SubShader {
 LOD 800
 Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  LOD 800
  Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 26651
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_projection;
uniform mediump vec4 _MainTex_ST;
uniform mediump mat4 _ImageTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 texcoord_1;
  highp vec4 tmpvar_2;
  mediump float tmpvar_3;
  mediump vec2 tmpvar_4;
  tmpvar_2.xzw = _glesVertex.xzw;
  tmpvar_2.y = (_glesVertex.y * sign(glstate_matrix_projection[1].y));
  highp vec2 tmpvar_5;
  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  texcoord_1 = tmpvar_5;
  tmpvar_4.x = (((_ImageTransform[0].x * texcoord_1.x) + (_ImageTransform[0].y * texcoord_1.y)) + _ImageTransform[0].z);
  tmpvar_4.y = (((_ImageTransform[1].x * texcoord_1.x) + (_ImageTransform[1].y * texcoord_1.y)) + _ImageTransform[1].z);
  tmpvar_3 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump vec4 _FogColor;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_DetailTex, xlv_TEXCOORD1);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_4 * 
    (tmpvar_4 * (3.0 - (2.0 * tmpvar_4)))
  ) + _BlendBias), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = mix (tmpvar_2, tmpvar_3, vec4(tmpvar_5));
  pixel_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = (_FogColor.w * _FogColor.w);
  tmpvar_7 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _FogColor.xyz), vec3(tmpvar_8));
  pixel_1.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (pixel_1.xyz, _FogColor.xyz, vec3(((tmpvar_5 * tmpvar_5) * tmpvar_8)));
  pixel_1.xyz = tmpvar_9;
  mediump vec3 background_10;
  background_10 = pixel_1.xyz;
  mediump vec3 selector_11;
  bvec3 tmpvar_12;
  tmpvar_12 = greaterThan (_ColorGradingTint.xyz, vec3(0.5, 0.5, 0.5));
  lowp vec3 tmpvar_13;
  tmpvar_13 = vec3(tmpvar_12);
  selector_11 = tmpvar_13;
  mediump vec3 tmpvar_14;
  mediump vec3 tmpvar_15;
  tmpvar_15 = (2.0 * _ColorGradingTint.xyz);
  tmpvar_14 = mix (((
    (tmpvar_15 - vec3(1.0, 1.0, 1.0))
   * 
    (background_10 - (background_10 * background_10))
  ) + background_10), ((
    (tmpvar_15 - vec3(1.0, 1.0, 1.0))
   * 
    (sqrt(background_10) - background_10)
  ) + background_10), selector_11);
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (background_10, vec3(dot (vec3(0.22, 0.66, 0.11), background_10)), _ColorGradingTint.www);
  background_10 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = mix (tmpvar_16, tmpvar_14, _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_17;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_18;
  tmpvar_18 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_18;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_projection;
uniform mediump vec4 _MainTex_ST;
uniform mediump mat4 _ImageTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 texcoord_1;
  highp vec4 tmpvar_2;
  mediump float tmpvar_3;
  mediump vec2 tmpvar_4;
  tmpvar_2.xzw = _glesVertex.xzw;
  tmpvar_2.y = (_glesVertex.y * sign(glstate_matrix_projection[1].y));
  highp vec2 tmpvar_5;
  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  texcoord_1 = tmpvar_5;
  tmpvar_4.x = (((_ImageTransform[0].x * texcoord_1.x) + (_ImageTransform[0].y * texcoord_1.y)) + _ImageTransform[0].z);
  tmpvar_4.y = (((_ImageTransform[1].x * texcoord_1.x) + (_ImageTransform[1].y * texcoord_1.y)) + _ImageTransform[1].z);
  tmpvar_3 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump vec4 _FogColor;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_DetailTex, xlv_TEXCOORD1);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_4 * 
    (tmpvar_4 * (3.0 - (2.0 * tmpvar_4)))
  ) + _BlendBias), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = mix (tmpvar_2, tmpvar_3, vec4(tmpvar_5));
  pixel_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = (_FogColor.w * _FogColor.w);
  tmpvar_7 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _FogColor.xyz), vec3(tmpvar_8));
  pixel_1.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (pixel_1.xyz, _FogColor.xyz, vec3(((tmpvar_5 * tmpvar_5) * tmpvar_8)));
  pixel_1.xyz = tmpvar_9;
  mediump vec3 background_10;
  background_10 = pixel_1.xyz;
  mediump vec3 selector_11;
  bvec3 tmpvar_12;
  tmpvar_12 = greaterThan (_ColorGradingTint.xyz, vec3(0.5, 0.5, 0.5));
  lowp vec3 tmpvar_13;
  tmpvar_13 = vec3(tmpvar_12);
  selector_11 = tmpvar_13;
  mediump vec3 tmpvar_14;
  mediump vec3 tmpvar_15;
  tmpvar_15 = (2.0 * _ColorGradingTint.xyz);
  tmpvar_14 = mix (((
    (tmpvar_15 - vec3(1.0, 1.0, 1.0))
   * 
    (background_10 - (background_10 * background_10))
  ) + background_10), ((
    (tmpvar_15 - vec3(1.0, 1.0, 1.0))
   * 
    (sqrt(background_10) - background_10)
  ) + background_10), selector_11);
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (background_10, vec3(dot (vec3(0.22, 0.66, 0.11), background_10)), _ColorGradingTint.www);
  background_10 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = mix (tmpvar_16, tmpvar_14, _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_17;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_18;
  tmpvar_18 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_18;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_projection;
uniform mediump vec4 _MainTex_ST;
uniform mediump mat4 _ImageTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 texcoord_1;
  highp vec4 tmpvar_2;
  mediump float tmpvar_3;
  mediump vec2 tmpvar_4;
  tmpvar_2.xzw = _glesVertex.xzw;
  tmpvar_2.y = (_glesVertex.y * sign(glstate_matrix_projection[1].y));
  highp vec2 tmpvar_5;
  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  texcoord_1 = tmpvar_5;
  tmpvar_4.x = (((_ImageTransform[0].x * texcoord_1.x) + (_ImageTransform[0].y * texcoord_1.y)) + _ImageTransform[0].z);
  tmpvar_4.y = (((_ImageTransform[1].x * texcoord_1.x) + (_ImageTransform[1].y * texcoord_1.y)) + _ImageTransform[1].z);
  tmpvar_3 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump vec4 _FogColor;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_DetailTex, xlv_TEXCOORD1);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_4 * 
    (tmpvar_4 * (3.0 - (2.0 * tmpvar_4)))
  ) + _BlendBias), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = mix (tmpvar_2, tmpvar_3, vec4(tmpvar_5));
  pixel_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = (_FogColor.w * _FogColor.w);
  tmpvar_7 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _FogColor.xyz), vec3(tmpvar_8));
  pixel_1.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (pixel_1.xyz, _FogColor.xyz, vec3(((tmpvar_5 * tmpvar_5) * tmpvar_8)));
  pixel_1.xyz = tmpvar_9;
  mediump vec3 background_10;
  background_10 = pixel_1.xyz;
  mediump vec3 selector_11;
  bvec3 tmpvar_12;
  tmpvar_12 = greaterThan (_ColorGradingTint.xyz, vec3(0.5, 0.5, 0.5));
  lowp vec3 tmpvar_13;
  tmpvar_13 = vec3(tmpvar_12);
  selector_11 = tmpvar_13;
  mediump vec3 tmpvar_14;
  mediump vec3 tmpvar_15;
  tmpvar_15 = (2.0 * _ColorGradingTint.xyz);
  tmpvar_14 = mix (((
    (tmpvar_15 - vec3(1.0, 1.0, 1.0))
   * 
    (background_10 - (background_10 * background_10))
  ) + background_10), ((
    (tmpvar_15 - vec3(1.0, 1.0, 1.0))
   * 
    (sqrt(background_10) - background_10)
  ) + background_10), selector_11);
  mediump vec3 tmpvar_16;
  tmpvar_16 = mix (background_10, vec3(dot (vec3(0.22, 0.66, 0.11), background_10)), _ColorGradingTint.www);
  background_10 = tmpvar_16;
  mediump vec3 tmpvar_17;
  tmpvar_17 = mix (tmpvar_16, tmpvar_14, _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_17;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_18;
  tmpvar_18 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_18;
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
SubShader {
 LOD 200
 Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  LOD 200
  Tags { "QUEUE" = "Geometry-1" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 105561
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_projection;
uniform mediump vec4 _MainTex_ST;
uniform mediump mat4 _ImageTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 texcoord_1;
  highp vec4 tmpvar_2;
  mediump float tmpvar_3;
  mediump vec2 tmpvar_4;
  tmpvar_2.xzw = _glesVertex.xzw;
  tmpvar_2.y = (_glesVertex.y * sign(glstate_matrix_projection[1].y));
  highp vec2 tmpvar_5;
  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  texcoord_1 = tmpvar_5;
  tmpvar_4.x = (((_ImageTransform[0].x * texcoord_1.x) + (_ImageTransform[0].y * texcoord_1.y)) + _ImageTransform[0].z);
  tmpvar_4.y = (((_ImageTransform[1].x * texcoord_1.x) + (_ImageTransform[1].y * texcoord_1.y)) + _ImageTransform[1].z);
  tmpvar_3 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump vec4 _FogColor;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_DetailTex, xlv_TEXCOORD1);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_4 * 
    (tmpvar_4 * (3.0 - (2.0 * tmpvar_4)))
  ) + _BlendBias), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = mix (tmpvar_2, tmpvar_3, vec4(tmpvar_5));
  pixel_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = (_FogColor.w * _FogColor.w);
  tmpvar_7 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _FogColor.xyz), vec3(tmpvar_8));
  pixel_1.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (pixel_1.xyz, _FogColor.xyz, vec3(((tmpvar_5 * tmpvar_5) * tmpvar_8)));
  pixel_1.xyz = tmpvar_9;
  mediump vec3 background_10;
  background_10 = pixel_1.xyz;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (_ColorGradingTint.xyz * background_10);
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (background_10, vec3(dot (vec3(0.22, 0.66, 0.11), background_10)), _ColorGradingTint.www);
  background_10 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = mix (tmpvar_12, tmpvar_11, _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_13;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_14;
  tmpvar_14 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_14;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_projection;
uniform mediump vec4 _MainTex_ST;
uniform mediump mat4 _ImageTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 texcoord_1;
  highp vec4 tmpvar_2;
  mediump float tmpvar_3;
  mediump vec2 tmpvar_4;
  tmpvar_2.xzw = _glesVertex.xzw;
  tmpvar_2.y = (_glesVertex.y * sign(glstate_matrix_projection[1].y));
  highp vec2 tmpvar_5;
  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  texcoord_1 = tmpvar_5;
  tmpvar_4.x = (((_ImageTransform[0].x * texcoord_1.x) + (_ImageTransform[0].y * texcoord_1.y)) + _ImageTransform[0].z);
  tmpvar_4.y = (((_ImageTransform[1].x * texcoord_1.x) + (_ImageTransform[1].y * texcoord_1.y)) + _ImageTransform[1].z);
  tmpvar_3 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump vec4 _FogColor;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_DetailTex, xlv_TEXCOORD1);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_4 * 
    (tmpvar_4 * (3.0 - (2.0 * tmpvar_4)))
  ) + _BlendBias), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = mix (tmpvar_2, tmpvar_3, vec4(tmpvar_5));
  pixel_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = (_FogColor.w * _FogColor.w);
  tmpvar_7 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _FogColor.xyz), vec3(tmpvar_8));
  pixel_1.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (pixel_1.xyz, _FogColor.xyz, vec3(((tmpvar_5 * tmpvar_5) * tmpvar_8)));
  pixel_1.xyz = tmpvar_9;
  mediump vec3 background_10;
  background_10 = pixel_1.xyz;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (_ColorGradingTint.xyz * background_10);
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (background_10, vec3(dot (vec3(0.22, 0.66, 0.11), background_10)), _ColorGradingTint.www);
  background_10 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = mix (tmpvar_12, tmpvar_11, _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_13;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_14;
  tmpvar_14 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_14;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 glstate_matrix_projection;
uniform mediump vec4 _MainTex_ST;
uniform mediump mat4 _ImageTransform;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  mediump vec2 texcoord_1;
  highp vec4 tmpvar_2;
  mediump float tmpvar_3;
  mediump vec2 tmpvar_4;
  tmpvar_2.xzw = _glesVertex.xzw;
  tmpvar_2.y = (_glesVertex.y * sign(glstate_matrix_projection[1].y));
  highp vec2 tmpvar_5;
  tmpvar_5 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  texcoord_1 = tmpvar_5;
  tmpvar_4.x = (((_ImageTransform[0].x * texcoord_1.x) + (_ImageTransform[0].y * texcoord_1.y)) + _ImageTransform[0].z);
  tmpvar_4.y = (((_ImageTransform[1].x * texcoord_1.x) + (_ImageTransform[1].y * texcoord_1.y)) + _ImageTransform[1].z);
  tmpvar_3 = ((_glesVertex.y * 0.5) + 0.5);
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
  xlv_TEXCOORD1 = tmpvar_4;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _DetailTex;
uniform mediump vec4 _FogColor;
uniform mediump vec4 _ColorGradingTint;
uniform mediump float _BlendBias;
varying mediump float xlv_TEXCOORD0;
varying mediump vec2 xlv_TEXCOORD1;
void main ()
{
  lowp vec4 pixel_1;
  lowp vec4 tmpvar_2;
  tmpvar_2 = texture2D (_MainTex, xlv_TEXCOORD1);
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_DetailTex, xlv_TEXCOORD1);
  mediump float tmpvar_4;
  tmpvar_4 = clamp (((xlv_TEXCOORD0 - 0.25) / 0.5), 0.0, 1.0);
  mediump float tmpvar_5;
  tmpvar_5 = clamp (((tmpvar_4 * 
    (tmpvar_4 * (3.0 - (2.0 * tmpvar_4)))
  ) + _BlendBias), 0.0, 1.0);
  mediump vec4 tmpvar_6;
  tmpvar_6 = mix (tmpvar_2, tmpvar_3, vec4(tmpvar_5));
  pixel_1 = tmpvar_6;
  mediump vec3 tmpvar_7;
  mediump float tmpvar_8;
  tmpvar_8 = (_FogColor.w * _FogColor.w);
  tmpvar_7 = mix (pixel_1.xyz, (dot (pixel_1.xyz, vec3(0.299, 0.587, 0.114)) * _FogColor.xyz), vec3(tmpvar_8));
  pixel_1.xyz = tmpvar_7;
  mediump vec3 tmpvar_9;
  tmpvar_9 = mix (pixel_1.xyz, _FogColor.xyz, vec3(((tmpvar_5 * tmpvar_5) * tmpvar_8)));
  pixel_1.xyz = tmpvar_9;
  mediump vec3 background_10;
  background_10 = pixel_1.xyz;
  mediump vec3 tmpvar_11;
  tmpvar_11 = (_ColorGradingTint.xyz * background_10);
  mediump vec3 tmpvar_12;
  tmpvar_12 = mix (background_10, vec3(dot (vec3(0.22, 0.66, 0.11), background_10)), _ColorGradingTint.www);
  background_10 = tmpvar_12;
  mediump vec3 tmpvar_13;
  tmpvar_13 = mix (tmpvar_12, tmpvar_11, _ColorGradingTint.www);
  pixel_1.xyz = tmpvar_13;
  pixel_1.w = 1.0;
  lowp vec4 tmpvar_14;
  tmpvar_14 = clamp (pixel_1, 0.0, 1.0);
  gl_FragData[0] = tmpvar_14;
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