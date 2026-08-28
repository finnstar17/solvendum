shader_type canvas_item;
render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;
uniform float base_pixel_size : hint_range(1.0, 64.0, 1.0) = 16.0;
uniform float reference_height = 1080.0;

void fragment() {
    float current_pixel_size = base_pixel_size * (1.0 / SCREEN_PIXEL_SIZE.y / reference_height);
    current_pixel_size = max(current_pixel_size, 1.0);

    float x = FRAGCOORD.x - mod(FRAGCOORD.x, current_pixel_size);
    float y = FRAGCOORD.y - mod(FRAGCOORD.y, current_pixel_size);
    float shift = floor(current_pixel_size / 2.0);
    
    COLOR = texture(SCREEN_TEXTURE, vec2(x + shift, y + shift) * SCREEN_PIXEL_SIZE);
}