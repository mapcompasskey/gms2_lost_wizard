/// @descr scr_block_trigger_step()


// update the image
image_index = 0;
if (is_active)
{
    image_index = 1;
}


//
// Check if Recovering
//
if (recovering)
{
    //image_alpha = 0.5;
    
    recover_timer += global.TICK;
    if (recover_timer >= recover_time)
    {
        //image_alpha = 1.0;
        
        // update states
        recovering = false;
        recover_timer = 0;
        can_be_damaged = true;
    }
}


//
// Check if Being Attacked
//
if ( ! recovering)
{
    if (can_be_damaged)
    {
        // if being damaged
        if (damage_from != noone)
        {
            // update states
            recovering = true;
            recover_timer = 0;
            can_be_damaged = false;
            
            // update instance and global settings
            is_active = !is_active;
            global.BLOCKS_ACTIVE = is_active;
            
            // update blocks to change their appearance
            with (obj_block)
            {
                is_active = global.BLOCKS_ACTIVE;
            }
            
            // update entities to check block collision
            with (obj_entity)
            {
                check_collision_with_blocks = global.BLOCKS_ACTIVE;
            }
            
        }
        
    }
}
    
// reset collision referrence
damage_from = noone;

