#ifdef GL_ES
precision mediump float;
#endif

#include "./libs/random.glsl"

uniform vec2 u_resolution;
uniform float u_time;

// 4 lets define a random function that takes a vec2 as input
float rand (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}

void main(){
    //vec2 mouse = u_mouse.xy / u_resolution.xy
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    //1
    float c = rand(st.x);
    
    // 2 try out several combination
    //c = rand(st.x)*rand(st.x);
    //c = sqrt(rand(st.x));
    //c = pow(rand(st.x),5.);

    // 3 Ok. But how can we implement the random function in 2d?, to both the x and y?

    // we need a way to return a float starting from a 2d vector.
    // there is function in glsl that takes a vec2 and returns a float
    // and it is the dot function. the dot function returns the dot product between two vectors.
    // that means, for example, that taking vec2 a and vec2 b,
    // the dot product returns a.x⋅b.x + a.y⋅b.y
    // https://kidscancode.org/godot_recipes/math/dot_cross_product/
    // https://thebookofshaders.com/glossary/?search=dot

    c = rand( st );

    // 5 exercises
    // try to change the values in the rand function above
    // try to make your own random function. It's ok if it contains repetition that you like ;)

    // 6 pass add u_time to st as parameter
    // vec2 sst = st;
    // sst.x += u_time * 0.000001;
    // c = rand( sst );

    gl_FragColor=vec4(vec3(c), 1.0);
}
