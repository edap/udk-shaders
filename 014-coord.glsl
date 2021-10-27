#ifdef GL_ES
precision mediump float;
#endif

// what is a uniform? why is it called like this?
uniform vec2 u_resolution;

void main(){
    // gl_FragCoord. What it does represent?
    // what there is inside the u_resolution uniform?
    // what does it mean a "normalized" variable?
    // what does it mean "screen space coordinates"?
    vec2 coord = gl_FragCoord.xy / u_resolution;
    gl_FragColor=vec4(coord.xy, 0.0, 1.0);

    
}