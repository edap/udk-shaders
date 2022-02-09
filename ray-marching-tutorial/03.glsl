precision mediump float;
uniform vec2        u_resolution;

// how many marching steps
const int MAX_MARCHING_STEPS = 64;
const float EPSILON = 0.01;

// let's use the SDF function for plane and sphere
float plane(vec3 pos){
    return pos.y;
}

float sphere(vec3 pos, float radius){
    return length(pos) - radius;
}

// But the previous approach in 02.glsl can be slow if the step size is small and inaccurate if it is large.
// So we speed the things up using a step size variable, and its value it is calculated by the distance field of the scene
// that, in this sketch, is done in the function "map".
// map return the closest distance to the scene. If the scene is far away, we step forward for that distance. If it is closer, we proceed at smaller steps.
// Using the words from http://9bitscience.blogspot.de/2013/07/raymarching-distance-fields_14.html :
// The basic idea is to make sure every surface in our scene is given by a distance estimator (DE), which returns the distance to it from a point p. This way, we can find the distance to the closest surface in the scene, and know that we can step this far without overshooting.
// At the first point (the eye) there is quite a large distance to the closest surface, so we step that far to the next point. This continues until we get close enough to say we hit the surface.

float map(vec3 pos){
    // We expect that this function provides us a lower-bound on the closest object
    // (remember boolean operation with distance field, min is mergin the plane and the sphere)
    return min(plane(pos), sphere(pos, 2.0));
}

void main(){
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;

    // the value of pos, before the ray marching, is the position of the eye
    vec3 pos = vec3(0.0, 5.0, -10.);
    // try to move the eye around
    //vec3 pos = vec3(sin(iGlobalTime), 5.+sin(iGlobalTime*0.7) * 3.0, -10.);
    vec3 dir = normalize(vec3(uv, 1.0));

    vec3 color = vec3(0.0);

    for (int i = 0; i < MAX_MARCHING_STEPS; i++) {
        float d = map(pos); // this value defines the surface of the scene
        // the scene in this sketch it is composed by a plane and a sphere
        if (d < EPSILON){
            color = fract(pos * 0.5);
            break;
        }

        pos += d * dir;
    }

    gl_FragColor = vec4(color, 1.0);
}