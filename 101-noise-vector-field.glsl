// https://www.shadertoy.com/view/llVyWw

#ifdef GL_ES
precision mediump float;
#endif

#include "./libs/random.glsl"

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// what if we use the float noise() function to create a function that returns noised vectors?
// based on McGuire noise
vec2 vectorField(vec2 uv){
  vec2 res = uv;
  float n = noise(res*vec2(3.0));
  // 2 Can you add time to it?
  //res.y -= time*0.05;
  res += sin(res.yx*40.) * 0.02;
  res += vec2(n);

  // normalize the vector
  return res;
}

float plot(float val, float c, float t){
  float l = smoothstep(c,c-t,val);
  float r = smoothstep(c,c-t/5.,val);
  return r-l;
}

void main(){
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    st *= 4.0;
    // try just print this color
    st = vectorField(st);
    //

    vec2 m = u_mouse.xy / u_resolution.xy;
    float cell = 0.2 + m.y*0.3;
    vec2 modSt = mod(st, vec2(cell));

    // we have seen the plot function when we have learned
    // smoothstep. File 032-draw_line.glsl
    float x = plot(modSt.x, cell, 0.1);
    float y = plot(modSt.y, cell, 0.1);

    vec3 col = vec3(0.);
    //col = vec3(cell, 0., 1.);
    //col = vec3(modSt, 1.0);
    //col = vec3(x, 0., 1.);
    //col = vec3(y, 0., 1.);

    // let's add some colors

    // vec3 bgCol = vec3(0.1,0.9,0.9);
    // vec3 col = vec3(0.9,0.5,0.03) * x;
    // col     += vec3(0.95,0.3,0.) * y;
    // col     += bgCol*vec3(smoothstep(1.7, .01,x+y));

    gl_FragColor = vec4(col, 1.0);
}