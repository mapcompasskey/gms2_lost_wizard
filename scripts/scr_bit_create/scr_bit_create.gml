/// @descr scr_bit_create()


// initial burst movement
burst_speed = random_range(10, 30);
busrt_angle = random_range(0, 360);

// sine wave based movement
motion_x = 0;
motion_y = 0;

motion_angle_x = 0;
motion_angle_y = 0;

motion_radius_x = random_range(2, 4);
motion_radius_y = random_range(2, 4);

previous_motion_x = dcos(motion_angle_x) * motion_radius_x;
previous_motion_y = dsin(motion_angle_y) * motion_radius_y;

angle_speed_x = random_range(50, 100);
if (irandom(1))
{
    angle_speed_x = -(angle_speed_x);
}

angle_speed_y = random_range(50, 100);
if (irandom(1))
{
    angle_speed_y = -(angle_speed_y);
}

// object tracking
following_id = noone;
following_speed = 100;
proximity_max = 40;
proximity_min = 1;

// settings
points = 1;

// states
dying = false;
bursting = true;
following = false;
can_capture = false;
can_follow = false;

// drawing
image_speed = 0;
image_index = irandom_range(0, 2);
points += image_index;

// timers
can_capture_timer = 0;
can_capture_time = 0.5;

can_follow_timer = 0;
can_follow_time = 1;

kill_timer = 0;
kill_time = 10;

