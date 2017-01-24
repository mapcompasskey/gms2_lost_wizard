/// @descr scr_player_step()

event_inherited();

//
// Update Inputs
//
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump_pressed = keyboard_check_pressed(ord("Z"));
key_jump_released = keyboard_check_released(ord("Z"));


//
// Check if jumping and/or falling
//
if ( ! dying && ! hurting)
{
    // if grounded and just pressed the JUMP button
    if (grounded && ! jumping && key_jump_pressed)
    {
        jumping = true;
        grounded = false;
        velocity_y = -speed_y;
    }
    
    // if pressed the JUMP button while jumping
    if (jumping && key_jump_pressed)
    {
        jumping = true;
        falling = false;
        grounded = false;
        velocity_y = -speed_y;
    }
    
    // reduce jump height
    if (jumping && velocity_y < 0 && key_jump_released)
    {
        velocity_y = (velocity_y / 2);
    }
    
    // if falling
    if (velocity_y > 0 && ! grounded)
    {
        falling = true;
    }
    
    // if grounded after jumping or falling
    if ((jumping || falling) && grounded)
    {
        jumping = false;
        falling = false;
    }
}


//
// Check if walking
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

