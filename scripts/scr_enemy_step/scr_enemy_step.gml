/// @descr scr_enemy_step()

event_inherited();

/*
//
// Update Action
//
if ( ! dying && ! hurting)
{
    action_timer += global.TICK;
    if (action_timer > action_time)
    {
        action_timer = 0;
        action_time = (random_range(2, 4) * 60);
        
        key_left = false;
        key_right = false;
        var rand = irandom(4);
        show_debug_message(rand);
        switch (rand)
        {
            case 0:
            case 1:
                key_left = true;
                break;
                
            case 2:
            case 3:
                key_right = true;
                break;
        }
    }
}
*/


//
// Check if Hurting
//
if ( ! dying)
{
	// if hurting and hit the ground
	if (hurting && grounded)
    {
        hurting = false;
    }
	
	// if recovering
	if (recovering)
	{
		recover_timer += global.TICK;
		if (recover_timer >= recover_time)
		{
			// reset object collision
			can_collide = true;
			
			// reset hurting properties
			hurting = false;
			recovering = false;
			recover_timer = 0;
		}
	}
	
	if ( ! hurting && ! recovering)
	{
		// if collided with an object
		if (collided_with != noone)
		{
			// if there is collision data
			if ( ! ds_map_empty(collided_with_data))
			{
				// get the "damage" value
				var c_damage = ds_map_find_value(collided_with_data, "damage");
				if ( ! is_undefined(c_damage))
				{
					hurting = true;
				    recovering = true;
					recover_timer = 0;
				
					// get the "velocity_x" valule
					var c_velocity_x = ds_map_find_value(collided_with_data, "velocity_x");
					if ( ! is_undefined(c_velocity_x))
					{
						// apply horizontal knockback
						velocity_x = knockback_x * sign(c_velocity_x);
					}
					
				    // apply vertical knockback
				    velocity_y = -knockback_y;
				    grounded = false;
					
					// reduce health
					//current_health = (current_health - c_damage);
					//if (current_health <= 0)
					//{
					//	dying = true;
					//}
				}
		
				// reset collision data
				collided_with_data = ds_map_create();
			}
		
			// reset collision referrence
			collided_with = noone;
		}
	}
	
}


//
// Check if Walking
//
if ( ! dying && ! hurting)
{
    walking = false;
    velocity_x = 0;
     
	if (key_left)
    {
        facing = LEFT;
        walking = true;
        velocity_x = (speed_x * facing);
    }
    else if (key_right)
    {
        facing = RIGHT;
        walking = true;
        velocity_x = (speed_x * facing);
    }
}
