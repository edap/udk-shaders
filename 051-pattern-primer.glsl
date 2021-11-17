#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    vec3 color=vec3(0.);
    // 1)try to multiply the coord system
    //st*=5.;
    st=fract(st);

    // 2) what is happening??
    // well, fract is returning the fractional part of a number, therefore
    // the number after the comma. The fractional part is ALWAYS a positive number, keep this in mind
    color=vec3(st,0.);
    gl_FragColor=vec4(color,1.);
}