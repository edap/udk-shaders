// https://thebookofshaders.com/12/

#ifdef GL_ES
precision mediump float;
#endif

#include "./libs/random.glsl"

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// A faster approach. Let's devide the screen into tiles, not every pixel needs to check the distance to every single point.
// we can subdivide the space into cells, each one with one unique point to watch. 
// an image to explain it https://www.the-scientist.com/image-of-the-day/image-of-the-day--scrambled-frog-eggs--66681
// In two words, it is noised applied to cell structures.

// How does it work? for each cell, it needs to calculate the distance to the other cell.
// the color of the pixels between the cells depends on the distance between the points




void main(){
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    vec3 color = vec3(.0);

    // 1) let's tile the space
    // Scale
    st *= 3.;

    // Tile the space
    vec2 i_st = floor(st);
    vec2 f_st = fract(st);

    // 2) We will use the tile coordinates (stored in the integer coordinate, i_st)
    // to construct a random position of a point.
    // remember to copy the random.glsl file from our repo
    vec2 point = random2d(i_st);

    // 3 Each pixel inside that tile (stored in the float coordinate, f_st)
    // will check their distance to that random point.
    vec2 diff = point - f_st;
    float dist = length(diff);
    color = vec3(dist);

    
    gl_FragColor = vec4(color, 1.0);
}