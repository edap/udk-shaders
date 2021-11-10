float fill(float dist, float size){
  return smoothstep(-size, +size, dist);
}

float stroke(float x, float size, float t) {
    float a = smoothstep(-size, +size, x+t *0.5);
    float b = smoothstep(-size, +size, x-t *0.5);
    return a - b;
}