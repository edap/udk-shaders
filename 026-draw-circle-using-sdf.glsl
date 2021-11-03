#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

// 2 return a float
// bool myCircle(vec2 pos, float radius){
//     float d = length(pos) -radius;
//     // 1 try to change
//     //return d > 0.5;
//     return d < 0.0;
// }

float myCircle(vec2 pos, float radius){
    return length(pos) * 2.0 -radius;
}

void main(){
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    coord.x *= u_resolution.x / u_resolution.y;

    // 1 introduce the mix function
    vec4 colorA = vec4(1.0, 1.0, 1.0, 1.0);
    vec4 colorB = vec4(1.0, 0.0, 0.0, 1.0);
    //vec4 color = mix(colorA, colorB, coord.x);
    vec4 color = mix(colorA, colorB, myCircle(coord, 0.5));


    gl_FragColor=color;
    
}