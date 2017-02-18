/// @desc scr_block_trigger_2_update_global()


// update global
global.BLOCK_2_ACTIVE = is_active;

// update block state (changes their appearance)
with (obj_block_2)
{
    is_active = global.BLOCK_2_ACTIVE;
}

// update entities to check for block collision
with (obj_entity)
{
    check_collision_with_block_2 = global.BLOCK_2_ACTIVE;
}
