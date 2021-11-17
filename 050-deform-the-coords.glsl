
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

float box(vec2 p,vec2 b ){
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}

float fill(float dist, float size){
  return smoothstep(-size, +size, dist);
}

void main(){
    vec2 st = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    st.x *= u_resolution.x / u_resolution.y;

    // 1) what if we add a wave to the x axis?
    //st.x += sin(st.y * 6.2)* 0.2;

    // 2) and to the y axis?
    //st.y += sin(st.x * 6.2)* 0.2;

    // 3) can you imagine to deform the coord system, using others function than cos and sin ?
    //st.y += fract(st.x * 22.2);

    float pct = box(st, vec2(0.25));
    pct = fill(pct, 0.001);
    vec4 color = mix(vec4(1.0), vec4(0.0,0.0,0.0,1.0),pct);

    // 2)let's inspect the deformation
    //color = vec4(st.x, st.y, 0.0, 1.0);

    gl_FragColor = color;
}