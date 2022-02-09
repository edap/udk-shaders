// Colors. Go to the albedo function

precision mediump float;
uniform vec2  u_resolution;
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
    float offset = 20.;

    pos.xy = rotate(pos.xy, pos.z * sin(u_time)*0.0045);
    
    pos.x = abs(pos.x);
    
    pos = mod(pos + offset/2., offset) - offset/2.;
    
    pos.xy = rotate(pos.xy, u_time);
    pos.xz = rotate(pos.xz, u_time * 0.5);
    
    return min(planeDist, roundedBox(pos, vec3(2.0),0.8));
}

vec3 albedo(vec3 pos){
    // 1 try to scale the position
    pos *= 0.5; // try out smth like 7.0
    // 2) BN
    //return fract(pos.z) * fract(pos.x) * vec3(1.0);
    
    // 3) color
    //return fract(pos.z) * fract(pos.x) * vec3(4.0, 0.2, 0.6);

    // 4) enter smoothstep
    //float f = smoothstep(0.5, 0.65, fract(pos.x));

    // 5) add sine
    float f = smoothstep(0.27, 0.3, fract(pos.x + sin(pos.z) * 0.4));
    return f * vec3(1.0);
}

void main(){
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    vec3 pos = vec3(sin(u_time * 0.2) * 4.0, 5. +sin(u_time*0.4) * 3.0, -15.);
    vec3 dir = normalize(vec3(uv, 1.0));

    vec3 color = vec3(0.0);
    // Change the BG
    //vec3 color = vec3(0.2, 0.2, 0.7);

    for (int i = 0; i < MAX_MARCHING_STEPS; i++) {
        float d = map(pos);
        if (d < EPSILON){
            color = albedo(pos);
            break;
        }

        pos += d * dir;
    }

    gl_FragColor = vec4(color, 1.0);
}