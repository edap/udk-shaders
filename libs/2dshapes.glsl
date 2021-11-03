bool box(vec2 coord, vec2 box){
    return coord.x > -box.x && coord.x < box.x && coord.y > -box.y && coord.y < box.y;
}

float circle(vec2 coord, float radius) {
    return length(coord) - radius;
}

