/// @descr scr_player_attack_step()

if ( ! dying && update_velocity)
{	
	// update the velocity vector from angle and speed
	velocity_x = (dcos(angle) * velocity);
	velocity_y = (dsin(angle) * velocity * -1);
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

if (dying)
{
	instance_destroy();
}