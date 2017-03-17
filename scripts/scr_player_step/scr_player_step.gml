/// @desc scr_player_step()

event_inherited();


//
// Update Inputs
//
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_down = keyboard_check(vk_down);
key_jump_pressed = keyboard_check_pressed(ord("X"));
key_jump_released = keyboard_check_released(ord("X"));
key_attack_pressed = keyboard_check(ord("Z"));//keyboard_check_pressed(ord("Z"));
key_attack_released = keyboard_check_released(ord("Z"));


//
// Check if Hurting
//
if ( ! dying)
{
    // if hurting and hit the ground
    if (hurting && grounded)
    {
        hurting = false;
    }
    
    // if recovering
    if (recovering)
    {
        image_alpha = 0.5;
        
        recover_timer += global.TICK;
        if (recover_timer >= recover_time)
        {
            image_alpha = 1;
            
            // update states
            hurting = false;
            recovering = false;
            recover_timer = 0;
            can_be_attacked = true;
        }
    }
    
}


//
// Check if Jumping or Falling
//
if ( ! dying && ! hurting && ! crouching)
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
            
            // create a player projectile instance
            var inst = instance_create_layer(x, y, global.ROOM_LAYER_PLAYER, obj_player_projectile);
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
// Check if Crouching
//
crouching = false;
camera_offset_y = bbox_height;
if ( ! dying && ! hurting)
{
    if (grounded && key_down)
    {
        velocity_x = 0;
        velocity_y = 0;
        crouching = true;
    }
    
    if (crouching)
    {
        if (key_left)
        {
            facing = LEFT;
        }
        else if (key_right)
        {
            facing = RIGHT;
        }
        
        camera_offset_y = -bbox_height;
    }
}


//
// Check if Walking
//
walking = false;
if ( ! dying && ! hurting && ! crouching)
{
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


//
// Update Sprite
//
if (crouching)
{
    if (sprite_index != crouch_sprite)
    {
        sprite_index = crouch_sprite;
        image_index = 0;
        image_speed = crouch_speed;
    }
}
else if (falling)
{
    if (sprite_index != fall_sprite)
    {
        sprite_index = fall_sprite;
        image_index = 0;
        image_speed = fall_speed;
    }
}
else if (jumping)
{
    if (sprite_index != jump_sprite)
    {
        sprite_index = jump_sprite;
        image_index = 0;
        image_speed = jump_speed;
    }
}
else if (walking)
{
    if (sprite_index != walk_sprite)
    {
        sprite_index = walk_sprite;
        image_index = 0;
        image_speed = walk_speed;
    }
}
else
{
    if (sprite_index != idle_sprite)
    {
        sprite_index = idle_sprite;
        image_index = 0;
        image_speed = idle_speed;
    }
}
