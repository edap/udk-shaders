#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

bool myShape(vec2 coord){
    // 3) change the limit of the function
    return coord.x > -0.25 && coord.x < 0.25 && coord.y > -0.25 && coord.y < 0.25;
}

void main(){
    // 1) move the origin of the x and y axis to the center of the screen.
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    // keep the square with the right proportion
    coord.x *= u_resolution.x / u_resolution.y;

    vec4 color;
    if(myShape(coord) ){
        color = vec4(1.0, 1.0, 1.0, 1.0);
    }else{
        color = vec4(1.0, 0.0, 0.0, 1.0);
    };


    // 2) check the new center of the world!
    // why the black spot in the left bottom part of the screen?
    //gl_FragColor=vec4(coord.x, coord.y, 0.0, 1.0);


    // 5) try to resize the screen
    gl_FragColor=color;
    
}