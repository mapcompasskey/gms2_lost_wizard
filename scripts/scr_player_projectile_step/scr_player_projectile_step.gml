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
                // if the enemy can be damaged
                if (can_be_damaged && damage_from == noone)
                {
                    // update enemy
                    damage_from = other;
                    
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
                // if the block trigger can be damaged
                if (can_be_damaged && damage_from == noone)
                {
                    // update block trigger
                    damage_from = other;
                    
                    // update projectile
                    other.dying = true;
                    
                    break;
                }
            }
        }
    }
    
}

