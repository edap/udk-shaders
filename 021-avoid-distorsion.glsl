#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

// introduce functions, introduce boolean logic
bool myShape(vec2 coord){
    return coord.x > 0.25 && coord.x < 0.75 && coord.y > 0.25 && coord.y < 0.75;
}

void main(){
    vec2 coord = gl_FragCoord.xy / u_resolution;

    // keep the square with the right proportion
    coord.x *= u_resolution.x / u_resolution.y;

    // in one line you can also write
    //vec2 coord = gl_FragCoord.xy / u_resolution.y;

    vec4 color;
    if(myShape(coord) ){
        color = vec4(1.0, 1.0, 1.0, 1.0);
    }else{
        color = vec4(1.0, 0.0, 0.0, 1.0);
    };


    // debug the value of coord.x and coord.y when necessary
    //gl_FragColor=vec4(coord.y, 0.0, 0.0, 1.0);
    gl_FragColor=color;
    
}