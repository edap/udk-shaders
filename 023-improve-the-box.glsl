#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

// 1) let's call the vec2 parameter position
bool myShape(vec2 pos){
    return pos.x > -0.25 && pos.x < 0.25 && pos.y > -0.25 && pos.y < 0.25;
}

// 2) the side of the square can be a parameter
bool myShape(vec2 pos, float side){
    return pos.x > -side && pos.x < side && pos.y > -side && pos.y < side;
}

// 3) x and y can be defined separately, we could have a box function that is able
// to draw also rectangle!
bool myShape(vec2 pos, vec2 box){
    return pos.x > -box.x && pos.x < box.x && pos.y > -box.y && pos.y < box.y;
}

void main(){
    // 1) move the origin of the x and y axis to the center of the screen.
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    // keep the square with the right proportion
    coord.x *= u_resolution.x / u_resolution.y;

    vec4 color;
    //if(myShape(coord) ){
    if(myShape(coord, 0.05) ){
    //if(myShape(coord, vec2(0.1, 0.44) )){
    
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