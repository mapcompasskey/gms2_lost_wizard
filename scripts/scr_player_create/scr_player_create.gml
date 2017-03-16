/// @desc scr_player_create()


event_inherited();

// update globals
global.PLAYER = id;

// movement
speed_x = 100;
speed_y = 200;

knockback_x = 60;
knockback_y = 50;

max_velocity_x = 200;
max_velocity_y = 400;

// object collision
max_health = global.PLAYER_MAX_HEALTH;
current_health = global.PLAYER_HEALTH;

// collision
movement_collision_script = scr_player_movement_collision;

// states
attacking = false;

// timers
attack_cooldown_time = 0.5;
attack_cooldown_timer = 0;

// drawing
idle_speed = 0.1;
idle_sprite = spr_player_idle;

jumping_speed = 0;
jumping_sprite = spr_player_jump;

falling_speed = 0;
falling_sprite = spr_player_fall;

walking_speed = 0.5;
walking_sprite = spr_player_walk;

sprite_index = idle_sprite;
image_index = 0;
image_speed = idle_speed;
mask_index = spr_player;

bbox_width = sprite_get_bbox_right(mask_index) - sprite_get_bbox_left(mask_index)
bbox_height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index)

sprite_bbox_left = sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_right = sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index);
sprite_bbox_top = sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index);

// inputs
key_attack_pressed = false;
key_attack_released = false;
