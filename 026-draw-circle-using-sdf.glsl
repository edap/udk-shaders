#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

// 2 return a float instead of a bool. Why are float better?
// they are more flexible and they allow us to do a lot of things more.
// bool myCircle(vec2 pos, float radius){
//     float d = length(pos) -radius;
//     // 1 try to change
//     //return d > 0.5;
//     return d < 0.0;
// }

float myCircle(vec2 pos, float radius){
    return length(pos) -radius;
}

void main(){
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    coord.x *= u_resolution.x / u_resolution.y;

    // 1 introduce the mix function
    vec4 colorA = vec4(1.0, 1.0, 1.0, 1.0);
    vec4 colorB = vec4(1.0, 0.0, 0.0, 1.0);
    vec4 color = mix(colorA, colorB, myCircle(coord, 0.5));


    gl_FragColor=color;
    
}

// via http://hughsk.io/fragment-foundry/chapters/07-distance-fields.html
// To start: a distance function takes a point as input and returns the distance from a surface as output. In GLSL, you'd mark up a 2D Distance Function like so:

// float distanceFn(vec2 position);

// A signed distance function (SDF) is very similar, but it returns a negative value when it's inside the surface. You can now very quickly draw out that shape in 2D by checking if the SDF's value is less than zero.