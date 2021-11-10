
#ifdef GL_ES
precision mediump float;
#endif

// 1) how to define constant? what is a constant? why is it written in capital?
// Why PI, why rotations are in radians and not in degree?
#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

float box(vec2 p,vec2 b ){
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}

float fill(float dist, float size){
  return smoothstep(-size, +size, dist);
}

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

mat2 scale(vec2 _scale){
    return mat2(_scale.x,0.0,
                0.0,_scale.y);
}



void main(){
    vec2 st = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    st.x *= u_resolution.x / u_resolution.y;

    // 1) Rotate
    st = rotate2d( sin(u_time)*PI ) * st;
    // 2) Scale
    st = scale( vec2(sin(u_time)+1.0) ) * st;
    // 3) Translate
    st += vec2(sin(u_time), 0.0);

    // what happens if you invert the order of the operations?
    // do the result change? can you explain why?


    float pct = box(st, vec2(0.15));
    pct = fill(pct, 0.02);
    vec4 color = mix(vec4(1.0), vec4(0.0,0.0,0.0,1.0),pct);

    // 2)let's see how it moves
    //color = vec4(st.x, st.y, 0.0, 1.0);
    gl_FragColor = color;
}