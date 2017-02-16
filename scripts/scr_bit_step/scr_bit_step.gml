/// @descr scr_bit_step()


var tick = global.TICK;


//
// Update Movement
//
if ( ! dying && ! following)
{
    // if moving outward
    if (bursting)
    {
        // update movement
        x += dcos(busrt_angle) * burst_speed * tick;;
        y += dsin(busrt_angle) * burst_speed * tick;
        
        // slow down burst speed
        burst_speed = lerp(burst_speed, 0, 0.1);
        if (burst_speed < 1)
        {
            bursting = false;
        }
    }
    
    // update the x-axis curve
    motion_angle_x += (angle_speed_x * tick);
    if (motion_angle_x > 360)
    {
        motion_angle_x = (motion_angle_x % 360);
    }
    motion_x = dcos(motion_angle_x) * motion_radius_x;
    
    // update the y-axis curve
    motion_angle_y += (angle_speed_y * tick);
    if (motion_angle_y > 360)
    {
        motion_angle_y = (motion_angle_y % 360);
    }
    motion_y = dsin(motion_angle_y) * motion_radius_y;
    
    // update position
    x += (previous_motion_x - motion_x);
    y += (previous_motion_y - motion_y);
    
    previous_motion_x = motion_x;
    previous_motion_y = motion_y;
}


//
// Check if Following an Instance
//
if ( ! dying)
{
    // if the bit can't be captured yet
    if ( ! can_capture)
    {
        image_alpha = 0.5;
        can_capture_timer += tick;
        if (can_capture_timer >= can_capture_time)
        {
            image_alpha = 1.0;
            can_capture = true;
        }
    }
    
    // else, the bit can be captured
    else
    {
        // if not being pulled towards an instance
        if (following_id == noone)
        {
            // *if there were multiple players, this would target the closest
            var previous_dist = proximity_max;
            with (obj_player)
            {
                // if this player instance is close
                var dist = distance_to_object(other);
                if (dist < previous_dist)
                {
                    // update the bit
                    other.following_id = id;
                    previous_dist = dist;
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
                if (dist < proximity_max)
                {
                    // update the reference
                    following_id = inst;
                    
                    // move towards the instance
                    if (can_follow)
                    {
                        following = true;
                        
                        var pos_x = (inst.bbox_left + ((inst.bbox_right - inst.bbox_left) / 2));
                        var pos_y = (inst.bbox_top + ((inst.bbox_bottom - inst.bbox_top) / 2));
                        var deg = point_direction(x, y, pos_x, pos_y);
                        x += dcos(deg) * following_speed * tick;
                        y += dsin(deg) * following_speed * tick * -1;
                    }
                    
                    // if close enough to be picked up
                    if (dist < proximity_min)
                    {
                        script_execute(proximity_collision_script);
                    }
                
                }
            
            }
        
        }
    }
    
    // if the bit can't follow
    if ( ! can_follow)
    {
        can_follow_timer += tick;
        if (can_follow_timer >= can_follow_time)
        {
            can_follow = true;
        }
    }
    
}


//
// Kill the Instance after a While
//
if ( ! dying)
{
    kill_timer += global.TICK;
    if (kill_timer >= kill_time)
    {
        dying = true;
        instance_destroy();
    }
}

