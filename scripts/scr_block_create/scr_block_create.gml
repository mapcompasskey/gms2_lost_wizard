/// @descr scr_block_create()


// states
is_active = global.BLOCKS_ACTIVE;
previous_is_active = !is_active;

// drawing
draw_sprite_index = sprite_index;
image_speed = 0;
sprite_index = noone;
mask_index = noone;
