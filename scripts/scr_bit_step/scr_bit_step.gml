/// @descr scr_bit_step()


var tick = global.TICK;

if ( ! dying && ! pulling)
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
if ( ! dying)
{
    if (instance_exists(global.PLAYER))
    {
        var dist = distance_to_object(global.PLAYER);
        if (dist < 40)
        {
            pulling = true;
            
            if (dist < 1)
            {
                dying = true;
                scr_update_globals_player_bits(1);
                instance_destroy();
            }
        }
        
        if (pulling)
        {
            var deg = point_direction(x, y, global.PLAYER.x, global.PLAYER.y);
            var mx = dcos(deg) * 50 * tick;
            var my = dsin(deg) * 50 * tick * -1;
            
            x += mx;
            y += my;
        }
    }
}

