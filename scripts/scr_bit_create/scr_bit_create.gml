/// @descr scr_bit_create()


// inital burst movement
burst_speed = random_range(10, 30);
busrt_angle = random_range(0, 360);
burst_x = dcos(busrt_angle) * burst_speed;
burst_y = dsin(busrt_angle) * burst_speed;

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

// states
dying = false;
bursting = true;

following = false;
following_id = noone;
