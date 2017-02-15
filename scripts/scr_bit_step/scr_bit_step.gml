/// @descr scr_bit_step()


var tick = global.TICK;


//
// Update Movement
//
if ( ! dying && ! following)
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


//
// Check If Following an Instance
//
if ( ! dying)
{
    // if not being pulled towards an instance
    if (following_id == noone)
    {
        with (obj_player)
        {
            // if close to a player object
            var dist = distance_to_object(other);
            if (dist < 40)
            {
                // update the bit
                other.following = true;
                other.following_id = id;
                break;
            }
        }
    }
    // else, being pulled towards an instance
    else
    {
        var inst = following_id;
        
        // reset the reference
        following = false;
        following_id = noone;
        
        // if the instance still exsits
        if (instance_exists(inst))
        {
            // if its still within range
            var dist = distance_to_object(inst);
            if (dist < 40)
            {
                // update the reference
                following = true;
                following_id = inst;
                
                // move towards the instance
                var deg = point_direction(x, y, inst.x, inst.y);
                x += dcos(deg) * 50 * tick;
                y += dsin(deg) * 50 * tick * -1;
                
                // if close enough to be picked up
                if (dist < 1)
                {
                    scr_update_globals_player_bits(1);
                    dying = true;
                    instance_destroy();
                }
                
            }
            
        }
    
    }
    
}

