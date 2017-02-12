/// @descr scr_block_trigger_create()


// object collision
can_be_damaged = true;
damage_from = noone;

// states
recovering = false;
is_active = global.BLOCKS_ACTIVE;

update_global_script = scr_block_trigger_update_global;

// drawing
image_speed = 0;
//sprite_index = noone;
//mask_index = noone;

// timers
recover_time = 0.5;
recover_timer = 0;
