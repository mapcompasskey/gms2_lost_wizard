/// @desc scr_projectile_create()

event_inherited();

// movement
gravity_factor = 0;

base_velocity = 200;
angle = 0;

// movement collision
projectile_inside_tilemap = false;
projectile_hit_tilemap_x = false;
projectile_hit_tilemap_y = false;

projectile_hit_enemy_x = false;
projectile_hit_enemy_y = false;

movement_collision_script = scr_projectile_movement_collision;

// states
update_velocity = true;

// timers
travel_time = 1;
travel_timer = 0;
