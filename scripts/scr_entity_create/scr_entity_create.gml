/// @desc scr_entity_create()

// movement
gravity_factor = 1;

mx = 0;
my = 0;

speed_x = 100;
speed_y = 200;

knockback_x = 100;
knockback_y = 200;

velocity_x = 0;
velocity_y = 0;

last_velocity_x = 0;
last_velocity_y = 0;

max_velocity_x = (speed_x * 2);
max_velocity_y = (speed_y * 2);

move_friction = 0;     // 0.9 - reduce by 10% every step
move_friction_min = 0; // 1   - if less than 1
jump_bounce = 0;       // 0.4 - reduce by 60% every bounce
jump_bounce_min = 0;   // 1   - if less than 1

// object collision
damage = 1;
max_health = 1;
current_health = 1;

can_be_attacked = true;
attacker_id = noone;
attacker_x = 0;
attacker_y = 0;

health_updated = false;
health_updated_points = 0;

// movement collision
entity_hit_tilemap_x = false;
entity_hit_tilemap_y = false;
entity_hit_block_x = false;
entity_hit_block_y = false;
entity_at_edge_of_tilemap = false;

movement_collision_script = scr_entity_movement_collision;

test_tile_solid_top = true;

// collision tile map
var collision_layer_id = layer_get_id("CollisionMap");
tilemap = layer_tilemap_get_id(collision_layer_id);

// collision with blocks
check_collision_with_blocks = global.BLOCKS_ACTIVE;
check_collision_with_block_1 = global.BLOCK_1_ACTIVE;
check_collision_with_block_2 = global.BLOCK_2_ACTIVE;

// states
grounded = false;
dying = false;
hurting = false;
recovering = false;
walking = false;
jumping = false;
falling = false;

// drawing
facing = RIGHT;

//image_speed = 0;
//sprite_index = noone;
//mask_index = noone;

bbox_width = 0; // sprite_get_bbox_right(mask_index) - sprite_get_bbox_left(mask_index)
bbox_height = 0; // sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index)

sprite_bbox_left = 0; // sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_right = 0; // sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_bottom = 0; // sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index);
sprite_bbox_top = 0; // sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index);

// inputs
key_left = false;
key_right = false;
key_up = false;
key_down = false;
key_jump_pressed = false;
key_jump_released = false;

// timers
recover_time = 0.5;
recover_timer = 0;
