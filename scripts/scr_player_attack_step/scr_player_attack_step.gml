/// @descr scr_player_attack_step()

event_inherited();


//
// Check if Attacking
//
if ( ! dying)
{
	// check collision with enemy objects
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
					damage_data = ds_map_create();
					ds_map_add(damage_data , "damage", other.damage);
					ds_map_add(damage_data , "knockback_x", other.velocity_x);
						
					// update projectile
					other.dying = true;
					
					break;
				}
			}
		}
	}
}

if (dying)
{
	instance_destroy();
}
