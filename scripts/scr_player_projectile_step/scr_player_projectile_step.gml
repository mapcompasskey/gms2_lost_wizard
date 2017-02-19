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
/*
if ( ! dying)
{
    // check if colliding with enemy objects
    if (place_meeting(x, y, obj_enemy))
    {
        with (obj_enemy)
        {
            if (place_meeting(x, y, other))
            {
                // if the entity is damaged
                if (scr_damage_entity(id, other, -other.damage))
                {
                    // update projectile
                    other.dying = true;
                    
                    break;
                }
                
            }
        }
    }
    
    // check if colliding with block trigger objects
    if (place_meeting(x, y, obj_block_trigger))
    {
        with (obj_block_trigger)
        {
            if (place_meeting(x, y, other))
            {
                // if the block trigger is damaged
                if (scr_damage_block_trigger(id, other))
                {
                    // update projectile
                    other.dying = true;
                    
                    break;
                }
                
            }
        }
    }
    
}
/**/

/*
if ( ! dying)
{
    attack_mx = (velocity_x * global.TICK);
    attack_my = (velocity_y * global.TICK);
    
    var steps = 0;
    var step_size = 0;
    
    var wd = (bbox_right - bbox_left);
    var hg = (bbox_bottom - bbox_top);
    
    steps = 1;
    if (abs(attack_mx) > wd)
    {
        steps = ceil(abs(attack_mx) / wd);
    }
    step_size = (attack_mx / steps);
    
    for (var i = 1; i <= steps; i++)
    {
        var temp_mx = (step_size * i);
        
        // check if colliding with enemy objects
        if (place_meeting(x + temp_mx, y, obj_enemy))
        {
            with (obj_enemy)
            {
                if (place_meeting(x - temp_mx, y, other))
                {
                    // if the entity is damaged
                    if (scr_damage_entity(id, other, 0))
                    {
                        // update projectile
                        other.dying = true;
                        other.x = other.x + temp_mx;
                        
                        break;
                    }
                
                }
            }
        }
        
    }
    
}
*/

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
    if (attack_distance > )
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
        
        if (dying)
        {
            break; // end for()
        }
    }
    
    
    /*
    var steps = 0;
    var step_size = 0;
    
    var wd = (bbox_right - bbox_left);
    var hg = (bbox_bottom - bbox_top);
    
    steps = 1;
    if (abs(attack_mx) > wd)
    {
        steps = ceil(abs(attack_mx) / wd);
    }
    step_size = (attack_mx / steps);
    
    for (var i = 1; i <= steps; i++)
    {
        var temp_mx = (step_size * i);
        
        // check if colliding with enemy objects
        if (place_meeting(x + temp_mx, y, obj_enemy))
        {
            with (obj_enemy)
            {
                if (place_meeting(x - temp_mx, y, other))
                {
                    // if the entity is damaged
                    if (scr_damage_entity(id, other, 0))
                    {
                        // update projectile
                        other.dying = true;
                        other.x = other.x + temp_mx;
                        
                        break;
                    }
                
                }
            }
        }
        
    }
    */
}

















