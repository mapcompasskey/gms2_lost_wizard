/// @descr scr_bit_step()


var tick = global.TICK;

if (bursting)
{
    burst_x = dcos(busrt_angle) * burst_speed;
    burst_y = dsin(busrt_angle) * burst_speed;
    
    x += (burst_x * tick);
    y += (burst_y * tick);
    
    burst_speed = lerp(burst_speed, 0, 0.1);
    if (burst_speed < 1)
    {
        bursting = false;
    }
    
}

motion_angle_x += (angle_speed_x * tick);
if (motion_angle_x > 360)
{
    motion_angle_x = (motion_angle_x % 360);
}
    
motion_angle_y += (angle_speed_y * tick);
if (motion_angle_y > 360)
{
    motion_angle_y = (motion_angle_y % 360);
}
    
motion_x = dcos(motion_angle_x) * motion_radius_x;
motion_y = dsin(motion_angle_y) * motion_radius_y;

x += (previous_motion_x - motion_x);
y += (previous_motion_y - motion_y);
    
previous_motion_x = motion_x;
previous_motion_y = motion_y;

