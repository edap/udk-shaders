#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_tex0;
uniform vec2 u_resolution;


void main(){
    vec3 tex = texture2D(u_tex0,gl_FragCoord.xy/ u_resolution.xy).xyz;
    gl_FragColor=vec4(tex, 1.0);
}