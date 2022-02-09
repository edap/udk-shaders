// Playing with space, cos, sin, mod, abs
// https://www.youtube.com/watch?v=s6t0mJsgUKw

precision mediump float;
uniform vec2        u_resolution;

const int MAX_MARCHING_STEPS = 64;
const float EPSILON = 0.01;

float plane(vec3 pos){
    return pos.y;
}

float sphere(vec3 pos, float radius){
    return length(pos) - radius;
}

float box(vec3 pos, vec3 size){
    return length(max(abs(pos) - size, 0.0));
}

float roundedBox(vec3 pos, vec3 size, float radius){
    return length(max(abs(pos) - size, 0.0)) - radius;
}

float map(vec3 pos){
    // 1) uncomment and move things around
    //vec3 boxPos = pos - vec3(sin(iGlobalTime), 0., 0.);
    //return min(plane(pos), roundedBox(boxPos, vec3(2.0),0.8));

    // 2) ok, now pay attention. here we are getting the plane as we did beofre
    // but we get the position of the box using the modulo function
    float planeDist = plane(pos);
    float offset = 20.;
    //pos = mod(pos, offset);
    
    // 3) as you see, the boxes are messed up, because the position of the box is
    // in the middle. Let's fix this
    pos = mod(pos + offset/2., offset) - offset/2.;
    return min(planeDist, roundedBox(pos, vec3(2.0),0.8));

}


void main(){
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;

    vec3 pos = vec3(0.0, 5.0, -10.);
    //vec3 pos = vec3(sin(iGlobalTime * 0.2) * 4.0, 5. +sin(iGlobalTime*0.4) * 3.0, -10.);
    vec3 dir = normalize(vec3(uv, 1.0));

    vec3 color = vec3(0.0);

    for (int i = 0; i < MAX_MARCHING_STEPS; i++) {
        float d = map(pos);
        if (d < EPSILON){
            color = fract(pos * 0.5);
            break;
        }

        pos += d * dir;
    }

    gl_FragColor = vec4(color, 1.0);
}