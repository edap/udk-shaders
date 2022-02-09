#ifdef GL_ES
precision mediump float;
uniform vec2        u_resolution;
#endif

float intersectPlane(vec3 pos, vec3 dir){
    return -pos.y / dir.y;
}

void main(){
    //coordinates at the center of the screen
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;

    vec3 pos = vec3(0.0, 10.0, 0.);
    vec3 dir = normalize(vec3(uv, 1.0));

    // if the vector dir intersect the plane, return white, otherwise black
    float d = intersectPlane(pos, dir);
    gl_FragColor = vec4(vec3(d), 1.0);
}