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


    st*=2.;
    st=fract(st);

    // let's use a color that help us to debug
    // the coord sistem
    vec3 color=vec3(st, 0.);
    vec3 boxColor = vec3(1.);

    //1 draw a box
    float box = fill(box(st, vec2(0.2)), 0.001);

    // 2 what if I want to have it in the middle of the screen?
    //vec2 boxPos = st - vec2(0.5, 0.5);
    //float box = fill(box(boxPos, vec2(0.2)), 0.001);

    // 3 what if I want to rotate it?
    // vec2 boxPos = st - vec2(0.5, 0.5);
    // boxPos = rotate2d(sin(u_time) * PI) * boxPos;
    // float box = fill(box(boxPos, vec2(0.2)), 0.001);

    // Exercise!
    // can you deform the coordinate field after the tiling?

    
    color = mix(boxColor, color, box);
    gl_FragColor=vec4(color,1.);
}