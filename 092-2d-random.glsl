#ifdef GL_ES
precision mediump float;
#endif

#include "./libs/random.glsl"

uniform vec2 u_resolution;
uniform float u_time;

// trick to devide the screen in cell and give to each cell a random id

// P.S. do you remember this one? we did it with the truchet pattern!

void main(){
    //vec2 mouse = u_mouse.xy / u_resolution.xy
    vec2 st = gl_FragCoord.xy / u_resolution.xy;

    st *= 5.0; // Scale the coordinate system by 10
    vec2 ipos = floor(st);  // get the integer coords
    vec2 fpos = fract(st);  // get the fractional coords

    // Assign a random value based on the integer coord
    vec3 color = vec3(rand( ipos ));

    // Uncomment to see the subdivided grid
    //color = vec3(fpos,0.0);

    // exercise,
    // 1 can you use the random id tick to introduce randomness in a pattern?
    // 2 can you think about a sketch that uses random but more then 2 colors?
    gl_FragColor=vec4(vec3(color), 1.0);
}