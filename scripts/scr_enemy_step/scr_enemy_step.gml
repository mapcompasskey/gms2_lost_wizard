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
if ( ! dying && ! hurting && ! recovering)
{
	if (collided_with != noone)
	{
		// *how does it know it was a projectile
		// *maybe "collide_with" should be "hurt_by" or "take_damage_from"
		
		// if the instance can cause damage
		if (collided_with.damage)
		{
			hurting = true;
	        recovering = true;
			recover_timer = 0;
		
	        // apply horizontal knockback
	        var knockback_x = speed_x;
	        if (x < collided_with.x)
	        {
	            knockback_x = -knockback_x;
	        }
	        velocity_x = knockback_x;
			
	        // apply vertical knockback
	        velocity_y = -speed_x;
	        grounded = false;
			
	        // move away from the attack
	        key_left = false;
	        key_right = true;
	        if (velocity_x < 0)
	        {
	            key_left = true;
	            key_right = false;
	        }
			
			// reduce health
			//current_health = (current_health - collided_with.damage);
			if (current_health <= 0)
			{
				dying = true;
			}
		}
		
	}
}

if ( ! dying)
{
	if (hurting && grounded)
    {
        hurting = false;
    }
	
	if (recovering)
	{
		recover_timer += global.TICK;
		if (recover_timer >= recover_time)
		{
			// reset object collision
			can_collide = true;
			collided_with = noone;
			
			hurting = false;
			recovering = false;
			recover_timer = 0;
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
