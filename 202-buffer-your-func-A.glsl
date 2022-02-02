#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D   u_buffer0;
uniform sampler2D   u_buffer1;
uniform vec2        u_resolution;
uniform float       u_time;

vec4 fracture(vec2 x){
    return texture2D(u_buffer1, fract((x)/u_resolution));
}

float circle(vec2 coord, float radius) {
    return length(coord) - radius;
}


void main() {
    float waveScale = 1.1;
    float contribution = 0.1; // how much the new texture is affecting the old one
    vec4 color = vec4(0.0);
    vec2 uv = gl_FragCoord.xy/u_resolution;

    vec4 old = texture2D(u_buffer1, uv);
    vec4 new = texture2D(u_buffer0, uv);

#ifdef BUFFER_0
    vec2 coord = (gl_FragCoord.xy/u_resolution - 0.5) * 2.0;

    // START

    float test = 2.6;
    // c is simply offsetting the coordinate system using u_time
    // using a vec4 for the coord system allow us to use it later
    // as a color

    // 1
    //vec4 c = (coord*0.75).xxyy * (sin(u_time*0.5));
    vec4 c = (coord*0.75).xxyy;
    color = c;
    // END 1, remove color = c

    c += fracture(gl_FragCoord.xy-c.xy) * 2.7 -6.;
    // TODO, what if you animate the -6 value?
    // we get the value of c sampling again the texture and mixing it with the
    // fract of its coordinate(swizzled)
    c = mix(fracture(gl_FragCoord.xy+c.xy), fract(c/vec4(test)).argb, .1);
   

    old *= 0.01;
    old += clamp(c, 0., 1.);
    color = new*(contribution) + old;

    // END

    // try to mix the two buffers again
    //color = mix(color, new, 0.2);

    // draw a simple circle as we already did many times
    vec2 off = vec2(0.);
    // animate the circle
    off = vec2(sin(u_time), cos(u_time)) * 0.2;
    float cir = circle(coord + off, 0.3);
    vec4 circle = vec4(vec3(cir), 1.0);

    // now add the circle over the color
    gl_FragColor = color+circle;


#elif defined( BUFFER_1 )
    gl_FragColor = texture2D(u_buffer0, uv);

#else    
    gl_FragColor = texture2D(u_buffer1, uv);
#endif
}