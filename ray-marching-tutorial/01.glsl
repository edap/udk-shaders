precision mediump float;
uniform vec2 u_resolution;

float intersectPlane(vec3 pos, vec3 dir){
    return -pos.y / dir.y;
}

void main(){
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    vec3 pos = vec3(0.0, 10.0, 0.);
    vec3 dir = normalize(vec3(uv, 1.0));

    float d = intersectPlane(pos, dir);
    pos += d * dir;

    vec3 color = vec3(0.8, 0.9, 1.0);
    if(d >= 0.)
        color = fract(pos * 0.1);
        // let's play with the perspective
        //vec3 color = fract(pos * 0.5);

    gl_FragColor = vec4(color.xxz, 1.0);
}