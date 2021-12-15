#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_tex0;

// The texture coordinates stored in v_texcoord indicate
// which pixel of the texture the fragment shader should process.

// the value of v_texcoord is created in the vertex shader
// the extension glslCanvas is creating it for us
varying vec2 v_texcoord;

void main(){
    gl_FragColor=texture2D(u_tex0,v_texcoord);
}