#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform float u_time;

float box(vec2 p,vec2 b){
    vec2 d=abs(p)-b;
    return length(max(d,0.))+min(max(d.x,d.y),0.);
}

float fill(float dist,float size){
    return smoothstep(-size,+size,dist);
}

mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
    sin(_angle),cos(_angle));
}

mat2 scale(vec2 _scale){
    return mat2(_scale.x,0.,
    0.,_scale.y);
}

void main(){
    vec2 st=gl_FragCoord.xy/u_resolution;
    st.x*=u_resolution.x/u_resolution.y;
    
    // Define colors for the backgroun, the layer A and the layer B
    vec3 colorBg=vec3(st,0.);
    vec3 colorLayerA=vec3(.2824,.4745,1.);
    vec3 colorLayerB=vec3(.9451,.0157,.5882);
    
    // Layer A. Each layer has its own coord system
    vec2 layerA=st;
    layerA*=2.;
    layerA=fract(layerA);
    
    //1 draw a box in the middle of the coord system layerA
    vec2 boxPosA=layerA-vec2(.5,.5);
    float boxA=fill(box(boxPosA,vec2(.2)),.001);
    
    // Add Layer A to the background
    colorBg=mix(colorLayerA,colorBg,boxA);
    
    // Layer B
    vec2 layerB=st;
    layerB*=8.;
    layerB=fract(layerB);
    
    //1 draw a box in the middle of the screen?
    vec2 boxPosB=layerB-vec2(.5,.5);
    float boxB=fill(box(boxPosB,vec2(.2)),.001);
    
    // Add Layer B to the background
    colorBg=mix(colorLayerB,colorBg,boxB);
    
    // Exercise!
// 1)Create a multi layer pattern, animate it.
// 2)Search online for parallax. Try to combine the movement of the layers
// in order to give the feeling of depth.
// 3) try to use a custom shape. If you do not have one, spend some time
// creating a function that generates a custom shapes.

gl_FragColor=vec4(colorBg,1.);
}