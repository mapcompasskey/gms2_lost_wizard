/// @desc scr_npc_create()

event_inherited();

// movement
speed_x = 50;
speed_y = 50;
max_velocity_x = (speed_x * 2);
max_velocity_y = (speed_y * 2);

// collision
movement_collision_script = scr_npc_movement_collision;

// drawing
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

// inputs
key_right = true;

// timers
//action_time = (random_range(2, 4) * 60) // 2 - 4 seconds
//action_timer = action_time;
