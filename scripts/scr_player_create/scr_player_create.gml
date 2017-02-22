/// @desc scr_player_create()


event_inherited();

// update globals
global.PLAYER = id;

// movement
speed_x = 400;//100;
speed_y = 400;//200;

knockback_x = 60;
knockback_y = 50;

max_velocity_x = 0;//200;
max_velocity_y = 0;//400;

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
sprite_index = spr_npc; //spr_npc_5//spr_player;

bbox_width = sprite_get_bbox_right(sprite_index) - sprite_get_bbox_left(sprite_index)
bbox_height = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index)

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

// inputs
key_attack_pressed = false;
key_attack_released = false;
