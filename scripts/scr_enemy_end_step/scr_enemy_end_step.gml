/// @desc scr_enemy_end_step()


//
// Check if Being Attacked
//
if ( ! dying && ! hurting && ! recovering)
{
    if (can_be_attacked && attacker_id != noone)
    {
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
            dying = true;
            
            // add bits
            var pos_x = (bbox_left + ((bbox_right - bbox_left) / 2));
            var pos_y = (bbox_top + ((bbox_bottom - bbox_top) / 2));
            instance_create_layer(pos_x, pos_y, global.ROOM_LAYER_PLAYER, obj_soul_bit);
            instance_create_layer(pos_x, pos_y, global.ROOM_LAYER_PLAYER, obj_soul_bit);
            instance_create_layer(pos_x, pos_y, global.ROOM_LAYER_PLAYER, obj_soul_bit);
            instance_create_layer(pos_x, pos_y, global.ROOM_LAYER_PLAYER, obj_soul_bit);
            instance_create_layer(pos_x, pos_y, global.ROOM_LAYER_PLAYER, obj_soul_bit);
            instance_create_layer(pos_x, pos_y, global.ROOM_LAYER_PLAYER, obj_soul_bit);
            
            // reset variables
            velocity_x = 0;
            velocity_y = 0;
            current_health = max_health;
        }
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

