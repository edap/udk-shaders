#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;

void main(){
    // what is a wave? sin gif, explain amplitude and frequency and
    // how to use them to manipulate a wave
    float ampl = 0.5;
    float freq = 2.2;
    float red = cos(u_time * freq) * ampl;

    gl_FragColor=vec4(red, 0.0, 0.0, 1.0);
    
}