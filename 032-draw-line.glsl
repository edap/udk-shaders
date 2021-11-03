#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

float plot_x_vals(vec2 st, float pct){
    return  smoothstep( pct-0.02, pct, st.y) -
            smoothstep( pct, pct+0.02, st.y);
}

void main(){
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    coord.x *= u_resolution.x / u_resolution.y;

    float line = plot_x_vals(coord, 0.0);

    vec4 color = mix(vec4(1.0, 0.0, 0.0, 1.0),vec4(0.0667, 0.0, 1.0, 1.0), line);
    gl_FragColor = color;
}