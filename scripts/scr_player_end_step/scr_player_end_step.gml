/// @descr scr_player_end_step()

///scr_entity_end_step()

if (has_physics)
{
    // apply gravity
    velocity_y += (global.GRAV * global.TICK * gravity_factor);
    
	/*
    // apply movement friction
    if (grounded && move_friction > 0)
    {
        if (abs(velocity_x * move_friction) < move_friction_min)
        {
            velocity_x = 0;
        }
        velocity_x = (velocity_x * move_friction);
    }
    
    // apply jump bounce
    if (grounded && jump_bounce > 0)
    {
        if (last_velocity_y < jump_bounce_min)
        {
            velocity_y = 0;
        }
        velocity_y = (-last_velocity_y * jump_bounce);
    }
    
    // apply horizontal restrictions
    if (max_velocity_x != 0)
    {
        velocity_x = clamp(velocity_x, -max_velocity_x, max_velocity_x);
    }
    
    // apply vertical restrictions
    if (max_velocity_y != 0)
    {
        velocity_y = clamp(velocity_y, -max_velocity_y, max_velocity_y);
    }
    */
	
    // new x/y positions
    mx = (velocity_x * global.TICK);
    my = (velocity_y * global.TICK);
    
    // store velocities
    last_velocity_x = velocity_x;//mx;
    last_velocity_y = velocity_y;//my;
    
	// resolve movement collision
	scr_entity_movement_collision();
	
	// update position
    x += mx;
    y += my;
}

/*
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
*/
