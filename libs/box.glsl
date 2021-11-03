#ifndef FNC_RECT
#define FNC_RECT
bool rect(vec2 pos, vec2 box){
    return pos.x > -box.x && pos.x < box.x && pos.y > -box.y && pos.y < box.y;
}
#endif

