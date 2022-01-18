#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;
uniform vec2 u_resolution;


float rand(float x){
    return fract(sin(x) * 100000.0);
}

void main(){
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    st *= 5.0;
    float i = floor(st.x);  // integer
    float f = fract(st.x);  // fraction

    // remember our random function?
    // integer part of a number
    float c = rand(i);

    //float part of a number?
    c = rand(f);

    // now, let's interpolate linearly the 2 values
    c = mix(rand(i), rand(i + 1.0), f);

    // do you remember the mix function?
    // https://thebookofshaders.com/glossary/?search=mix
    // mix(start_of_range, end_of_the_range, a value used to interpolate between the 2 ranges)

    // with smoothstep it can be even smoother
    c = mix(rand(i), rand(i + 1.0), smoothstep(0.,1.,f));

    // you have noticed that the third parameter in the previous mix function
    // is crucial.

    // online you may find various cubic formulas for curves
    // https://en.wikipedia.org/wiki/Cubic_plane_curve
    //instead of smoothstep, the book of shader present this one

    float u = f * f * (3.0 - 2.0 * f ); // custom cubic curve
    
    // Exercise:
    // can you came up with your own formula?
    // put it in a file called noise.glsl in your lib folder


    // draw a circle under the mouse position. Use noise to randomly deviate the circle from the mouse position
    // use time to animate it

    // combine at least 5 2D sdf functions togehter and use noise give them an organic look 

    c = mix(rand(i), rand(i + 1.0), u); // using it in the interpolation
    gl_FragColor=vec4(vec3(c), 1.0);
    
}