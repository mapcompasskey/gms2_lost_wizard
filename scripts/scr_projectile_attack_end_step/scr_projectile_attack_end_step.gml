/// @descr scr_projectile_attack_end_step()

if ( ! dying)
{
	// store velocities
	last_velocity_x = velocity_x;
	last_velocity_y = velocity_y;
	
	// new x/y positions
	mx = (velocity_x * global.TICK);
	my = (velocity_y * global.TICK);
	
	// resolve movement collision
	//script_execute(movement_collision_script);
	scr_projectile_movement_collision();
	
	// update position
	x += mx;
	y += my;
}
