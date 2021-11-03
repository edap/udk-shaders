// refer to https://thebookofshaders.com/05/

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

float plot_x_vals(vec2 st, float pct){
    return  smoothstep( pct-0.02, pct, st.y) -
            smoothstep( pct, pct+0.02, st.y);
}

void main(){
    vec2 coord = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;
    coord.x *= u_resolution.x / u_resolution.y;
    
    float pct; 
    //pct = pow(coord.x, 0.4);
    //pct = mod(x,0.5); // return x modulo of 0.5
    //pct = fract(coord.x); // return only the fraction part of a number
    //pct = ceil(coord.x);  // nearest integer that is greater than or equal to x
    //pct = floor(coord.x); // nearest integer less than or equal to x
    //pct = sign(coord.x);  // extract the sign of x
    //pct = abs(coord.x);   // return the absolute value of x
    //pct = clamp(coord.x,0.0,1.0); // constrain x to lie between 0.0 and 1.0
    //pct = min(0.0,coord.x);   // return the lesser of x and 0.0
    //pct = max(0.0,coord.x);   // return the greater of x and 0.0 

    float line = plot_x_vals(coord, pct);

    vec4 color = mix(vec4(1.0, 0.0, 0.0, 1.0),vec4(0.0667, 0.0, 1.0, 1.0), line);
    gl_FragColor = color;
}