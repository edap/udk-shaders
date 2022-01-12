#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

// https://learnopengl.com/Advanced-Lighting/Gamma-Correction
vec3 linearToGamma(vec3 inputColor){
    // apply gamma correction
    vec3 col;
    float gamma = 2.2;
    col = pow(inputColor, vec3(1.0/gamma));
    return col;    
}

void main(){
    vec2 st = gl_FragCoord.xy/ u_resolution.xy;
    vec3 col = vec3(st.x);
    if (st.y > 0.5) {
        col = linearToGamma(col);
    }
    gl_FragColor=vec4(col, 1.0);
}