#ifdef GL_ES
precision mediump float;
#endif

//glslViewer col-invert-sqaures.frag  ../textures/pink-necked-green-pigeon-big.jpg
#define PI 3.14159265359
#define SPEED.2

uniform float u_time;
uniform vec2 u_resolution;
uniform sampler2D u_tex0;

// returns a random float value given a vec2
float hash(vec2 p){
    p=fract(p*vec2(234.34,435.345));
    p+=dot(p,p+34.23);
    return fract(p.x*p.y);
}

float myShape(vec2 gv){
    // Try to play with the functions that
    // you know. Try to came up with your own
    // shape.

    //return abs(gv.y + gv.x);
    return abs(abs(gv.x+gv.y)-.5);

}

void main(void){
    vec2 uv=(2.*gl_FragCoord.xy-u_resolution.xy)/u_resolution.y;
    vec3 col=vec3(0.);
    // 6) Animate
    // uv += u_time * 0.3;
    uv*=8.;
    vec2 gv=fract(uv)-.5;

    // 2) each cell has now an id
    vec2 id=floor(uv);

    // 3) we can use the id to give a random value to each cell.
    float n=hash(id);// random between 0 and 1

    // 5) random flip the x direction only if a condition is match
    if(n<.5){
        gv.x*=-1.;
    };

    // 4) Try to see what happens if you flip the x direction
    //gv.x *= -1.;

    float width=.25;
    // 1) draw something. Possible something that is not simmetric
    float d=myShape(gv);

    float mask=d-width;
    mask=smoothstep(.01,-.01,mask);

    // this time we are not uing mix, we are simply adding white to the black bg.
    col+=mask;
    //col.rg += id;
    // outline
    //if(gv.x > 0.48 || gv.y > 0.48) col = vec3(1.,0.,0.);

    gl_FragColor=vec4(sqrt(col),1.);
}
