#ifdef GL_ES
precision mediump float;
#endif

// can I use some of the function that we have just learned, to make the circle smoother?
uniform vec2 u_resolution;

float myCircle(vec2 pos, float radius){
    return length(pos) -radius;
}

float fill(float dist){
  // gross
  //return step(0.1, dist);
  // fine
  return smoothstep(-0.1, 0.1, dist);
}

// pass a thikness parameter
float fill(float dist, float size){
  return smoothstep(-size, +size, dist);
}

float stroke(float x, float size, float t) {
    float a = smoothstep(-size, +size, x+t *0.5);
    float b = smoothstep(-size, +size, x-t *0.5);
    return a - b;
}

void main(){
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    coord.x *= u_resolution.x / u_resolution.y;

    float circle = myCircle(coord, 0.3);
    //circle = fill(circle);
    //circle = stroke(circle, 0.01, 0.1);

    vec4 colorA = vec4(1.0, 1.0, 1.0, 1.0);
    vec4 colorB = vec4(1.0, 0.0, 0.0, 1.0);
    vec4 color = mix(colorA, colorB, circle);


    gl_FragColor=color;
    
}

// via http://hughsk.io/fragment-foundry/chapters/07-distance-fields.html
// To start: a distance function takes a point as input and returns the distance from a surface as output. In GLSL, you'd mark up a 2D Distance Function like so:

// float distanceFn(vec2 position);

// A signed distance function (SDF) is very similar, but it returns a negative value when it's inside the surface. You can now very quickly draw out that shape in 2D by checking if the SDF's value is less than zero.