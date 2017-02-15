/// @descr scr_bit_step()


var tick = global.TICK;

if ( ! pulling)
{
    if (bursting)
    {
        burst_x = dcos(busrt_angle) * burst_speed * tick;
        burst_y = dsin(busrt_angle) * burst_speed * tick;
        
        x += burst_x;
        y += burst_y;
        
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
}


pulling = false;
if (instance_exists(global.PLAYER))
{
    var distance_to_player = distance_to_object(global.PLAYER);
    
    if (distance_to_player < 40)
    {
        pulling = true;
        
        if (distance_to_player < 1)
        {
            instance_destroy();
        }
    }
    
    if (pulling)
    {
        var angle_to_player = point_direction(x, y, global.PLAYER.x, global.PLAYER.y);
        
        var mx = dcos(angle_to_player) * 50 * tick;
        var my = dsin(angle_to_player) * 50 * tick * -1;
        
        x += mx;
        y += my;
    }
}

