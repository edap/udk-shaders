#ifdef GL_ES
precision mediump float;
#endif

void main(){
    vec3 threeLittlePigs = vec3(0.1, 0.4, 0.999);
    // Comment out and try the different results

    //gl_FragColor=vec4(threeLittlePigs.rgb,  1.0);
    //gl_FragColor=vec4(threeLittlePigs.bgr,  1.0);
    //gl_FragColor=vec4(threeLittlePigs.rrr,  1.0);
    //gl_FragColor=vec4(threeLittlePigs.bbb,  1.0);
    //gl_FragColor=vec4(threeLittlePigs.xyz,  1.0);
    //gl_FragColor=vec4(threeLittlePigs.xxx,  1.0);
    gl_FragColor=vec4(threeLittlePigs.yyx,  1.0);
    
}