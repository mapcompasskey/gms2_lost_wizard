/// @desc scr_enemy_bat_step()

event_inherited();

var tick = global.TICK;


//
// Update Movement
//
if ( ! dying && ! hurting && ! targeting)
{
    // update the x-axis curve
    motion_angle_x += (angle_speed_x * tick);
    if (motion_angle_x > 360)
    {
        motion_angle_x = (motion_angle_x % 360);
    }
    motion_x = dcos(motion_angle_x) * motion_radius_x;
    
    // update the y-axis curve
    motion_angle_y += (angle_speed_y * tick);
    if (motion_angle_y > 360)
    {
        motion_angle_y = (motion_angle_y % 360);
    }
    motion_y = dsin(motion_angle_y) * motion_radius_y;
    
    // update velocity
    velocity_x = (previous_motion_x - motion_x) / tick;
    velocity_y = (previous_motion_y - motion_y) / tick;
    
    previous_motion_x = motion_x;
    previous_motion_y = motion_y;
}


//
// Check if Targeting an Instance
//
if ( ! dying && ! hurting)
{
    // if nothing is being targeted
    if (targeting_id == noone)
    {
        // find the closest player instance
        var previous_dist = proximity_max;
        with (obj_player)
        {
            // if this instance is within range
            var dist = distance_to_object(other);
            if (dist < previous_dist)
            {
                // update the enemy bat
                other.targeting_id = id;
                previous_dist = dist;
            }
        }
        
    }
    
    // else, something is being targeted
    else
    {
        track_timer += tick;
        if (track_timer > track_time)
        {
            var inst = targeting_id;
            
            // reset the reference
            targeting = false;
            targeting_id = noone;
            
            // if the instance still exsits
            if (instance_exists(inst))
            {
                // if its still within range
                var dist = distance_to_object(inst);
                if (dist < proximity_max && dist > proximity_min)
                {
                    // update the reference
                    targeting_id = inst;
                    targeting = true;
                    
                    // find the center of the object
                    var pos_x = (inst.bbox_left + ((inst.bbox_right - inst.bbox_left) / 2));
                    var pos_y = (inst.bbox_top + ((inst.bbox_bottom - inst.bbox_top) / 2));
                    var deg = point_direction(x, y, pos_x, pos_y);
                    
                    velocity_x = dcos(deg) * targeting_speed;
                    velocity_y = dsin(deg) * targeting_speed * -1;
                }
            
            }
            
            track_timer = 0;
        }
    }
    
}


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


/*
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
*/
