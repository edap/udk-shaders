#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_tex0;
uniform vec2 u_resolution;


void main(){
    vec2 coord = gl_FragCoord.xy/ u_resolution.xy;
    // flip vertically
    //coord = vec2(coord.x, 1.0 - coord.y);

    // flip horizzontally
    //coord = vec2(1.0 - coord.x, coord.y);

    // Exercise:
    // 1) giving all the transformations of the coordinate
    // field that you have learned in the previous
    // lessons, what else you could try?

    // 2) can you try to make a multilayer patterns
    // that use a texture and some custom shape?


    vec3 tex = texture2D(u_tex0,coord).xyz;
    gl_FragColor=vec4(tex, 1.0);
}