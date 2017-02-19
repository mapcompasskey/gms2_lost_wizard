/// @desc scr_player_projectile_step()

event_inherited();


//
// Check if Dead
//
if (dying)
{
    instance_destroy();
}


//
// Check if Attacking
//
if ( ! dying)
{
    if (bbox_width && bbox_height)
    {
        // step in increments along the path this projectile is going to travel
        var attack_mx = (velocity_x * global.TICK);
        var attack_my = (velocity_y * global.TICK);
        var attack_distance = sqrt(sqr(attack_mx) + sqr(attack_my));
        
        var min_side = min(bbox_width, bbox_height);
        
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
                // check if will collide with enemy objects
                if (place_meeting(x + temp_mx, y + temp_my, obj_enemy))
                {
                    with (obj_enemy)
                    {
                        if (place_meeting(x - temp_mx, y - temp_my, other))
                        {
                            // if the entity is damaged
                            if (scr_damage_entity(id, other, -other.damage))
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
            
            if ( ! dying)
            {
                // check if will collide with block trigger objects
                if (place_meeting(x + temp_mx, y + temp_my, obj_block_trigger))
                {
                    with (obj_block_trigger)
                    {
                        if (place_meeting(x - temp_mx, y - temp_my, other))
                        {
                            // if the block trigger is damaged
                            if (scr_damage_block_trigger(id, other))
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
}

