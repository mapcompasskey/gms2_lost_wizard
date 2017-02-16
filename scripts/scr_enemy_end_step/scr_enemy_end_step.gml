/// @descr scr_enemy_end_step()


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
                current_health = (current_health - other_damage);
                if (current_health <= 0)
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

