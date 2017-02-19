/// @desc scr_projectile_step()

event_inherited();

// get the x/y velocities from the angle and base velocity
if ( ! dying && update_velocity)
{
    velocity_x = (dcos(angle) * base_velocity);
    velocity_y = (dsin(angle) * base_velocity * -1);
    update_velocity = false;
}

// kill the instance after a certain amount of time has passed
if ( ! dying)
{
    travel_timer += global.TICK;
    if (travel_timer >= travel_time)
    {
        dying = true;
    }
}


/*
//
// Check if Attacking (Example)
//
if ( ! dying)
{
    // step in increments along the path this projectile is going to travel
    var attack_mx = (velocity_x * global.TICK);
    var attack_my = (velocity_y * global.TICK);
    var attack_distance = sqrt(sqr(attack_mx) + sqr(attack_my));
    
    var wd = (bbox_right - bbox_left);
    var hg = (bbox_bottom - bbox_top);
    var min_side = min(wd, hg);
    
    var steps = 1;
    if (attack_distance > min_side)
    {
        steps = ceil(attack_distance / min_side);
    }
    var step_size = (attack_distance / steps);
    
    for (var i = 1; i <= steps; i++)
    {
        var temp_mx = (dcos(angle) * (step_size * i));
        var temp_my = (dsin(angle) * (step_size * i) * -1);
        
        if ( ! dying)
        {
            // check if will collide with OBJECT_NAME
            if (place_meeting(x + temp_mx, y + temp_my, OBJECT_NAME))
            {
                with (OBJECT_NAME)
                {
                    if (place_meeting(x - temp_mx, y - temp_my, other))
                    {
                        // if the instance is damaged
                        if (CHECK_IF_CAN_DAMAGE)
                        {
                            // update projectile
                            other.dying = true;
                            other.x = other.x + temp_mx;
                            other.y = other.y + temp_my;
                        
                            break; // end with()
                        }
                
                    }
                }
            }
        }
        
        if (dying)
        {
            break; // end for()
        }
    }
    
}
*/
