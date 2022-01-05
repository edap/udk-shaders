#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D u_tex0;
uniform vec2 u_resolution;
uniform vec2 u_tex0Resolution;


varying vec2 v_texcoord;

// A "convolution" can be defined as a simple operation for which the final color of a pixel depends on its neighbour.
// let's start with a simple example.
// let's say that the result of the fragment shader (meaning, the value of gl_FragColor)
// is the average color of 3 pixels in the texture.
//For every pixel, consider its neighbour on the right and its neighbour on the left
// some the 3 values and divide it by 3. You get the average color.


void main(){
    // open the image with an image editor and check the size of your image.
    vec2 texture_size = vec2(730.0, 730.0);

    // What if we want to do image processing that actually looks at other pixels?
    // Since WebGL references textures in texture coordinates which go from 0.0 to 1.0
    // then we can calculate how much to move for 1 pixel with the
    // simple math step_size = 1.0 / textureSize.
    vec2 step_size = vec2(1.0, 1.0) / texture_size;
    gl_FragColor = (
        texture2D(u_tex0, v_texcoord) +
        texture2D(u_tex0, v_texcoord + vec2(step_size.x, 0.0)) +
        texture2D(u_tex0, v_texcoord + vec2(-step_size.x, 0.0))) / 3.0;

    // the difference is minimal, but it is visible
    // the image with the color averaged it is a bit more blurred.
    //gl_FragColor = texture2D(u_tex0, v_texcoord);
}
