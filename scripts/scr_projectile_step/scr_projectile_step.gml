/// @descr scr_projectile_step()

// update the velocity vector from the angle and base velocity
if ( ! dying && update_velocity)
{	
	velocity_x = (dcos(angle) * base_velocity);
	velocity_y = (dsin(angle) * base_velocity * -1);
	update_velocity = false;
}

// kill the instance after a certain amount of time has passed
if ( ! dying)
{
	travel_timer += global.TICK;
	if (travel_timer >= travel_time)
	{
		dying = true;
		instance_destroy();
	}
}