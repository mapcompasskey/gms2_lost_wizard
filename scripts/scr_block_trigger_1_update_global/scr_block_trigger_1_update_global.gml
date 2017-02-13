/// @descr scr_block_trigger_1_update_global()


// update global
global.BLOCK_1_ACTIVE = is_active;

// update block state (changes their appearance)
with (obj_block_1)
{
    is_active = global.BLOCK_1_ACTIVE;
}

// update entities to check for block collision
with (obj_entity)
{
    check_collision_with_block_1 = global.BLOCK_1_ACTIVE;
}
