#ifdef GL_ES
precision mediump float;
#endif

#include "./libs/random.glsl"

uniform float u_time;
uniform vec2 u_resolution;

uniform vec2 u_mouse;


void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;

    float scale = 4.0;
    vec2 pos = vec2(st*scale);

    // Notes for the teacher, explain Perlin intuition
    // for simplex noise

    // Use the simplex noise function
    float n = snoise(pos);

    // Try to animate some stroke of a pencil on a canvas
    // hint, start with the rectangle, draw noised border
    // now move the rectangle and change its length
    // add more strokes
    gl_FragColor = vec4(vec3(n), 1.0);
}
    
