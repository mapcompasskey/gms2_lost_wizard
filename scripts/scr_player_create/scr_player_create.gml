/// @descr scr_player_create()

event_inherited();

// physics
speed_x = 100;
speed_y = 200;
max_velocity_x = (speed_x * 2);
max_velocity_y = (speed_y * 2);

// drawing
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
