#ifdef GL_ES
precision mediump float;
#endif

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
    vec2 st=gl_FragCoord.xy/u_resolution;
    st.x*=u_resolution.x/u_resolution.y;


    st*=4.;
    // 1
    // lets' make a brick tile
    // if y % 2 ==0 I should offset x by 0.5, otherwise no.
    // How can I do this?
    vec2 offset;
    // if (mod(st.y, 2.0) < 1.0){
    //     st.x += .5;
    // }

    // 2
    // This is cool. Can we write it without branch condition? using step?
    // yes
    st.x += step(1., mod(st.y,2.0)) * 0.5;

    // Exercise!
    // 1)move the offset according to time. can you make the rows slide left and right?
    // 2) can you do this wall effect using columns instead of rows?
    // 3) Find online a pattern that you like
    // try to copy it

    //
    st=fract(st);

    vec3 color=vec3(st, 0.);
    vec3 boxColor = vec3(1.);
    vec2 boxPos = st - vec2(0.5, 0.5);
    float box = fill(box(boxPos, vec2(0.4, 0.25)), 0.001);
    
    color = mix(boxColor, color, box);
    gl_FragColor=vec4(color,1.);
}