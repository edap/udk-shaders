#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_tex0;
uniform vec2 u_resolution;
uniform vec2 u_tex0Resolution;


varying vec2 v_texcoord;

// https://webglfundamentals.org/webgl/lessons/webgl-image-processing.html
// https://www.taylorpetrick.com/blog/post/convolution-part1
// https://github.com/Sophia-Gold/WebGL-Convolution-Shaders/blob/master/convolution.glsl.js
// https://codepen.io/jsnda/pen/eGYJPR
// https://www.turais.de/using-shaders-image-post-processing-with-convolution/

// What if, instead of having 2 neighbours that influence the color of the final pixel, we have 8 neighbours?
// a 3x3 convolution matrix is exactly this, one pixel in the middle surrounded by 8 neighbours
// We use a matrix as an easier way to store the position of all the neighbours.

// And what if, each neighbour would have a different importance depending on the position?
// What if, for example, the pixel on top and that one on the bottom will have much more importance
// than the pixel on the corners?

// Rather than writing the expression as a sequence of arithmetic operations
// it can instead be described using a matrix of values. 
// This matrix is referred to as a kernel, mask or convolution matrix. 
// For example, a four-neighbor edge detector
// could be written in the following 3x3 form:
//  0 −1  0
// −1  4 −1
//  0 −1  0


// Prima fai un esempio con 8 

//https://thebookofshaders.com/glossary/?search=mat3


// this function calculates the weight of the kernel
// (the sum of all values in the kernel) or 1.0, whichever is greater.
float getKernelWeight(mat3 m){
    // TODO
    // Sei arrivato qua
    // https://webglfundamentals.org/webgl/lessons/webgl-image-processing.html
    // devi capire l'ordine delle matrix
    float sum = m[0][0] + m[0][1] + m[0][2] +
                m[1][0] + m[1][1] + m[1][2] +
                m[2][0] + m[2][1] + m[2][2];

    if (sum > 1.0) {
        return sum;
    } else {
        return 1.0;
    }
}

mat3 getKernel(){
    mat3 edgeDetect3 = mat3(
       -5.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        0.0, 0.0, 5.0
    );
    return edgeDetect3;
}

void main(){


    vec2 texture_size = vec2(730.0, 730.0);
    vec2 step_size = vec2(1.0, 1.0) / texture_size;
    mat3 kernel = getKernel();

    vec4 colorSum =
        // // South West, SS and SE
        // texture2D(u_tex0, v_texcoord + step_size * vec2(-1, -1)) * kernel[0][0] +
        // texture2D(u_tex0, v_texcoord + step_size * vec2( 0, -1)) * kernel[0][1] +
        // texture2D(u_tex0, v_texcoord + step_size * vec2( 1, -1)) * kernel[0][2] +

        // // Center W, CC, CE
        // texture2D(u_tex0, v_texcoord + step_size * vec2(-1,  0)) * kernel[1][0] +
        // texture2D(u_tex0, v_texcoord + step_size * vec2( 0,  0)) * kernel[1][1] +
        // texture2D(u_tex0, v_texcoord + step_size * vec2( 1,  0)) * kernel[1][2] +

        // // North W, NN, NE
        // texture2D(u_tex0, v_texcoord + step_size * vec2(-1,  1)) * kernel[2][0] +
        // texture2D(u_tex0, v_texcoord + step_size * vec2( 0,  1)) * kernel[2][1] +
        // texture2D(u_tex0, v_texcoord + step_size * vec2( 1,  1)) * kernel[2][2] ;

        // South West, SS and SE
        texture2D(u_tex0, v_texcoord + step_size * vec2(-1, -1)) * kernel[0][0] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 0, -1)) * kernel[1][0] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 1, -1)) * kernel[2][0] +

        // Center W, CC, CE
        texture2D(u_tex0, v_texcoord + step_size * vec2(-1,  0)) * kernel[0][1] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 0,  0)) * kernel[1][1] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 1,  0)) * kernel[2][1] +

        // North W, NN, NE
        texture2D(u_tex0, v_texcoord + step_size * vec2(-1,  1)) * kernel[0][2] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 0,  1)) * kernel[1][2] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 1,  1)) * kernel[2][2] ;

    gl_FragColor = vec4((colorSum / getKernelWeight(kernel)).rgb, 1.0);

    // the difference is minimal, but it is visible
    // the image with the color averaged it is a bit more blurred.
    //gl_FragColor = texture2D(u_tex0, v_texcoord);
}
