// credits to Innigo https://www.iquilezles.org/www/articles/distfunctions2d/distfunctions2d.htm
float box(vec2 p,vec2 b ){
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}

float circle(vec2 coord, float radius) {
    return length(coord) - radius;
}