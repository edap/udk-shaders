// https://thebookofshaders.com/12/

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// 1 what is cellular noise?
// an image to explain it https://www.the-scientist.com/image-of-the-day/image-of-the-day--scrambled-frog-eggs--66681
// In two words, it is noised applied to cell structures.

// How does it work? for each cell, it needs to calculate the distance to the other cell.
// the color of the pixels between the cells depends on the distance between the points





void main(){
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    vec3 color = vec3(.0);

    // 2
    // let's define 5 points, that act as cells.
    // we need an array
    vec2 point[5];
    point[0] = vec2(0.83,0.75);
    point[1] = vec2(0.60,0.07);
    point[2] = vec2(0.28,0.64);
    point[3] =  vec2(0.31,0.26);
    point[4] = u_mouse/u_resolution;



    // let's draw those points
    // how? well, we check which point is closer to st.
    // we start saying that the minimum distance is huge, like 1.0
    // and then we go through all the point, and for each of them we check the distance with
    // st. Is it smaller? then this is the new value of min dist.
    // When the loop is finished, min_dist contains the closest distance between st
    // and one of the points
    float min_dist = 1.0;
    for (int i = 0; i < 5; i++) {
        float dist = distance(st, point[i]);
        if(dist < min_dist){
            min_dist = dist;
        }

        // but this if condition is a bit silly
        // we could use min, that always return the smaller
        // between two numbers.
        //min_dist = min(min_dist, dist);
    }

    // now we use min_dist to color the pixel.
    color += min_dist;

    // Try to add more points. What happens? is your code slower or faster?
    // hint, click on the isobar icon on the bottom of the canvas

    // try to use u_time to animate the points

    
    gl_FragColor = vec4(color, 1.0);
}