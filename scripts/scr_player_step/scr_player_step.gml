/// @descr scr_player_step()

event_inherited();

//
// Check if jumping and/or falling
//
if ( ! dying && ! hurting)
{
    // if grounded and just pressed the JUMP button
    if (grounded && ! jumping && keyboard_check_pressed(ord("Z")))
    {
        jumping = true;
        grounded = false;
        velocity_y = -speed_y;
    }
    
    /**/
    // if pressed the JUMP button while jumping
    if (jumping && keyboard_check_pressed(ord("Z")))
    {
        jumping = true;
        falling = false;
        grounded = false;
        velocity_y = -speed_y;
    }
    /**/
    
    // reduce jump height
    if (jumping && velocity_y < 0 && keyboard_check_released(ord("Z")))
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
     
	if (keyboard_check(vk_left))
    {
        facing = -1;//global.LEFT;
        walking = true;
        velocity_x = (speed_x * facing);
    }
    else if (keyboard_check(vk_right))
    {
        facing = 1;//global.RIGHT;
        walking = true;
        velocity_x = (speed_x * facing);
    }
}

