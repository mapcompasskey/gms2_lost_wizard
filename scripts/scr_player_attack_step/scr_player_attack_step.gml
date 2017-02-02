/// @descr scr_player_attack_step()

event_inherited();

//
// Check Collision with Enemy Objects
//
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
						collided_with_data = ds_map_create();
						ds_map_add(collided_with_data , "damage", other.damage);
						ds_map_add(collided_with_data , "velocity_x", other.velocity_x);
						
						// update projectile
						other.can_collide = false;
						other.collided_with = id;
						other.dying = true;
						
						break;
					}
				}
			}
		}
	}
}

if (dying)
{
	instance_destroy();
}
