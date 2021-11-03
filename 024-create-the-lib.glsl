#ifdef GL_ES
precision mediump float;
#endif

// create a lib folder and place a box function in it
#include "./libs/box.glsl"
uniform vec2 u_resolution;


void main(){
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    coord.x *= u_resolution.x / u_resolution.y;

    vec4 color;
    if(rect(coord, vec2(0.1, 0.44) )){
    
        color = vec4(1.0, 1.0, 1.0, 1.0);
    }else{
        color = vec4(1.0, 0.0, 0.0, 1.0);
    };

    gl_FragColor=color;
    
}