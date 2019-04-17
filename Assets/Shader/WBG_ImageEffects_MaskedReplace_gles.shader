Shader "WBG/ImageEffects/MaskedReplace" {
Properties {
_MainTex ("Color Buffer RGBA", 2D) = "white" { }
_MaskTex ("Color Mask RGBA", 2D) = "black" { }
_PrimaryColor ("Primary Color", Color) = (0,0,1,1)
_SecondaryColor ("Secondary Color", Color) = (1,0,0,1)
_ColorThreshold ("Color Threshold", Float) = 0
}
SubShader {
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
 Pass {
  Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" "ShaderType" = "WBGOpaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 31255
Program "vp" {
SubProgram "gles hw_tier00 " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec4 tmpvar_2;
  mediump vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2.xzw = tmpvar_4.xzw;
  tmpvar_2.y = (tmpvar_4.y * sign(glstate_matrix_projection[1].y));
  tmpvar_3 = tmpvar_1.xy;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MaskTex;
uniform mediump vec4 _PrimaryColor;
uniform mediump vec4 _SecondaryColor;
uniform mediump float _ColorThreshold;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tex1_1;
  mediump vec4 tex0_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex0_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MaskTex, xlv_TEXCOORD0);
  tex1_1 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = (_SecondaryColor * tex0_2.zzzz).xyz;
  mediump float tmpvar_6;
  tmpvar_6 = clamp (((
    (tex1_1.w * tex0_2.z)
   - _ColorThreshold) / 0.5), 0.0, 1.0);
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = mix (tmpvar_5, _PrimaryColor, vec4((tmpvar_6 * (tmpvar_6 * 
    (3.0 - (2.0 * tmpvar_6))
  )))).xyz;
  tmpvar_7.w = tex0_2.z;
  gl_FragData[0] = tmpvar_7;
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
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec4 tmpvar_2;
  mediump vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2.xzw = tmpvar_4.xzw;
  tmpvar_2.y = (tmpvar_4.y * sign(glstate_matrix_projection[1].y));
  tmpvar_3 = tmpvar_1.xy;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MaskTex;
uniform mediump vec4 _PrimaryColor;
uniform mediump vec4 _SecondaryColor;
uniform mediump float _ColorThreshold;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tex1_1;
  mediump vec4 tex0_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex0_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MaskTex, xlv_TEXCOORD0);
  tex1_1 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = (_SecondaryColor * tex0_2.zzzz).xyz;
  mediump float tmpvar_6;
  tmpvar_6 = clamp (((
    (tex1_1.w * tex0_2.z)
   - _ColorThreshold) / 0.5), 0.0, 1.0);
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = mix (tmpvar_5, _PrimaryColor, vec4((tmpvar_6 * (tmpvar_6 * 
    (3.0 - (2.0 * tmpvar_6))
  )))).xyz;
  tmpvar_7.w = tex0_2.z;
  gl_FragData[0] = tmpvar_7;
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
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1 = _glesMultiTexCoord0;
  highp vec4 tmpvar_2;
  mediump vec2 tmpvar_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  tmpvar_5.w = 1.0;
  tmpvar_5.xyz = _glesVertex.xyz;
  tmpvar_4 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_5));
  tmpvar_2.xzw = tmpvar_4.xzw;
  tmpvar_2.y = (tmpvar_4.y * sign(glstate_matrix_projection[1].y));
  tmpvar_3 = tmpvar_1.xy;
  gl_Position = tmpvar_2;
  xlv_TEXCOORD0 = tmpvar_3;
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
uniform sampler2D _MaskTex;
uniform mediump vec4 _PrimaryColor;
uniform mediump vec4 _SecondaryColor;
uniform mediump float _ColorThreshold;
varying mediump vec2 xlv_TEXCOORD0;
void main ()
{
  mediump vec4 tex1_1;
  mediump vec4 tex0_2;
  lowp vec4 tmpvar_3;
  tmpvar_3 = texture2D (_MainTex, xlv_TEXCOORD0);
  tex0_2 = tmpvar_3;
  lowp vec4 tmpvar_4;
  tmpvar_4 = texture2D (_MaskTex, xlv_TEXCOORD0);
  tex1_1 = tmpvar_4;
  mediump vec4 tmpvar_5;
  tmpvar_5.w = 0.0;
  tmpvar_5.xyz = (_SecondaryColor * tex0_2.zzzz).xyz;
  mediump float tmpvar_6;
  tmpvar_6 = clamp (((
    (tex1_1.w * tex0_2.z)
   - _ColorThreshold) / 0.5), 0.0, 1.0);
  mediump vec4 tmpvar_7;
  tmpvar_7.xyz = mix (tmpvar_5, _PrimaryColor, vec4((tmpvar_6 * (tmpvar_6 * 
    (3.0 - (2.0 * tmpvar_6))
  )))).xyz;
  tmpvar_7.w = tex0_2.z;
  gl_FragData[0] = tmpvar_7;
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