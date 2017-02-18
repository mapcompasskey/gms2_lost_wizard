/// @desc scr_enemy_step()

event_inherited();


//
// Check if Dead
//
if (dying)
{
    image_alpha = 0.2;
    
    dead_timer += global.TICK;
    if (dead_timer > dead_time)
    {
        dead_timer = 0;    
        dying = false;
        
        // repostion to starting point
        x = starting_x;
        y = starting_y;
    }
}


/*
//
// Update Action
//
if ( ! dying && ! hurting)
{
    action_timer += global.TICK;
    if (action_timer > action_time)
    {
        action_timer = 0;
        action_time = (random_range(2, 4) * 60);
        
        key_left = false;
        key_right = false;
        var rand = irandom(4);
        show_debug_message(rand);
        switch (rand)
        {
            case 0:
            case 1:
                key_left = true;
                break;
                
            case 2:
            case 3:
                key_right = true;
                break;
        }
    }
}
*/


//
// Check if Hurting or Recovering
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
// Check if Attacking
//
if ( ! dying)
{
    // check if colliding with player objects
    if (place_meeting(x, y, obj_player))
    {
        with (obj_player)
        {
            if (place_meeting(x, y, other))
            {
                // if the entity is damaged
                scr_damage_entity(id, other, -damage)
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

