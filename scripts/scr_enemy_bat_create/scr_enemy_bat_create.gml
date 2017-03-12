/// @desc scr_enemy_bat_create()

event_inherited();

// movement
gravity_factor = 0;

speed_x = 0;
speed_y = 0;

starting_x = x;
starting_y = y;

// sine wave based movement
motion_x = 0;
motion_y = 0;

motion_angle_x = 0;
motion_angle_y = 0;

motion_radius_x = random_range(3, 6);
motion_radius_y = random_range(3, 6);

previous_motion_x = dcos(motion_angle_x) * motion_radius_x;
previous_motion_y = dsin(motion_angle_y) * motion_radius_y;

angle_speed_x = random_range(50, 150);
if (irandom(1))
{
    angle_speed_x = -(angle_speed_x);
}

angle_speed_y = random_range(50, 150);
if (irandom(1))
{
    angle_speed_y = -(angle_speed_y);
}

// object tracking
targeting_id = noone;
targeting_speed = 50;
proximity_max = 80;
proximity_min = 1;

// object collision
max_health = 4;
current_health = 4;

// collision
movement_collision_script = scr_enemy_bat_movement_collision;

// states
targeting = false;

// drawing
bbox_width = sprite_get_bbox_right(sprite_index) - sprite_get_bbox_left(sprite_index)
bbox_height = sprite_get_bbox_bottom(sprite_index) - sprite_get_bbox_top(sprite_index)

sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);

// timers
//action_time = (random_range(2, 4) * 60) // 2 - 4 seconds
//action_timer = action_time;

track_time = 0.5;
track_timer = 0;

dead_time = 1;
dead_timer = 0;
