/// @descr scr_player_projectile_step()

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
    // check if colliding with enemy objects
    if (place_meeting(x, y, obj_enemy))
    {
        with (obj_enemy)
        {
            if (place_meeting(x, y, other))
            {
                // if the entity is damaged
                if (scr_damage_entity(id, other, -damage))
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

