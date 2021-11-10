
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

    // We use matrices to move and rotate things around.


    // or, more precisely, we move the coordinate system.
    //vec2 translate = vec2(cos(u_time),sin(u_time));
    vec2 translate = vec2(cos(u_time),0.0);
    // 1) uncomment this line to see it moving
    //st += translate*0.35;

    // Let's draw a box
    float pct = box(st, vec2(0.25));
    pct = fill(pct, 0.001);
    vec4 color = mix(vec4(1.0), vec4(0.0,0.0,0.0,1.0),pct);

    // 2)let's see how it moves
    //color = vec4(st.x, st.y, 0.0, 1.0);

    gl_FragColor = color;
}