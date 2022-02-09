// Now rotate it

precision mediump float;
uniform vec2        u_resolution;
uniform float u_time;

const int MAX_MARCHING_STEPS = 64;
const float EPSILON = 0.01;

float plane(vec3 pos){
    return pos.y;
}

vec2 rotate(vec2 pos, float angle){
    float c = cos(angle);
    float s = sin(angle);
    return mat2(c, s, -s, c) * pos;
} 

float roundedBox(vec3 pos, vec3 size, float radius){
    return length(max(abs(pos) - size, 0.0)) - radius;
}

float map(vec3 pos){
    float planeDist = plane(pos);
    float offset = 18.;
    // 1) I rotate the cubes depending on their position on the z axis
    // the bigger the value of z, the bigger the rotation
    //pos.xy = rotate(pos.xy, pos.z * 0.0045);

    // 2) add sine
    //pos.xy = rotate(pos.xy, pos.z * sin(iGlobalTime)*0.0045);

    // 4) do it after 3. getting only the absolute part of x will deform the box
    //pos.x = abs(pos.x);

    pos = mod(pos + offset/2., offset) - offset/2.;
    // 3) And now, for something comletely different,
    // rotate AFTER the modulo call
    pos.xy = rotate(pos.xy, u_time);
    pos.xz = rotate(pos.xz, u_time * 0.5);
    
    return min(planeDist, roundedBox(pos, vec3(2.0),0.8));
}

void main(){
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    vec3 pos = vec3(sin(u_time * 0.2) * 4.0, 5. +sin(u_time*0.4) * 3.0, -15.);
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