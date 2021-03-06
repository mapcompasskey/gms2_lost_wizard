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
targeting_speed = 40;
returning_speed = 20;
proximity_max = 50;
proximity_min = 1;

// object collision
max_health = 4;
current_health = 4;

// collision
movement_collision_script = scr_enemy_bat_movement_collision;

// states
targeting = false;
returning = false;

// drawing
idle_speed = 0.5;
idle_sprite = spr_enemy_bat_idle;

sprite_index = idle_sprite;
image_index = 0;
image_speed = idle_speed;
mask_index = spr_enemy_bat;

bbox_width = sprite_get_bbox_right(mask_index) - sprite_get_bbox_left(mask_index)
bbox_height = sprite_get_bbox_bottom(mask_index) - sprite_get_bbox_top(mask_index)
sprite_bbox_left = sprite_get_bbox_left(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_right = sprite_get_bbox_right(mask_index) - sprite_get_xoffset(mask_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index);
sprite_bbox_top = sprite_get_bbox_top(mask_index) - sprite_get_yoffset(mask_index);

// timers
//action_time = (random_range(2, 4) * 60) // 2 - 4 seconds
//action_timer = action_time;

track_time = 0.5;
track_timer = 0;

dead_time = 1;
dead_timer = 0;
