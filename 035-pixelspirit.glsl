// Title: Merge
// Author: Patricio Gonzalez Vivo

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;

#include "./libs/pixelspirit/fill.glsl"
#include "./libs/pixelspirit/stroke.glsl"
#include "./libs/pixelspirit/circleSDF.glsl"
#include "./libs/pixelspirit/flip.glsl"

// more examples:
//1  https://github.com/patriciogonzalezvivo/PixelSpiritDeck/tree/master/examples_SDFs
//2 https://github.com/patriciogonzalezvivo/PixelSpiritDeck/tree/master/examples_shapes
//3 https://github.com/patriciogonzalezvivo/PixelSpiritDeck/tree/master/00-elements

void main() {
    vec3 color = vec3(0.);
    vec2 st = gl_FragCoord.xy/u_resolution;
    st.x *= u_resolution.x / u_resolution.y;

    vec2 offset = vec2(.15,.0);
    float left = circleSDF(st+offset);
    float right = circleSDF(st-offset);
    color += flip(stroke(left,.5,.05),
                  fill(right,.525));

    gl_FragColor = vec4(color,1.);
}