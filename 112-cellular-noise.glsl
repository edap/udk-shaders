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
    st *= 3.;
    vec2 i_st = floor(st);
    vec2 f_st = fract(st);

    // 4 as you see, the border between the tiles are not smoothed.
    // We still need to check the distances to the points in the surrounding tiles,
    // not just the one in the current tile. For that we need to iterate through the neighbor tiles.
    // Not all tiles, just the ones immediately around the current one. 
    // That means from -1 (left) to 1 (right) tile in x axis and -1 (bottom) to 1 (top) in y axis.
    // A 3x3 region of 9 tiles can be iterated through using a double for loop (AKA a nested loop).

    float m_dist = 1.;  // minimum distance

    for (int y= -1; y <= 1; y++) {
        for (int x= -1; x <= 1; x++) {
            // Neighbor place in the grid
            vec2 neighbor = vec2(float(x),float(y));

            // Random position from current + neighbor place in the grid
            vec2 point = random2d(i_st + neighbor);

			// 5) Animate the point
            //point = 0.5 + 0.5*sin(u_time + 6.2831*point);

			// Vector between the pixel and the point
            vec2 diff = neighbor + point - f_st;

            // Distance to the point
            float dist = length(diff);

            // Keep the closer distance
            m_dist = min(m_dist, dist);
        }
    }

    // Draw the min distance (distance field)
    color += m_dist;


    // 6) some helper to debug what is going on
    // Draw cell center
    //color += 1.-step(.02, m_dist);

    // Draw grid
    //color.r += step(.98, f_st.x) + step(.98, f_st.y);

    // Show isolines
    // color -= step(.7,abs(sin(27.0*m_dist)))*.5;

    
    // Exercises
    // try to deform the coord field before to devide it in cells
    // think about other way to animate the dots
    // is there any other way to represent the distance, other than m_dist = min(m_dist, dist); ?
    // could you try to use other functions?


    gl_FragColor = vec4(color, 1.0);
}