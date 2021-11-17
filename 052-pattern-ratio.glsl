#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;

    // 1)try to use coord space that goes from -1 to +1
    //vec2 st=2.*gl_FragCoord.xy/u_resolution.xy-1.;
    //st.x*=u_resolution.x/u_resolution.y;

    // Hey, wait! each tile has the center (0,0) at the bottom left corner!
    // why? well, fract always returns the POSITIVE fractional
    // part of a number. Does it make sense then to center the origin?
    // no. but keeping the proportion probably yes

    // from now on, let's use this origin
    //vec2 st=gl_FragCoord.xy/u_resolution;
    //st.x*=u_resolution.x/u_resolution.y;
    
    vec3 color=vec3(0.);
    st*=2.;
    st=fract(st);

    color=vec3(st,0.);
    gl_FragColor=vec4(color,1.);
}