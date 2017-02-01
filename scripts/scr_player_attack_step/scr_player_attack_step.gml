/// @descr scr_player_attack_step()

event_inherited();

//
// Check Collision with Enemy Objects
//

// *need to check in steps since the projectile can travel fast
if ( ! dying)
{
	if (can_collide && collided_with == noone)
	{
		if (place_meeting(x, y, obj_enemy))
		{
			with (obj_enemy)
			{
				if (place_meeting(x, y, other))
				{
					// if the enemy can handle collision
					if (can_collide && collided_with == noone)
					{
						// update enemy
						can_collide = false;
						collided_with = other;
						
						// update projectile
						other.can_collide = false;
						other.collided_with = id;
					
						break;
					}
				}
			}
		}
	}
	else
	{
		dying = true;
	}
}

if (dying)
{
	instance_destroy();
}
