#ifdef GL_ES
precision mediump float;
#endif

#include "./libs/random.glsl"

uniform sampler2D   u_buffer0;
uniform sampler2D   u_buffer1;

uniform vec2        u_resolution;
uniform vec2        u_mouse;
uniform float       u_time;


float circle(vec2 coord, float radius) {
    return length(coord) - radius;
}

float stroke(float x, float size, float t) {
    float a = smoothstep(-size, +size, x+t *0.5);
    float b = smoothstep(-size, +size, x-t *0.5);
    return a - b;
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;

#ifdef BUFFER_0
    // let's sample the buffer 1 using noise to offset the sampler
    vec2 noisedSt = st;
    noisedSt += noise(
        vec2(
            st.x+sin(u_time * 0.1) * 2.0,
            st.y+cos(u_time * 0.1)
        )
    ) * 0.01;


    vec4 old = texture2D(u_buffer1,noisedSt);
    // depending on how many frame per seconds you have, the circle will
    // tend to disappear. Try to change this value between 0.9 and 0.99
    old*= 0.96;

    // Exrcises:
    // 1 can you think to another way to animate your sketch
    float cir = circle(noisedSt -vec2(0.5), 0.2);
    cir = stroke(cir, 0.01, 0.002);
    vec4 new = vec4(vec3(cir), 1.0);
    gl_FragColor = new+old;


#elif defined( BUFFER_1 )
    gl_FragColor = texture2D(u_buffer0, st);
#else
    gl_FragColor = texture2D(u_buffer1, st);
#endif
}