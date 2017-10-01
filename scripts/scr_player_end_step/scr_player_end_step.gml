/// @desc scr_player_end_step()


//
// Check if Being Attacked
//
if ( ! dying && ! hurting && ! recovering)
{
    if (can_be_attacked && attacker_id != noone)
    {
        /*
        // apply horizontal knockback
        if (attacker_x != 0)
        {
            velocity_x = knockback_x;
            if (x < attacker_x)
            {
                velocity_x = -knockback_x;
            }
        }
        
        // apply vertical knockback
        velocity_y = -knockback_y;
        grounded = false;
        */
        
        // update states
        hurting = true;
        recovering = true;
        recover_timer = 0;
        can_be_attacked = false;
    }
}

// reset referrence
attacker_id = noone;
attacker_x = 0;
attacker_y = 0;


//
// Check if the Health was Updated
//
if ( ! dying)
{
    if (health_updated)
    {
        // update the health
        current_health += health_updated_points;
        
        if (current_health > max_health)
        {
            current_health = max_health;
        }
        else if (current_health < 0)
        {
            //dying = true;
            current_health = max_health;
        }
        
        // update the player health
        scr_update_globals_player_health();
    }
}

// reset values
health_updated = false;
health_updated_points = 0;


//
// Update Position
//
if ( ! dying)
{
    event_inherited();
}


//
// Update Camera
//
scr_update_player_camera(x, (y - camera_offset_y), false);

