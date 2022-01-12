#ifdef GL_ES
precision mediump float;
#endif

// Main reference https://thebookofshaders.com/10/

uniform vec2 u_resolution;

void main(){
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    // 1
    vec3 col = vec3(st.x);

    // 2 How to add randomness?
    // let's start with a sin wave. It oscillates from -1.0 to 1.0
    // fract return the fractional part of a number
    // let's try this.
    col =vec3( fract(sin(st.x)*1.0) );
    // Nothing change, right?

    // 3 But what if we change the amplitude of the sin wave?
    col =vec3( fract(sin(st.x)*7.0) );
    // some strips are larger than others

    // 4 make the number big!
    col =vec3( fract(sin(st.x)*10000.0) );

    // 5 make a file called random.glsl and put it in your lib folder.

    gl_FragColor=vec4(col, 1.0);
}
