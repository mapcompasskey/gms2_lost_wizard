/// @descr scr_projectile_end_step()

if ( ! dying)
{
	// store velocities
	last_velocity_x = velocity_x;
	last_velocity_y = velocity_y;
	
	// new x/y positions
	mx = (velocity_x * global.TICK);
	my = (velocity_y * global.TICK);
	
	// resolve movement collision
	script_execute(movement_collision_script);
	//scr_projectile_movement_collision();
	
	// update position
	x += mx;
	y += my;
}

// keep instance inside the room
// *sprite_width can be negative when facing LEFT
if (bbox_right < 0)
{
    x = (room_width - abs(sprite_width));
}
else if (bbox_left > room_width)
{
    x = abs(sprite_width);
}

if (bbox_top > room_height)
{
    y = abs(sprite_height);
}
