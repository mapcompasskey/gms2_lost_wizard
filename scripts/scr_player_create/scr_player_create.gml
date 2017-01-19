/// @descr scr_player_create()

tile_size = global.TILE_SIZE;
not_tile_size = tile_size - 1;

// basic player vars
move_speed = 8;
jump_impulse = 8;
grav = 0.75;
v_speed = 0;

// tile map info
var l = layer_get_id("CollisionMap");
tilemap = layer_tilemap_get_id(l);

// sprite info
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
