#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D   u_buffer0;
uniform sampler2D   u_buffer1;
uniform vec2        u_resolution;

float circle(vec2 coord, float radius) {
    return length(coord) - radius;
}


void main() {
    vec2 st = gl_FragCoord.xy/u_resolution;

#ifdef BUFFER_0
    // PING BUFFER
    //
    //  Note: Here is where most of the action happens. But need's to read
    //  te content of the previous pass, for that we are making another buffer
    //  BUFFER_1 (u_buffer1)

    // read the previous buffer
    // sample the previous buffer, shifting the coordinates
    // using noise
	//vec2 st = gl_FragCoord.xy / u_resolution.xy;

	// float rx = st.x *= (0.999 );
	// float ry = st.y *= (0.99);

    // 2 try to change st
    //st.y *= 0.97;
    vec4 old = texture2D(u_buffer1, st);
  
    // decrease, so that it will tend to disappear
	// 1 change this value
    old*= 0.9;

    float cir = circle(st - vec2(0.5), 0.2);
    vec4 new = vec4(vec3(cir), 1.0);
    gl_FragColor = new+old;



#elif defined( BUFFER_1 )
    // PONG BUFFER
    //
    //  Note: Just copy the content of the BUFFER0 so it can be 
    //  read by it in the next frame
    //
    gl_FragColor = texture2D(u_buffer0, st);

#else
    // Main Buffer
    // this is what we see
    
    gl_FragColor = texture2D(u_buffer1, st);
#endif
}