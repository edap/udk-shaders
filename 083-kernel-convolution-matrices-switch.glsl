#ifdef GL_ES
precision mediump float;
#endif


uniform sampler2D u_tex0;
uniform vec2 u_resolution;
uniform vec2 u_mouse;

varying vec2 v_texcoord;

#include "./libs/convolution_matrices.glsl"

// Reference
// https://webglfundamentals.org/webgl/lessons/webgl-image-processing.html

float getKernelWeight(mat3 m){
    float sum = m[0][0] + m[0][1] + m[0][2] +
                m[1][0] + m[1][1] + m[1][2] +
                m[2][0] + m[2][1] + m[2][2];
  if(sum == 0.0){
    return 1.0;
  }else {
    return sum;    
  }
}

mat3 getKernel(float mouse_x){
  float index = mouse_x * 18.00;
  if(index > 0.0 && index <= 1.0) {
    return gaussianBlur2Kernel();
  }else if(index > 1.0 && index <= 2.0){
    return gaussianBlur3Kernel();
  }else if(index > 2.0 && index <= 3.0){
    return unsharpenKernel();
  }else if(index > 3.0 && index <= 4.0){
    return sharpnessKernel();
  }else if(index > 4.0 && index <= 5.0){
    return sharpenKernel();
  }else if(index > 5.0 && index <= 6.0){
    return edgeDetectKernel();
  }else if(index > 6.0 && index <= 7.0){
    return edgeDetect2Kernel();
  }else if(index > 7.0 && index <= 8.0){
    return edgeDetect3Kernel();
  }else if(index > 8.0 && index <= 9.0){
    return edgeDetect4Kernel();
  }else if(index > 9.0 && index <= 10.0){
    return edgeDetect5Kernel();
  }else if(index > 10.0 && index <= 11.0){
    return edgeDetect6Kernel();
  }else if(index > 11.0 && index <= 12.0){
    return sobelHorizontalKernel();
  }else if(index > 12.0 && index <= 13.0){
    return sobelVerticalKernel();
  }else if(index > 13.0 && index <= 14.0){
    return previtHorizontalKernel();
  }else if(index > 14.0 && index <= 15.0){
    return previtVerticalKernel();
  }else if(index > 15.0 && index <= 16.0){
    return boxBlurKernel();
  }else if(index > 0.0 && index <= 17.0){
    return triangleBlurKernel();
  }else if(index > 17.0 && index <= 19.0){
    return embossKernel();
  }
}

void main(){
    vec2 texture_size = vec2(730.0, 730.0);
    vec2 step_size = vec2(1.0, 1.0) / texture_size;
    mat3 kernel = getKernel(u_mouse.x/ u_resolution.x);

    vec4 colorSum =
        // South West, South Center and South East
        texture2D(u_tex0, v_texcoord + step_size * vec2(-1, -1)) * kernel[0][0] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 0, -1)) * kernel[1][0] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 1, -1)) * kernel[2][0] +

        // Center West, CenterC center, Center East
        texture2D(u_tex0, v_texcoord + step_size * vec2(-1,  0)) * kernel[0][1] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 0,  0)) * kernel[1][1] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 1,  0)) * kernel[2][1] +

        // North West, North Center, North East
        texture2D(u_tex0, v_texcoord + step_size * vec2(-1,  1)) * kernel[0][2] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 0,  1)) * kernel[1][2] +
        texture2D(u_tex0, v_texcoord + step_size * vec2( 1,  1)) * kernel[2][2] ;

    gl_FragColor = vec4((colorSum / getKernelWeight(kernel)).rgb, 1.0);
}
