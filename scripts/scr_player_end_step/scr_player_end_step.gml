/// @descr scr_player_end_step()


//
// Check if Being Attacked
//
if ( ! dying && ! hurting && ! recovering)
{
    if (can_be_damaged)
    {
        // if being damaged
        if (damage_from != noone)
        {
            if (instance_exists(damage_from))
            {
                with (damage_from)
                {
                    var other_damage = damage;
                    var other_x = x;
                }
                
                // update states
                hurting = true;
                recovering = true;
                recover_timer = 0;
                can_be_damaged = false;
                
                // apply vertical knockback
                velocity_x = knockback_x;
                if (x < other_x)
                {
                    velocity_x = -knockback_x;
                }
                
                // apply vertical knockback
                velocity_y = -knockback_y;
                grounded = false;
                
                // reduce health
                //current_health = (current_health - other_damage);
                //if (current_health <= 0)
                //{
                //    dying = true;
                //}
            }
        }
        
    }
}
    
// reset collision referrence
damage_from = noone;


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

// move towards the player
scr_camera_update(x, y, false);
//scr_camera_update(x, (y + sprite_bbox_top), false);
