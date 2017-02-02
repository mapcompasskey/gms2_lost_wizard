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
// Check if Dead
//
if (dying)
{
	image_alpha = 0.2;
	
	dead_timer += global.TICK;
	if (dead_timer > dead_time)
	{
		dead_timer = 0;	
		dying = false;
	}
}


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
		image_alpha = 0.5;
		
		recover_timer += global.TICK;
		if (recover_timer >= recover_time)
		{
			image_alpha = 1;
			
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
					
					// get the "knockback_x" valule
					var c_knockback_x = ds_map_find_value(collided_with_data, "knockback_x");
					if ( ! is_undefined(c_knockback_x))
					{
						// apply horizontal knockback
						velocity_x = knockback_x * sign(c_knockback_x);
					}
					
				    // apply vertical knockback
				    velocity_y = -knockback_y;
				    grounded = false;
					
					// reduce health
					current_health = (current_health - c_damage);
					if (current_health <= 0)
					{
						dying = true;
						
						// reset values
						velocity_x = 0;
						velocity_y = 0;
						current_health = starting_health;
					}
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
