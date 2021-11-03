#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;


bool myCircle(vec2 pos, float radius){
    float d = length(pos) * 2.0 -radius;
    // 1 try to change
    //return d > 0.5;
    return d < 0.0;
}

void main(){
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    coord.x *= u_resolution.x / u_resolution.y;

    vec4 color;
    if(myCircle(coord, 0.5) ){
        color = vec4(1.0, 1.0, 1.0, 1.0);
    }else{
        color = vec4(1.0, 0.0, 0.0, 1.0);
    };

    gl_FragColor=color;
    
}