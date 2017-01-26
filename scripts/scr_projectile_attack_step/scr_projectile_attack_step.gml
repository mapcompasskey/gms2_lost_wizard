/// @descr scr_projectile_attack_step()

if ( ! dying && update_velocity)
{	
	// update the velocity vector from the angle and base velocity
	velocity_x = (dcos(angle) * base_velocity);
	velocity_y = (dsin(angle) * base_velocity * -1);
	update_velocity = false;
}

if ( ! dying)
{
	kill_timer += global.TICK;
	if (kill_timer >= kill_time)
	{
		dying = true;
	}
}
