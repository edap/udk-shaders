float rand(float x){
    return fract(sin(x) * 100000.0);
}

float rand (vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))*
        43758.5453123);
}