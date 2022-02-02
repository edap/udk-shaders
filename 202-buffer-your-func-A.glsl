#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D   u_buffer0;
uniform sampler2D   u_buffer1;
uniform vec2        u_resolution;
uniform float       u_time;

#define FRACTURE(x) texture2D(u_buffer1, fract((x)/u_resolution))
// FRACTURE take a vec2 as argument and returns a vec4, it samples a portion of the buffer_1 texture using fract()
// Yes! you can try several functions to sample your texture!

#define S c+=FRACTURE(gl_FragCoord.xy-c.xy)*2.-.6;

// callig S is a function that replace the value of c
// is like
// vec4 S(vec4 c){
//    c+=FRACTURE(gl_FragCoord.xy-c.xy)*2.-.6;
//}
// c = S(c);

// But why do we write it in this way? Because then we can chain more call to S in an easy way.

float circle(vec2 coord, float radius) {
    return length(coord) - radius;
}

void main() {
    float waveScale = 1.1;
    float sourcePersistence = 0.99;
    vec4 color = vec4(0.0);
    vec2 uv = gl_FragCoord.xy/u_resolution;

    vec4 old = texture2D(u_buffer1, uv);
    vec4 new = texture2D(u_buffer0, uv);

#ifdef BUFFER_0
    vec2 coord = (gl_FragCoord.xy/u_resolution - 0.5) * 2.0;
    float test = 2.4;
    // c is simply offsetting the coordinate system using u_time
    vec4 c = (coord*0.75).xxyy * (sin(u_time*0.5));
    
    S S S S S S 
    c = mix(FRACTURE(gl_FragCoord.xy+c.xy), fract(c/vec4(test)).argb, .1);
   
    old *= sourcePersistence;
    old *= 1.0 - waveScale;
    old += clamp(c, 0., 1.) * waveScale;
    color = new*(1.0-sourcePersistence) + old;

    // now try to mix the two buffers again
    //color = mix(color, new, 0.2);

    // draw a simple circle as we already did many times
    vec2 off = vec2(0.);
    // animate the circle
    //off = vec2(sin(u_time), cos(u_time)) * 0.2;
    float cir = circle(coord + off, 0.3);
    vec4 circle = vec4(vec3(cir), 1.0);

    // now add the color on top of the old one
    gl_FragColor = circle+color;


#elif defined( BUFFER_1 )
    gl_FragColor = texture2D(u_buffer0, uv);

#else    
    gl_FragColor = texture2D(u_buffer1, uv);
#endif
}