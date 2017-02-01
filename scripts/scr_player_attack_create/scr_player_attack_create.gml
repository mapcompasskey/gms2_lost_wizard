/// @descr scr_player_attack_create()

event_inherited();

// movement
base_velocity = 600; // 200

// collision
//movement_collision_script = scr_projectile_movement_collision;

// drawing
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

// timers
travel_time = 1;
travel_timer = 0;
