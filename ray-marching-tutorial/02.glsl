precision mediump float;
uniform vec2        u_resolution;

// how many marching steps
const int MAX_MARCHING_STEPS = 64;
const float EPSILON = 0.01;

float map(vec3 pos){
    return pos.y;
}

//now instead of calculating the interesection with this method, we use distance field
// float intersectPlane(vec3 pos, vec3 dir){
//     return -pos.y / dir.y;
// }


void main(){
    vec2 uv = 2.0 * gl_FragCoord.xy / u_resolution.xy - 1.0;

    vec3 pos = vec3(0.0, 5.0, -10.);
    vec3 dir = normalize(vec3(uv, 1.0));

    vec3 color = vec3(0.0);
    
    // via http://9bitscience.blogspot.de/2013/07/raymarching-distance-fields_14.html
    // The raymarching algorithm
    // In traditional raytracing, a scene is often described by a set of triangles or spheres, making up a mesh. Using some spatial acceleration structure, we can quickly solve for the exact intersections between the rays and the objects.
    // With raymarching however, we allow for some leeway in the intersection, and accept it when a ray is close enough to a surface. This is done by marching along the ray at step sizes, and checking whether or not the surface is within a given threshold. We can set a limit on the number of steps to prevent marching into oblivion.

    for (int i = 0; i < MAX_MARCHING_STEPS; i++) {
        float d = map(pos);
        if (d < EPSILON){
            // hit! stop and calculate the color
            color = fract(pos * 0.5);
            break;
        }
        // did not hit, marche one step forward
        pos += d * dir;
    }

    gl_FragColor = vec4(color, 1.0);
}