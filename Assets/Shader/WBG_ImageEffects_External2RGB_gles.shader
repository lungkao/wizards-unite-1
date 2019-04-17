Shader "WBG/ImageEffects/External2RGB" {
Properties {
_UvTopLeftRight ("UV of top corners", Vector) = (0,1,1,1)
_UvBottomLeftRight ("UV of bottom corners", Vector) = (0,0,1,0)
}
SubShader {
 Tags { "QUEUE" = "Geometry" }
 Pass {
  Tags { "QUEUE" = "Geometry" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 22000
Program "vp" {
}
Program "fp" {
}
}
}
}