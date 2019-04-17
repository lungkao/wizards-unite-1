Shader "TextMeshPro/Distance Field (Surface)" {
Properties {
_FaceTex ("Fill Texture", 2D) = "white" { }
_FaceUVSpeedX ("Face UV Speed X", Range(-5, 5)) = 0
_FaceUVSpeedY ("Face UV Speed Y", Range(-5, 5)) = 0
_FaceColor ("Fill Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineTex ("Outline Texture", 2D) = "white" { }
_OutlineUVSpeedX ("Outline UV Speed X", Range(-5, 5)) = 0
_OutlineUVSpeedY ("Outline UV Speed Y", Range(-5, 5)) = 0
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_Bevel ("Bevel", Range(0, 1)) = 0.5
_BevelOffset ("Bevel Offset", Range(-0.5, 0.5)) = 0
_BevelWidth ("Bevel Width", Range(-0.5, 0.5)) = 0
_BevelClamp ("Bevel Clamp", Range(0, 1)) = 0
_BevelRoundness ("Bevel Roundness", Range(0, 1)) = 0
_BumpMap ("Normalmap", 2D) = "bump" { }
_BumpOutline ("Bump Outline", Range(0, 1)) = 0.5
_BumpFace ("Bump Face", Range(0, 1)) = 0.5
_ReflectFaceColor ("Face Color", Color) = (0,0,0,1)
_ReflectOutlineColor ("Outline Color", Color) = (0,0,0,1)
_Cube ("Reflection Cubemap", Cube) = "black" { }
_EnvMatrixRotation ("Texture Rotation", Vector) = (0,0,0,0)
_SpecColor ("Specular Color", Color) = (0,0,0,1)
_FaceShininess ("Face Shininess", Range(0, 1)) = 0
_OutlineShininess ("Outline Shininess", Range(0, 1)) = 0
_GlowColor ("Color", Color) = (0,1,0,0.5)
_GlowOffset ("Offset", Range(-1, 1)) = 0
_GlowInner ("Inner", Range(0, 1)) = 0.05
_GlowOuter ("Outer", Range(0, 1)) = 0.05
_GlowPower ("Falloff", Range(1, 0)) = 0.75
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_PerspectiveFilter ("Perspective Correction", Range(0, 1)) = 0.875
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
}
SubShader {
 LOD 300
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 36808
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 viewDir_67;
  viewDir_67 = worldViewDir_10;
  lowp vec4 c_68;
  lowp vec4 c_69;
  highp float nh_70;
  lowp float diff_71;
  mediump float tmpvar_72;
  tmpvar_72 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_71 = tmpvar_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_67)
  )));
  nh_70 = tmpvar_73;
  mediump float y_74;
  y_74 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_75;
  tmpvar_75 = pow (nh_70, y_74);
  c_69.xyz = (((tmpvar_14 * tmpvar_1) * diff_71) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_75));
  c_69.w = tmpvar_18;
  c_68.w = c_69.w;
  c_68.xyz = c_69.xyz;
  c_4.w = c_68.w;
  c_4.xyz = (c_69.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 viewDir_67;
  viewDir_67 = worldViewDir_10;
  lowp vec4 c_68;
  lowp vec4 c_69;
  highp float nh_70;
  lowp float diff_71;
  mediump float tmpvar_72;
  tmpvar_72 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_71 = tmpvar_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_67)
  )));
  nh_70 = tmpvar_73;
  mediump float y_74;
  y_74 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_75;
  tmpvar_75 = pow (nh_70, y_74);
  c_69.xyz = (((tmpvar_14 * tmpvar_1) * diff_71) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_75));
  c_69.w = tmpvar_18;
  c_68.w = c_69.w;
  c_68.xyz = c_69.xyz;
  c_4.w = c_68.w;
  c_4.xyz = (c_69.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 viewDir_67;
  viewDir_67 = worldViewDir_10;
  lowp vec4 c_68;
  lowp vec4 c_69;
  highp float nh_70;
  lowp float diff_71;
  mediump float tmpvar_72;
  tmpvar_72 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_71 = tmpvar_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_67)
  )));
  nh_70 = tmpvar_73;
  mediump float y_74;
  y_74 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_75;
  tmpvar_75 = pow (nh_70, y_74);
  c_69.xyz = (((tmpvar_14 * tmpvar_1) * diff_71) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_75));
  c_69.w = tmpvar_18;
  c_68.w = c_69.w;
  c_68.xyz = c_69.xyz;
  c_4.w = c_68.w;
  c_4.xyz = (c_69.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  mediump vec3 normal_30;
  normal_30 = tmpvar_22;
  mediump vec3 x1_31;
  mediump vec4 tmpvar_32;
  tmpvar_32 = (normal_30.xyzz * normal_30.yzzx);
  x1_31.x = dot (unity_SHBr, tmpvar_32);
  x1_31.y = dot (unity_SHBg, tmpvar_32);
  x1_31.z = dot (unity_SHBb, tmpvar_32);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD7 = (x1_31 + (unity_SHC.xyz * (
    (normal_30.x * normal_30.x)
   - 
    (normal_30.y * normal_30.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_78;
  normalWorld_78 = tmpvar_6;
  mediump vec4 tmpvar_79;
  tmpvar_79.w = 1.0;
  tmpvar_79.xyz = normalWorld_78;
  mediump vec3 x_80;
  x_80.x = dot (unity_SHAr, tmpvar_79);
  x_80.y = dot (unity_SHAg, tmpvar_79);
  x_80.z = dot (unity_SHAb, tmpvar_79);
  mediump vec3 tmpvar_81;
  tmpvar_81 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_80)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_82;
  viewDir_82 = worldViewDir_10;
  lowp vec4 c_83;
  lowp vec4 c_84;
  highp float nh_85;
  lowp float diff_86;
  mediump float tmpvar_87;
  tmpvar_87 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_86 = tmpvar_87;
  mediump float tmpvar_88;
  tmpvar_88 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_82)
  )));
  nh_85 = tmpvar_88;
  mediump float y_89;
  y_89 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_90;
  tmpvar_90 = pow (nh_85, y_89);
  c_84.xyz = (((tmpvar_14 * tmpvar_1) * diff_86) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_90));
  c_84.w = tmpvar_18;
  c_83.w = c_84.w;
  c_83.xyz = (c_84.xyz + (tmpvar_14 * tmpvar_81));
  c_4.w = c_83.w;
  c_4.xyz = (c_83.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  mediump vec3 normal_30;
  normal_30 = tmpvar_22;
  mediump vec3 x1_31;
  mediump vec4 tmpvar_32;
  tmpvar_32 = (normal_30.xyzz * normal_30.yzzx);
  x1_31.x = dot (unity_SHBr, tmpvar_32);
  x1_31.y = dot (unity_SHBg, tmpvar_32);
  x1_31.z = dot (unity_SHBb, tmpvar_32);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD7 = (x1_31 + (unity_SHC.xyz * (
    (normal_30.x * normal_30.x)
   - 
    (normal_30.y * normal_30.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_78;
  normalWorld_78 = tmpvar_6;
  mediump vec4 tmpvar_79;
  tmpvar_79.w = 1.0;
  tmpvar_79.xyz = normalWorld_78;
  mediump vec3 x_80;
  x_80.x = dot (unity_SHAr, tmpvar_79);
  x_80.y = dot (unity_SHAg, tmpvar_79);
  x_80.z = dot (unity_SHAb, tmpvar_79);
  mediump vec3 tmpvar_81;
  tmpvar_81 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_80)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_82;
  viewDir_82 = worldViewDir_10;
  lowp vec4 c_83;
  lowp vec4 c_84;
  highp float nh_85;
  lowp float diff_86;
  mediump float tmpvar_87;
  tmpvar_87 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_86 = tmpvar_87;
  mediump float tmpvar_88;
  tmpvar_88 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_82)
  )));
  nh_85 = tmpvar_88;
  mediump float y_89;
  y_89 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_90;
  tmpvar_90 = pow (nh_85, y_89);
  c_84.xyz = (((tmpvar_14 * tmpvar_1) * diff_86) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_90));
  c_84.w = tmpvar_18;
  c_83.w = c_84.w;
  c_83.xyz = (c_84.xyz + (tmpvar_14 * tmpvar_81));
  c_4.w = c_83.w;
  c_4.xyz = (c_83.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  mediump vec3 normal_30;
  normal_30 = tmpvar_22;
  mediump vec3 x1_31;
  mediump vec4 tmpvar_32;
  tmpvar_32 = (normal_30.xyzz * normal_30.yzzx);
  x1_31.x = dot (unity_SHBr, tmpvar_32);
  x1_31.y = dot (unity_SHBg, tmpvar_32);
  x1_31.z = dot (unity_SHBb, tmpvar_32);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD7 = (x1_31 + (unity_SHC.xyz * (
    (normal_30.x * normal_30.x)
   - 
    (normal_30.y * normal_30.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_78;
  normalWorld_78 = tmpvar_6;
  mediump vec4 tmpvar_79;
  tmpvar_79.w = 1.0;
  tmpvar_79.xyz = normalWorld_78;
  mediump vec3 x_80;
  x_80.x = dot (unity_SHAr, tmpvar_79);
  x_80.y = dot (unity_SHAg, tmpvar_79);
  x_80.z = dot (unity_SHAb, tmpvar_79);
  mediump vec3 tmpvar_81;
  tmpvar_81 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_80)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_82;
  viewDir_82 = worldViewDir_10;
  lowp vec4 c_83;
  lowp vec4 c_84;
  highp float nh_85;
  lowp float diff_86;
  mediump float tmpvar_87;
  tmpvar_87 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_86 = tmpvar_87;
  mediump float tmpvar_88;
  tmpvar_88 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_82)
  )));
  nh_85 = tmpvar_88;
  mediump float y_89;
  y_89 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_90;
  tmpvar_90 = pow (nh_85, y_89);
  c_84.xyz = (((tmpvar_14 * tmpvar_1) * diff_86) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_90));
  c_84.w = tmpvar_18;
  c_83.w = c_84.w;
  c_83.xyz = (c_84.xyz + (tmpvar_14 * tmpvar_81));
  c_4.w = c_83.w;
  c_4.xyz = (c_83.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  mediump vec3 normal_30;
  normal_30 = tmpvar_22;
  mediump vec3 x1_31;
  mediump vec4 tmpvar_32;
  tmpvar_32 = (normal_30.xyzz * normal_30.yzzx);
  x1_31.x = dot (unity_SHBr, tmpvar_32);
  x1_31.y = dot (unity_SHBg, tmpvar_32);
  x1_31.z = dot (unity_SHBb, tmpvar_32);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD7 = (x1_31 + (unity_SHC.xyz * (
    (normal_30.x * normal_30.x)
   - 
    (normal_30.y * normal_30.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_67;
  normalWorld_67 = tmpvar_6;
  mediump vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = normalWorld_67;
  mediump vec3 x_69;
  x_69.x = dot (unity_SHAr, tmpvar_68);
  x_69.y = dot (unity_SHAg, tmpvar_68);
  x_69.z = dot (unity_SHAb, tmpvar_68);
  mediump vec3 tmpvar_70;
  tmpvar_70 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_69)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_71;
  viewDir_71 = worldViewDir_10;
  lowp vec4 c_72;
  lowp vec4 c_73;
  highp float nh_74;
  lowp float diff_75;
  mediump float tmpvar_76;
  tmpvar_76 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_75 = tmpvar_76;
  mediump float tmpvar_77;
  tmpvar_77 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_71)
  )));
  nh_74 = tmpvar_77;
  mediump float y_78;
  y_78 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_79;
  tmpvar_79 = pow (nh_74, y_78);
  c_73.xyz = (((tmpvar_14 * tmpvar_1) * diff_75) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_79));
  c_73.w = tmpvar_18;
  c_72.w = c_73.w;
  c_72.xyz = (c_73.xyz + (tmpvar_14 * tmpvar_70));
  c_4.w = c_72.w;
  c_4.xyz = (c_72.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  mediump vec3 normal_30;
  normal_30 = tmpvar_22;
  mediump vec3 x1_31;
  mediump vec4 tmpvar_32;
  tmpvar_32 = (normal_30.xyzz * normal_30.yzzx);
  x1_31.x = dot (unity_SHBr, tmpvar_32);
  x1_31.y = dot (unity_SHBg, tmpvar_32);
  x1_31.z = dot (unity_SHBb, tmpvar_32);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD7 = (x1_31 + (unity_SHC.xyz * (
    (normal_30.x * normal_30.x)
   - 
    (normal_30.y * normal_30.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_67;
  normalWorld_67 = tmpvar_6;
  mediump vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = normalWorld_67;
  mediump vec3 x_69;
  x_69.x = dot (unity_SHAr, tmpvar_68);
  x_69.y = dot (unity_SHAg, tmpvar_68);
  x_69.z = dot (unity_SHAb, tmpvar_68);
  mediump vec3 tmpvar_70;
  tmpvar_70 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_69)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_71;
  viewDir_71 = worldViewDir_10;
  lowp vec4 c_72;
  lowp vec4 c_73;
  highp float nh_74;
  lowp float diff_75;
  mediump float tmpvar_76;
  tmpvar_76 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_75 = tmpvar_76;
  mediump float tmpvar_77;
  tmpvar_77 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_71)
  )));
  nh_74 = tmpvar_77;
  mediump float y_78;
  y_78 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_79;
  tmpvar_79 = pow (nh_74, y_78);
  c_73.xyz = (((tmpvar_14 * tmpvar_1) * diff_75) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_79));
  c_73.w = tmpvar_18;
  c_72.w = c_73.w;
  c_72.xyz = (c_73.xyz + (tmpvar_14 * tmpvar_70));
  c_4.w = c_72.w;
  c_4.xyz = (c_72.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  mediump vec3 normal_30;
  normal_30 = tmpvar_22;
  mediump vec3 x1_31;
  mediump vec4 tmpvar_32;
  tmpvar_32 = (normal_30.xyzz * normal_30.yzzx);
  x1_31.x = dot (unity_SHBr, tmpvar_32);
  x1_31.y = dot (unity_SHBg, tmpvar_32);
  x1_31.z = dot (unity_SHBb, tmpvar_32);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
  xlv_TEXCOORD7 = (x1_31 + (unity_SHC.xyz * (
    (normal_30.x * normal_30.x)
   - 
    (normal_30.y * normal_30.y)
  )));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_67;
  normalWorld_67 = tmpvar_6;
  mediump vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = normalWorld_67;
  mediump vec3 x_69;
  x_69.x = dot (unity_SHAr, tmpvar_68);
  x_69.y = dot (unity_SHAg, tmpvar_68);
  x_69.z = dot (unity_SHAb, tmpvar_68);
  mediump vec3 tmpvar_70;
  tmpvar_70 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_69)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_71;
  viewDir_71 = worldViewDir_10;
  lowp vec4 c_72;
  lowp vec4 c_73;
  highp float nh_74;
  lowp float diff_75;
  mediump float tmpvar_76;
  tmpvar_76 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_75 = tmpvar_76;
  mediump float tmpvar_77;
  tmpvar_77 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_71)
  )));
  nh_74 = tmpvar_77;
  mediump float y_78;
  y_78 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_79;
  tmpvar_79 = pow (nh_74, y_78);
  c_73.xyz = (((tmpvar_14 * tmpvar_1) * diff_75) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_79));
  c_73.w = tmpvar_18;
  c_72.w = c_73.w;
  c_72.xyz = (c_73.xyz + (tmpvar_14 * tmpvar_70));
  c_4.w = c_72.w;
  c_4.xyz = (c_72.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_14;
  tmpvar_14.x = _ScaleX;
  tmpvar_14.y = _ScaleY;
  highp mat2 tmpvar_15;
  tmpvar_15[0] = glstate_matrix_projection[0].xy;
  tmpvar_15[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13)).ww / (tmpvar_14 * (tmpvar_15 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_17;
  tmpvar_17 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((tmpvar_7 * tmpvar_16))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_17;
  tmpvar_9.y = tmpvar_17;
  tmpvar_9.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_8.xy = (xlat_varoutput_18 * 0.001953125);
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_WorldToObject[0].xyz;
  tmpvar_22[1] = unity_WorldToObject[1].xyz;
  tmpvar_22[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_7 * tmpvar_22));
  highp mat3 tmpvar_24;
  tmpvar_24[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_24[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_24[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize((tmpvar_24 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_27 = (((tmpvar_23.yzx * worldTangent_3.zxy) - (tmpvar_23.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.x;
  tmpvar_28.y = worldBinormal_1.x;
  tmpvar_28.z = tmpvar_23.x;
  tmpvar_28.w = tmpvar_21.x;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.y;
  tmpvar_29.y = worldBinormal_1.y;
  tmpvar_29.z = tmpvar_23.y;
  tmpvar_29.w = tmpvar_21.y;
  highp vec4 tmpvar_30;
  tmpvar_30.x = worldTangent_3.z;
  tmpvar_30.y = worldBinormal_1.z;
  tmpvar_30.z = tmpvar_23.z;
  tmpvar_30.w = tmpvar_21.z;
  highp vec3 lightColor0_31;
  lightColor0_31 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_32;
  lightColor1_32 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_33;
  lightColor2_33 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_34;
  lightColor3_34 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_35;
  lightAttenSq_35 = unity_4LightAtten0;
  highp vec3 col_36;
  highp vec4 ndotl_37;
  highp vec4 lengthSq_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (unity_4LightPosX0 - tmpvar_21.x);
  highp vec4 tmpvar_40;
  tmpvar_40 = (unity_4LightPosY0 - tmpvar_21.y);
  highp vec4 tmpvar_41;
  tmpvar_41 = (unity_4LightPosZ0 - tmpvar_21.z);
  lengthSq_38 = (tmpvar_39 * tmpvar_39);
  lengthSq_38 = (lengthSq_38 + (tmpvar_40 * tmpvar_40));
  lengthSq_38 = (lengthSq_38 + (tmpvar_41 * tmpvar_41));
  highp vec4 tmpvar_42;
  tmpvar_42 = max (lengthSq_38, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_38 = tmpvar_42;
  ndotl_37 = (tmpvar_39 * tmpvar_23.x);
  ndotl_37 = (ndotl_37 + (tmpvar_40 * tmpvar_23.y));
  ndotl_37 = (ndotl_37 + (tmpvar_41 * tmpvar_23.z));
  highp vec4 tmpvar_43;
  tmpvar_43 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_37 * inversesqrt(tmpvar_42)));
  ndotl_37 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44 = (tmpvar_43 * (1.0/((1.0 + 
    (tmpvar_42 * lightAttenSq_35)
  ))));
  col_36 = (lightColor0_31 * tmpvar_44.x);
  col_36 = (col_36 + (lightColor1_32 * tmpvar_44.y));
  col_36 = (col_36 + (lightColor2_33 * tmpvar_44.z));
  col_36 = (col_36 + (lightColor3_34 * tmpvar_44.w));
  tmpvar_5 = col_36;
  mediump vec3 normal_45;
  normal_45 = tmpvar_23;
  mediump vec3 ambient_46;
  mediump vec3 x1_47;
  mediump vec4 tmpvar_48;
  tmpvar_48 = (normal_45.xyzz * normal_45.yzzx);
  x1_47.x = dot (unity_SHBr, tmpvar_48);
  x1_47.y = dot (unity_SHBg, tmpvar_48);
  x1_47.z = dot (unity_SHBb, tmpvar_48);
  ambient_46 = ((tmpvar_5 * (
    (tmpvar_5 * ((tmpvar_5 * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_47 + (unity_SHC.xyz * 
    ((normal_45.x * normal_45.x) - (normal_45.y * normal_45.y))
  )));
  tmpvar_5 = ambient_46;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_8.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_28;
  xlv_TEXCOORD3 = tmpvar_29;
  xlv_TEXCOORD4 = tmpvar_30;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_9;
  xlv_TEXCOORD6 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD7 = ambient_46;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_78;
  normalWorld_78 = tmpvar_6;
  mediump vec4 tmpvar_79;
  tmpvar_79.w = 1.0;
  tmpvar_79.xyz = normalWorld_78;
  mediump vec3 x_80;
  x_80.x = dot (unity_SHAr, tmpvar_79);
  x_80.y = dot (unity_SHAg, tmpvar_79);
  x_80.z = dot (unity_SHAb, tmpvar_79);
  mediump vec3 tmpvar_81;
  tmpvar_81 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_80)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_82;
  viewDir_82 = worldViewDir_10;
  lowp vec4 c_83;
  lowp vec4 c_84;
  highp float nh_85;
  lowp float diff_86;
  mediump float tmpvar_87;
  tmpvar_87 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_86 = tmpvar_87;
  mediump float tmpvar_88;
  tmpvar_88 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_82)
  )));
  nh_85 = tmpvar_88;
  mediump float y_89;
  y_89 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_90;
  tmpvar_90 = pow (nh_85, y_89);
  c_84.xyz = (((tmpvar_14 * tmpvar_1) * diff_86) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_90));
  c_84.w = tmpvar_18;
  c_83.w = c_84.w;
  c_83.xyz = (c_84.xyz + (tmpvar_14 * tmpvar_81));
  c_4.w = c_83.w;
  c_4.xyz = (c_83.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_14;
  tmpvar_14.x = _ScaleX;
  tmpvar_14.y = _ScaleY;
  highp mat2 tmpvar_15;
  tmpvar_15[0] = glstate_matrix_projection[0].xy;
  tmpvar_15[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13)).ww / (tmpvar_14 * (tmpvar_15 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_17;
  tmpvar_17 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((tmpvar_7 * tmpvar_16))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_17;
  tmpvar_9.y = tmpvar_17;
  tmpvar_9.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_8.xy = (xlat_varoutput_18 * 0.001953125);
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_WorldToObject[0].xyz;
  tmpvar_22[1] = unity_WorldToObject[1].xyz;
  tmpvar_22[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_7 * tmpvar_22));
  highp mat3 tmpvar_24;
  tmpvar_24[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_24[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_24[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize((tmpvar_24 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_27 = (((tmpvar_23.yzx * worldTangent_3.zxy) - (tmpvar_23.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.x;
  tmpvar_28.y = worldBinormal_1.x;
  tmpvar_28.z = tmpvar_23.x;
  tmpvar_28.w = tmpvar_21.x;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.y;
  tmpvar_29.y = worldBinormal_1.y;
  tmpvar_29.z = tmpvar_23.y;
  tmpvar_29.w = tmpvar_21.y;
  highp vec4 tmpvar_30;
  tmpvar_30.x = worldTangent_3.z;
  tmpvar_30.y = worldBinormal_1.z;
  tmpvar_30.z = tmpvar_23.z;
  tmpvar_30.w = tmpvar_21.z;
  highp vec3 lightColor0_31;
  lightColor0_31 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_32;
  lightColor1_32 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_33;
  lightColor2_33 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_34;
  lightColor3_34 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_35;
  lightAttenSq_35 = unity_4LightAtten0;
  highp vec3 col_36;
  highp vec4 ndotl_37;
  highp vec4 lengthSq_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (unity_4LightPosX0 - tmpvar_21.x);
  highp vec4 tmpvar_40;
  tmpvar_40 = (unity_4LightPosY0 - tmpvar_21.y);
  highp vec4 tmpvar_41;
  tmpvar_41 = (unity_4LightPosZ0 - tmpvar_21.z);
  lengthSq_38 = (tmpvar_39 * tmpvar_39);
  lengthSq_38 = (lengthSq_38 + (tmpvar_40 * tmpvar_40));
  lengthSq_38 = (lengthSq_38 + (tmpvar_41 * tmpvar_41));
  highp vec4 tmpvar_42;
  tmpvar_42 = max (lengthSq_38, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_38 = tmpvar_42;
  ndotl_37 = (tmpvar_39 * tmpvar_23.x);
  ndotl_37 = (ndotl_37 + (tmpvar_40 * tmpvar_23.y));
  ndotl_37 = (ndotl_37 + (tmpvar_41 * tmpvar_23.z));
  highp vec4 tmpvar_43;
  tmpvar_43 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_37 * inversesqrt(tmpvar_42)));
  ndotl_37 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44 = (tmpvar_43 * (1.0/((1.0 + 
    (tmpvar_42 * lightAttenSq_35)
  ))));
  col_36 = (lightColor0_31 * tmpvar_44.x);
  col_36 = (col_36 + (lightColor1_32 * tmpvar_44.y));
  col_36 = (col_36 + (lightColor2_33 * tmpvar_44.z));
  col_36 = (col_36 + (lightColor3_34 * tmpvar_44.w));
  tmpvar_5 = col_36;
  mediump vec3 normal_45;
  normal_45 = tmpvar_23;
  mediump vec3 ambient_46;
  mediump vec3 x1_47;
  mediump vec4 tmpvar_48;
  tmpvar_48 = (normal_45.xyzz * normal_45.yzzx);
  x1_47.x = dot (unity_SHBr, tmpvar_48);
  x1_47.y = dot (unity_SHBg, tmpvar_48);
  x1_47.z = dot (unity_SHBb, tmpvar_48);
  ambient_46 = ((tmpvar_5 * (
    (tmpvar_5 * ((tmpvar_5 * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_47 + (unity_SHC.xyz * 
    ((normal_45.x * normal_45.x) - (normal_45.y * normal_45.y))
  )));
  tmpvar_5 = ambient_46;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_8.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_28;
  xlv_TEXCOORD3 = tmpvar_29;
  xlv_TEXCOORD4 = tmpvar_30;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_9;
  xlv_TEXCOORD6 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD7 = ambient_46;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_78;
  normalWorld_78 = tmpvar_6;
  mediump vec4 tmpvar_79;
  tmpvar_79.w = 1.0;
  tmpvar_79.xyz = normalWorld_78;
  mediump vec3 x_80;
  x_80.x = dot (unity_SHAr, tmpvar_79);
  x_80.y = dot (unity_SHAg, tmpvar_79);
  x_80.z = dot (unity_SHAb, tmpvar_79);
  mediump vec3 tmpvar_81;
  tmpvar_81 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_80)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_82;
  viewDir_82 = worldViewDir_10;
  lowp vec4 c_83;
  lowp vec4 c_84;
  highp float nh_85;
  lowp float diff_86;
  mediump float tmpvar_87;
  tmpvar_87 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_86 = tmpvar_87;
  mediump float tmpvar_88;
  tmpvar_88 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_82)
  )));
  nh_85 = tmpvar_88;
  mediump float y_89;
  y_89 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_90;
  tmpvar_90 = pow (nh_85, y_89);
  c_84.xyz = (((tmpvar_14 * tmpvar_1) * diff_86) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_90));
  c_84.w = tmpvar_18;
  c_83.w = c_84.w;
  c_83.xyz = (c_84.xyz + (tmpvar_14 * tmpvar_81));
  c_4.w = c_83.w;
  c_4.xyz = (c_83.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_14;
  tmpvar_14.x = _ScaleX;
  tmpvar_14.y = _ScaleY;
  highp mat2 tmpvar_15;
  tmpvar_15[0] = glstate_matrix_projection[0].xy;
  tmpvar_15[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13)).ww / (tmpvar_14 * (tmpvar_15 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_17;
  tmpvar_17 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((tmpvar_7 * tmpvar_16))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_17;
  tmpvar_9.y = tmpvar_17;
  tmpvar_9.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_8.xy = (xlat_varoutput_18 * 0.001953125);
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_WorldToObject[0].xyz;
  tmpvar_22[1] = unity_WorldToObject[1].xyz;
  tmpvar_22[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_7 * tmpvar_22));
  highp mat3 tmpvar_24;
  tmpvar_24[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_24[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_24[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize((tmpvar_24 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_27 = (((tmpvar_23.yzx * worldTangent_3.zxy) - (tmpvar_23.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.x;
  tmpvar_28.y = worldBinormal_1.x;
  tmpvar_28.z = tmpvar_23.x;
  tmpvar_28.w = tmpvar_21.x;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.y;
  tmpvar_29.y = worldBinormal_1.y;
  tmpvar_29.z = tmpvar_23.y;
  tmpvar_29.w = tmpvar_21.y;
  highp vec4 tmpvar_30;
  tmpvar_30.x = worldTangent_3.z;
  tmpvar_30.y = worldBinormal_1.z;
  tmpvar_30.z = tmpvar_23.z;
  tmpvar_30.w = tmpvar_21.z;
  highp vec3 lightColor0_31;
  lightColor0_31 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_32;
  lightColor1_32 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_33;
  lightColor2_33 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_34;
  lightColor3_34 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_35;
  lightAttenSq_35 = unity_4LightAtten0;
  highp vec3 col_36;
  highp vec4 ndotl_37;
  highp vec4 lengthSq_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (unity_4LightPosX0 - tmpvar_21.x);
  highp vec4 tmpvar_40;
  tmpvar_40 = (unity_4LightPosY0 - tmpvar_21.y);
  highp vec4 tmpvar_41;
  tmpvar_41 = (unity_4LightPosZ0 - tmpvar_21.z);
  lengthSq_38 = (tmpvar_39 * tmpvar_39);
  lengthSq_38 = (lengthSq_38 + (tmpvar_40 * tmpvar_40));
  lengthSq_38 = (lengthSq_38 + (tmpvar_41 * tmpvar_41));
  highp vec4 tmpvar_42;
  tmpvar_42 = max (lengthSq_38, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_38 = tmpvar_42;
  ndotl_37 = (tmpvar_39 * tmpvar_23.x);
  ndotl_37 = (ndotl_37 + (tmpvar_40 * tmpvar_23.y));
  ndotl_37 = (ndotl_37 + (tmpvar_41 * tmpvar_23.z));
  highp vec4 tmpvar_43;
  tmpvar_43 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_37 * inversesqrt(tmpvar_42)));
  ndotl_37 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44 = (tmpvar_43 * (1.0/((1.0 + 
    (tmpvar_42 * lightAttenSq_35)
  ))));
  col_36 = (lightColor0_31 * tmpvar_44.x);
  col_36 = (col_36 + (lightColor1_32 * tmpvar_44.y));
  col_36 = (col_36 + (lightColor2_33 * tmpvar_44.z));
  col_36 = (col_36 + (lightColor3_34 * tmpvar_44.w));
  tmpvar_5 = col_36;
  mediump vec3 normal_45;
  normal_45 = tmpvar_23;
  mediump vec3 ambient_46;
  mediump vec3 x1_47;
  mediump vec4 tmpvar_48;
  tmpvar_48 = (normal_45.xyzz * normal_45.yzzx);
  x1_47.x = dot (unity_SHBr, tmpvar_48);
  x1_47.y = dot (unity_SHBg, tmpvar_48);
  x1_47.z = dot (unity_SHBb, tmpvar_48);
  ambient_46 = ((tmpvar_5 * (
    (tmpvar_5 * ((tmpvar_5 * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_47 + (unity_SHC.xyz * 
    ((normal_45.x * normal_45.x) - (normal_45.y * normal_45.y))
  )));
  tmpvar_5 = ambient_46;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_8.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_28;
  xlv_TEXCOORD3 = tmpvar_29;
  xlv_TEXCOORD4 = tmpvar_30;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_9;
  xlv_TEXCOORD6 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD7 = ambient_46;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_78;
  normalWorld_78 = tmpvar_6;
  mediump vec4 tmpvar_79;
  tmpvar_79.w = 1.0;
  tmpvar_79.xyz = normalWorld_78;
  mediump vec3 x_80;
  x_80.x = dot (unity_SHAr, tmpvar_79);
  x_80.y = dot (unity_SHAg, tmpvar_79);
  x_80.z = dot (unity_SHAb, tmpvar_79);
  mediump vec3 tmpvar_81;
  tmpvar_81 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_80)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_82;
  viewDir_82 = worldViewDir_10;
  lowp vec4 c_83;
  lowp vec4 c_84;
  highp float nh_85;
  lowp float diff_86;
  mediump float tmpvar_87;
  tmpvar_87 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_86 = tmpvar_87;
  mediump float tmpvar_88;
  tmpvar_88 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_82)
  )));
  nh_85 = tmpvar_88;
  mediump float y_89;
  y_89 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_90;
  tmpvar_90 = pow (nh_85, y_89);
  c_84.xyz = (((tmpvar_14 * tmpvar_1) * diff_86) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_90));
  c_84.w = tmpvar_18;
  c_83.w = c_84.w;
  c_83.xyz = (c_84.xyz + (tmpvar_14 * tmpvar_81));
  c_4.w = c_83.w;
  c_4.xyz = (c_83.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_14;
  tmpvar_14.x = _ScaleX;
  tmpvar_14.y = _ScaleY;
  highp mat2 tmpvar_15;
  tmpvar_15[0] = glstate_matrix_projection[0].xy;
  tmpvar_15[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13)).ww / (tmpvar_14 * (tmpvar_15 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_17;
  tmpvar_17 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((tmpvar_7 * tmpvar_16))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_17;
  tmpvar_9.y = tmpvar_17;
  tmpvar_9.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_8.xy = (xlat_varoutput_18 * 0.001953125);
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_WorldToObject[0].xyz;
  tmpvar_22[1] = unity_WorldToObject[1].xyz;
  tmpvar_22[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_7 * tmpvar_22));
  highp mat3 tmpvar_24;
  tmpvar_24[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_24[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_24[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize((tmpvar_24 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_27 = (((tmpvar_23.yzx * worldTangent_3.zxy) - (tmpvar_23.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.x;
  tmpvar_28.y = worldBinormal_1.x;
  tmpvar_28.z = tmpvar_23.x;
  tmpvar_28.w = tmpvar_21.x;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.y;
  tmpvar_29.y = worldBinormal_1.y;
  tmpvar_29.z = tmpvar_23.y;
  tmpvar_29.w = tmpvar_21.y;
  highp vec4 tmpvar_30;
  tmpvar_30.x = worldTangent_3.z;
  tmpvar_30.y = worldBinormal_1.z;
  tmpvar_30.z = tmpvar_23.z;
  tmpvar_30.w = tmpvar_21.z;
  highp vec3 lightColor0_31;
  lightColor0_31 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_32;
  lightColor1_32 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_33;
  lightColor2_33 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_34;
  lightColor3_34 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_35;
  lightAttenSq_35 = unity_4LightAtten0;
  highp vec3 col_36;
  highp vec4 ndotl_37;
  highp vec4 lengthSq_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (unity_4LightPosX0 - tmpvar_21.x);
  highp vec4 tmpvar_40;
  tmpvar_40 = (unity_4LightPosY0 - tmpvar_21.y);
  highp vec4 tmpvar_41;
  tmpvar_41 = (unity_4LightPosZ0 - tmpvar_21.z);
  lengthSq_38 = (tmpvar_39 * tmpvar_39);
  lengthSq_38 = (lengthSq_38 + (tmpvar_40 * tmpvar_40));
  lengthSq_38 = (lengthSq_38 + (tmpvar_41 * tmpvar_41));
  highp vec4 tmpvar_42;
  tmpvar_42 = max (lengthSq_38, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_38 = tmpvar_42;
  ndotl_37 = (tmpvar_39 * tmpvar_23.x);
  ndotl_37 = (ndotl_37 + (tmpvar_40 * tmpvar_23.y));
  ndotl_37 = (ndotl_37 + (tmpvar_41 * tmpvar_23.z));
  highp vec4 tmpvar_43;
  tmpvar_43 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_37 * inversesqrt(tmpvar_42)));
  ndotl_37 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44 = (tmpvar_43 * (1.0/((1.0 + 
    (tmpvar_42 * lightAttenSq_35)
  ))));
  col_36 = (lightColor0_31 * tmpvar_44.x);
  col_36 = (col_36 + (lightColor1_32 * tmpvar_44.y));
  col_36 = (col_36 + (lightColor2_33 * tmpvar_44.z));
  col_36 = (col_36 + (lightColor3_34 * tmpvar_44.w));
  tmpvar_5 = col_36;
  mediump vec3 normal_45;
  normal_45 = tmpvar_23;
  mediump vec3 ambient_46;
  mediump vec3 x1_47;
  mediump vec4 tmpvar_48;
  tmpvar_48 = (normal_45.xyzz * normal_45.yzzx);
  x1_47.x = dot (unity_SHBr, tmpvar_48);
  x1_47.y = dot (unity_SHBg, tmpvar_48);
  x1_47.z = dot (unity_SHBb, tmpvar_48);
  ambient_46 = ((tmpvar_5 * (
    (tmpvar_5 * ((tmpvar_5 * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_47 + (unity_SHC.xyz * 
    ((normal_45.x * normal_45.x) - (normal_45.y * normal_45.y))
  )));
  tmpvar_5 = ambient_46;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_8.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_28;
  xlv_TEXCOORD3 = tmpvar_29;
  xlv_TEXCOORD4 = tmpvar_30;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_9;
  xlv_TEXCOORD6 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD7 = ambient_46;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_67;
  normalWorld_67 = tmpvar_6;
  mediump vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = normalWorld_67;
  mediump vec3 x_69;
  x_69.x = dot (unity_SHAr, tmpvar_68);
  x_69.y = dot (unity_SHAg, tmpvar_68);
  x_69.z = dot (unity_SHAb, tmpvar_68);
  mediump vec3 tmpvar_70;
  tmpvar_70 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_69)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_71;
  viewDir_71 = worldViewDir_10;
  lowp vec4 c_72;
  lowp vec4 c_73;
  highp float nh_74;
  lowp float diff_75;
  mediump float tmpvar_76;
  tmpvar_76 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_75 = tmpvar_76;
  mediump float tmpvar_77;
  tmpvar_77 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_71)
  )));
  nh_74 = tmpvar_77;
  mediump float y_78;
  y_78 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_79;
  tmpvar_79 = pow (nh_74, y_78);
  c_73.xyz = (((tmpvar_14 * tmpvar_1) * diff_75) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_79));
  c_73.w = tmpvar_18;
  c_72.w = c_73.w;
  c_72.xyz = (c_73.xyz + (tmpvar_14 * tmpvar_70));
  c_4.w = c_72.w;
  c_4.xyz = (c_72.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_14;
  tmpvar_14.x = _ScaleX;
  tmpvar_14.y = _ScaleY;
  highp mat2 tmpvar_15;
  tmpvar_15[0] = glstate_matrix_projection[0].xy;
  tmpvar_15[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13)).ww / (tmpvar_14 * (tmpvar_15 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_17;
  tmpvar_17 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((tmpvar_7 * tmpvar_16))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_17;
  tmpvar_9.y = tmpvar_17;
  tmpvar_9.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_8.xy = (xlat_varoutput_18 * 0.001953125);
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_WorldToObject[0].xyz;
  tmpvar_22[1] = unity_WorldToObject[1].xyz;
  tmpvar_22[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_7 * tmpvar_22));
  highp mat3 tmpvar_24;
  tmpvar_24[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_24[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_24[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize((tmpvar_24 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_27 = (((tmpvar_23.yzx * worldTangent_3.zxy) - (tmpvar_23.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.x;
  tmpvar_28.y = worldBinormal_1.x;
  tmpvar_28.z = tmpvar_23.x;
  tmpvar_28.w = tmpvar_21.x;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.y;
  tmpvar_29.y = worldBinormal_1.y;
  tmpvar_29.z = tmpvar_23.y;
  tmpvar_29.w = tmpvar_21.y;
  highp vec4 tmpvar_30;
  tmpvar_30.x = worldTangent_3.z;
  tmpvar_30.y = worldBinormal_1.z;
  tmpvar_30.z = tmpvar_23.z;
  tmpvar_30.w = tmpvar_21.z;
  highp vec3 lightColor0_31;
  lightColor0_31 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_32;
  lightColor1_32 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_33;
  lightColor2_33 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_34;
  lightColor3_34 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_35;
  lightAttenSq_35 = unity_4LightAtten0;
  highp vec3 col_36;
  highp vec4 ndotl_37;
  highp vec4 lengthSq_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (unity_4LightPosX0 - tmpvar_21.x);
  highp vec4 tmpvar_40;
  tmpvar_40 = (unity_4LightPosY0 - tmpvar_21.y);
  highp vec4 tmpvar_41;
  tmpvar_41 = (unity_4LightPosZ0 - tmpvar_21.z);
  lengthSq_38 = (tmpvar_39 * tmpvar_39);
  lengthSq_38 = (lengthSq_38 + (tmpvar_40 * tmpvar_40));
  lengthSq_38 = (lengthSq_38 + (tmpvar_41 * tmpvar_41));
  highp vec4 tmpvar_42;
  tmpvar_42 = max (lengthSq_38, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_38 = tmpvar_42;
  ndotl_37 = (tmpvar_39 * tmpvar_23.x);
  ndotl_37 = (ndotl_37 + (tmpvar_40 * tmpvar_23.y));
  ndotl_37 = (ndotl_37 + (tmpvar_41 * tmpvar_23.z));
  highp vec4 tmpvar_43;
  tmpvar_43 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_37 * inversesqrt(tmpvar_42)));
  ndotl_37 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44 = (tmpvar_43 * (1.0/((1.0 + 
    (tmpvar_42 * lightAttenSq_35)
  ))));
  col_36 = (lightColor0_31 * tmpvar_44.x);
  col_36 = (col_36 + (lightColor1_32 * tmpvar_44.y));
  col_36 = (col_36 + (lightColor2_33 * tmpvar_44.z));
  col_36 = (col_36 + (lightColor3_34 * tmpvar_44.w));
  tmpvar_5 = col_36;
  mediump vec3 normal_45;
  normal_45 = tmpvar_23;
  mediump vec3 ambient_46;
  mediump vec3 x1_47;
  mediump vec4 tmpvar_48;
  tmpvar_48 = (normal_45.xyzz * normal_45.yzzx);
  x1_47.x = dot (unity_SHBr, tmpvar_48);
  x1_47.y = dot (unity_SHBg, tmpvar_48);
  x1_47.z = dot (unity_SHBb, tmpvar_48);
  ambient_46 = ((tmpvar_5 * (
    (tmpvar_5 * ((tmpvar_5 * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_47 + (unity_SHC.xyz * 
    ((normal_45.x * normal_45.x) - (normal_45.y * normal_45.y))
  )));
  tmpvar_5 = ambient_46;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_8.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_28;
  xlv_TEXCOORD3 = tmpvar_29;
  xlv_TEXCOORD4 = tmpvar_30;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_9;
  xlv_TEXCOORD6 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD7 = ambient_46;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_67;
  normalWorld_67 = tmpvar_6;
  mediump vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = normalWorld_67;
  mediump vec3 x_69;
  x_69.x = dot (unity_SHAr, tmpvar_68);
  x_69.y = dot (unity_SHAg, tmpvar_68);
  x_69.z = dot (unity_SHAb, tmpvar_68);
  mediump vec3 tmpvar_70;
  tmpvar_70 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_69)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_71;
  viewDir_71 = worldViewDir_10;
  lowp vec4 c_72;
  lowp vec4 c_73;
  highp float nh_74;
  lowp float diff_75;
  mediump float tmpvar_76;
  tmpvar_76 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_75 = tmpvar_76;
  mediump float tmpvar_77;
  tmpvar_77 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_71)
  )));
  nh_74 = tmpvar_77;
  mediump float y_78;
  y_78 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_79;
  tmpvar_79 = pow (nh_74, y_78);
  c_73.xyz = (((tmpvar_14 * tmpvar_1) * diff_75) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_79));
  c_73.w = tmpvar_18;
  c_72.w = c_73.w;
  c_72.xyz = (c_73.xyz + (tmpvar_14 * tmpvar_70));
  c_4.w = c_72.w;
  c_4.xyz = (c_72.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "VERTEXLIGHT_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp vec4 unity_4LightPosX0;
uniform highp vec4 unity_4LightPosY0;
uniform highp vec4 unity_4LightPosZ0;
uniform mediump vec4 unity_4LightAtten0;
uniform mediump vec4 unity_LightColor[8];
uniform mediump vec4 unity_SHBr;
uniform mediump vec4 unity_SHBg;
uniform mediump vec4 unity_SHBb;
uniform mediump vec4 unity_SHC;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  mediump vec3 tmpvar_5;
  highp vec4 tmpvar_6;
  highp vec3 tmpvar_7;
  highp vec4 tmpvar_8;
  tmpvar_6.zw = _glesVertex.zw;
  tmpvar_8.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_9;
  highp float scale_10;
  highp vec2 pixelSize_11;
  tmpvar_6.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_6.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = _WorldSpaceCameraPos;
  tmpvar_7 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_12).xyz - tmpvar_6.xyz)
  )));
  highp vec4 tmpvar_13;
  tmpvar_13.w = 1.0;
  tmpvar_13.xyz = tmpvar_6.xyz;
  highp vec2 tmpvar_14;
  tmpvar_14.x = _ScaleX;
  tmpvar_14.y = _ScaleY;
  highp mat2 tmpvar_15;
  tmpvar_15[0] = glstate_matrix_projection[0].xy;
  tmpvar_15[1] = glstate_matrix_projection[1].xy;
  pixelSize_11 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_13)).ww / (tmpvar_14 * (tmpvar_15 * _ScreenParams.xy)));
  scale_10 = (inversesqrt(dot (pixelSize_11, pixelSize_11)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_16;
  tmpvar_16[0] = unity_WorldToObject[0].xyz;
  tmpvar_16[1] = unity_WorldToObject[1].xyz;
  tmpvar_16[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_17;
  tmpvar_17 = mix ((scale_10 * (1.0 - _PerspectiveFilter)), scale_10, abs(dot (
    normalize((tmpvar_7 * tmpvar_16))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz))
  )));
  scale_10 = tmpvar_17;
  tmpvar_9.y = tmpvar_17;
  tmpvar_9.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_18;
  xlat_varoutput_18.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_18.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_18.x));
  tmpvar_8.xy = (xlat_varoutput_18 * 0.001953125);
  highp mat3 tmpvar_19;
  tmpvar_19[0] = _EnvMatrix[0].xyz;
  tmpvar_19[1] = _EnvMatrix[1].xyz;
  tmpvar_19[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_20;
  tmpvar_20.w = 1.0;
  tmpvar_20.xyz = tmpvar_6.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_8.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_21;
  tmpvar_21 = (unity_ObjectToWorld * tmpvar_6).xyz;
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_WorldToObject[0].xyz;
  tmpvar_22[1] = unity_WorldToObject[1].xyz;
  tmpvar_22[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_7 * tmpvar_22));
  highp mat3 tmpvar_24;
  tmpvar_24[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_24[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_24[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_25;
  tmpvar_25 = normalize((tmpvar_24 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_25;
  highp float tmpvar_26;
  tmpvar_26 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_26;
  highp vec3 tmpvar_27;
  tmpvar_27 = (((tmpvar_23.yzx * worldTangent_3.zxy) - (tmpvar_23.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_27;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.x;
  tmpvar_28.y = worldBinormal_1.x;
  tmpvar_28.z = tmpvar_23.x;
  tmpvar_28.w = tmpvar_21.x;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.y;
  tmpvar_29.y = worldBinormal_1.y;
  tmpvar_29.z = tmpvar_23.y;
  tmpvar_29.w = tmpvar_21.y;
  highp vec4 tmpvar_30;
  tmpvar_30.x = worldTangent_3.z;
  tmpvar_30.y = worldBinormal_1.z;
  tmpvar_30.z = tmpvar_23.z;
  tmpvar_30.w = tmpvar_21.z;
  highp vec3 lightColor0_31;
  lightColor0_31 = unity_LightColor[0].xyz;
  highp vec3 lightColor1_32;
  lightColor1_32 = unity_LightColor[1].xyz;
  highp vec3 lightColor2_33;
  lightColor2_33 = unity_LightColor[2].xyz;
  highp vec3 lightColor3_34;
  lightColor3_34 = unity_LightColor[3].xyz;
  highp vec4 lightAttenSq_35;
  lightAttenSq_35 = unity_4LightAtten0;
  highp vec3 col_36;
  highp vec4 ndotl_37;
  highp vec4 lengthSq_38;
  highp vec4 tmpvar_39;
  tmpvar_39 = (unity_4LightPosX0 - tmpvar_21.x);
  highp vec4 tmpvar_40;
  tmpvar_40 = (unity_4LightPosY0 - tmpvar_21.y);
  highp vec4 tmpvar_41;
  tmpvar_41 = (unity_4LightPosZ0 - tmpvar_21.z);
  lengthSq_38 = (tmpvar_39 * tmpvar_39);
  lengthSq_38 = (lengthSq_38 + (tmpvar_40 * tmpvar_40));
  lengthSq_38 = (lengthSq_38 + (tmpvar_41 * tmpvar_41));
  highp vec4 tmpvar_42;
  tmpvar_42 = max (lengthSq_38, vec4(1e-06, 1e-06, 1e-06, 1e-06));
  lengthSq_38 = tmpvar_42;
  ndotl_37 = (tmpvar_39 * tmpvar_23.x);
  ndotl_37 = (ndotl_37 + (tmpvar_40 * tmpvar_23.y));
  ndotl_37 = (ndotl_37 + (tmpvar_41 * tmpvar_23.z));
  highp vec4 tmpvar_43;
  tmpvar_43 = max (vec4(0.0, 0.0, 0.0, 0.0), (ndotl_37 * inversesqrt(tmpvar_42)));
  ndotl_37 = tmpvar_43;
  highp vec4 tmpvar_44;
  tmpvar_44 = (tmpvar_43 * (1.0/((1.0 + 
    (tmpvar_42 * lightAttenSq_35)
  ))));
  col_36 = (lightColor0_31 * tmpvar_44.x);
  col_36 = (col_36 + (lightColor1_32 * tmpvar_44.y));
  col_36 = (col_36 + (lightColor2_33 * tmpvar_44.z));
  col_36 = (col_36 + (lightColor3_34 * tmpvar_44.w));
  tmpvar_5 = col_36;
  mediump vec3 normal_45;
  normal_45 = tmpvar_23;
  mediump vec3 ambient_46;
  mediump vec3 x1_47;
  mediump vec4 tmpvar_48;
  tmpvar_48 = (normal_45.xyzz * normal_45.yzzx);
  x1_47.x = dot (unity_SHBr, tmpvar_48);
  x1_47.y = dot (unity_SHBg, tmpvar_48);
  x1_47.z = dot (unity_SHBb, tmpvar_48);
  ambient_46 = ((tmpvar_5 * (
    (tmpvar_5 * ((tmpvar_5 * 0.305306) + 0.6821711))
   + 0.01252288)) + (x1_47 + (unity_SHC.xyz * 
    ((normal_45.x * normal_45.x) - (normal_45.y * normal_45.y))
  )));
  tmpvar_5 = ambient_46;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_20));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_8.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_28;
  xlv_TEXCOORD3 = tmpvar_29;
  xlv_TEXCOORD4 = tmpvar_30;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_9;
  xlv_TEXCOORD6 = (tmpvar_19 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_6).xyz));
  xlv_TEXCOORD7 = ambient_46;
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform mediump vec4 unity_SHAr;
uniform mediump vec4 unity_SHAg;
uniform mediump vec4 unity_SHAb;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
varying mediump vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_60, xlv_TEXCOORD6)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_66;
  tmpvar_66 = normalize(worldN_3);
  worldN_3 = tmpvar_66;
  tmpvar_6 = tmpvar_66;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 normalWorld_67;
  normalWorld_67 = tmpvar_6;
  mediump vec4 tmpvar_68;
  tmpvar_68.w = 1.0;
  tmpvar_68.xyz = normalWorld_67;
  mediump vec3 x_69;
  x_69.x = dot (unity_SHAr, tmpvar_68);
  x_69.y = dot (unity_SHAg, tmpvar_68);
  x_69.z = dot (unity_SHAb, tmpvar_68);
  mediump vec3 tmpvar_70;
  tmpvar_70 = max (((1.055 * 
    pow (max (vec3(0.0, 0.0, 0.0), (xlv_TEXCOORD7 + x_69)), vec3(0.4166667, 0.4166667, 0.4166667))
  ) - 0.055), vec3(0.0, 0.0, 0.0));
  mediump vec3 viewDir_71;
  viewDir_71 = worldViewDir_10;
  lowp vec4 c_72;
  lowp vec4 c_73;
  highp float nh_74;
  lowp float diff_75;
  mediump float tmpvar_76;
  tmpvar_76 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_75 = tmpvar_76;
  mediump float tmpvar_77;
  tmpvar_77 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_71)
  )));
  nh_74 = tmpvar_77;
  mediump float y_78;
  y_78 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_79;
  tmpvar_79 = pow (nh_74, y_78);
  c_73.xyz = (((tmpvar_14 * tmpvar_1) * diff_75) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_79));
  c_73.w = tmpvar_18;
  c_72.w = c_73.w;
  c_72.xyz = (c_73.xyz + (tmpvar_14 * tmpvar_70));
  c_4.w = c_72.w;
  c_4.xyz = (c_72.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 viewDir_78;
  viewDir_78 = worldViewDir_10;
  lowp vec4 c_79;
  lowp vec4 c_80;
  highp float nh_81;
  lowp float diff_82;
  mediump float tmpvar_83;
  tmpvar_83 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_82 = tmpvar_83;
  mediump float tmpvar_84;
  tmpvar_84 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_78)
  )));
  nh_81 = tmpvar_84;
  mediump float y_85;
  y_85 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_86;
  tmpvar_86 = pow (nh_81, y_85);
  c_80.xyz = (((tmpvar_14 * tmpvar_1) * diff_82) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_86));
  c_80.w = tmpvar_18;
  c_79.w = c_80.w;
  c_79.xyz = c_80.xyz;
  c_4.w = c_79.w;
  c_4.xyz = (c_80.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 viewDir_78;
  viewDir_78 = worldViewDir_10;
  lowp vec4 c_79;
  lowp vec4 c_80;
  highp float nh_81;
  lowp float diff_82;
  mediump float tmpvar_83;
  tmpvar_83 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_82 = tmpvar_83;
  mediump float tmpvar_84;
  tmpvar_84 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_78)
  )));
  nh_81 = tmpvar_84;
  mediump float y_85;
  y_85 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_86;
  tmpvar_86 = pow (nh_81, y_85);
  c_80.xyz = (((tmpvar_14 * tmpvar_1) * diff_82) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_86));
  c_80.w = tmpvar_18;
  c_79.w = c_80.w;
  c_79.xyz = c_80.xyz;
  c_4.w = c_79.w;
  c_4.xyz = (c_80.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp vec3 tmpvar_20;
  tmpvar_20 = (unity_ObjectToWorld * tmpvar_5).xyz;
  highp mat3 tmpvar_21;
  tmpvar_21[0] = unity_WorldToObject[0].xyz;
  tmpvar_21[1] = unity_WorldToObject[1].xyz;
  tmpvar_21[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_22;
  tmpvar_22 = normalize((tmpvar_6 * tmpvar_21));
  highp mat3 tmpvar_23;
  tmpvar_23[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_23[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_23[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_24;
  tmpvar_24 = normalize((tmpvar_23 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_24;
  highp float tmpvar_25;
  tmpvar_25 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26 = (((tmpvar_22.yzx * worldTangent_3.zxy) - (tmpvar_22.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_26;
  highp vec4 tmpvar_27;
  tmpvar_27.x = worldTangent_3.x;
  tmpvar_27.y = worldBinormal_1.x;
  tmpvar_27.z = tmpvar_22.x;
  tmpvar_27.w = tmpvar_20.x;
  highp vec4 tmpvar_28;
  tmpvar_28.x = worldTangent_3.y;
  tmpvar_28.y = worldBinormal_1.y;
  tmpvar_28.z = tmpvar_22.y;
  tmpvar_28.w = tmpvar_20.y;
  highp vec4 tmpvar_29;
  tmpvar_29.x = worldTangent_3.z;
  tmpvar_29.y = worldBinormal_1.z;
  tmpvar_29.z = tmpvar_22.z;
  tmpvar_29.w = tmpvar_20.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_27;
  xlv_TEXCOORD3 = tmpvar_28;
  xlv_TEXCOORD4 = tmpvar_29;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD5 = tmpvar_8;
  xlv_TEXCOORD6 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec4 xlv_TEXCOORD2;
varying highp vec4 xlv_TEXCOORD3;
varying highp vec4 xlv_TEXCOORD4;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD5;
varying highp vec3 xlv_TEXCOORD6;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec4 c_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  highp vec3 tmpvar_12;
  tmpvar_12.x = xlv_TEXCOORD2.w;
  tmpvar_12.y = xlv_TEXCOORD3.w;
  tmpvar_12.z = xlv_TEXCOORD4.w;
  mediump vec3 tmpvar_13;
  tmpvar_13 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_13;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - tmpvar_12));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_5;
  tmpvar_15 = tmpvar_6;
  tmpvar_16 = tmpvar_7;
  tmpvar_17 = tmpvar_8;
  tmpvar_18 = tmpvar_9;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD5.x) * xlv_TEXCOORD5.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD5.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD5.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD5.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD6 - (2.0 * (
    dot (N_62, xlv_TEXCOORD6)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD5.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD5.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_5 = tmpvar_14;
  tmpvar_7 = tmpvar_16;
  tmpvar_8 = tmpvar_17;
  tmpvar_9 = tmpvar_18;
  worldN_3.x = dot (xlv_TEXCOORD2.xyz, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3.xyz, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4.xyz, tmpvar_15);
  highp vec3 tmpvar_77;
  tmpvar_77 = normalize(worldN_3);
  worldN_3 = tmpvar_77;
  tmpvar_6 = tmpvar_77;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  mediump vec3 viewDir_78;
  viewDir_78 = worldViewDir_10;
  lowp vec4 c_79;
  lowp vec4 c_80;
  highp float nh_81;
  lowp float diff_82;
  mediump float tmpvar_83;
  tmpvar_83 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_82 = tmpvar_83;
  mediump float tmpvar_84;
  tmpvar_84 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_78)
  )));
  nh_81 = tmpvar_84;
  mediump float y_85;
  y_85 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_86;
  tmpvar_86 = pow (nh_81, y_85);
  c_80.xyz = (((tmpvar_14 * tmpvar_1) * diff_82) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_86));
  c_80.w = tmpvar_18;
  c_79.w = c_80.w;
  c_79.xyz = c_80.xyz;
  c_4.w = c_79.w;
  c_4.xyz = (c_80.xyz + tmpvar_16);
  gl_FragData[0] = c_4;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" "GLOW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "LIGHTPROBE_SH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
}
}
 Pass {
  Name "FORWARD"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDADD" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZWrite Off
  Cull Off
  GpuProgramID 75290
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66).xyz;
  highp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_67;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_68;
  tmpvar_68 = normalize(worldN_3);
  worldN_3 = tmpvar_68;
  tmpvar_7 = tmpvar_68;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_11;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_14 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_18;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66).xyz;
  highp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_67;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_68;
  tmpvar_68 = normalize(worldN_3);
  worldN_3 = tmpvar_68;
  tmpvar_7 = tmpvar_68;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_11;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_14 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_18;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66).xyz;
  highp float tmpvar_67;
  tmpvar_67 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_67;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_68;
  tmpvar_68 = normalize(worldN_3);
  worldN_3 = tmpvar_68;
  tmpvar_7 = tmpvar_68;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_11;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_14 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_18;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  highp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  worldViewDir_9 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  tmpvar_5 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_12;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp float tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_12 = tmpvar_4;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  highp vec4 glowColor_17;
  highp vec3 emission_18;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec4 tmpvar_64;
  highp float glow_65;
  highp float tmpvar_66;
  tmpvar_66 = (tmpvar_31 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_67;
  tmpvar_67 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_66 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_65 = (1.0 - pow (clamp (
    abs((tmpvar_66 / (1.0 + tmpvar_67)))
  , 0.0, 1.0), _GlowPower));
  glow_65 = (glow_65 * sqrt(min (1.0, tmpvar_67)));
  highp float tmpvar_68;
  tmpvar_68 = clamp (((_GlowColor.w * glow_65) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_69;
  tmpvar_69.xyz = _GlowColor.xyz;
  tmpvar_69.w = tmpvar_68;
  tmpvar_64 = tmpvar_69;
  glowColor_17.xyz = tmpvar_64.xyz;
  glowColor_17.w = (tmpvar_64.w * xlv_COLOR0.w);
  emission_18 = (((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w) + (tmpvar_64.xyz * glowColor_17.w));
  highp vec4 overlying_70;
  overlying_70.w = glowColor_17.w;
  highp vec4 underlying_71;
  underlying_71.w = faceColor_21.w;
  overlying_70.xyz = (tmpvar_64.xyz * glowColor_17.w);
  underlying_71.xyz = (faceColor_21.xyz * faceColor_21.w);
  highp vec3 tmpvar_72;
  tmpvar_72 = (overlying_70.xyz + ((1.0 - glowColor_17.w) * underlying_71.xyz));
  highp vec4 tmpvar_73;
  tmpvar_73.xyz = tmpvar_72;
  tmpvar_73.w = (faceColor_21.w + ((1.0 - faceColor_21.w) * glowColor_17.w));
  faceColor_21.w = tmpvar_73.w;
  faceColor_21.xyz = (tmpvar_72 / max (tmpvar_73.w, 0.0001));
  tmpvar_12 = faceColor_21.xyz;
  tmpvar_13 = -(tmpvar_57);
  tmpvar_14 = emission_18;
  highp float tmpvar_74;
  tmpvar_74 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_15 = 1.0;
  tmpvar_16 = faceColor_21.w;
  tmpvar_4 = tmpvar_12;
  tmpvar_6 = tmpvar_14;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_13);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_13);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_13);
  highp vec3 tmpvar_75;
  tmpvar_75 = normalize(worldN_3);
  worldN_3 = tmpvar_75;
  tmpvar_5 = tmpvar_75;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_76;
  viewDir_76 = worldViewDir_9;
  lowp vec4 c_77;
  lowp vec4 c_78;
  highp float nh_79;
  lowp float diff_80;
  mediump float tmpvar_81;
  tmpvar_81 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_80 = tmpvar_81;
  mediump float tmpvar_82;
  tmpvar_82 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_76)
  )));
  nh_79 = tmpvar_82;
  mediump float y_83;
  y_83 = (mix (_FaceShininess, _OutlineShininess, tmpvar_74) * 128.0);
  highp float tmpvar_84;
  tmpvar_84 = pow (nh_79, y_83);
  c_78.xyz = (((tmpvar_12 * tmpvar_1) * diff_80) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_84));
  c_78.w = tmpvar_16;
  c_77.w = c_78.w;
  c_77.xyz = c_78.xyz;
  gl_FragData[0] = c_77;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  highp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  worldViewDir_9 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  tmpvar_5 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_12;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp float tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_12 = tmpvar_4;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  highp vec4 glowColor_17;
  highp vec3 emission_18;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec4 tmpvar_64;
  highp float glow_65;
  highp float tmpvar_66;
  tmpvar_66 = (tmpvar_31 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_67;
  tmpvar_67 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_66 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_65 = (1.0 - pow (clamp (
    abs((tmpvar_66 / (1.0 + tmpvar_67)))
  , 0.0, 1.0), _GlowPower));
  glow_65 = (glow_65 * sqrt(min (1.0, tmpvar_67)));
  highp float tmpvar_68;
  tmpvar_68 = clamp (((_GlowColor.w * glow_65) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_69;
  tmpvar_69.xyz = _GlowColor.xyz;
  tmpvar_69.w = tmpvar_68;
  tmpvar_64 = tmpvar_69;
  glowColor_17.xyz = tmpvar_64.xyz;
  glowColor_17.w = (tmpvar_64.w * xlv_COLOR0.w);
  emission_18 = (((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w) + (tmpvar_64.xyz * glowColor_17.w));
  highp vec4 overlying_70;
  overlying_70.w = glowColor_17.w;
  highp vec4 underlying_71;
  underlying_71.w = faceColor_21.w;
  overlying_70.xyz = (tmpvar_64.xyz * glowColor_17.w);
  underlying_71.xyz = (faceColor_21.xyz * faceColor_21.w);
  highp vec3 tmpvar_72;
  tmpvar_72 = (overlying_70.xyz + ((1.0 - glowColor_17.w) * underlying_71.xyz));
  highp vec4 tmpvar_73;
  tmpvar_73.xyz = tmpvar_72;
  tmpvar_73.w = (faceColor_21.w + ((1.0 - faceColor_21.w) * glowColor_17.w));
  faceColor_21.w = tmpvar_73.w;
  faceColor_21.xyz = (tmpvar_72 / max (tmpvar_73.w, 0.0001));
  tmpvar_12 = faceColor_21.xyz;
  tmpvar_13 = -(tmpvar_57);
  tmpvar_14 = emission_18;
  highp float tmpvar_74;
  tmpvar_74 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_15 = 1.0;
  tmpvar_16 = faceColor_21.w;
  tmpvar_4 = tmpvar_12;
  tmpvar_6 = tmpvar_14;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_13);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_13);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_13);
  highp vec3 tmpvar_75;
  tmpvar_75 = normalize(worldN_3);
  worldN_3 = tmpvar_75;
  tmpvar_5 = tmpvar_75;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_76;
  viewDir_76 = worldViewDir_9;
  lowp vec4 c_77;
  lowp vec4 c_78;
  highp float nh_79;
  lowp float diff_80;
  mediump float tmpvar_81;
  tmpvar_81 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_80 = tmpvar_81;
  mediump float tmpvar_82;
  tmpvar_82 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_76)
  )));
  nh_79 = tmpvar_82;
  mediump float y_83;
  y_83 = (mix (_FaceShininess, _OutlineShininess, tmpvar_74) * 128.0);
  highp float tmpvar_84;
  tmpvar_84 = pow (nh_79, y_83);
  c_78.xyz = (((tmpvar_12 * tmpvar_1) * diff_80) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_84));
  c_78.w = tmpvar_16;
  c_77.w = c_78.w;
  c_77.xyz = c_78.xyz;
  gl_FragData[0] = c_77;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  highp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  worldViewDir_9 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  tmpvar_5 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_12;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp float tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_12 = tmpvar_4;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  highp vec4 glowColor_17;
  highp vec3 emission_18;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec4 tmpvar_64;
  highp float glow_65;
  highp float tmpvar_66;
  tmpvar_66 = (tmpvar_31 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_67;
  tmpvar_67 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_66 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_65 = (1.0 - pow (clamp (
    abs((tmpvar_66 / (1.0 + tmpvar_67)))
  , 0.0, 1.0), _GlowPower));
  glow_65 = (glow_65 * sqrt(min (1.0, tmpvar_67)));
  highp float tmpvar_68;
  tmpvar_68 = clamp (((_GlowColor.w * glow_65) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_69;
  tmpvar_69.xyz = _GlowColor.xyz;
  tmpvar_69.w = tmpvar_68;
  tmpvar_64 = tmpvar_69;
  glowColor_17.xyz = tmpvar_64.xyz;
  glowColor_17.w = (tmpvar_64.w * xlv_COLOR0.w);
  emission_18 = (((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w) + (tmpvar_64.xyz * glowColor_17.w));
  highp vec4 overlying_70;
  overlying_70.w = glowColor_17.w;
  highp vec4 underlying_71;
  underlying_71.w = faceColor_21.w;
  overlying_70.xyz = (tmpvar_64.xyz * glowColor_17.w);
  underlying_71.xyz = (faceColor_21.xyz * faceColor_21.w);
  highp vec3 tmpvar_72;
  tmpvar_72 = (overlying_70.xyz + ((1.0 - glowColor_17.w) * underlying_71.xyz));
  highp vec4 tmpvar_73;
  tmpvar_73.xyz = tmpvar_72;
  tmpvar_73.w = (faceColor_21.w + ((1.0 - faceColor_21.w) * glowColor_17.w));
  faceColor_21.w = tmpvar_73.w;
  faceColor_21.xyz = (tmpvar_72 / max (tmpvar_73.w, 0.0001));
  tmpvar_12 = faceColor_21.xyz;
  tmpvar_13 = -(tmpvar_57);
  tmpvar_14 = emission_18;
  highp float tmpvar_74;
  tmpvar_74 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_15 = 1.0;
  tmpvar_16 = faceColor_21.w;
  tmpvar_4 = tmpvar_12;
  tmpvar_6 = tmpvar_14;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_13);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_13);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_13);
  highp vec3 tmpvar_75;
  tmpvar_75 = normalize(worldN_3);
  worldN_3 = tmpvar_75;
  tmpvar_5 = tmpvar_75;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_76;
  viewDir_76 = worldViewDir_9;
  lowp vec4 c_77;
  lowp vec4 c_78;
  highp float nh_79;
  lowp float diff_80;
  mediump float tmpvar_81;
  tmpvar_81 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_80 = tmpvar_81;
  mediump float tmpvar_82;
  tmpvar_82 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_76)
  )));
  nh_79 = tmpvar_82;
  mediump float y_83;
  y_83 = (mix (_FaceShininess, _OutlineShininess, tmpvar_74) * 128.0);
  highp float tmpvar_84;
  tmpvar_84 = pow (nh_79, y_83);
  c_78.xyz = (((tmpvar_12 * tmpvar_1) * diff_80) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_84));
  c_78.w = tmpvar_16;
  c_77.w = c_78.w;
  c_77.xyz = c_78.xyz;
  gl_FragData[0] = c_77;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  highp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  worldViewDir_9 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  tmpvar_5 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_12;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp float tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_12 = tmpvar_4;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  highp vec3 bump_17;
  highp vec4 outlineColor_18;
  highp vec4 faceColor_19;
  highp float c_20;
  highp vec4 smp4x_21;
  highp vec3 tmpvar_22;
  tmpvar_22.z = 0.0;
  tmpvar_22.x = (1.0/(_TextureWidth));
  tmpvar_22.y = (1.0/(_TextureHeight));
  highp vec2 P_23;
  P_23 = (xlv_TEXCOORD0.xy - tmpvar_22.xz);
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy + tmpvar_22.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_22.zy);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_22.zy);
  lowp vec4 tmpvar_27;
  tmpvar_27.x = texture2D (_MainTex, P_23).w;
  tmpvar_27.y = texture2D (_MainTex, P_24).w;
  tmpvar_27.z = texture2D (_MainTex, P_25).w;
  tmpvar_27.w = texture2D (_MainTex, P_26).w;
  smp4x_21 = tmpvar_27;
  lowp float tmpvar_28;
  tmpvar_28 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_20 = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = (((
    (0.5 - c_20)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_30;
  tmpvar_30 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_19 = _FaceColor;
  outlineColor_18 = _OutlineColor;
  faceColor_19 = (faceColor_19 * xlv_COLOR0);
  outlineColor_18.w = (outlineColor_18.w * xlv_COLOR0.w);
  highp vec2 tmpvar_32;
  tmpvar_32.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_32.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_FaceTex, tmpvar_32);
  faceColor_19 = (faceColor_19 * tmpvar_33);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_OutlineTex, tmpvar_34);
  outlineColor_18 = (outlineColor_18 * tmpvar_35);
  mediump float d_36;
  d_36 = tmpvar_29;
  lowp vec4 faceColor_37;
  faceColor_37 = faceColor_19;
  lowp vec4 outlineColor_38;
  outlineColor_38 = outlineColor_18;
  mediump float outline_39;
  outline_39 = tmpvar_30;
  mediump float softness_40;
  softness_40 = tmpvar_31;
  mediump float tmpvar_41;
  tmpvar_41 = (1.0 - clamp ((
    ((d_36 - (outline_39 * 0.5)) + (softness_40 * 0.5))
   / 
    (1.0 + softness_40)
  ), 0.0, 1.0));
  faceColor_37.xyz = (faceColor_37.xyz * faceColor_37.w);
  outlineColor_38.xyz = (outlineColor_38.xyz * outlineColor_38.w);
  mediump vec4 tmpvar_42;
  tmpvar_42 = mix (faceColor_37, outlineColor_38, vec4((clamp (
    (d_36 + (outline_39 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_39)
  ))));
  faceColor_37 = tmpvar_42;
  faceColor_37 = (faceColor_37 * tmpvar_41);
  faceColor_19 = faceColor_37;
  faceColor_19.xyz = (faceColor_19.xyz / max (faceColor_19.w, 0.0001));
  highp vec4 h_43;
  h_43 = smp4x_21;
  highp float tmpvar_44;
  tmpvar_44 = (_ShaderFlags / 2.0);
  highp float tmpvar_45;
  tmpvar_45 = (fract(abs(tmpvar_44)) * 2.0);
  highp float tmpvar_46;
  if ((tmpvar_44 >= 0.0)) {
    tmpvar_46 = tmpvar_45;
  } else {
    tmpvar_46 = -(tmpvar_45);
  };
  h_43 = (smp4x_21 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_47;
  tmpvar_47 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_43 = (h_43 - 0.5);
  h_43 = (h_43 / tmpvar_47);
  highp vec4 tmpvar_48;
  tmpvar_48 = clamp ((h_43 + 0.5), 0.0, 1.0);
  h_43 = tmpvar_48;
  if (bool(float((tmpvar_46 >= 1.0)))) {
    h_43 = (1.0 - abs((
      (tmpvar_48 * 2.0)
     - 1.0)));
  };
  h_43 = (min (mix (h_43, 
    sin(((h_43 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_47) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_49;
  tmpvar_49.xy = vec2(1.0, 0.0);
  tmpvar_49.z = (h_43.y - h_43.x);
  highp vec3 tmpvar_50;
  tmpvar_50 = normalize(tmpvar_49);
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(0.0, -1.0);
  tmpvar_51.z = (h_43.w - h_43.z);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  lowp vec3 tmpvar_53;
  tmpvar_53 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_17 = tmpvar_53;
  bump_17 = (bump_17 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_29 + (tmpvar_30 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_54;
  tmpvar_54 = mix (vec3(0.0, 0.0, 1.0), bump_17, faceColor_19.www);
  bump_17 = tmpvar_54;
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(((
    (tmpvar_50.yzx * tmpvar_52.zxy)
   - 
    (tmpvar_50.zxy * tmpvar_52.yzx)
  ) - tmpvar_54));
  highp mat3 tmpvar_56;
  tmpvar_56[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_56[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_56[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_57;
  highp vec3 N_58;
  N_58 = (tmpvar_56 * tmpvar_55);
  tmpvar_57 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_58, xlv_TEXCOORD7)
   * N_58)));
  lowp vec4 tmpvar_59;
  tmpvar_59 = textureCube (_Cube, tmpvar_57);
  highp float tmpvar_60;
  tmpvar_60 = clamp ((tmpvar_29 + (tmpvar_30 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_61;
  tmpvar_61 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_60));
  highp vec3 tmpvar_62;
  tmpvar_62 = ((tmpvar_59.xyz * tmpvar_61) * faceColor_19.w);
  tmpvar_12 = faceColor_19.xyz;
  tmpvar_13 = -(tmpvar_55);
  tmpvar_14 = tmpvar_62;
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_29 + (tmpvar_30 * 0.5)), 0.0, 1.0);
  tmpvar_15 = 1.0;
  tmpvar_16 = faceColor_19.w;
  tmpvar_4 = tmpvar_12;
  tmpvar_6 = tmpvar_14;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_13);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_13);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_13);
  highp vec3 tmpvar_64;
  tmpvar_64 = normalize(worldN_3);
  worldN_3 = tmpvar_64;
  tmpvar_5 = tmpvar_64;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_63) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_12 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_16;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  highp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  worldViewDir_9 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  tmpvar_5 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_12;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp float tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_12 = tmpvar_4;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  highp vec3 bump_17;
  highp vec4 outlineColor_18;
  highp vec4 faceColor_19;
  highp float c_20;
  highp vec4 smp4x_21;
  highp vec3 tmpvar_22;
  tmpvar_22.z = 0.0;
  tmpvar_22.x = (1.0/(_TextureWidth));
  tmpvar_22.y = (1.0/(_TextureHeight));
  highp vec2 P_23;
  P_23 = (xlv_TEXCOORD0.xy - tmpvar_22.xz);
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy + tmpvar_22.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_22.zy);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_22.zy);
  lowp vec4 tmpvar_27;
  tmpvar_27.x = texture2D (_MainTex, P_23).w;
  tmpvar_27.y = texture2D (_MainTex, P_24).w;
  tmpvar_27.z = texture2D (_MainTex, P_25).w;
  tmpvar_27.w = texture2D (_MainTex, P_26).w;
  smp4x_21 = tmpvar_27;
  lowp float tmpvar_28;
  tmpvar_28 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_20 = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = (((
    (0.5 - c_20)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_30;
  tmpvar_30 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_19 = _FaceColor;
  outlineColor_18 = _OutlineColor;
  faceColor_19 = (faceColor_19 * xlv_COLOR0);
  outlineColor_18.w = (outlineColor_18.w * xlv_COLOR0.w);
  highp vec2 tmpvar_32;
  tmpvar_32.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_32.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_FaceTex, tmpvar_32);
  faceColor_19 = (faceColor_19 * tmpvar_33);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_OutlineTex, tmpvar_34);
  outlineColor_18 = (outlineColor_18 * tmpvar_35);
  mediump float d_36;
  d_36 = tmpvar_29;
  lowp vec4 faceColor_37;
  faceColor_37 = faceColor_19;
  lowp vec4 outlineColor_38;
  outlineColor_38 = outlineColor_18;
  mediump float outline_39;
  outline_39 = tmpvar_30;
  mediump float softness_40;
  softness_40 = tmpvar_31;
  mediump float tmpvar_41;
  tmpvar_41 = (1.0 - clamp ((
    ((d_36 - (outline_39 * 0.5)) + (softness_40 * 0.5))
   / 
    (1.0 + softness_40)
  ), 0.0, 1.0));
  faceColor_37.xyz = (faceColor_37.xyz * faceColor_37.w);
  outlineColor_38.xyz = (outlineColor_38.xyz * outlineColor_38.w);
  mediump vec4 tmpvar_42;
  tmpvar_42 = mix (faceColor_37, outlineColor_38, vec4((clamp (
    (d_36 + (outline_39 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_39)
  ))));
  faceColor_37 = tmpvar_42;
  faceColor_37 = (faceColor_37 * tmpvar_41);
  faceColor_19 = faceColor_37;
  faceColor_19.xyz = (faceColor_19.xyz / max (faceColor_19.w, 0.0001));
  highp vec4 h_43;
  h_43 = smp4x_21;
  highp float tmpvar_44;
  tmpvar_44 = (_ShaderFlags / 2.0);
  highp float tmpvar_45;
  tmpvar_45 = (fract(abs(tmpvar_44)) * 2.0);
  highp float tmpvar_46;
  if ((tmpvar_44 >= 0.0)) {
    tmpvar_46 = tmpvar_45;
  } else {
    tmpvar_46 = -(tmpvar_45);
  };
  h_43 = (smp4x_21 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_47;
  tmpvar_47 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_43 = (h_43 - 0.5);
  h_43 = (h_43 / tmpvar_47);
  highp vec4 tmpvar_48;
  tmpvar_48 = clamp ((h_43 + 0.5), 0.0, 1.0);
  h_43 = tmpvar_48;
  if (bool(float((tmpvar_46 >= 1.0)))) {
    h_43 = (1.0 - abs((
      (tmpvar_48 * 2.0)
     - 1.0)));
  };
  h_43 = (min (mix (h_43, 
    sin(((h_43 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_47) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_49;
  tmpvar_49.xy = vec2(1.0, 0.0);
  tmpvar_49.z = (h_43.y - h_43.x);
  highp vec3 tmpvar_50;
  tmpvar_50 = normalize(tmpvar_49);
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(0.0, -1.0);
  tmpvar_51.z = (h_43.w - h_43.z);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  lowp vec3 tmpvar_53;
  tmpvar_53 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_17 = tmpvar_53;
  bump_17 = (bump_17 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_29 + (tmpvar_30 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_54;
  tmpvar_54 = mix (vec3(0.0, 0.0, 1.0), bump_17, faceColor_19.www);
  bump_17 = tmpvar_54;
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(((
    (tmpvar_50.yzx * tmpvar_52.zxy)
   - 
    (tmpvar_50.zxy * tmpvar_52.yzx)
  ) - tmpvar_54));
  highp mat3 tmpvar_56;
  tmpvar_56[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_56[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_56[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_57;
  highp vec3 N_58;
  N_58 = (tmpvar_56 * tmpvar_55);
  tmpvar_57 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_58, xlv_TEXCOORD7)
   * N_58)));
  lowp vec4 tmpvar_59;
  tmpvar_59 = textureCube (_Cube, tmpvar_57);
  highp float tmpvar_60;
  tmpvar_60 = clamp ((tmpvar_29 + (tmpvar_30 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_61;
  tmpvar_61 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_60));
  highp vec3 tmpvar_62;
  tmpvar_62 = ((tmpvar_59.xyz * tmpvar_61) * faceColor_19.w);
  tmpvar_12 = faceColor_19.xyz;
  tmpvar_13 = -(tmpvar_55);
  tmpvar_14 = tmpvar_62;
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_29 + (tmpvar_30 * 0.5)), 0.0, 1.0);
  tmpvar_15 = 1.0;
  tmpvar_16 = faceColor_19.w;
  tmpvar_4 = tmpvar_12;
  tmpvar_6 = tmpvar_14;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_13);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_13);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_13);
  highp vec3 tmpvar_64;
  tmpvar_64 = normalize(worldN_3);
  worldN_3 = tmpvar_64;
  tmpvar_5 = tmpvar_64;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_63) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_12 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_16;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp vec3 tmpvar_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp float tmpvar_7;
  lowp float tmpvar_8;
  highp vec3 worldViewDir_9;
  lowp vec3 lightDir_10;
  mediump vec3 tmpvar_11;
  tmpvar_11 = _WorldSpaceLightPos0.xyz;
  lightDir_10 = tmpvar_11;
  worldViewDir_9 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_4 = vec3(0.0, 0.0, 0.0);
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = 0.0;
  tmpvar_7 = 0.0;
  tmpvar_5 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_12;
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp float tmpvar_15;
  lowp float tmpvar_16;
  tmpvar_12 = tmpvar_4;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  highp vec3 bump_17;
  highp vec4 outlineColor_18;
  highp vec4 faceColor_19;
  highp float c_20;
  highp vec4 smp4x_21;
  highp vec3 tmpvar_22;
  tmpvar_22.z = 0.0;
  tmpvar_22.x = (1.0/(_TextureWidth));
  tmpvar_22.y = (1.0/(_TextureHeight));
  highp vec2 P_23;
  P_23 = (xlv_TEXCOORD0.xy - tmpvar_22.xz);
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy + tmpvar_22.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_22.zy);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_22.zy);
  lowp vec4 tmpvar_27;
  tmpvar_27.x = texture2D (_MainTex, P_23).w;
  tmpvar_27.y = texture2D (_MainTex, P_24).w;
  tmpvar_27.z = texture2D (_MainTex, P_25).w;
  tmpvar_27.w = texture2D (_MainTex, P_26).w;
  smp4x_21 = tmpvar_27;
  lowp float tmpvar_28;
  tmpvar_28 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_20 = tmpvar_28;
  highp float tmpvar_29;
  tmpvar_29 = (((
    (0.5 - c_20)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_30;
  tmpvar_30 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_19 = _FaceColor;
  outlineColor_18 = _OutlineColor;
  faceColor_19 = (faceColor_19 * xlv_COLOR0);
  outlineColor_18.w = (outlineColor_18.w * xlv_COLOR0.w);
  highp vec2 tmpvar_32;
  tmpvar_32.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_32.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_33;
  tmpvar_33 = texture2D (_FaceTex, tmpvar_32);
  faceColor_19 = (faceColor_19 * tmpvar_33);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_OutlineTex, tmpvar_34);
  outlineColor_18 = (outlineColor_18 * tmpvar_35);
  mediump float d_36;
  d_36 = tmpvar_29;
  lowp vec4 faceColor_37;
  faceColor_37 = faceColor_19;
  lowp vec4 outlineColor_38;
  outlineColor_38 = outlineColor_18;
  mediump float outline_39;
  outline_39 = tmpvar_30;
  mediump float softness_40;
  softness_40 = tmpvar_31;
  mediump float tmpvar_41;
  tmpvar_41 = (1.0 - clamp ((
    ((d_36 - (outline_39 * 0.5)) + (softness_40 * 0.5))
   / 
    (1.0 + softness_40)
  ), 0.0, 1.0));
  faceColor_37.xyz = (faceColor_37.xyz * faceColor_37.w);
  outlineColor_38.xyz = (outlineColor_38.xyz * outlineColor_38.w);
  mediump vec4 tmpvar_42;
  tmpvar_42 = mix (faceColor_37, outlineColor_38, vec4((clamp (
    (d_36 + (outline_39 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_39)
  ))));
  faceColor_37 = tmpvar_42;
  faceColor_37 = (faceColor_37 * tmpvar_41);
  faceColor_19 = faceColor_37;
  faceColor_19.xyz = (faceColor_19.xyz / max (faceColor_19.w, 0.0001));
  highp vec4 h_43;
  h_43 = smp4x_21;
  highp float tmpvar_44;
  tmpvar_44 = (_ShaderFlags / 2.0);
  highp float tmpvar_45;
  tmpvar_45 = (fract(abs(tmpvar_44)) * 2.0);
  highp float tmpvar_46;
  if ((tmpvar_44 >= 0.0)) {
    tmpvar_46 = tmpvar_45;
  } else {
    tmpvar_46 = -(tmpvar_45);
  };
  h_43 = (smp4x_21 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_47;
  tmpvar_47 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_43 = (h_43 - 0.5);
  h_43 = (h_43 / tmpvar_47);
  highp vec4 tmpvar_48;
  tmpvar_48 = clamp ((h_43 + 0.5), 0.0, 1.0);
  h_43 = tmpvar_48;
  if (bool(float((tmpvar_46 >= 1.0)))) {
    h_43 = (1.0 - abs((
      (tmpvar_48 * 2.0)
     - 1.0)));
  };
  h_43 = (min (mix (h_43, 
    sin(((h_43 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_47) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_49;
  tmpvar_49.xy = vec2(1.0, 0.0);
  tmpvar_49.z = (h_43.y - h_43.x);
  highp vec3 tmpvar_50;
  tmpvar_50 = normalize(tmpvar_49);
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(0.0, -1.0);
  tmpvar_51.z = (h_43.w - h_43.z);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  lowp vec3 tmpvar_53;
  tmpvar_53 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_17 = tmpvar_53;
  bump_17 = (bump_17 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_29 + (tmpvar_30 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_54;
  tmpvar_54 = mix (vec3(0.0, 0.0, 1.0), bump_17, faceColor_19.www);
  bump_17 = tmpvar_54;
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(((
    (tmpvar_50.yzx * tmpvar_52.zxy)
   - 
    (tmpvar_50.zxy * tmpvar_52.yzx)
  ) - tmpvar_54));
  highp mat3 tmpvar_56;
  tmpvar_56[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_56[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_56[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_57;
  highp vec3 N_58;
  N_58 = (tmpvar_56 * tmpvar_55);
  tmpvar_57 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_58, xlv_TEXCOORD7)
   * N_58)));
  lowp vec4 tmpvar_59;
  tmpvar_59 = textureCube (_Cube, tmpvar_57);
  highp float tmpvar_60;
  tmpvar_60 = clamp ((tmpvar_29 + (tmpvar_30 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_61;
  tmpvar_61 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_60));
  highp vec3 tmpvar_62;
  tmpvar_62 = ((tmpvar_59.xyz * tmpvar_61) * faceColor_19.w);
  tmpvar_12 = faceColor_19.xyz;
  tmpvar_13 = -(tmpvar_55);
  tmpvar_14 = tmpvar_62;
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_29 + (tmpvar_30 * 0.5)), 0.0, 1.0);
  tmpvar_15 = 1.0;
  tmpvar_16 = faceColor_19.w;
  tmpvar_4 = tmpvar_12;
  tmpvar_6 = tmpvar_14;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_13);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_13);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_13);
  highp vec3 tmpvar_64;
  tmpvar_64 = normalize(worldN_3);
  worldN_3 = tmpvar_64;
  tmpvar_5 = tmpvar_64;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_10;
  mediump vec3 viewDir_65;
  viewDir_65 = worldViewDir_9;
  lowp vec4 c_66;
  lowp vec4 c_67;
  highp float nh_68;
  lowp float diff_69;
  mediump float tmpvar_70;
  tmpvar_70 = max (0.0, dot (tmpvar_5, tmpvar_2));
  diff_69 = tmpvar_70;
  mediump float tmpvar_71;
  tmpvar_71 = max (0.0, dot (tmpvar_5, normalize(
    (tmpvar_2 + viewDir_65)
  )));
  nh_68 = tmpvar_71;
  mediump float y_72;
  y_72 = (mix (_FaceShininess, _OutlineShininess, tmpvar_63) * 128.0);
  highp float tmpvar_73;
  tmpvar_73 = pow (nh_68, y_72);
  c_67.xyz = (((tmpvar_12 * tmpvar_1) * diff_69) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_73));
  c_67.w = tmpvar_16;
  c_66.w = c_67.w;
  c_66.xyz = c_67.xyz;
  gl_FragData[0] = c_66;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77);
  lowp float tmpvar_78;
  highp vec4 tmpvar_79;
  tmpvar_79 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_78 = tmpvar_79.w;
  lowp float tmpvar_80;
  highp vec4 tmpvar_81;
  tmpvar_81 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_80 = tmpvar_81.w;
  highp float tmpvar_82;
  tmpvar_82 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_78) * tmpvar_80);
  atten_4 = tmpvar_82;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_83;
  tmpvar_83 = normalize(worldN_3);
  worldN_3 = tmpvar_83;
  tmpvar_7 = tmpvar_83;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_84;
  viewDir_84 = worldViewDir_11;
  lowp vec4 c_85;
  lowp vec4 c_86;
  highp float nh_87;
  lowp float diff_88;
  mediump float tmpvar_89;
  tmpvar_89 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_88 = tmpvar_89;
  mediump float tmpvar_90;
  tmpvar_90 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_84)
  )));
  nh_87 = tmpvar_90;
  mediump float y_91;
  y_91 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_92;
  tmpvar_92 = pow (nh_87, y_91);
  c_86.xyz = (((tmpvar_14 * tmpvar_1) * diff_88) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_92));
  c_86.w = tmpvar_18;
  c_85.w = c_86.w;
  c_85.xyz = c_86.xyz;
  gl_FragData[0] = c_85;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77);
  lowp float tmpvar_78;
  highp vec4 tmpvar_79;
  tmpvar_79 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_78 = tmpvar_79.w;
  lowp float tmpvar_80;
  highp vec4 tmpvar_81;
  tmpvar_81 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_80 = tmpvar_81.w;
  highp float tmpvar_82;
  tmpvar_82 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_78) * tmpvar_80);
  atten_4 = tmpvar_82;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_83;
  tmpvar_83 = normalize(worldN_3);
  worldN_3 = tmpvar_83;
  tmpvar_7 = tmpvar_83;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_84;
  viewDir_84 = worldViewDir_11;
  lowp vec4 c_85;
  lowp vec4 c_86;
  highp float nh_87;
  lowp float diff_88;
  mediump float tmpvar_89;
  tmpvar_89 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_88 = tmpvar_89;
  mediump float tmpvar_90;
  tmpvar_90 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_84)
  )));
  nh_87 = tmpvar_90;
  mediump float y_91;
  y_91 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_92;
  tmpvar_92 = pow (nh_87, y_91);
  c_86.xyz = (((tmpvar_14 * tmpvar_1) * diff_88) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_92));
  c_86.w = tmpvar_18;
  c_85.w = c_86.w;
  c_85.xyz = c_86.xyz;
  gl_FragData[0] = c_85;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77);
  lowp float tmpvar_78;
  highp vec4 tmpvar_79;
  tmpvar_79 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_78 = tmpvar_79.w;
  lowp float tmpvar_80;
  highp vec4 tmpvar_81;
  tmpvar_81 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_80 = tmpvar_81.w;
  highp float tmpvar_82;
  tmpvar_82 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_78) * tmpvar_80);
  atten_4 = tmpvar_82;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_83;
  tmpvar_83 = normalize(worldN_3);
  worldN_3 = tmpvar_83;
  tmpvar_7 = tmpvar_83;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_84;
  viewDir_84 = worldViewDir_11;
  lowp vec4 c_85;
  lowp vec4 c_86;
  highp float nh_87;
  lowp float diff_88;
  mediump float tmpvar_89;
  tmpvar_89 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_88 = tmpvar_89;
  mediump float tmpvar_90;
  tmpvar_90 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_84)
  )));
  nh_87 = tmpvar_90;
  mediump float y_91;
  y_91 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_92;
  tmpvar_92 = pow (nh_87, y_91);
  c_86.xyz = (((tmpvar_14 * tmpvar_1) * diff_88) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_92));
  c_86.w = tmpvar_18;
  c_85.w = c_86.w;
  c_85.xyz = c_86.xyz;
  gl_FragData[0] = c_85;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66);
  lowp float tmpvar_67;
  highp vec4 tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_67 = tmpvar_68.w;
  lowp float tmpvar_69;
  highp vec4 tmpvar_70;
  tmpvar_70 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_69 = tmpvar_70.w;
  highp float tmpvar_71;
  tmpvar_71 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_67) * tmpvar_69);
  atten_4 = tmpvar_71;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_72;
  tmpvar_72 = normalize(worldN_3);
  worldN_3 = tmpvar_72;
  tmpvar_7 = tmpvar_72;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_11;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66);
  lowp float tmpvar_67;
  highp vec4 tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_67 = tmpvar_68.w;
  lowp float tmpvar_69;
  highp vec4 tmpvar_70;
  tmpvar_70 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_69 = tmpvar_70.w;
  highp float tmpvar_71;
  tmpvar_71 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_67) * tmpvar_69);
  atten_4 = tmpvar_71;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_72;
  tmpvar_72 = normalize(worldN_3);
  worldN_3 = tmpvar_72;
  tmpvar_7 = tmpvar_72;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_11;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec4 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66);
  lowp float tmpvar_67;
  highp vec4 tmpvar_68;
  tmpvar_68 = texture2D (_LightTexture0, ((lightCoord_5.xy / lightCoord_5.w) + 0.5));
  tmpvar_67 = tmpvar_68.w;
  lowp float tmpvar_69;
  highp vec4 tmpvar_70;
  tmpvar_70 = texture2D (_LightTextureB0, vec2(dot (lightCoord_5.xyz, lightCoord_5.xyz)));
  tmpvar_69 = tmpvar_70.w;
  highp float tmpvar_71;
  tmpvar_71 = ((float(
    (lightCoord_5.z > 0.0)
  ) * tmpvar_67) * tmpvar_69);
  atten_4 = tmpvar_71;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_72;
  tmpvar_72 = normalize(worldN_3);
  worldN_3 = tmpvar_72;
  tmpvar_7 = tmpvar_72;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_73;
  viewDir_73 = worldViewDir_11;
  lowp vec4 c_74;
  lowp vec4 c_75;
  highp float nh_76;
  lowp float diff_77;
  mediump float tmpvar_78;
  tmpvar_78 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_77 = tmpvar_78;
  mediump float tmpvar_79;
  tmpvar_79 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_73)
  )));
  nh_76 = tmpvar_79;
  mediump float y_80;
  y_80 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_81;
  tmpvar_81 = pow (nh_76, y_80);
  c_75.xyz = (((tmpvar_14 * tmpvar_1) * diff_77) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_81));
  c_75.w = tmpvar_18;
  c_74.w = c_75.w;
  c_74.xyz = c_75.xyz;
  gl_FragData[0] = c_74;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77).xyz;
  highp float tmpvar_78;
  tmpvar_78 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_78;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_79;
  tmpvar_79 = normalize(worldN_3);
  worldN_3 = tmpvar_79;
  tmpvar_7 = tmpvar_79;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_80;
  viewDir_80 = worldViewDir_11;
  lowp vec4 c_81;
  lowp vec4 c_82;
  highp float nh_83;
  lowp float diff_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_84 = tmpvar_85;
  mediump float tmpvar_86;
  tmpvar_86 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_80)
  )));
  nh_83 = tmpvar_86;
  mediump float y_87;
  y_87 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_88;
  tmpvar_88 = pow (nh_83, y_87);
  c_82.xyz = (((tmpvar_14 * tmpvar_1) * diff_84) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_88));
  c_82.w = tmpvar_18;
  c_81.w = c_82.w;
  c_81.xyz = c_82.xyz;
  gl_FragData[0] = c_81;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77).xyz;
  highp float tmpvar_78;
  tmpvar_78 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_78;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_79;
  tmpvar_79 = normalize(worldN_3);
  worldN_3 = tmpvar_79;
  tmpvar_7 = tmpvar_79;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_80;
  viewDir_80 = worldViewDir_11;
  lowp vec4 c_81;
  lowp vec4 c_82;
  highp float nh_83;
  lowp float diff_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_84 = tmpvar_85;
  mediump float tmpvar_86;
  tmpvar_86 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_80)
  )));
  nh_83 = tmpvar_86;
  mediump float y_87;
  y_87 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_88;
  tmpvar_88 = pow (nh_83, y_87);
  c_82.xyz = (((tmpvar_14 * tmpvar_1) * diff_84) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_88));
  c_82.w = tmpvar_18;
  c_81.w = c_82.w;
  c_81.xyz = c_82.xyz;
  gl_FragData[0] = c_81;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77).xyz;
  highp float tmpvar_78;
  tmpvar_78 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_78;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_79;
  tmpvar_79 = normalize(worldN_3);
  worldN_3 = tmpvar_79;
  tmpvar_7 = tmpvar_79;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_80;
  viewDir_80 = worldViewDir_11;
  lowp vec4 c_81;
  lowp vec4 c_82;
  highp float nh_83;
  lowp float diff_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_84 = tmpvar_85;
  mediump float tmpvar_86;
  tmpvar_86 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_80)
  )));
  nh_83 = tmpvar_86;
  mediump float y_87;
  y_87 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_88;
  tmpvar_88 = pow (nh_83, y_87);
  c_82.xyz = (((tmpvar_14 * tmpvar_1) * diff_84) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_88));
  c_82.w = tmpvar_18;
  c_81.w = c_82.w;
  c_81.xyz = c_82.xyz;
  gl_FragData[0] = c_81;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66).xyz;
  highp float tmpvar_67;
  tmpvar_67 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_67;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_68;
  tmpvar_68 = normalize(worldN_3);
  worldN_3 = tmpvar_68;
  tmpvar_7 = tmpvar_68;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_11;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_14 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_18;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66).xyz;
  highp float tmpvar_67;
  tmpvar_67 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_67;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_68;
  tmpvar_68 = normalize(worldN_3);
  worldN_3 = tmpvar_68;
  tmpvar_7 = tmpvar_68;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_11;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_14 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_18;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp samplerCube _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform highp sampler2D _LightTextureB0;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec3 bump_19;
  highp vec4 outlineColor_20;
  highp vec4 faceColor_21;
  highp float c_22;
  highp vec4 smp4x_23;
  highp vec3 tmpvar_24;
  tmpvar_24.z = 0.0;
  tmpvar_24.x = (1.0/(_TextureWidth));
  tmpvar_24.y = (1.0/(_TextureHeight));
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy - tmpvar_24.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy + tmpvar_24.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_24.zy);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_24.zy);
  lowp vec4 tmpvar_29;
  tmpvar_29.x = texture2D (_MainTex, P_25).w;
  tmpvar_29.y = texture2D (_MainTex, P_26).w;
  tmpvar_29.z = texture2D (_MainTex, P_27).w;
  tmpvar_29.w = texture2D (_MainTex, P_28).w;
  smp4x_23 = tmpvar_29;
  lowp float tmpvar_30;
  tmpvar_30 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_22 = tmpvar_30;
  highp float tmpvar_31;
  tmpvar_31 = (((
    (0.5 - c_22)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_21 = _FaceColor;
  outlineColor_20 = _OutlineColor;
  faceColor_21 = (faceColor_21 * xlv_COLOR0);
  outlineColor_20.w = (outlineColor_20.w * xlv_COLOR0.w);
  highp vec2 tmpvar_34;
  tmpvar_34.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_34.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_35;
  tmpvar_35 = texture2D (_FaceTex, tmpvar_34);
  faceColor_21 = (faceColor_21 * tmpvar_35);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_OutlineTex, tmpvar_36);
  outlineColor_20 = (outlineColor_20 * tmpvar_37);
  mediump float d_38;
  d_38 = tmpvar_31;
  lowp vec4 faceColor_39;
  faceColor_39 = faceColor_21;
  lowp vec4 outlineColor_40;
  outlineColor_40 = outlineColor_20;
  mediump float outline_41;
  outline_41 = tmpvar_32;
  mediump float softness_42;
  softness_42 = tmpvar_33;
  mediump float tmpvar_43;
  tmpvar_43 = (1.0 - clamp ((
    ((d_38 - (outline_41 * 0.5)) + (softness_42 * 0.5))
   / 
    (1.0 + softness_42)
  ), 0.0, 1.0));
  faceColor_39.xyz = (faceColor_39.xyz * faceColor_39.w);
  outlineColor_40.xyz = (outlineColor_40.xyz * outlineColor_40.w);
  mediump vec4 tmpvar_44;
  tmpvar_44 = mix (faceColor_39, outlineColor_40, vec4((clamp (
    (d_38 + (outline_41 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_41)
  ))));
  faceColor_39 = tmpvar_44;
  faceColor_39 = (faceColor_39 * tmpvar_43);
  faceColor_21 = faceColor_39;
  faceColor_21.xyz = (faceColor_21.xyz / max (faceColor_21.w, 0.0001));
  highp vec4 h_45;
  h_45 = smp4x_23;
  highp float tmpvar_46;
  tmpvar_46 = (_ShaderFlags / 2.0);
  highp float tmpvar_47;
  tmpvar_47 = (fract(abs(tmpvar_46)) * 2.0);
  highp float tmpvar_48;
  if ((tmpvar_46 >= 0.0)) {
    tmpvar_48 = tmpvar_47;
  } else {
    tmpvar_48 = -(tmpvar_47);
  };
  h_45 = (smp4x_23 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_49;
  tmpvar_49 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_45 = (h_45 - 0.5);
  h_45 = (h_45 / tmpvar_49);
  highp vec4 tmpvar_50;
  tmpvar_50 = clamp ((h_45 + 0.5), 0.0, 1.0);
  h_45 = tmpvar_50;
  if (bool(float((tmpvar_48 >= 1.0)))) {
    h_45 = (1.0 - abs((
      (tmpvar_50 * 2.0)
     - 1.0)));
  };
  h_45 = (min (mix (h_45, 
    sin(((h_45 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_49) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_51;
  tmpvar_51.xy = vec2(1.0, 0.0);
  tmpvar_51.z = (h_45.y - h_45.x);
  highp vec3 tmpvar_52;
  tmpvar_52 = normalize(tmpvar_51);
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(0.0, -1.0);
  tmpvar_53.z = (h_45.w - h_45.z);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  lowp vec3 tmpvar_55;
  tmpvar_55 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_19 = tmpvar_55;
  bump_19 = (bump_19 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_31 + (tmpvar_32 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_56;
  tmpvar_56 = mix (vec3(0.0, 0.0, 1.0), bump_19, faceColor_21.www);
  bump_19 = tmpvar_56;
  highp vec3 tmpvar_57;
  tmpvar_57 = normalize(((
    (tmpvar_52.yzx * tmpvar_54.zxy)
   - 
    (tmpvar_52.zxy * tmpvar_54.yzx)
  ) - tmpvar_56));
  highp mat3 tmpvar_58;
  tmpvar_58[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_58[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_58[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_59;
  highp vec3 N_60;
  N_60 = (tmpvar_58 * tmpvar_57);
  tmpvar_59 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_60, xlv_TEXCOORD7)
   * N_60)));
  lowp vec4 tmpvar_61;
  tmpvar_61 = textureCube (_Cube, tmpvar_59);
  highp float tmpvar_62;
  tmpvar_62 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_63;
  tmpvar_63 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_62));
  highp vec3 tmpvar_64;
  tmpvar_64 = ((tmpvar_61.xyz * tmpvar_63) * faceColor_21.w);
  tmpvar_14 = faceColor_21.xyz;
  tmpvar_15 = -(tmpvar_57);
  tmpvar_16 = tmpvar_64;
  highp float tmpvar_65;
  tmpvar_65 = clamp ((tmpvar_31 + (tmpvar_32 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_21.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_66;
  tmpvar_66.w = 1.0;
  tmpvar_66.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_66).xyz;
  highp float tmpvar_67;
  tmpvar_67 = (texture2D (_LightTextureB0, vec2(dot (lightCoord_5, lightCoord_5))).w * textureCube (_LightTexture0, lightCoord_5).w);
  atten_4 = tmpvar_67;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_68;
  tmpvar_68 = normalize(worldN_3);
  worldN_3 = tmpvar_68;
  tmpvar_7 = tmpvar_68;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_69;
  viewDir_69 = worldViewDir_11;
  lowp vec4 c_70;
  lowp vec4 c_71;
  highp float nh_72;
  lowp float diff_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_73 = tmpvar_74;
  mediump float tmpvar_75;
  tmpvar_75 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_69)
  )));
  nh_72 = tmpvar_75;
  mediump float y_76;
  y_76 = (mix (_FaceShininess, _OutlineShininess, tmpvar_65) * 128.0);
  highp float tmpvar_77;
  tmpvar_77 = pow (nh_72, y_76);
  c_71.xyz = (((tmpvar_14 * tmpvar_1) * diff_73) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_77));
  c_71.w = tmpvar_18;
  c_70.w = c_71.w;
  c_70.xyz = c_71.xyz;
  gl_FragData[0] = c_70;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_12;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  highp vec4 glowColor_18;
  highp vec3 emission_19;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_61, xlv_TEXCOORD7)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec4 tmpvar_65;
  highp float glow_66;
  highp float tmpvar_67;
  tmpvar_67 = (tmpvar_32 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_68;
  tmpvar_68 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_67 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_66 = (1.0 - pow (clamp (
    abs((tmpvar_67 / (1.0 + tmpvar_68)))
  , 0.0, 1.0), _GlowPower));
  glow_66 = (glow_66 * sqrt(min (1.0, tmpvar_68)));
  highp float tmpvar_69;
  tmpvar_69 = clamp (((_GlowColor.w * glow_66) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_70;
  tmpvar_70.xyz = _GlowColor.xyz;
  tmpvar_70.w = tmpvar_69;
  tmpvar_65 = tmpvar_70;
  glowColor_18.xyz = tmpvar_65.xyz;
  glowColor_18.w = (tmpvar_65.w * xlv_COLOR0.w);
  emission_19 = (((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w) + (tmpvar_65.xyz * glowColor_18.w));
  highp vec4 overlying_71;
  overlying_71.w = glowColor_18.w;
  highp vec4 underlying_72;
  underlying_72.w = faceColor_22.w;
  overlying_71.xyz = (tmpvar_65.xyz * glowColor_18.w);
  underlying_72.xyz = (faceColor_22.xyz * faceColor_22.w);
  highp vec3 tmpvar_73;
  tmpvar_73 = (overlying_71.xyz + ((1.0 - glowColor_18.w) * underlying_72.xyz));
  highp vec4 tmpvar_74;
  tmpvar_74.xyz = tmpvar_73;
  tmpvar_74.w = (faceColor_22.w + ((1.0 - faceColor_22.w) * glowColor_18.w));
  faceColor_22.w = tmpvar_74.w;
  faceColor_22.xyz = (tmpvar_73 / max (tmpvar_74.w, 0.0001));
  tmpvar_13 = faceColor_22.xyz;
  tmpvar_14 = -(tmpvar_58);
  tmpvar_15 = emission_19;
  highp float tmpvar_75;
  tmpvar_75 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_22.w;
  tmpvar_5 = tmpvar_13;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  highp vec4 tmpvar_76;
  tmpvar_76.w = 1.0;
  tmpvar_76.xyz = xlv_TEXCOORD5;
  highp float tmpvar_77;
  tmpvar_77 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_76).xy).w;
  atten_4 = tmpvar_77;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_14);
  highp vec3 tmpvar_78;
  tmpvar_78 = normalize(worldN_3);
  worldN_3 = tmpvar_78;
  tmpvar_6 = tmpvar_78;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_79;
  viewDir_79 = worldViewDir_10;
  lowp vec4 c_80;
  lowp vec4 c_81;
  highp float nh_82;
  lowp float diff_83;
  mediump float tmpvar_84;
  tmpvar_84 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_83 = tmpvar_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_79)
  )));
  nh_82 = tmpvar_85;
  mediump float y_86;
  y_86 = (mix (_FaceShininess, _OutlineShininess, tmpvar_75) * 128.0);
  highp float tmpvar_87;
  tmpvar_87 = pow (nh_82, y_86);
  c_81.xyz = (((tmpvar_13 * tmpvar_1) * diff_83) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_87));
  c_81.w = tmpvar_17;
  c_80.w = c_81.w;
  c_80.xyz = c_81.xyz;
  gl_FragData[0] = c_80;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_12;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  highp vec4 glowColor_18;
  highp vec3 emission_19;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_61, xlv_TEXCOORD7)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec4 tmpvar_65;
  highp float glow_66;
  highp float tmpvar_67;
  tmpvar_67 = (tmpvar_32 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_68;
  tmpvar_68 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_67 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_66 = (1.0 - pow (clamp (
    abs((tmpvar_67 / (1.0 + tmpvar_68)))
  , 0.0, 1.0), _GlowPower));
  glow_66 = (glow_66 * sqrt(min (1.0, tmpvar_68)));
  highp float tmpvar_69;
  tmpvar_69 = clamp (((_GlowColor.w * glow_66) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_70;
  tmpvar_70.xyz = _GlowColor.xyz;
  tmpvar_70.w = tmpvar_69;
  tmpvar_65 = tmpvar_70;
  glowColor_18.xyz = tmpvar_65.xyz;
  glowColor_18.w = (tmpvar_65.w * xlv_COLOR0.w);
  emission_19 = (((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w) + (tmpvar_65.xyz * glowColor_18.w));
  highp vec4 overlying_71;
  overlying_71.w = glowColor_18.w;
  highp vec4 underlying_72;
  underlying_72.w = faceColor_22.w;
  overlying_71.xyz = (tmpvar_65.xyz * glowColor_18.w);
  underlying_72.xyz = (faceColor_22.xyz * faceColor_22.w);
  highp vec3 tmpvar_73;
  tmpvar_73 = (overlying_71.xyz + ((1.0 - glowColor_18.w) * underlying_72.xyz));
  highp vec4 tmpvar_74;
  tmpvar_74.xyz = tmpvar_73;
  tmpvar_74.w = (faceColor_22.w + ((1.0 - faceColor_22.w) * glowColor_18.w));
  faceColor_22.w = tmpvar_74.w;
  faceColor_22.xyz = (tmpvar_73 / max (tmpvar_74.w, 0.0001));
  tmpvar_13 = faceColor_22.xyz;
  tmpvar_14 = -(tmpvar_58);
  tmpvar_15 = emission_19;
  highp float tmpvar_75;
  tmpvar_75 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_22.w;
  tmpvar_5 = tmpvar_13;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  highp vec4 tmpvar_76;
  tmpvar_76.w = 1.0;
  tmpvar_76.xyz = xlv_TEXCOORD5;
  highp float tmpvar_77;
  tmpvar_77 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_76).xy).w;
  atten_4 = tmpvar_77;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_14);
  highp vec3 tmpvar_78;
  tmpvar_78 = normalize(worldN_3);
  worldN_3 = tmpvar_78;
  tmpvar_6 = tmpvar_78;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_79;
  viewDir_79 = worldViewDir_10;
  lowp vec4 c_80;
  lowp vec4 c_81;
  highp float nh_82;
  lowp float diff_83;
  mediump float tmpvar_84;
  tmpvar_84 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_83 = tmpvar_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_79)
  )));
  nh_82 = tmpvar_85;
  mediump float y_86;
  y_86 = (mix (_FaceShininess, _OutlineShininess, tmpvar_75) * 128.0);
  highp float tmpvar_87;
  tmpvar_87 = pow (nh_82, y_86);
  c_81.xyz = (((tmpvar_13 * tmpvar_1) * diff_83) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_87));
  c_81.w = tmpvar_17;
  c_80.w = c_81.w;
  c_80.xyz = c_81.xyz;
  gl_FragData[0] = c_80;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_12;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  highp vec4 glowColor_18;
  highp vec3 emission_19;
  highp vec3 bump_20;
  highp vec4 outlineColor_21;
  highp vec4 faceColor_22;
  highp float c_23;
  highp vec4 smp4x_24;
  highp vec3 tmpvar_25;
  tmpvar_25.z = 0.0;
  tmpvar_25.x = (1.0/(_TextureWidth));
  tmpvar_25.y = (1.0/(_TextureHeight));
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_25.xz);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_25.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy - tmpvar_25.zy);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy + tmpvar_25.zy);
  lowp vec4 tmpvar_30;
  tmpvar_30.x = texture2D (_MainTex, P_26).w;
  tmpvar_30.y = texture2D (_MainTex, P_27).w;
  tmpvar_30.z = texture2D (_MainTex, P_28).w;
  tmpvar_30.w = texture2D (_MainTex, P_29).w;
  smp4x_24 = tmpvar_30;
  lowp float tmpvar_31;
  tmpvar_31 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_23 = tmpvar_31;
  highp float tmpvar_32;
  tmpvar_32 = (((
    (0.5 - c_23)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_33;
  tmpvar_33 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_22 = _FaceColor;
  outlineColor_21 = _OutlineColor;
  faceColor_22 = (faceColor_22 * xlv_COLOR0);
  outlineColor_21.w = (outlineColor_21.w * xlv_COLOR0.w);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_FaceTex, tmpvar_35);
  faceColor_22 = (faceColor_22 * tmpvar_36);
  highp vec2 tmpvar_37;
  tmpvar_37.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_37.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_38;
  tmpvar_38 = texture2D (_OutlineTex, tmpvar_37);
  outlineColor_21 = (outlineColor_21 * tmpvar_38);
  mediump float d_39;
  d_39 = tmpvar_32;
  lowp vec4 faceColor_40;
  faceColor_40 = faceColor_22;
  lowp vec4 outlineColor_41;
  outlineColor_41 = outlineColor_21;
  mediump float outline_42;
  outline_42 = tmpvar_33;
  mediump float softness_43;
  softness_43 = tmpvar_34;
  mediump float tmpvar_44;
  tmpvar_44 = (1.0 - clamp ((
    ((d_39 - (outline_42 * 0.5)) + (softness_43 * 0.5))
   / 
    (1.0 + softness_43)
  ), 0.0, 1.0));
  faceColor_40.xyz = (faceColor_40.xyz * faceColor_40.w);
  outlineColor_41.xyz = (outlineColor_41.xyz * outlineColor_41.w);
  mediump vec4 tmpvar_45;
  tmpvar_45 = mix (faceColor_40, outlineColor_41, vec4((clamp (
    (d_39 + (outline_42 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_42)
  ))));
  faceColor_40 = tmpvar_45;
  faceColor_40 = (faceColor_40 * tmpvar_44);
  faceColor_22 = faceColor_40;
  faceColor_22.xyz = (faceColor_22.xyz / max (faceColor_22.w, 0.0001));
  highp vec4 h_46;
  h_46 = smp4x_24;
  highp float tmpvar_47;
  tmpvar_47 = (_ShaderFlags / 2.0);
  highp float tmpvar_48;
  tmpvar_48 = (fract(abs(tmpvar_47)) * 2.0);
  highp float tmpvar_49;
  if ((tmpvar_47 >= 0.0)) {
    tmpvar_49 = tmpvar_48;
  } else {
    tmpvar_49 = -(tmpvar_48);
  };
  h_46 = (smp4x_24 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_50;
  tmpvar_50 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_46 = (h_46 - 0.5);
  h_46 = (h_46 / tmpvar_50);
  highp vec4 tmpvar_51;
  tmpvar_51 = clamp ((h_46 + 0.5), 0.0, 1.0);
  h_46 = tmpvar_51;
  if (bool(float((tmpvar_49 >= 1.0)))) {
    h_46 = (1.0 - abs((
      (tmpvar_51 * 2.0)
     - 1.0)));
  };
  h_46 = (min (mix (h_46, 
    sin(((h_46 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_50) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(1.0, 0.0);
  tmpvar_52.z = (h_46.y - h_46.x);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  highp vec3 tmpvar_54;
  tmpvar_54.xy = vec2(0.0, -1.0);
  tmpvar_54.z = (h_46.w - h_46.z);
  highp vec3 tmpvar_55;
  tmpvar_55 = normalize(tmpvar_54);
  lowp vec3 tmpvar_56;
  tmpvar_56 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_20 = tmpvar_56;
  bump_20 = (bump_20 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_32 + (tmpvar_33 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_57;
  tmpvar_57 = mix (vec3(0.0, 0.0, 1.0), bump_20, faceColor_22.www);
  bump_20 = tmpvar_57;
  highp vec3 tmpvar_58;
  tmpvar_58 = normalize(((
    (tmpvar_53.yzx * tmpvar_55.zxy)
   - 
    (tmpvar_53.zxy * tmpvar_55.yzx)
  ) - tmpvar_57));
  highp mat3 tmpvar_59;
  tmpvar_59[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_59[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_59[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_60;
  highp vec3 N_61;
  N_61 = (tmpvar_59 * tmpvar_58);
  tmpvar_60 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_61, xlv_TEXCOORD7)
   * N_61)));
  lowp vec4 tmpvar_62;
  tmpvar_62 = textureCube (_Cube, tmpvar_60);
  highp float tmpvar_63;
  tmpvar_63 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_64;
  tmpvar_64 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_63));
  highp vec4 tmpvar_65;
  highp float glow_66;
  highp float tmpvar_67;
  tmpvar_67 = (tmpvar_32 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_68;
  tmpvar_68 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_67 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_66 = (1.0 - pow (clamp (
    abs((tmpvar_67 / (1.0 + tmpvar_68)))
  , 0.0, 1.0), _GlowPower));
  glow_66 = (glow_66 * sqrt(min (1.0, tmpvar_68)));
  highp float tmpvar_69;
  tmpvar_69 = clamp (((_GlowColor.w * glow_66) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_70;
  tmpvar_70.xyz = _GlowColor.xyz;
  tmpvar_70.w = tmpvar_69;
  tmpvar_65 = tmpvar_70;
  glowColor_18.xyz = tmpvar_65.xyz;
  glowColor_18.w = (tmpvar_65.w * xlv_COLOR0.w);
  emission_19 = (((tmpvar_62.xyz * tmpvar_64) * faceColor_22.w) + (tmpvar_65.xyz * glowColor_18.w));
  highp vec4 overlying_71;
  overlying_71.w = glowColor_18.w;
  highp vec4 underlying_72;
  underlying_72.w = faceColor_22.w;
  overlying_71.xyz = (tmpvar_65.xyz * glowColor_18.w);
  underlying_72.xyz = (faceColor_22.xyz * faceColor_22.w);
  highp vec3 tmpvar_73;
  tmpvar_73 = (overlying_71.xyz + ((1.0 - glowColor_18.w) * underlying_72.xyz));
  highp vec4 tmpvar_74;
  tmpvar_74.xyz = tmpvar_73;
  tmpvar_74.w = (faceColor_22.w + ((1.0 - faceColor_22.w) * glowColor_18.w));
  faceColor_22.w = tmpvar_74.w;
  faceColor_22.xyz = (tmpvar_73 / max (tmpvar_74.w, 0.0001));
  tmpvar_13 = faceColor_22.xyz;
  tmpvar_14 = -(tmpvar_58);
  tmpvar_15 = emission_19;
  highp float tmpvar_75;
  tmpvar_75 = clamp ((tmpvar_32 + (tmpvar_33 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_22.w;
  tmpvar_5 = tmpvar_13;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  highp vec4 tmpvar_76;
  tmpvar_76.w = 1.0;
  tmpvar_76.xyz = xlv_TEXCOORD5;
  highp float tmpvar_77;
  tmpvar_77 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_76).xy).w;
  atten_4 = tmpvar_77;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_14);
  highp vec3 tmpvar_78;
  tmpvar_78 = normalize(worldN_3);
  worldN_3 = tmpvar_78;
  tmpvar_6 = tmpvar_78;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_79;
  viewDir_79 = worldViewDir_10;
  lowp vec4 c_80;
  lowp vec4 c_81;
  highp float nh_82;
  lowp float diff_83;
  mediump float tmpvar_84;
  tmpvar_84 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_83 = tmpvar_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_79)
  )));
  nh_82 = tmpvar_85;
  mediump float y_86;
  y_86 = (mix (_FaceShininess, _OutlineShininess, tmpvar_75) * 128.0);
  highp float tmpvar_87;
  tmpvar_87 = pow (nh_82, y_86);
  c_81.xyz = (((tmpvar_13 * tmpvar_1) * diff_83) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_87));
  c_81.w = tmpvar_17;
  c_80.w = c_81.w;
  c_80.xyz = c_81.xyz;
  gl_FragData[0] = c_80;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_12;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_59, xlv_TEXCOORD7)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_5 = tmpvar_13;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD5;
  highp float tmpvar_66;
  tmpvar_66 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_65).xy).w;
  atten_4 = tmpvar_66;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_14);
  highp vec3 tmpvar_67;
  tmpvar_67 = normalize(worldN_3);
  worldN_3 = tmpvar_67;
  tmpvar_6 = tmpvar_67;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_10;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_12;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_59, xlv_TEXCOORD7)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_5 = tmpvar_13;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD5;
  highp float tmpvar_66;
  tmpvar_66 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_65).xy).w;
  atten_4 = tmpvar_66;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_14);
  highp vec3 tmpvar_67;
  tmpvar_67 = normalize(worldN_3);
  worldN_3 = tmpvar_67;
  tmpvar_6 = tmpvar_67;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_10;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform mediump vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  lowp vec3 tmpvar_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp float tmpvar_8;
  lowp float tmpvar_9;
  highp vec3 worldViewDir_10;
  lowp vec3 lightDir_11;
  mediump vec3 tmpvar_12;
  tmpvar_12 = _WorldSpaceLightPos0.xyz;
  lightDir_11 = tmpvar_12;
  worldViewDir_10 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_5 = vec3(0.0, 0.0, 0.0);
  tmpvar_7 = vec3(0.0, 0.0, 0.0);
  tmpvar_9 = 0.0;
  tmpvar_8 = 0.0;
  tmpvar_6 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_13;
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp float tmpvar_16;
  lowp float tmpvar_17;
  tmpvar_13 = tmpvar_5;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  highp vec3 bump_18;
  highp vec4 outlineColor_19;
  highp vec4 faceColor_20;
  highp float c_21;
  highp vec4 smp4x_22;
  highp vec3 tmpvar_23;
  tmpvar_23.z = 0.0;
  tmpvar_23.x = (1.0/(_TextureWidth));
  tmpvar_23.y = (1.0/(_TextureHeight));
  highp vec2 P_24;
  P_24 = (xlv_TEXCOORD0.xy - tmpvar_23.xz);
  highp vec2 P_25;
  P_25 = (xlv_TEXCOORD0.xy + tmpvar_23.xz);
  highp vec2 P_26;
  P_26 = (xlv_TEXCOORD0.xy - tmpvar_23.zy);
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy + tmpvar_23.zy);
  lowp vec4 tmpvar_28;
  tmpvar_28.x = texture2D (_MainTex, P_24).w;
  tmpvar_28.y = texture2D (_MainTex, P_25).w;
  tmpvar_28.z = texture2D (_MainTex, P_26).w;
  tmpvar_28.w = texture2D (_MainTex, P_27).w;
  smp4x_22 = tmpvar_28;
  lowp float tmpvar_29;
  tmpvar_29 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_21 = tmpvar_29;
  highp float tmpvar_30;
  tmpvar_30 = (((
    (0.5 - c_21)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_31;
  tmpvar_31 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_32;
  tmpvar_32 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_20 = _FaceColor;
  outlineColor_19 = _OutlineColor;
  faceColor_20 = (faceColor_20 * xlv_COLOR0);
  outlineColor_19.w = (outlineColor_19.w * xlv_COLOR0.w);
  highp vec2 tmpvar_33;
  tmpvar_33.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_33.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_34;
  tmpvar_34 = texture2D (_FaceTex, tmpvar_33);
  faceColor_20 = (faceColor_20 * tmpvar_34);
  highp vec2 tmpvar_35;
  tmpvar_35.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_35.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_36;
  tmpvar_36 = texture2D (_OutlineTex, tmpvar_35);
  outlineColor_19 = (outlineColor_19 * tmpvar_36);
  mediump float d_37;
  d_37 = tmpvar_30;
  lowp vec4 faceColor_38;
  faceColor_38 = faceColor_20;
  lowp vec4 outlineColor_39;
  outlineColor_39 = outlineColor_19;
  mediump float outline_40;
  outline_40 = tmpvar_31;
  mediump float softness_41;
  softness_41 = tmpvar_32;
  mediump float tmpvar_42;
  tmpvar_42 = (1.0 - clamp ((
    ((d_37 - (outline_40 * 0.5)) + (softness_41 * 0.5))
   / 
    (1.0 + softness_41)
  ), 0.0, 1.0));
  faceColor_38.xyz = (faceColor_38.xyz * faceColor_38.w);
  outlineColor_39.xyz = (outlineColor_39.xyz * outlineColor_39.w);
  mediump vec4 tmpvar_43;
  tmpvar_43 = mix (faceColor_38, outlineColor_39, vec4((clamp (
    (d_37 + (outline_40 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_40)
  ))));
  faceColor_38 = tmpvar_43;
  faceColor_38 = (faceColor_38 * tmpvar_42);
  faceColor_20 = faceColor_38;
  faceColor_20.xyz = (faceColor_20.xyz / max (faceColor_20.w, 0.0001));
  highp vec4 h_44;
  h_44 = smp4x_22;
  highp float tmpvar_45;
  tmpvar_45 = (_ShaderFlags / 2.0);
  highp float tmpvar_46;
  tmpvar_46 = (fract(abs(tmpvar_45)) * 2.0);
  highp float tmpvar_47;
  if ((tmpvar_45 >= 0.0)) {
    tmpvar_47 = tmpvar_46;
  } else {
    tmpvar_47 = -(tmpvar_46);
  };
  h_44 = (smp4x_22 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_48;
  tmpvar_48 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_44 = (h_44 - 0.5);
  h_44 = (h_44 / tmpvar_48);
  highp vec4 tmpvar_49;
  tmpvar_49 = clamp ((h_44 + 0.5), 0.0, 1.0);
  h_44 = tmpvar_49;
  if (bool(float((tmpvar_47 >= 1.0)))) {
    h_44 = (1.0 - abs((
      (tmpvar_49 * 2.0)
     - 1.0)));
  };
  h_44 = (min (mix (h_44, 
    sin(((h_44 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_48) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_50;
  tmpvar_50.xy = vec2(1.0, 0.0);
  tmpvar_50.z = (h_44.y - h_44.x);
  highp vec3 tmpvar_51;
  tmpvar_51 = normalize(tmpvar_50);
  highp vec3 tmpvar_52;
  tmpvar_52.xy = vec2(0.0, -1.0);
  tmpvar_52.z = (h_44.w - h_44.z);
  highp vec3 tmpvar_53;
  tmpvar_53 = normalize(tmpvar_52);
  lowp vec3 tmpvar_54;
  tmpvar_54 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_18 = tmpvar_54;
  bump_18 = (bump_18 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_30 + (tmpvar_31 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_55;
  tmpvar_55 = mix (vec3(0.0, 0.0, 1.0), bump_18, faceColor_20.www);
  bump_18 = tmpvar_55;
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(((
    (tmpvar_51.yzx * tmpvar_53.zxy)
   - 
    (tmpvar_51.zxy * tmpvar_53.yzx)
  ) - tmpvar_55));
  highp mat3 tmpvar_57;
  tmpvar_57[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_57[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_57[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_58;
  highp vec3 N_59;
  N_59 = (tmpvar_57 * tmpvar_56);
  tmpvar_58 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_59, xlv_TEXCOORD7)
   * N_59)));
  lowp vec4 tmpvar_60;
  tmpvar_60 = textureCube (_Cube, tmpvar_58);
  highp float tmpvar_61;
  tmpvar_61 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_62;
  tmpvar_62 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_61));
  highp vec3 tmpvar_63;
  tmpvar_63 = ((tmpvar_60.xyz * tmpvar_62) * faceColor_20.w);
  tmpvar_13 = faceColor_20.xyz;
  tmpvar_14 = -(tmpvar_56);
  tmpvar_15 = tmpvar_63;
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_30 + (tmpvar_31 * 0.5)), 0.0, 1.0);
  tmpvar_16 = 1.0;
  tmpvar_17 = faceColor_20.w;
  tmpvar_5 = tmpvar_13;
  tmpvar_7 = tmpvar_15;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  highp vec4 tmpvar_65;
  tmpvar_65.w = 1.0;
  tmpvar_65.xyz = xlv_TEXCOORD5;
  highp float tmpvar_66;
  tmpvar_66 = texture2D (_LightTexture0, (unity_WorldToLight * tmpvar_65).xy).w;
  atten_4 = tmpvar_66;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_14);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_14);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_14);
  highp vec3 tmpvar_67;
  tmpvar_67 = normalize(worldN_3);
  worldN_3 = tmpvar_67;
  tmpvar_6 = tmpvar_67;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_11;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_68;
  viewDir_68 = worldViewDir_10;
  lowp vec4 c_69;
  lowp vec4 c_70;
  highp float nh_71;
  lowp float diff_72;
  mediump float tmpvar_73;
  tmpvar_73 = max (0.0, dot (tmpvar_6, tmpvar_2));
  diff_72 = tmpvar_73;
  mediump float tmpvar_74;
  tmpvar_74 = max (0.0, dot (tmpvar_6, normalize(
    (tmpvar_2 + viewDir_68)
  )));
  nh_71 = tmpvar_74;
  mediump float y_75;
  y_75 = (mix (_FaceShininess, _OutlineShininess, tmpvar_64) * 128.0);
  highp float tmpvar_76;
  tmpvar_76 = pow (nh_71, y_75);
  c_70.xyz = (((tmpvar_13 * tmpvar_1) * diff_72) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_76));
  c_70.w = tmpvar_17;
  c_69.w = c_70.w;
  c_69.xyz = c_70.xyz;
  gl_FragData[0] = c_69;
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77).xyz;
  highp float tmpvar_78;
  tmpvar_78 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_78;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_79;
  tmpvar_79 = normalize(worldN_3);
  worldN_3 = tmpvar_79;
  tmpvar_7 = tmpvar_79;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_80;
  viewDir_80 = worldViewDir_11;
  lowp vec4 c_81;
  lowp vec4 c_82;
  highp float nh_83;
  lowp float diff_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_84 = tmpvar_85;
  mediump float tmpvar_86;
  tmpvar_86 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_80)
  )));
  nh_83 = tmpvar_86;
  mediump float y_87;
  y_87 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_88;
  tmpvar_88 = pow (nh_83, y_87);
  c_82.xyz = (((tmpvar_14 * tmpvar_1) * diff_84) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_88));
  c_82.w = tmpvar_18;
  c_81.w = c_82.w;
  c_81.xyz = c_82.xyz;
  gl_FragData[0] = c_81;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77).xyz;
  highp float tmpvar_78;
  tmpvar_78 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_78;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_79;
  tmpvar_79 = normalize(worldN_3);
  worldN_3 = tmpvar_79;
  tmpvar_7 = tmpvar_79;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_80;
  viewDir_80 = worldViewDir_11;
  lowp vec4 c_81;
  lowp vec4 c_82;
  highp float nh_83;
  lowp float diff_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_84 = tmpvar_85;
  mediump float tmpvar_86;
  tmpvar_86 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_80)
  )));
  nh_83 = tmpvar_86;
  mediump float y_87;
  y_87 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_88;
  tmpvar_88 = pow (nh_83, y_87);
  c_82.xyz = (((tmpvar_14 * tmpvar_1) * diff_84) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_88));
  c_82.w = tmpvar_18;
  c_81.w = c_82.w;
  c_81.xyz = c_82.xyz;
  gl_FragData[0] = c_81;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "GLOW_ON" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesTANGENT;
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
attribute vec3 _glesNormal;
attribute vec4 _glesMultiTexCoord0;
attribute vec4 _glesMultiTexCoord1;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _ScreenParams;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_WorldToObject;
uniform highp vec4 unity_WorldTransformParams;
uniform highp mat4 glstate_matrix_projection;
uniform highp mat4 unity_MatrixVP;
uniform highp float _FaceDilate;
uniform highp mat4 _EnvMatrix;
uniform highp float _WeightNormal;
uniform highp float _WeightBold;
uniform highp float _ScaleRatioA;
uniform highp float _VertexOffsetX;
uniform highp float _VertexOffsetY;
uniform highp float _GradientScale;
uniform highp float _ScaleX;
uniform highp float _ScaleY;
uniform highp float _PerspectiveFilter;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _FaceTex_ST;
uniform highp vec4 _OutlineTex_ST;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  lowp vec3 worldBinormal_1;
  lowp float tangentSign_2;
  lowp vec3 worldTangent_3;
  highp vec4 tmpvar_4;
  highp vec4 tmpvar_5;
  highp vec3 tmpvar_6;
  highp vec4 tmpvar_7;
  tmpvar_5.zw = _glesVertex.zw;
  tmpvar_7.zw = _glesMultiTexCoord1.zw;
  highp vec2 tmpvar_8;
  highp float scale_9;
  highp vec2 pixelSize_10;
  tmpvar_5.x = (_glesVertex.x + _VertexOffsetX);
  tmpvar_5.y = (_glesVertex.y + _VertexOffsetY);
  highp vec4 tmpvar_11;
  tmpvar_11.w = 1.0;
  tmpvar_11.xyz = _WorldSpaceCameraPos;
  tmpvar_6 = (_glesNormal * sign(dot (_glesNormal, 
    ((unity_WorldToObject * tmpvar_11).xyz - tmpvar_5.xyz)
  )));
  highp vec4 tmpvar_12;
  tmpvar_12.w = 1.0;
  tmpvar_12.xyz = tmpvar_5.xyz;
  highp vec2 tmpvar_13;
  tmpvar_13.x = _ScaleX;
  tmpvar_13.y = _ScaleY;
  highp mat2 tmpvar_14;
  tmpvar_14[0] = glstate_matrix_projection[0].xy;
  tmpvar_14[1] = glstate_matrix_projection[1].xy;
  pixelSize_10 = ((unity_MatrixVP * (unity_ObjectToWorld * tmpvar_12)).ww / (tmpvar_13 * (tmpvar_14 * _ScreenParams.xy)));
  scale_9 = (inversesqrt(dot (pixelSize_10, pixelSize_10)) * ((
    abs(_glesMultiTexCoord1.y)
   * _GradientScale) * 1.5));
  highp mat3 tmpvar_15;
  tmpvar_15[0] = unity_WorldToObject[0].xyz;
  tmpvar_15[1] = unity_WorldToObject[1].xyz;
  tmpvar_15[2] = unity_WorldToObject[2].xyz;
  highp float tmpvar_16;
  tmpvar_16 = mix ((scale_9 * (1.0 - _PerspectiveFilter)), scale_9, abs(dot (
    normalize((tmpvar_6 * tmpvar_15))
  , 
    normalize((_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz))
  )));
  scale_9 = tmpvar_16;
  tmpvar_8.y = tmpvar_16;
  tmpvar_8.x = (((
    (mix (_WeightNormal, _WeightBold, float((0.0 >= _glesMultiTexCoord1.y))) / 4.0)
   + _FaceDilate) * _ScaleRatioA) * 0.5);
  highp vec2 xlat_varoutput_17;
  xlat_varoutput_17.x = floor((_glesMultiTexCoord1.x / 4096.0));
  xlat_varoutput_17.y = (_glesMultiTexCoord1.x - (4096.0 * xlat_varoutput_17.x));
  tmpvar_7.xy = (xlat_varoutput_17 * 0.001953125);
  highp mat3 tmpvar_18;
  tmpvar_18[0] = _EnvMatrix[0].xyz;
  tmpvar_18[1] = _EnvMatrix[1].xyz;
  tmpvar_18[2] = _EnvMatrix[2].xyz;
  highp vec4 tmpvar_19;
  tmpvar_19.w = 1.0;
  tmpvar_19.xyz = tmpvar_5.xyz;
  tmpvar_4.xy = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  tmpvar_4.zw = ((tmpvar_7.xy * _FaceTex_ST.xy) + _FaceTex_ST.zw);
  highp mat3 tmpvar_20;
  tmpvar_20[0] = unity_WorldToObject[0].xyz;
  tmpvar_20[1] = unity_WorldToObject[1].xyz;
  tmpvar_20[2] = unity_WorldToObject[2].xyz;
  highp vec3 tmpvar_21;
  tmpvar_21 = normalize((tmpvar_6 * tmpvar_20));
  highp mat3 tmpvar_22;
  tmpvar_22[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_22[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_22[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_23;
  tmpvar_23 = normalize((tmpvar_22 * _glesTANGENT.xyz));
  worldTangent_3 = tmpvar_23;
  highp float tmpvar_24;
  tmpvar_24 = (_glesTANGENT.w * unity_WorldTransformParams.w);
  tangentSign_2 = tmpvar_24;
  highp vec3 tmpvar_25;
  tmpvar_25 = (((tmpvar_21.yzx * worldTangent_3.zxy) - (tmpvar_21.zxy * worldTangent_3.yzx)) * tangentSign_2);
  worldBinormal_1 = tmpvar_25;
  highp vec3 tmpvar_26;
  tmpvar_26.x = worldTangent_3.x;
  tmpvar_26.y = worldBinormal_1.x;
  tmpvar_26.z = tmpvar_21.x;
  highp vec3 tmpvar_27;
  tmpvar_27.x = worldTangent_3.y;
  tmpvar_27.y = worldBinormal_1.y;
  tmpvar_27.z = tmpvar_21.y;
  highp vec3 tmpvar_28;
  tmpvar_28.x = worldTangent_3.z;
  tmpvar_28.y = worldBinormal_1.z;
  tmpvar_28.z = tmpvar_21.z;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_19));
  xlv_TEXCOORD0 = tmpvar_4;
  xlv_TEXCOORD1 = ((tmpvar_7.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = tmpvar_26;
  xlv_TEXCOORD3 = tmpvar_27;
  xlv_TEXCOORD4 = tmpvar_28;
  xlv_TEXCOORD5 = (unity_ObjectToWorld * tmpvar_5).xyz;
  xlv_COLOR0 = _glesColor;
  xlv_TEXCOORD6 = tmpvar_8;
  xlv_TEXCOORD7 = (tmpvar_18 * (_WorldSpaceCameraPos - (unity_ObjectToWorld * tmpvar_5).xyz));
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _Time;
uniform highp vec3 _WorldSpaceCameraPos;
uniform highp vec4 _WorldSpaceLightPos0;
uniform highp mat4 unity_ObjectToWorld;
uniform lowp vec4 _LightColor0;
uniform lowp vec4 _SpecColor;
uniform highp sampler2D _LightTexture0;
uniform highp mat4 unity_WorldToLight;
uniform sampler2D _FaceTex;
uniform highp float _FaceUVSpeedX;
uniform highp float _FaceUVSpeedY;
uniform lowp vec4 _FaceColor;
uniform highp float _OutlineSoftness;
uniform sampler2D _OutlineTex;
uniform highp float _OutlineUVSpeedX;
uniform highp float _OutlineUVSpeedY;
uniform lowp vec4 _OutlineColor;
uniform highp float _OutlineWidth;
uniform highp float _Bevel;
uniform highp float _BevelOffset;
uniform highp float _BevelWidth;
uniform highp float _BevelClamp;
uniform highp float _BevelRoundness;
uniform sampler2D _BumpMap;
uniform highp float _BumpOutline;
uniform highp float _BumpFace;
uniform lowp samplerCube _Cube;
uniform lowp vec4 _ReflectFaceColor;
uniform lowp vec4 _ReflectOutlineColor;
uniform lowp vec4 _GlowColor;
uniform highp float _GlowOffset;
uniform highp float _GlowOuter;
uniform highp float _GlowInner;
uniform highp float _GlowPower;
uniform highp float _ShaderFlags;
uniform highp float _ScaleRatioA;
uniform highp float _ScaleRatioB;
uniform sampler2D _MainTex;
uniform highp float _TextureWidth;
uniform highp float _TextureHeight;
uniform highp float _GradientScale;
uniform mediump float _FaceShininess;
uniform mediump float _OutlineShininess;
varying highp vec4 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec3 xlv_TEXCOORD2;
varying highp vec3 xlv_TEXCOORD3;
varying highp vec3 xlv_TEXCOORD4;
varying highp vec3 xlv_TEXCOORD5;
varying lowp vec4 xlv_COLOR0;
varying highp vec2 xlv_TEXCOORD6;
varying highp vec3 xlv_TEXCOORD7;
void main ()
{
  mediump vec3 tmpvar_1;
  mediump vec3 tmpvar_2;
  highp vec3 worldN_3;
  lowp float atten_4;
  highp vec3 lightCoord_5;
  lowp vec3 tmpvar_6;
  lowp vec3 tmpvar_7;
  lowp vec3 tmpvar_8;
  lowp float tmpvar_9;
  lowp float tmpvar_10;
  highp vec3 worldViewDir_11;
  lowp vec3 lightDir_12;
  highp vec3 tmpvar_13;
  tmpvar_13 = normalize((_WorldSpaceLightPos0.xyz - xlv_TEXCOORD5));
  lightDir_12 = tmpvar_13;
  worldViewDir_11 = normalize((_WorldSpaceCameraPos - xlv_TEXCOORD5));
  tmpvar_6 = vec3(0.0, 0.0, 0.0);
  tmpvar_8 = vec3(0.0, 0.0, 0.0);
  tmpvar_10 = 0.0;
  tmpvar_9 = 0.0;
  tmpvar_7 = vec3(0.0, 0.0, 1.0);
  lowp vec3 tmpvar_14;
  lowp vec3 tmpvar_15;
  lowp vec3 tmpvar_16;
  lowp float tmpvar_17;
  lowp float tmpvar_18;
  tmpvar_14 = tmpvar_6;
  tmpvar_15 = tmpvar_7;
  tmpvar_16 = tmpvar_8;
  tmpvar_17 = tmpvar_9;
  tmpvar_18 = tmpvar_10;
  highp vec4 glowColor_19;
  highp vec3 emission_20;
  highp vec3 bump_21;
  highp vec4 outlineColor_22;
  highp vec4 faceColor_23;
  highp float c_24;
  highp vec4 smp4x_25;
  highp vec3 tmpvar_26;
  tmpvar_26.z = 0.0;
  tmpvar_26.x = (1.0/(_TextureWidth));
  tmpvar_26.y = (1.0/(_TextureHeight));
  highp vec2 P_27;
  P_27 = (xlv_TEXCOORD0.xy - tmpvar_26.xz);
  highp vec2 P_28;
  P_28 = (xlv_TEXCOORD0.xy + tmpvar_26.xz);
  highp vec2 P_29;
  P_29 = (xlv_TEXCOORD0.xy - tmpvar_26.zy);
  highp vec2 P_30;
  P_30 = (xlv_TEXCOORD0.xy + tmpvar_26.zy);
  lowp vec4 tmpvar_31;
  tmpvar_31.x = texture2D (_MainTex, P_27).w;
  tmpvar_31.y = texture2D (_MainTex, P_28).w;
  tmpvar_31.z = texture2D (_MainTex, P_29).w;
  tmpvar_31.w = texture2D (_MainTex, P_30).w;
  smp4x_25 = tmpvar_31;
  lowp float tmpvar_32;
  tmpvar_32 = texture2D (_MainTex, xlv_TEXCOORD0.xy).w;
  c_24 = tmpvar_32;
  highp float tmpvar_33;
  tmpvar_33 = (((
    (0.5 - c_24)
   - xlv_TEXCOORD6.x) * xlv_TEXCOORD6.y) + 0.5);
  highp float tmpvar_34;
  tmpvar_34 = ((_OutlineWidth * _ScaleRatioA) * xlv_TEXCOORD6.y);
  highp float tmpvar_35;
  tmpvar_35 = ((_OutlineSoftness * _ScaleRatioA) * xlv_TEXCOORD6.y);
  faceColor_23 = _FaceColor;
  outlineColor_22 = _OutlineColor;
  faceColor_23 = (faceColor_23 * xlv_COLOR0);
  outlineColor_22.w = (outlineColor_22.w * xlv_COLOR0.w);
  highp vec2 tmpvar_36;
  tmpvar_36.x = (xlv_TEXCOORD0.z + (_FaceUVSpeedX * _Time.y));
  tmpvar_36.y = (xlv_TEXCOORD0.w + (_FaceUVSpeedY * _Time.y));
  lowp vec4 tmpvar_37;
  tmpvar_37 = texture2D (_FaceTex, tmpvar_36);
  faceColor_23 = (faceColor_23 * tmpvar_37);
  highp vec2 tmpvar_38;
  tmpvar_38.x = (xlv_TEXCOORD1.x + (_OutlineUVSpeedX * _Time.y));
  tmpvar_38.y = (xlv_TEXCOORD1.y + (_OutlineUVSpeedY * _Time.y));
  lowp vec4 tmpvar_39;
  tmpvar_39 = texture2D (_OutlineTex, tmpvar_38);
  outlineColor_22 = (outlineColor_22 * tmpvar_39);
  mediump float d_40;
  d_40 = tmpvar_33;
  lowp vec4 faceColor_41;
  faceColor_41 = faceColor_23;
  lowp vec4 outlineColor_42;
  outlineColor_42 = outlineColor_22;
  mediump float outline_43;
  outline_43 = tmpvar_34;
  mediump float softness_44;
  softness_44 = tmpvar_35;
  mediump float tmpvar_45;
  tmpvar_45 = (1.0 - clamp ((
    ((d_40 - (outline_43 * 0.5)) + (softness_44 * 0.5))
   / 
    (1.0 + softness_44)
  ), 0.0, 1.0));
  faceColor_41.xyz = (faceColor_41.xyz * faceColor_41.w);
  outlineColor_42.xyz = (outlineColor_42.xyz * outlineColor_42.w);
  mediump vec4 tmpvar_46;
  tmpvar_46 = mix (faceColor_41, outlineColor_42, vec4((clamp (
    (d_40 + (outline_43 * 0.5))
  , 0.0, 1.0) * sqrt(
    min (1.0, outline_43)
  ))));
  faceColor_41 = tmpvar_46;
  faceColor_41 = (faceColor_41 * tmpvar_45);
  faceColor_23 = faceColor_41;
  faceColor_23.xyz = (faceColor_23.xyz / max (faceColor_23.w, 0.0001));
  highp vec4 h_47;
  h_47 = smp4x_25;
  highp float tmpvar_48;
  tmpvar_48 = (_ShaderFlags / 2.0);
  highp float tmpvar_49;
  tmpvar_49 = (fract(abs(tmpvar_48)) * 2.0);
  highp float tmpvar_50;
  if ((tmpvar_48 >= 0.0)) {
    tmpvar_50 = tmpvar_49;
  } else {
    tmpvar_50 = -(tmpvar_49);
  };
  h_47 = (smp4x_25 + (xlv_TEXCOORD6.x + _BevelOffset));
  highp float tmpvar_51;
  tmpvar_51 = max (0.01, (_OutlineWidth + _BevelWidth));
  h_47 = (h_47 - 0.5);
  h_47 = (h_47 / tmpvar_51);
  highp vec4 tmpvar_52;
  tmpvar_52 = clamp ((h_47 + 0.5), 0.0, 1.0);
  h_47 = tmpvar_52;
  if (bool(float((tmpvar_50 >= 1.0)))) {
    h_47 = (1.0 - abs((
      (tmpvar_52 * 2.0)
     - 1.0)));
  };
  h_47 = (min (mix (h_47, 
    sin(((h_47 * 3.141592) / 2.0))
  , vec4(_BevelRoundness)), vec4((1.0 - _BevelClamp))) * ((_Bevel * tmpvar_51) * (_GradientScale * -2.0)));
  highp vec3 tmpvar_53;
  tmpvar_53.xy = vec2(1.0, 0.0);
  tmpvar_53.z = (h_47.y - h_47.x);
  highp vec3 tmpvar_54;
  tmpvar_54 = normalize(tmpvar_53);
  highp vec3 tmpvar_55;
  tmpvar_55.xy = vec2(0.0, -1.0);
  tmpvar_55.z = (h_47.w - h_47.z);
  highp vec3 tmpvar_56;
  tmpvar_56 = normalize(tmpvar_55);
  lowp vec3 tmpvar_57;
  tmpvar_57 = ((texture2D (_BumpMap, xlv_TEXCOORD0.zw).xyz * 2.0) - 1.0);
  bump_21 = tmpvar_57;
  bump_21 = (bump_21 * mix (_BumpFace, _BumpOutline, clamp (
    (tmpvar_33 + (tmpvar_34 * 0.5))
  , 0.0, 1.0)));
  highp vec3 tmpvar_58;
  tmpvar_58 = mix (vec3(0.0, 0.0, 1.0), bump_21, faceColor_23.www);
  bump_21 = tmpvar_58;
  highp vec3 tmpvar_59;
  tmpvar_59 = normalize(((
    (tmpvar_54.yzx * tmpvar_56.zxy)
   - 
    (tmpvar_54.zxy * tmpvar_56.yzx)
  ) - tmpvar_58));
  highp mat3 tmpvar_60;
  tmpvar_60[0] = unity_ObjectToWorld[0].xyz;
  tmpvar_60[1] = unity_ObjectToWorld[1].xyz;
  tmpvar_60[2] = unity_ObjectToWorld[2].xyz;
  highp vec3 tmpvar_61;
  highp vec3 N_62;
  N_62 = (tmpvar_60 * tmpvar_59);
  tmpvar_61 = (xlv_TEXCOORD7 - (2.0 * (
    dot (N_62, xlv_TEXCOORD7)
   * N_62)));
  lowp vec4 tmpvar_63;
  tmpvar_63 = textureCube (_Cube, tmpvar_61);
  highp float tmpvar_64;
  tmpvar_64 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  lowp vec3 tmpvar_65;
  tmpvar_65 = mix (_ReflectFaceColor.xyz, _ReflectOutlineColor.xyz, vec3(tmpvar_64));
  highp vec4 tmpvar_66;
  highp float glow_67;
  highp float tmpvar_68;
  tmpvar_68 = (tmpvar_33 - ((_GlowOffset * _ScaleRatioB) * (0.5 * xlv_TEXCOORD6.y)));
  highp float tmpvar_69;
  tmpvar_69 = ((mix (_GlowInner, 
    (_GlowOuter * _ScaleRatioB)
  , 
    float((tmpvar_68 >= 0.0))
  ) * 0.5) * xlv_TEXCOORD6.y);
  glow_67 = (1.0 - pow (clamp (
    abs((tmpvar_68 / (1.0 + tmpvar_69)))
  , 0.0, 1.0), _GlowPower));
  glow_67 = (glow_67 * sqrt(min (1.0, tmpvar_69)));
  highp float tmpvar_70;
  tmpvar_70 = clamp (((_GlowColor.w * glow_67) * 2.0), 0.0, 1.0);
  lowp vec4 tmpvar_71;
  tmpvar_71.xyz = _GlowColor.xyz;
  tmpvar_71.w = tmpvar_70;
  tmpvar_66 = tmpvar_71;
  glowColor_19.xyz = tmpvar_66.xyz;
  glowColor_19.w = (tmpvar_66.w * xlv_COLOR0.w);
  emission_20 = (((tmpvar_63.xyz * tmpvar_65) * faceColor_23.w) + (tmpvar_66.xyz * glowColor_19.w));
  highp vec4 overlying_72;
  overlying_72.w = glowColor_19.w;
  highp vec4 underlying_73;
  underlying_73.w = faceColor_23.w;
  overlying_72.xyz = (tmpvar_66.xyz * glowColor_19.w);
  underlying_73.xyz = (faceColor_23.xyz * faceColor_23.w);
  highp vec3 tmpvar_74;
  tmpvar_74 = (overlying_72.xyz + ((1.0 - glowColor_19.w) * underlying_73.xyz));
  highp vec4 tmpvar_75;
  tmpvar_75.xyz = tmpvar_74;
  tmpvar_75.w = (faceColor_23.w + ((1.0 - faceColor_23.w) * glowColor_19.w));
  faceColor_23.w = tmpvar_75.w;
  faceColor_23.xyz = (tmpvar_74 / max (tmpvar_75.w, 0.0001));
  tmpvar_14 = faceColor_23.xyz;
  tmpvar_15 = -(tmpvar_59);
  tmpvar_16 = emission_20;
  highp float tmpvar_76;
  tmpvar_76 = clamp ((tmpvar_33 + (tmpvar_34 * 0.5)), 0.0, 1.0);
  tmpvar_17 = 1.0;
  tmpvar_18 = faceColor_23.w;
  tmpvar_6 = tmpvar_14;
  tmpvar_8 = tmpvar_16;
  tmpvar_9 = tmpvar_17;
  tmpvar_10 = tmpvar_18;
  highp vec4 tmpvar_77;
  tmpvar_77.w = 1.0;
  tmpvar_77.xyz = xlv_TEXCOORD5;
  lightCoord_5 = (unity_WorldToLight * tmpvar_77).xyz;
  highp float tmpvar_78;
  tmpvar_78 = texture2D (_LightTexture0, vec2(dot (lightCoord_5, lightCoord_5))).w;
  atten_4 = tmpvar_78;
  worldN_3.x = dot (xlv_TEXCOORD2, tmpvar_15);
  worldN_3.y = dot (xlv_TEXCOORD3, tmpvar_15);
  worldN_3.z = dot (xlv_TEXCOORD4, tmpvar_15);
  highp vec3 tmpvar_79;
  tmpvar_79 = normalize(worldN_3);
  worldN_3 = tmpvar_79;
  tmpvar_7 = tmpvar_79;
  tmpvar_1 = _LightColor0.xyz;
  tmpvar_2 = lightDir_12;
  tmpvar_1 = (tmpvar_1 * atten_4);
  mediump vec3 viewDir_80;
  viewDir_80 = worldViewDir_11;
  lowp vec4 c_81;
  lowp vec4 c_82;
  highp float nh_83;
  lowp float diff_84;
  mediump float tmpvar_85;
  tmpvar_85 = max (0.0, dot (tmpvar_7, tmpvar_2));
  diff_84 = tmpvar_85;
  mediump float tmpvar_86;
  tmpvar_86 = max (0.0, dot (tmpvar_7, normalize(
    (tmpvar_2 + viewDir_80)
  )));
  nh_83 = tmpvar_86;
  mediump float y_87;
  y_87 = (mix (_FaceShininess, _OutlineShininess, tmpvar_76) * 128.0);
  highp float tmpvar_88;
  tmpvar_88 = pow (nh_83, y_87);
  c_82.xyz = (((tmpvar_14 * tmpvar_1) * diff_84) + ((tmpvar_1 * _SpecColor.xyz) * tmpvar_88));
  c_82.w = tmpvar_18;
  c_81.w = c_82.w;
  c_81.xyz = c_82.xyz;
  gl_FragData[0] = c_81;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" "GLOW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" "GLOW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT_COOKIE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" "GLOW_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "DIRECTIONAL_COOKIE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" "GLOW_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" "GLOW_ON" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" "GLOW_ON" }
""
}
}
}
 Pass {
  Name "CASTER"
  LOD 300
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  Cull Off
  Offset 1, 1
  GpuProgramID 136638
Program "vp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _OutlineTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord0.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _OutlineTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord0.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 unity_LightShadowBias;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _OutlineTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
  highp vec4 clipPos_3;
  clipPos_3.xyw = tmpvar_1.xyw;
  clipPos_3.z = (tmpvar_1.z + clamp ((unity_LightShadowBias.x / tmpvar_1.w), 0.0, 1.0));
  clipPos_3.z = mix (clipPos_3.z, max (clipPos_3.z, -(tmpvar_1.w)), unity_LightShadowBias.y);
  gl_Position = clipPos_3;
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord0.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform sampler2D _MainTex;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  gl_FragData[0] = vec4(0.0, 0.0, 0.0, 0.0);
}


#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _OutlineTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord0.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _OutlineTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord0.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesMultiTexCoord0;
uniform highp vec4 _LightPositionRange;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _MainTex_ST;
uniform highp vec4 _OutlineTex_ST;
uniform highp float _OutlineWidth;
uniform highp float _FaceDilate;
uniform highp float _ScaleRatioA;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp vec2 xlv_TEXCOORD3;
varying highp float xlv_TEXCOORD2;
void main ()
{
  highp vec4 tmpvar_1;
  tmpvar_1.w = 1.0;
  tmpvar_1.xyz = _glesVertex.xyz;
  xlv_TEXCOORD0 = ((unity_ObjectToWorld * _glesVertex).xyz - _LightPositionRange.xyz);
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_1));
  xlv_TEXCOORD1 = ((_glesMultiTexCoord0.xy * _MainTex_ST.xy) + _MainTex_ST.zw);
  xlv_TEXCOORD3 = ((_glesMultiTexCoord0.xy * _OutlineTex_ST.xy) + _OutlineTex_ST.zw);
  xlv_TEXCOORD2 = (((1.0 - 
    (_OutlineWidth * _ScaleRatioA)
  ) - (_FaceDilate * _ScaleRatioA)) / 2.0);
}


