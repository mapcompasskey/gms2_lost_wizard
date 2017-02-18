/// @desc scr_block_trigger_update_global()


// update global
global.BLOCKS_ACTIVE = is_active;

// update block state (changes their appearance)
with (obj_block)
{
    is_active = global.BLOCKS_ACTIVE;
}

// update entities to check for block collision
with (obj_entity)
{
    check_collision_with_blocks = global.BLOCKS_ACTIVE;
}
