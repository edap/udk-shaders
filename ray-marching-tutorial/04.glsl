precision mediump float;
uniform vec2        u_resolution;

// how many marching steps
const int MAX_MARCHING_STEPS = 64;
const float EPSILON = 0.01;

// let's use the SDF function for plane and sphere
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

// This is the scene, let's try a box instead of a sphere,
// or a rounded box
float map(vec3 pos){
    //return min(plane(pos), sphere(pos, 2.0));
    //return min(plane(pos), box(pos, vec3(2.0)));
    // 1) make the box rounded
    return min(plane(pos), roundedBox(pos, vec3(2.0), 0.8));
}


void main(){
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;

    vec3 pos = vec3(0.0, 5.0, -10.);
    //2) move the camera around
    //vec3 pos = vec3(sin(iGlobalTime), 5.+sin(iGlobalTime*0.7) * 3.0, -10.);
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