#endif
#ifdef FRAGMENT
uniform highp vec4 _LightPositionRange;
uniform highp vec4 unity_LightShadowBias;
uniform sampler2D _MainTex;
varying highp vec3 xlv_TEXCOORD0;
varying highp vec2 xlv_TEXCOORD1;
varying highp float xlv_TEXCOORD2;
void main ()
{
  lowp vec4 tmpvar_1;
  tmpvar_1 = texture2D (_MainTex, xlv_TEXCOORD1).wwww;
  highp float x_2;
  x_2 = (tmpvar_1.w - xlv_TEXCOORD2);
  if ((x_2 < 0.0)) {
    discard;
  };
  highp vec4 tmpvar_3;
  tmpvar_3 = fract((vec4(1.0, 255.0, 65025.0, 1.658138e+07) * min (
    ((sqrt(dot (xlv_TEXCOORD0, xlv_TEXCOORD0)) + unity_LightShadowBias.x) * _LightPositionRange.w)
  , 0.999)));
  highp vec4 tmpvar_4;
  tmpvar_4 = (tmpvar_3 - (tmpvar_3.yzww * 0.003921569));
  gl_FragData[0] = tmpvar_4;
}


#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
CustomEditor "TMPro.EditorUtilities.TMP_SDFShaderGUI"
}