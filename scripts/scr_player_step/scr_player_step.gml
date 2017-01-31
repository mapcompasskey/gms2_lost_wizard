/// @descr scr_player_step()

event_inherited();

//
// Update Inputs
//
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump_pressed = keyboard_check_pressed(ord("X"));
key_jump_released = keyboard_check_released(ord("X"));
key_attack_pressed = keyboard_check(ord("Z"));//keyboard_check_pressed(ord("Z"));
key_attack_released = keyboard_check_released(ord("Z"));


//
// Check if Jumping or Falling
//
if ( ! dying && ! hurting)
{
    // if grounded and just pressed the JUMP button
    //if (grounded && ! jumping && key_jump_pressed)
	if ( ! jumping && key_jump_pressed)
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
// Check if Attacking
//
if ( ! dying && ! hurting)
{
	if (attacking)
	{
		attack_cooldown_timer += global.TICK;
		if (attack_cooldown_timer >= attack_cooldown_time)
		{
			attacking = false;
		}
	}
	else
	{
		if (key_attack_pressed)
		{
			attacking = true;
			attack_cooldown_timer = 0;
			
			// create a player attack instance
			var inst = instance_create_layer(x, y, global.ROOM_LAYER_PLAYER, obj_player_attack);
			with (inst)
			{
				if (other.facing == LEFT)
				{
					angle = DEGREES_LEFT;
					x += other.sprite_bbox_left + sprite_bbox_left;
				}
				else
				{
					angle = DEGREES_RIGHT;
					x += other.sprite_bbox_right + sprite_bbox_right;
				}
				y += (other.bbox_top - other.bbox_bottom) / 2;
			}
			
		}
	}
	
}


//
// Check if Walking
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

