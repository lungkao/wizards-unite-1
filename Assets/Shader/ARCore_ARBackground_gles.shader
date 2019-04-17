Shader "ARCore/ARBackground" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_UvTopLeftRight ("UV of top corners", Vector) = (0,1,1,1)
_UvBottomLeftRight ("UV of bottom corners", Vector) = (0,0,1,0)
}
SubShader {
 Pass {
  ZWrite Off
  GpuProgramID 33429
Program "vp" {
}
Program "fp" {
}
}
}
}