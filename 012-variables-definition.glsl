#ifdef GL_ES
precision mediump float;
#endif

// how to change color? how is color represented?

void main(){


    // we have different types of variable. At the beginning, we will work
    // with bool, float, vec2, vec3 and vec4
    float red= 1.0;
    bool isItVeryBig = false;
    vec2 tomAndJerry = vec2(0.9, 0.2);
    vec3 threeLittlePigs = vec3(0.1, 0.4, 0.999);
    vec4 fourWinds = vec4(0.2, 0.7, 0.4, 0.89);


    // Comment out 
    //=vec4(red, 0.0, 0.0, 1.0);
    gl_FragColor=vec4(tomAndJerry, 0.0, 1.0);
    //gl_FragColor=vec4(threeLittlePigs,  1.0);
    // gl_FragColor=fourWinds;
    
}