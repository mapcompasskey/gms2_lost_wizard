/// @descr scr_projectile_create()

// movement
mx = 0;
my = 0;

base_velocity = 200;
velocity_x = 0;
velocity_y = 0;

last_velocity_x = 0;
last_velocity_y = 0;

angle = 0;

// object collision
damage = 1;
current_health = 1;

can_collide = true;
collided_with = noone;

// movement collision
projectile_inside_tilemap = false;
projectile_hit_tilemap_x = false;
projectile_hit_tilemap_y = false;

movement_collision_script = scr_projectile_movement_collision;

// collision tile map
var collision_layer_id = layer_get_id("CollisionMap");
tilemap = layer_tilemap_get_id(collision_layer_id);

// states
dying = false;
update_velocity = true;

// drawing
sprite_bbox_left = 0; //sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = 0; //sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = 0; //sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = 0; //sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

// timers
travel_time = 1;
travel_timer = 0;
