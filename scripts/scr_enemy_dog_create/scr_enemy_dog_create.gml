/// @desc scr_enemy_dog_create()

event_inherited();

// movement
speed_x = 40;
speed_y = 50;

knockback_x = 60;
knockback_y = 50;

max_velocity_x = 60;
max_velocity_y = 100;

starting_x = x;
starting_y = y;

// object collision
max_health = 4;
current_health = 4;

// collision
movement_collision_script = scr_enemy_dog_movement_collision;

// drawing
idle_speed = 0.1;
idle_sprite = spr_enemy_dog_idle;

walk_speed = 0.9;
walk_sprite = spr_enemy_dog_walk;

sprite_index = idle_sprite;
image_index = 0;
image_speed = idle_speed;
mask_index = spr_enemy_dog;

bbox_width = sprite_get_bbox_right(mask_index) - sprite_get_bbox_left(mask_index)
bbox_height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index)
sprite_bbox_left = sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_right = sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index);
sprite_bbox_top = sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index);

// inputs
key_right = true;

// timers
//action_time = (random_range(2, 4) * 60) // 2 - 4 seconds
//action_timer = action_time;

dead_time = 1;
dead_timer = 0;
