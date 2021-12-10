#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_tex0;
uniform vec2 u_resolution;


void main(){
    //vec3 tex = texture2D(u_tex0,gl_FragCoord.xy/ u_resolution.xy).xyz;
    //vec3 tex = texture2D(u_tex0,gl_FragCoord.xy/ u_resolution.xy).yxz;
    vec3 tex = texture2D(u_tex0,gl_FragCoord.xy/ u_resolution.xy).zyx;

    // Exercise:
    // 1) Try to animate a color change
    // 2) Try to animate the coord fields
    // 3) Try to use 3 textures, combine them together in a pattern.
    gl_FragColor=vec4(tex, 1.0);
}